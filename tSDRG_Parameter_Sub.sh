#!/bin/bash

# function summary() {
#     squeue "$@" | awk 
#     BEGIN {
#         abbrev["R"]="(Running)"
#         abbrev["PD"]="(Pending)"
#         abbrev["CG"]="(Completing)"
#         abbrev["F"]="(Failed)"
#     }
#     NR>1 {a[$]++}
#     END {
#         for (i in a) {
#             printf "%-2s %-12s %d\n", i, abbrev[i], a[i]
#         }
#     }
# }

sinfo
read -p "partition : " partition
scontrol show partition "scopion${partition}"
read -p "Number of core : " Ncore
read -p "Spin : " Spin
if [ "${Spin}" != "${1}" ] 
then
    echo -e "Spin key in is inconsistent, please resubmit"
    sh ~/aronton_script.sh
fi
read -p "ProDis : " P
read -p "BonDim : " bonDim
read -p "Init_L : " L1
read -p "Final_L : " L2
read -p "Space_L : " space_L
read -p "Init_J : " J1
read -p "Final_J : " J2
read -p "Space_J : " space_J
read -p "Init_D : " D1
read -p "Final_D : " D2
read -p "Space_D : " space_D
read -p "Init seed : " s1
read -p "Final seed : " s2
read -p "delta seed : " ds
read -p "BC :" BC


# cp /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub.sh /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy.sh

# sed -e "s@--partition=scopion@--partition=scopion$subpartition@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy.sh

# sed -e "s@--cpus-per-task@--cpus-per-task=$subNcore@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy.sh

# sed -e "s@/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/fileName@/home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy.sh

echo -e "\ntSDRG_Running_Parameter:\n\nSpin:"${Spin}"\n""BC:${BC}""\n""ProDis:"${P}"\n""Chi:"${bonDim}"\n""L:"${L1}"~"${L2}"("${space_L}")\n""J:"${J1}"~"${J2}"("${space_J}")\n""D:"${D1}"~"${D2}"("${space_D}")\n""seed:"${s1}"~"${s2}"(${ds})""\n""partion:scopion"${partition}"\n""cpu_per_task:"${Ncore}"\n"


read -p "Continue or not?(Y/N) : " Continue

if [ "${Continue}" == "Y" ]
then
    nohup sh /home/aronton/tSDRG_project/tSDRG/Sub_script/sub/sub.sh $partition $Ncore $Spin $P $bonDim $L1 $L2 $space_L $J1 $J2 $space_J $D1 $D2 $space_D $s1 $s2 $ds $BC &
else
    sh /home/aronton/tSDRG_project/tSDRG/Sub_script/tSDRG_Parameter_Sub.sh
fi