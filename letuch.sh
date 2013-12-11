#!/bin/bash

nums=(211 212)
name=${nums[*]}

cd stories/prob
for num in ${nums[*]}; do
	ruby gen_$num.rb;
done

cd ../..
ruby letuch_prob.rb

latex -output-directory output -output-format pdf letuch_prob.tex

cd output
rm *.out *.aux *.log
mv letuch_prob.pdf letuch_prob_${name// /_}.pdf

exit 0
