#-----------------------------------------------------------------
QUELL=main.cpp
PROG=main
CC=g++
CFLAGS=-Wall
#-----------------------------------------------------------------
OBJECTS=$(QUELL:.cpp=.o)
all: Protokoll25.tex
	pdflatex Protokoll25.tex
	bibtex Protokoll25
	pdflatex Protokoll25.tex
	pdflatex Protokoll25.tex
	rm -f $(PROG) *.o *.toc *.log *.aux *.bbl *.blg
clean: 
	rm -f $(PROG) *.o *.toc *.log *.aux *.bbl *.blg
