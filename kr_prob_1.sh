#!/bin/bash

cd stories/prob
for file in gen_0*; do
	ruby $file;
done

cd ../..
ruby kr_prob_1.rb
latex -output-directory output -output-format pdf kr_prob_1.tex

cd output
rm *.out *.aux 
mv kr_prob_1.log .kr_prob_1.log

exit 0
