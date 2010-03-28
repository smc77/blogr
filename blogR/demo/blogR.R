# 
# Author: sconway
###############################################################################


blogR.demo <- function() {
	require(blogR)
	#
	cat("This demo will post the example blog post onto your blog.\n\n")
	blogR.URL <- readline("Enter your blog url:")
	cat("Posting to your blog on:", blogR.URL, "\n\n")
	
}
