#!/bin/bash

for file in `diff <(ls *.jpg *.png) <(cd small; ls)`; do
	case $file in 
		*.png)
			echo "Thumbnailing $file"
                        mogrify -format png -path small -thumbnail 300 $file
			;;	
                *.jpg)
                        echo "Thumbnailing $file"
                        mogrify -format jpg -path small -thumbnail 300 $file
                        ;;		
		*)
			echo "skipping $file"
			;;		
	esac
done
