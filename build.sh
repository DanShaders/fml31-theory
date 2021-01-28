#!/bin/bash
mkdir build
mkdir build/sections
working_dir=`pwd`
error=false

while read a b 
do
	cd $b
	if pdflatex -output-directory="$working_dir/build" -jobname=$a main.tex && pdflatex -output-directory="$working_dir/build" -jobname=$a main.tex && pdflatex -output-directory="$working_dir/build" -jobname=$a main.tex ; then
		echo -e "\e[32m[OK]\e[0m $b"
	else
		echo -e "\e[31m[FAILED]\e[0m $b"
		error=true
	fi
	cd "$working_dir"
done < files

if $error ; then
	echo -e "\e[31mFAILED\e[0m"
	exit 1
else
	echo -e "\e[32mOK\e[0m"
fi