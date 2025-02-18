#!/bin/bash

# change `datascience` to the charge account for your project
nodes=1
ChargeAccount=datascience
queue=debug
runtime=01:00:00

echo number of nodes $nodes
echo run time $runtime

qsub -I -A $ChargeAccount -q $queue -l select=$nodes:ncpus=64:ngpus=4,walltime=$runtime,filesystems=eagle:home

