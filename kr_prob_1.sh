#!/bin/bash

cd stories/prob

for file in gen*; do
	ruby $file;
done

echo
echo all tasks successfully generated

cd ../..

ruby kr_prob_1.rb

echo
echo data file successfully written

latex -output-directory output -output-format pdf kr_prob_1.tex

echo
echo done

exit 1