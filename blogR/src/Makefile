JAVAC=javac
JAR=jar
JAVADOC=javadoc
JDKVER=1.4
JFLAGS=-source $(JDKVER) -target $(JDKVER)
JAPIURL=http://java.sun.com/j2se/1.4.2/docs/api

DOCSDIR=javaDoc

SRC=BlogPoster.java

all: blogposter.jar

blogposter.jar: $(SRC)
	$(JAVAC) -d . $(JFLAGS) -cp ../inst/java/xmlrpc-1.2-b1.jar $(SRC)
	$(JAR) fc $@ .

docs: $(SRC)
	rm -rf $(DOCSDIR)
	mkdir $(DOCSDIR)
	$(JAVADOC) -d $(DOCSDIR) -author -version -breakiterator -link $(JAPIURL) $(SRC)

install: blogposter.jar
	-mkdir -p ../inst/java
	cp blogposter.jar ../inst/java/blogposter.jar

clean:
	rm -rf *.class blogposter.jar $(DOCSDIR)
