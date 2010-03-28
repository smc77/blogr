\name{parse.blog.entry}
\alias{parse.blog.entry}
\title{Return the party totals from roll-call vote data...}
\usage{parse.blog.entry(blog.post, input.format, blogurl=blogR.URL, path=blogR.PATH)}
\description{Return the party totals from roll-call vote data}
\details{\code{parse.blog.entry} fully parses the output from roll-call vote data and returns the results for a particular party as a list}
\value{list of vote summary for supplied party}
\keyword{data}
\author{Shane Conway \email{shane.conway@gmail.com}}
\seealso{\code{\link{post.blog}}}
\arguments{\item{xml}{The xml returned from \code{getNYTCongress} with type="roll.call" (default)}
\item{party}{Can by either "total", "independent", "democratic", or "republican".}}
