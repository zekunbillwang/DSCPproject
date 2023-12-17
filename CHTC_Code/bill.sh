#!/bin/bash
if [[ $# -ne 1 ]]; then
    echo "usage: $0 <file>"
    exit 0
fi
file=$1
# tar -xzf python310.tar.gz
# export PATH=$PWD/python/bin:$PATH
# tail -n +2 ${file} | cut -d $'\t' -f 8 | { total=0; cnt=0; while read rate; do if [[ $rate =~ ^[.0-9]+$ ]]; then cnt=$(($cnt+1)); total=$(echo "scale=6; $total+$rate" | bc); fi; done; echo $total > total.${file}; echo $cnt > cnt.${file};}
tail -n +2 ${file} | { total=0; cnt=0; while read rate; do if [[ $rate =~ ^[.0-9]+$ ]]; then cnt=$(($cnt+1)); total=$(echo "scale=6; $total+$rate" | bc); fi; done; echo $total > total.${file}; echo $cnt > cnt.${file};}
rm -rf ${file}
