\name{new.post}
\alias{new.post}
\title{Post a new blog entry.}
\usage{new.post(blog.url=blogR.URL, username=blogR.USERNAME,
    password=blogR.PASSWORD, title, blog.post, publish=FALSE)}
\description{Post a new blog entry.}
\details{Creates a new blog post.}
\value{The url for the posted entry.}
\seealso{\code{\link{new.media}}}
\keyword{documentation}
\arguments{\item{blog.url}{The URL for the blog (e.g. http://myblog.wordpress.com/)}
\item{username}{The username for posting.}
\item{password}{Password for blog.}
\item{title}{Title of the blog post.}
\item{blog.post}{Full blog entry (can be html).}
\item{publish}{Whether the entry should be published or kept as draft (default = FALSE).}}
\examples{new.post()}
