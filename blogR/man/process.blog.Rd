\name{process.blog}
\alias{process.blog}
\title{Process a blog post.}
\usage{process.blog(post=true, blog.file=blogR.FILE, path=blogR.PATH,
    archive=blogR.ARCHIVE, input.format=blogR.FORMAT,
    create.script=blogR.RSCRIPT)}
\description{Process a blog post.}
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
