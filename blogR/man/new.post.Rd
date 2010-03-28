\name{new.post}
\alias{new.post}
\title{Post a new blog entry.}
\usage{new.post(blogurl=blogR.URL, username=blogR.USERNAME, password=blogR.PASSWORD, title,
    blog.post, publish=FALSE)}
\description{Post a new blog entry.}
\details{Creates a new blog post.}
\value{The url for the posted entry.}
\author{Shane Conway \email{shane.conway}
\seealso{\code{\link{new.media}}}
\keyword{documentation}
\arguments{\item{blogurl}{The URL for the blog (e.g. http://myblog.wordpress.com/)}
\item{username}{The username for posting.}
\item{password}{Password for blog.}
\item{title}{Title of the blog post.}
\item{blog.post}{Full blog entry (can be html).}
\item{publish}{Whether the entry should be published or kept as draft (default = FALSE).}}
\examples{\dontrun{
new.post()
}}
