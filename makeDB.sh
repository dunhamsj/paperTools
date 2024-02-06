#!/usr/bin/env bash

# Combine bib1.bib and bib2.bib into newbib.bib
# and comment out duplicates
#bibtool -s -d meth.bib sasi.bib -o newbib.bib

bibtool -r ${PTOOLSDIR}/bibtoolrsc \
        -i ${PTOOLSDIR}/mainDB.bib \
        -f "%-3.1n(author)%4d(year)" \
        -o main.bib
