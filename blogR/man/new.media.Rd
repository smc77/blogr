\name{new.media}
\alias{new.media}
\title{Post blog media (e...}
\usage{new.media(blogurl=blogR.URL, username=blogR.USERNAME, password=blogR.PASSWORD,
    filename=blogR.FILE, mimetype, path=blogR.PATH)}
\description{Post blog media (e.g. images, files).}
\details{Posts any media that's associated with a blog post.}
\value{The url for the posted media.}
\seealso{\code{\link{new.post}}}
\author{Shane Conway \email{shane.conway@gmail.com}}
\keyword{character}
\arguments{\item{blogurl}{The URL for the blog (e.g. http://myblog.wordpress.com/)}
\item{username}{The username for posting.}
\item{password}{Password for blog.}
\item{filename}{The file name.}
\item{mimetype}{Type of media.}
\item{path}{Path to file.}}
\examples{\dontrun{
post.blog()
}}
