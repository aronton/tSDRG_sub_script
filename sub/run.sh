#!/bin/bash
#SBATCH --partition=scopion
#SBATCH --ntasks=1
#SBATCH --job-name=example
#SBATCH --cpus-per-task
#SBATCH --output=/home/aronton/tSDRG_project/tSDRG/Main/jobRecord/slurmOutput/fileName.out

date

echo -e "current dir:"
pwd

#echo "The script name is        ==> ${0}"
#echo "Total parameter number is ==> $#"
[ "$#" -lt 8 ] && echo "The number of parameter is less than 8.  Stop here." && exit 0
#echo "Your whole parameter is   ==> '$@'"
echo "L         ==> ${1}"
echo "J         ==> ${2}"
echo "D         ==> ${3}"
echo "s1        ==> ${4}"
echo "s2        ==> ${5}"
echo "spin        ==> ${6}"
echo "bonDim        ==> ${7}"
echo "BC        ==> ${8}"
echo "Ncore        ==> ${9}"

L=$(echo "scale=0; (${1})/1" | bc)
echo -e "L=$L"

J=$(echo "scale=3; (${2})" | bc)
echo -e "J=$J"

D=$(echo "scale=3; (${3})" | bc)
echo -e "D=$D"

s1=$(echo "scale=0; (${4})/1" | bc)
echo -e "s1=$s1"

s2=$(echo "scale=0; (${5})/1" | bc)
echo -e "s2=$s2"

Spin=$(echo "scale=0; (${6})/1" | bc)
echo -e "Spin=$Spin"

bonDim=$(echo "scale=0; (${7})/1" | bc)
echo -e "bonDim=$bonDim"

BC=${8}
echo -e "BC=$BC"

Ncore=${9}
echo -e "Ncore=$Ncore"

CheckOrNot="N"

# export OMP_NUM_THREADS=${Ncore}
# export MKL_NUM_THREADS=${Ncore}

echo "./spin${Spin}.exe ${L} ${bonDim} 10 ${J} ${D} ${BC} ${s1} ${s2} ${Ncore} ${CheckOrNot}"
#sbatch ./spin15.exe ${1} 30 10 ${2} ${3} PBC ${4} ${5}
# date >> /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/running
# echo "L:", ${1}, ",J:", ${2}, ",D:", ${3}, ",seed1:", ${4}, ",seed2:", ${5} >> /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/running
/home/aronton/tSDRG_project/tSDRG/Main/Spin${Spin}_che.exe ${L} ${bonDim} 10 ${J} ${D} ${BC} ${s1} ${s2} ${CheckOrNot}

date