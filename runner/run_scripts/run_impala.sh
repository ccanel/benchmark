#!/bin/bash
IMPALA_HOSTS=ec2-54-234-9-63.compute-1.amazonaws.com,\
ec2-54-234-85-151.compute-1.amazonaws.com,\
ec2-23-20-27-173.compute-1.amazonaws.com,\
ec2-54-226-25-107.compute-1.amazonaws.com,\
ec2-107-22-65-69.compute-1.amazonaws.com
IMPALA_IDENTITY_FILE=~/.ssh/patkey.pem
NUM_TRIALS=3
RUN_DIR=..

queries=(1a)
out_file=impala_`date +%s`

for i in "${queries[@]}"
do
  $RUN_DIR/run-query.sh \
    --impala \
    --query-num=$i \
    --num-trials=$NUM_TRIALS \
    --impala-hosts=$IMPALA_HOSTS \
    --impala-identity-file=$IMPALA_IDENTITY_FILE >> $out_file
done


