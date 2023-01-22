#!/usr/bin/bash

for i in *.png; 
        do 
                name="$(basename "${i/.png}")";
                echo "Converting file $name.png";
                convert "$name.png" "$name.jpg";
        done
