SLIDE_RMD_FILES := 01-cloud/01-cloud.Rmd 02-tutorial/02-tutorial.Rmd 03-git/03-git.Rmd
SLIDE_HTML_FILES := $(subst Rmd,html,$(SLIDE_RMD_FILES))
SLIDE_PDF_FILES  := $(subst Rmd,pdf,$(SLIDE_RMD_FILES))

all: $(SLIDE_PDF_FILES)

print:
	echo $(SLIDE_PDF_FILES)
	echo $(SLIDE_HTML_FILES)

clean:
	rm -f $(SLIDE_HTML_FILES)
	rm -f $(SLIDE_PDF_FILES)

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$<')"

%.pdf: %.html
	cd $(<D); \
	Rscript -e "pagedown::chrome_print('$(<F)')"