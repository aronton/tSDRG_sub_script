sinfo
read -p "partition : " partition
scontrol show partition "scopion${partition}"
read -p "Number of core : " Ncore
read -p "R/F : " dir
read -p "Spin : " Spin
read -p "BC : " BC
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
read -p "initial_Seed : " initial_Seed
read -p "checkRangeFinalSeed : " checkRangeFinalSeed
read -p "deltaSeed : " deltaSeed

now_time="$(date +'%Y_%m_%d_h%H_m%M_s%S')/"
now_year="$(date +'%Y')/"
now_month="$(date +'%m')/"
now_day="$(date +'%d')/"


if [ "$dir" == "R" ]
then
    dir="Reverse"
    dirName="/home/aronton/tSDRG_project/tSDRG/Maiu_$Spin/check/$now_date"
    scriptName="/home/aronton/tSDRG_project/tSDRG/Sub_script/check/$now_date/check$dir"_"$now_date.sh"

    if [ -d "$dirName" ];
    then
        mkdir
    else
    fi

    cp /home/aronton/tSDRG_project/tSDRG/Sub_script/check/checkReverse.sh scriptName

    sed -e "s@scopion@scopion$partition@" -i scriptName
    sed -e "s@cpus-per-task@cpus-per-task=$Ncore@" -i scriptName
    sed -e "s@dir@$dir@" -i scriptName
    sed -e "s@BC@$BC@" -i scriptName
elif [ "$dir" == "D" ]
then
    dir="Forwarf"
    scriptName="/home/aronton/tSDRG_project/tSDRG/Sub_script/check/check$dir$PBC.sh"
else
    sh /home/aronton/tSDRG_project/tSDRG/Sub_script/sub_check.sh $Spin $BC $P $bonDim $L1 $L2 $space_L $J1 $J2 $space_J $D1 $D2 $space_D $initial_Seed $checkRangeFinalSeed $deltaSeed
fi
 

sbatch /home/aronton/tSDRG_project/tSDRG/Sub_script/check/check$dir$PBC.sh