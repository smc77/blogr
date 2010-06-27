#
# blogR: An R package to post Sweave documents as blog entries.
# author: Shane Conway <shane.conway@gmail.com>
#
# This is released under a GPL license.
#
# Documentation was created using roxygen:
# roxygenize('blogR', roxygen.dir='blogR', copy.package=FALSE, unlink.target=FALSE)
#
###############################################################################

#' Post a new blog entry.
#'
#' Creates a new blog post.
#'
#' @param blogurl The URL for the blog (e.g. http://myblog.wordpress.com/) 
#' @param username The username for posting.
#' @param password Password for blog.
#' @param title Title of the blog post.
#' @param blog.post Full blog entry (can be html).
#' @param publish Whether the entry should be published or kept as draft (default = FALSE).
#' @return The url for the posted entry.
#' @author Shane Conway \email{shane.conway@gmail.com}
#' @seealso \code{\link{new.media}} 
#' @keywords documentation
#' @examples
#' \dontrun{
#' new.post(title="foo", blog.post="bar")
#' }
new.post <- function(blogurl=blogR.URL, username=blogR.USERNAME, password=blogR.PASSWORD, title, blog.post, publish=FALSE) {
	wpp <- .jnew("BlogPoster") # create instance of class
	output <- tryCatch(.jcall(wpp, "S", "xmlrpcNewPost", blogurl, username, password, title, blog.post, as.character(publish)))
	return(output)
}

#' Edit an existing blog entry.
#'
#' Edit an existing blog post.
#'
#' @param blogurl The URL for the blog (e.g. http://myblog.wordpress.com/) 
#' @param postid The id for the post to be edited.
#' @param username The username for posting.
#' @param password Password for blog.
#' @param title Title of the blog post.
#' @param blog.post Full blog entry (can be html).
#' @param publish Whether the entry should be published or kept as draft (default = FALSE).
#' @return The url for the posted entry.
#' @author Shane Conway \email{shane.conway@gmail.com}
#' @seealso \code{\link{new.media}} 
#' @keywords documentation
#' @examples
#' \dontrun{
#' edit.post(postid=111, title="foo", blog.post="bar")
#' }
edit.post <- function(blogurl=blogR.URL, postid, username=blogR.USERNAME, password=blogR.PASSWORD, title, blog.post, publish=FALSE) {
	wpp <- .jnew("BlogPoster") # create instance of class
	output <- tryCatch(.jcall(wpp, "S", "xmlrpcEditPost", blogurl, postid, username, password, title, blog.post, as.character(publish)))
	return(output)
}

#' Post blog media (e.g. images, files).
#'
#' Posts any media that's associated with a blog post.
#'
#' @param blogurl The URL for the blog (e.g. http://myblog.wordpress.com/) 
#' @param username The username for posting.
#' @param password Password for blog.
#' @param filename The file name.
#' @param mimetype Type of media.
#' @param path Path to file.
#' @return The url for the posted media.
#' @seealso \code{\link{new.post}} 
#' @author Shane Conway \email{shane.conway@@gmail.com}
#' @keywords character
#' @examples
#' \dontrun{
#' post.blog()
#' }
new.media <- function(blogurl=blogR.URL, username=blogR.USERNAME, password=blogR.PASSWORD, filename=blogR.FILE, mimetype, path=blogR.PATH) {
	file <- paste(path, filename, sep="")
	wpp <- .jnew("BlogPoster") # create instance of class
	output <- .jcall(wpp, "S", "xmlrpcNewMediaObject", blogurl, username, password, filename, mimetype, file)
	return(output)
}

#' Process a blog post.
#'
#' Vectorised over \code{string}.  \code{pattern} should be a single pattern,
#' i.e. a character vector of length one.
#'
#' @param blog.file the name of the Sweave file cotaining the blog entry 
#' @param pattern pattern to look for, as defined by a POSIX regular
#'   expression.  See the ``Extended Regular Expressions'' section of 
#'   \code{\link{regex}} for details.
#' @return boolean vector
#' @seealso \code{\link{post.blog}} 
#' @author Shane Conway \email{shane.conway@@gmail.com}
#' @keywords documentation
#' @examples
#' \dontrun{
#' process.blog()
#' }
process.blog <- function(post=true, blog.file=blogR.FILE, path=blogR.PATH, archive=blogR.ARCHIVE, input.format=blogR.FORMAT, create.script=blogR.RSCRIPT) {
	setwd(path)
	#if(any(c(!exists(file), !exists(path), !exists(archive),!exists(format)))) {
	#	stop("Must provide a Sweave file, path, archive decision, and output format.")
	#}
	print(paste("Processing Sweave file:",blog.file))
	blog.file.full <- paste(path, blog.file, sep="")
	# input options = c("latex","html","ascii")
	if(input.format=="latex"){
		stop("Latex format is currently not supported.")
		Sweave(file=blog.file.full, driver="RWeaveLatex")
		ext <- "tex"
		# use tex to html converter
	} else if(input.format=="html") {
		stop("HTML format is currently not supported.")
		Sweave(file=blog.file.full, driver=RweaveHTML, syntax="SweaveSyntaxNoweb")
		ext <- "html"
	} else if(input.format=="ascii") {
		Sweave(file=blog.file.full, driver=RweaveAsciidoc, syntax="SweaveSyntaxNoweb")
		ext <- "txt"
	}
	sweave.file <- gsub("Rnw",ext,blog.file)
	# Create an R script
	if(create.script) {
		Stangle(file=blog.file.full, driver = Rtangle(), syntax = getOption("SweaveSyntax"))
		r.file <- gsub("Rnw","R",blog.file)
	}
	# Archive the file if necessary
	if(archive) {
		
	}
	return(paste(path, sweave.file, sep=""))
}

#' Return the party totals from roll-call vote data 
#'
#' \code{parse.blog.entry} fully parses the output from roll-call vote data and returns the results for a particular party as a list
#'
#' @param xml The xml returned from \code{getNYTCongress} with type="roll.call" (default)
#' @param party Can by either "total", "independent", "democratic", or "republican".
#' @return list of vote summary for supplied party
#' @keywords data
#' @author Shane Conway \email{shane.conway@@gmail.com}
#' @seealso \code{\link{post.blog}} 
parse.blog.entry <- function(blog.post, input.format, blogurl=blogR.URL, username=blogR.USERNAME, password=blogR.PASSWORD, path=blogR.PATH) {
	blog.data <- list()
	if(input.format=="ascii") {
		title.idx <- grep("title=", blog.post)
		image.idx <- grep("image::", blog.post)
		comment.idx <- grep("<!--", blog.post)
		title <- strsplit(blog.post[title.idx],"title=")[[1]][2]
		images <- gsub("\\[*.\\]","",gsub("image::","",blog.post[image.idx]))
		blog.images <- do.call("rbind", 
				lapply(images, function(image, blogurl, username, password, path) { 
							new.media(blogurl=blogurl, username=username, password=password, filename=image, mimetype="image/jpg", path=path)
						}, blogurl=blogurl, username=username, password=password, path=path))
		blog.post[image.idx] <- paste("<img src='",blog.images,"' alt='R image'>", sep="")
		blog.post <- paste(blog.post[-c(title.idx,comment.idx)], collapse = "\n") 
		blog.data <- list(title=title, blog.post=blog.post, images=images)
	}
	return(blog.data)
}

#' Post a new blog entry along with associated media.
#'
#' Post a new blog entry along with associated media.
#'
#' @param blog.file the name of the Sweave file cotaining the blog entry 
#' @param pattern pattern to look for, as defined by a POSIX regular
#'   expression.  See the ``Extended Regular Expressions'' section of 
#'   \code{\link{regex}} for details.
#' @return boolean vector
#' @seealso \code{\link{grepl}} which this function wraps
#' @author Shane Conway \email{shane.conway@@gmail.com}
#' @keywords character
#' @examples
#' \dontrun{
#' post.blog()
#' }
post.blog <- function(blog.file=blogR.FILE, postid=NA, path=blogR.PATH, username=blogR.USERNAME, password=if(exists("blogR.PASSWORD")) blogR.PASSWORD, publish=as.logical(blogR.PUBLISH), blogurl=blogR.URL, archive=blogR.ARCHIVE, input.format=blogR.FORMAT) {
	print(path)
	if(is.null("password"))
		password <- readline("Please provide password: ")
	#
	ext <- if(input.format=="ascii") "txt"
	blog.file <- gsub("Rnw",ext,blog.file)	
	#
	con <- file(paste(path, blog.file, sep=""), "r", blocking = FALSE)
	blog.post <- readLines(con)
	close(con)
	#
	blog.data <- parse.blog.entry(blog.post=blog.post, input.format=input.format, blogurl=blogurl, username=username, password=password, path=path)
	#
	if(is.na(postid)) {
		output <- new.post(blogurl=blogurl, username=username, password=password, title=blog.data$title, blog.post=blog.data$blog.post, publish=publish)
	} else {
		output <- edit.post(blogurl=blogurl, postid=postid, username=username, password=password, title=blog.data$title, blog.post=blog.data$blog.post, publish=publish)
	}
	#	
	return(paste("", blogurl, "?p=", output, if(!publish) "&preview=true", sep=""))
}

#' Process and post the latest blog entry.
#'
#' Function to process and post a blog entry using all the global enties.
#'
#' @return character The url for the posted entry.
#' @seealso \code{\link{process.blog}}, \code{\link{post.blog}}
#' @author Shane Conway \email{shane.conway@@gmail.com}
#' @keywords character
do.blogR <- function() {
	if(check.blogR()) {		
		process.blog()
		return(post.blog())
	} else {
		stop("Can't call blog without completing variable configuration first.  See ?blogR or vignette('blogR') for more details.")
	}
}
