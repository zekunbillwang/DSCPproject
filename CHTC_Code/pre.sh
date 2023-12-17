#!/bin/bash 
# python -c 'import pandas as pd; from kaggle.api.kaggle_api_extended import KaggleApi; api = KaggleApi(); api.authenticate(); FileList = api.datasets_list_files("cynthiarempel", "amazon-us-customer-reviews-dataset"); pd.Series([_["name"] for _ in FileList["datasetFiles"]]).to_csv("files", sep="\n", index=False, header=False)'
# unzip *.zip 
# ls *.tsv > superfiles
# cat superfiles | while read superfile; do split -d -n l/20 ${superfile} ${superfile}; rm ${superfile}; done; 
# if [[ $# -ne 1 ]]; then
    # echo "usage: $0 <file>"
    # exit 0
# fi
file=$(echo *.tsv)
echo $file > logs/file
split -d -n l/100 ${file} ${file}
cat ${file} | wc -l > logs/${file}.total;
# rm ${file}
ls ${file}{00..99} > files
