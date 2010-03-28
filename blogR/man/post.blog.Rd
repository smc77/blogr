\name{post.blog}
\alias{post.blog}
\title{Post a new blog entry along with associated media.}
\usage{post.blog(blog.file=blogR.FILE, username=blogR.USERNAME, password=if
    (exists("blogR.PASSWORD")) blogR.PASSWORD, publish=as.logical(blogR.PUBLISH),
    blogurl=blogR.URL, archive=blogR.ARCHIVE, input.format=blogR.FORMAT)}
\description{Post a new blog entry along with associated media.}
\details{Post a new blog entry along with associated media.}
\value{boolean vector}
\seealso{\code{\link{grepl}} which this function wraps}
\author{Shane Conway \email{shane.conway@gmail.com}}
\keyword{character}
\arguments{\item{blog.file}{the name of the Sweave file cotaining the blog entry}
\item{pattern}{pattern to look for, as defined by a POSIX regular
expression.  See the ``Extended Regular Expressions'' section of 
\code{\link{regex}} for details.}}
\examples{\dontrun{
post.blog()
}}
