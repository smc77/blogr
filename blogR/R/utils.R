
load.blogR <- function() {
	# Load environment variables
	if(!exists("blogR.PATH") && nchar(Sys.getenv("blogR.PATH")) > 0) assign("blogR.PATH", Sys.getenv("blogR.PATH"), envir = .GlobalEnv) 
	if(!exists("blogR.FILE") && nchar(Sys.getenv("blogR.FILE")) > 0) assign("blogR.FILE", Sys.getenv("blogR.FILE"), envir = .GlobalEnv)
	if(!exists("blogR.ARCHIVE") && nchar(Sys.getenv("blogR.ARCHIVE")) > 0) assign("blogR.ARCHIVE", Sys.getenv("blogR.ARCHIVE"), envir = .GlobalEnv)
	if(!exists("blogR.FORMAT") && nchar(Sys.getenv("blogR.FORMAT")) > 0) assign("blogR.FORMAT", Sys.getenv("blogR.FORMAT"), envir = .GlobalEnv)
	if(!exists("blogR.URL") && nchar(Sys.getenv("blogR.URL")) > 0) assign("blogR.URL", Sys.getenv("blogR.URL"), envir = .GlobalEnv)
	if(!exists("blogR.PUBLISH") && nchar(Sys.getenv("blogR.PUBLISH")) > 0) assign("blogR.PUBLISH", Sys.getenv("blogR.PUBLISH"), envir = .GlobalEnv)
	if(!exists("blogR.RSCRIPT") && nchar(Sys.getenv("blogR.RSCRIPT")) > 0) assign("blogR.RSCRIPT", Sys.getenv("blogR.RSCRIPT"), envir = .GlobalEnv)
	if(!exists("blogR.USERNAME") && nchar(Sys.getenv("blogR.USERNAME")) > 0) assign("blogR.USERNAME", Sys.getenv("blogR.USERNAME"), envir = .GlobalEnv)
	if(!exists("blogR.PASSWORD") && nchar(Sys.getenv("blogR.PASSWORD")) > 0) assign("blogR.PASSWORD", Sys.getenv("blogR.PASSWORD"), envir = .GlobalEnv)	
	variables <- ls(pattern="blogR..*", envir=.GlobalEnv)
	if(length(variables)) {
		cat("May all your blog posts receive positive comments!\n\nYou now have the following variables in your workspace: ")
		x <- data.frame(sapply(variables, get))
		rownames(x) <- variables
		print(x)
	} else {
		print("blogR is not configured with global variables")
	}
}

check.blogR <- function() {
	return(length(grep("blogR..*",ls())) < 8)
}