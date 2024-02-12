NAME=main
TARGET=$(NAME).pdf
SOURCE=$(NAME).tex
AUX=$(NAME).aux

FIGS=$(wildcard Figures/*.pdf Figures/*png)
#BIBS=$(shell find bibliography/ -name \*.bib)
#PLTS=$(shell find fig -name \*.py -perm +111)

JUNK=.aux .bbl .blg .bib .dvi .log .nav .out .toc .brf .fls .fdb_latexmk .lot .lof .nlo .synctex*

all: $(TARGET)

$(TARGET): $(SOURCE) $(FIGS) .FORCE
	@pdflatex $(SOURCE)
	@bibtex $(NAME)
	@pdflatex $(SOURCE)
	@pdflatex $(SOURCE)
	@sed -i 's/{1979/{r1979/g' $(NAME).bib # Hack to fix `van Riper` entry
	@sed -i 's/{a-d-tab2021/{amrex2021/g' $(NAME).bib # Hack to fix `amrex` entry

bib: $(SOURCE) $(FIGS) $(BIBS) .FORCE
	@pdflatex $(SOURCE)
	@bibtool -r $(PTOOLSDIR)/bibtoolrsc \
		 -f "%-3.1n(author)%4d(year)" \
                 -i $(PTOOLSDIR)/mainDB.bib \
		 -x $(AUX) \
                 -o $(NAME).bib
	@bibtex $(NAME)
	@pdflatex $(SOURCE)
	@pdflatex $(SOURCE)
	@sed -i 's/{1979/{r1979/g' $(NAME).bib # Hack to fix `van Riper` entry
	@sed -i 's/{a-d-tab2021/{amrex2021/g' $(NAME).bib # Hack to fix `amrex` entry

clean:
	@for ext in $(JUNK); do\
	    rm -f $(NAME)$$ext;\
	done

quick:  $(SOURCE) $(FIGS) $(BIBS) .FORCE
	@pdflatex $(SOURCE)

.FORCE:
