#!/usr/bin/env bash

# Combine bib1.bib and bib2.bib into newbib.bib
# and comment out duplicates
#bibtool -s -d bib1.bib bib2.bib -o newbib.bib

bibtool -r ${PTOOLSDIR}/bibtoolrsc \
        -i ${PTOOLSDIR}/main.bib \
        -f "%-3.1n(author)%4d(year)" \
        -o mainDB.bib
sed -i 's/{1979/{r1979/g' mainDB.bib # hack to fix van Riper entry
sed -i 's/{a-d-tab2021/{amrex2021/g' mainDB.bib # hack to fix amrex entry
