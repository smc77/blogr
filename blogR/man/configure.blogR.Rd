\name{configure.blogR}
\Rdversion{1.1}
\alias{configure.blogR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Configure the blogR package with all the global environmental variables.
}
\description{
Configure the blogR package with all the global environmental variables.
}
\usage{
configure.blogR(blogR.PATH, blogR.FILE, blogR.ARCHIVE, blogR.FORMAT, blogR.URL, blogR.PUBLISH, blogR.RSCRIPT, blogR.USERNAME, blogR.PASSWORD)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{blogR.PATH}{
The path to the blog file.
}
  \item{blogR.FILE}{
The name of the blog file.
}
  \item{blogR.ARCHIVE}{
Logical value determines whether blog entries are archived.
}
  \item{blogR.FORMAT}{
The format of the blog entry.  Currently only supports "ascii", but should ultimately support LaTex and HTML.
}
  \item{blogR.URL}{
The blog URL.
}
  \item{blogR.PUBLISH}{
Logical value determines whether to publish the blog post immediately, or leave it as a draft.
}
  \item{blogR.RSCRIPT}{
Logical value determines whether to add the R scripts as a separate file.
}
  \item{blogR.USERNAME}{
Username for logging into blog site.
}
  \item{blogR.PASSWORD}{
Password for blog site (optional).
}
}
\details{
This function is completely optional, but can save time in the long run if repeatedly posting to the same blog.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Shane M. Conway
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{load.blogR}},
\code{\link{check.blogR}}
}
\examples{
\dontrun{
...
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ utilities }
