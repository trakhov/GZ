#!/bin/bash

cd stories/prob
for num in $@; do
	ruby gen_$num.rb;
done

cd ../..
ruby letuch_prob.rb

latex -output-directory output -output-format pdf letuch_prob.tex

cd output
rm *.out *.aux *.log
mv letuch_prob.pdf letuch_prob_$(date +%y%m%d).pdf

exit 0
