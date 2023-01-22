#!/usr/bin/env bash
set -e

for i in *.rmd; do
        name="$(basename "${i/.rmd}")";
        echo "Rendering file $name.rmd";                
        Rscript -e "rmarkdown::render('$name.rmd')";
        echo ""
        echo ""
        echo "Rendering of $name.rmd complete";
done

