\name{new.media}
\alias{new.media}
\title{Post blog media (images).}
\usage{new.media(blogurl=blogR.URL, username=blogR.USERNAME,
    password=blogR.PASSWORD, filename=blogR.FILE, mimetype,
    path=blogR.PATH)}
\description{Post blog media (images).}
\details{Vectorised over \code{string}.  \code{pattern} should be a single pattern,
i.e. a character vector of length one.}
\value{boolean vector}
\seealso{\code{\link{grepl}} which this function wraps}
\keyword{character}
\arguments{\item{blog.file}{the name of the Sweave file cotaining the blog entry}
\item{pattern}{pattern to look for, as defined by a POSIX regular
expression.  See the ``Extended Regular Expressions'' section of 
\code{\link{regex}} for details.}}
\examples{post.blog()}
