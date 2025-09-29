#!/usr/bin/env bash

# Combine bib1.bib and bib2.bib into newbib.bib
# and comment out duplicates
#bibtool -s -d bib1.bib bib2.bib -o newbib.bib

bibtool -r ${PTOOLSDIR}/bibtoolrsc \
        -i ${PTOOLSDIR}/main.bib \
        -f "%-1n(author)%4d(year)" \
        -o mainDB.bib

if [[ ${FQDN} = *"killerkadoogan"* ]]; then
  sed -i 's/{1979/{vanriper1979/g' mainDB.bib
  sed -i 's/{mart2003/{marti2003/g' mainDB.bib
else
  sed -i ".bak" 's/{1979/{vanriper1979/g' mainDB.bib
  sed -i ".bak" 's/{mart2003/{marti2003/g' mainDB.bib
  rm -f mainDB.bib.bak
fi

#bibtool -r ${PTOOLSDIR}/bibtoolrsc \
#        -i ${PTOOLSDIR}/main.bib \
#        -f "%-3.1n(author)%4d(year)" \
#        -o mainDB.bib.initials
