#!/bin/bash

# change `CONDA_ENV_PREFIX` with the path to your conda environment
CONDA_ENV=/lus/eagle/projects/datascience/balin/test_build_SSIM_220908_clean_2/ssim
DRIVER=src/driver.py

echo number of total nodes $1
echo number of database nodes $2
echo number of simulation nodes $3
echo CPU cores per node $4
echo simprocs $5
echo sim_ppn $6
echo device $7
echo logging $8

module load conda/2022-09-08
conda activate $CONDA_ENV
HOST_FILE=$(echo $PBS_NODEFILE)

echo 2 > input.config
echo "$1 $4" >> input.config

python $DRIVER $1 $2 $3 $4 $5 $6 $7 $8 $HOST_FILE
