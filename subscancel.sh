sinfo

read -p "Spin : " Spin
read -p "ProDis : " ProbDis
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
read -p "deltaSeed : " deltaSeed
read -p "BC : " BC
read -p "Ncore : " Ncore


# cp /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub.sh /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy.sh

# sed -e "s@--partition=scopion@--partition=scopion$subpartition@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy.sh

# sed -e "s@--cpus-per-task@--cpus-per-task=$subNcore@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy.sh

# sed -e "s@/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/fileName@/home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub_copy.sh

echo -e "\nScancel By Job Name:\n\nSpin:"${Spin}"\n""ProDis:"${ProbDis}"\n""Chi:"${bonDim}"\n""L:"${L1}"~"${L2}"("${space_L}")\n""J:"${J1}"~"${J2}"("${space_J}")\n""D:"${D1}"~"${D2}"("${space_D}")\n""Ncore="${Ncore}"\nseed:"${s1}"~"${s2}"\n"


read -p "Continue or not?(Y/N) : " Continue

if [ "${Continue}" == "Y" ]
then
    nohup sh /home/aronton/tSDRG_project/tSDRG/Sub_script/scancel.sh $Spin $ProbDis $bonDim $L1 $L2 $space_L $J1 $J2 $space_J $D1 $D2 $space_D $s1 $s2 $deltaSeed $BC $Ncore &
else
    sh /home/aronton/tSDRG_project/tSDRG/subscancel.sh
fi