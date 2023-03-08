#! /bin/bash
#SBATCH --partition=scopion
#SBATCH --ntasks=1
#SBATCH --cpus-per-task
#SBATCH --output=./checkdirBC

date
python ./checkdir.py
date