#!/bin/bash 
file=$(echo *.tsv)
echo $file > logs/file
split -d -n l/100 ${file} ${file}
cat ${file} | wc -l > logs/${file}.total;
# rm ${file}
ls ${file}{00..99} > files
