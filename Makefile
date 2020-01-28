
.PHONY : all pdf html ingest clean

all : pdf html docs/r-intro-files.zip

pdf :
	cd book ; Rscript -e "bookdown::render_book('.', 'bookdown::pdf_book')"

html :
	cd book ; Rscript -e "bookdown::render_book('.', 'bookdown::gitbook')"
	cp -R book/figures docs

docs/r-intro-files.zip : r-intro-files/*
	zip -FSr docs/r-intro-files.zip r-intro-files

ingest :
	cd ingest ; make

clean :
	rm -rf docs/*


