.onLoad <- function(libname, pkgname) {
	
	load.blogR()
	
	# Load java package
	.jpackage(pkgname)
	
}  

