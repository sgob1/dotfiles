#!/usr/bin/env bash
set -e

name="$(basename "${1/.rmd}")";
echo "Rendering file $name.rmd";                
Rscript -e "rmarkdown::render('$name.rmd')";
echo ""
echo ""
echo "Rendering of $name.rmd complete";

