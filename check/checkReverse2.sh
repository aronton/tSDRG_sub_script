#! /bin/bash
#SBATCH --partition=scopion4
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=./checkReverseBC2

date
python /home/aronton/tSDRG_project/tSDRG/Main_2/checkReverse.py
date