#!/bin/bash
# condor_rm zwang2965
rm -rf master.dag*
rm -rf Billama* 
bash ./preAll.sh
condor_submit_dag master.dag
