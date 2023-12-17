#!/bin/bash 
# cat files | while read file; do echo "${file},$(cat ${file}.out)" > logs/out; done
outfile=$(cat logs/file)
cat files | { cnt=0; total=0; while read file; do cnt=$(($cnt+$(cat cnt.${file}))); total=$(($total+$(cat total.${file}))); done; mean=$(echo "scale=6; ${total}/${cnt}" | bc); echo ${mean} > logs/${outfile}.out; }
# rm *.tsv*
# Rscript bill.R ${outfile} ${mean}
