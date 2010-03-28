\name{parse.blog.entry}
\alias{parse.blog.entry}
\title{Post a new blog entry along with associated media.}
\usage{parse.blog.entry(blog.post, input.format, blogurl=blogR.URL,
    path=blogR.PATH)}
\description{Post a new blog entry along with associated media.}
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
