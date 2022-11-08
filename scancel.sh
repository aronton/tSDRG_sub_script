#!/bin/bash

date

# echo "partition         ==> ${1}"
# echo "Ncore         ==> ${2}"
echo "Spin         ==> ${1}"
echo "chi        ==> ${2}"
echo "bonDim        ==> ${3}"
echo "L1        ==> ${4}"
echo "L2        ==> ${5}"
echo "space_L        ==> ${6}"
echo "J1        ==> ${7}"
echo "J2        ==> ${8}"
echo "space_J        ==> ${9}"
echo "D1        ==> ${10}"
echo "D2        ==> ${11}"
echo "space_D        ==> ${12}"
echo "seed1        ==> ${13}"
echo "seed2        ==> ${14}"
echo "deltaSeed        ==> ${15}"
echo "BC        ==> ${16}"
echo "Ncore        ==> ${17}"



Spin=$(echo "scale=0; (${1})/1" | bc)
echo -e "Spin=$Spin"

chi=$(echo "scale=0; (${2})/1" | bc)
echo -e "chi=$chi"

bonDim=$(echo "scale=0; (${3})/1" | bc)
echo -e "bonDim=$bonDim"

L1=$(echo "scale=0; (${4})/1" | bc)
echo -e "L1=$L1"
L2=$(echo "scale=0; (${5})/1" | bc)
echo -e "L2=$L2"
space_L=$(echo "scale=0; (${6})/1" | bc)
echo -e "space_L=$space_L"

J1=$(echo "scale=3; (${7})/1." | bc)
echo -e "J1=$J1"
J2=$(echo "scale=3; (${8})/1." | bc)
echo -e "J2=$J2"
space_J=$(echo "scale=3; (${9})/1." | bc)
echo -e "space_J=$space_J"

D1=$(echo "scale=3; (${10})/1." | bc)
echo -e "D1=$D1"
D2=$(echo "scale=3; (${11})/1." | bc)
echo -e "D2=$D2"
space_D=$(echo "scale=3; (${12})/1." | bc)
echo -e "space_D=$space_D"

s1=$(echo "scale=0; (${13})/1" | bc)
echo -e "s1=$s1"
s2=$(echo "scale=0; (${14})/1" | bc)
echo -e "s2=$s2"
sInterval=$(echo "scale=0; (${15})/1" | bc)
echo -e "sInterval=$sInterval"

BC=${16}
echo -e "BC=$BC"

Ncore=${17}
echo -e "Ncore=$Ncore"

J1_100=$(echo "scale=0; 100*(${J1})/1" | bc)

if [ $J1_100 -lt 10 ]
then
    J1dis="Jdis00"$J1_100
elif [ $J1_100 -ge 10 ] && [ $J1_100 -lt 100 ]
then
    J1dis="Jdis0"$J1_100
else
    J1dis="Jdis"$J1_100
fi

J2_100=$(echo "scale=0; 100*(${J2})/1" | bc)

if [ $J2_100 -lt 10 ]
then
    J2dis="Jdis00"$J2_100
elif [ $J2_100 -ge 10 ] && [ $J2_100 -lt 100 ]
then
    J2dis="Jdis0"$J2_100
else
    J2dis="Jdis"$J2_100
fi

space_J_100=$(echo "scale=0; 100*(${space_J})/1" | bc)

if [ $space_J_100 -lt 10 ]
then
    space_Jdis="Jdis00"$space_J_100
elif [ $space_J_100 -ge 10 ] && [ $space_J_100 -lt 100 ]
then
    space_Jdis="Jdis0"$space_J_100
else
    space_Jdis="Jdis"$space_J_100
fi

D1_100=$(echo "scale=0; 100*(${D1})/1" | bc)

if [ $D1_100 -lt 10 ]
then
    dim1="dim00"$D1_100
elif [ $D1_100 -ge 10 ] && [ $D1_100 -lt 100 ]
then
    dim1="dim0"$D1_100
else
    dim1="dim"$D1_100
fi

D2_100=$(echo "scale=0; 100*(${D2})/1" | bc)

if [ $D2_100 -lt 10 ]
then
    dim2="dim00"$D2_100
elif [ $D2_100 -ge 10 ] && [ $D2_100 -lt 100 ]
then
    dim2="dim0"$D2_100
else
    dim2="dim"$D2_100
fi

space_D_100=$(echo "scale=0; 100*(${space_D})/1" | bc)

if [ $space_D_100 -lt 10 ]
then
    space_dim="dim00"$space_D_100
elif [ $space_D_100 -ge 10 ] && [ $space_D_100 -lt 100 ]
then
    space_dim="dim0"$space_D_100
else
    space_dim="dim"$space_D_100
fi

if [ "${space_L}" == "0" ]
then
    t0=$(echo "${space_L}" | bc)
else
    t0=$(echo "(${L2}-${L1})/${space_L}" | bc)
fi

if [ "${space_J}" == "0" ]
then
    t1=$(echo "${space_J}" | bc)
else
    t1=$(echo "(${J2}-${J1})/${space_J}" | bc)
fi

if [ "${space_D}" == "0" ]
then
    t2=$(echo "${space_D}" | bc)
else
    t2=$(echo "(${D2}-${D1})/${space_D}" | bc)
fi

now_date="$(date +'%Y_%m_%d')/"

tSDRG_Path="/home/aronton/tSDRG_project/tSDRG/Main_${Spin}/rm_submit/"

if [ -d "${tSDRG_Path}""${now_date}" ]; then
    # 目錄 /path/to/dir 存在
    echo -e "${tSDRG_Path}""${now_date}"
else
    # 目錄 /path/to/dir 不存在
    echo -e "mkdir""${tSDRG_Path}""${now_date}"
    mkdir -p "${tSDRG_Path}""${now_date}"
fi

file=${tSDRG_Path}${now_date}"Scancel_Spin="${Spin}";L="${L1}"_"${L2}"("${space_L}");J="${J1dis}"_"${J2dis}"("${space_Jdis}");D="${dim1}"_"${dim2}"("${space_dim}");seed1="${s1}"_seed2="${s2}

for (( l=0; l<=${t0}; l=l+1 ))
do
        L=$(echo "scale=3; ${L1}+${l}*${space_L}" | bc)

        echo "ooooooooooL_L=${L}_oooooooooo"
        echo -e "\n\noooooooooo_L=${L}_oooooooooo\n\n" >> "${file}.txt"

        # if [ -d "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}" ]; then
        #     # 目錄 /path/to/dir 存在
        #     echo -e "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}_ok" >> "${file}.txt"
        # else
        #     # 目錄 /path/to/dir 不存在
        #     echo -e "mkdir /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}" >> "${file}.txt"
        #     mkdir "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}"
        # fi

        # if [ -d "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/L${L}" ]; then
        #     # 目錄 /path/to/dir 存在
        #     echo -e "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/L${L}_ok" >> "${file}.txt"
        # else
        #     # 目錄 /path/to/dir 不存在
        #     echo -e "mkdir /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/L${L}" >> "${file}.txt"
        #     mkdir "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/L${L}"
        # fi

        for (( j=0; j<=${t1}; j=j+1 ))
        do
                J=$(echo "scale=3; ${J1}+${j}*${space_J}" | bc)
                J_100=$(echo "scale=0; 100*(${J1}+${j}*${space_J})/1" | bc)

                if [ $J_100 -lt 10 ]
                then
                    Jdis="Jdis00"$J_100
                elif [ $J_100 -ge 10 ] && [ $J_100 -lt 100 ]
                then
                    Jdis="Jdis0"$J_100
                else
                    Jdis="Jdis"$J_100
                fi

                echo "xxxxxxxxxxxxxxx_${Jdis}_xxxxxxxxxxxxxxx"
                echo -e "\n\nxxxxxxxxxxxxxxx_${Jdis}_xxxxxxxxxxxxxxx\n\n" >> "${file}.txt"

                # if [ -d "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}" ]; then
                #     # 目錄 /path/to/dir 存在
                #     echo -e "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}_ok" >> "${file}.txt"
                # else
                #     # 目錄 /path/to/dir 不存在
                #     echo -e "mkdir /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}" >> "${file}.txt"
                #     mkdir "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}"
                # fi

                # if [ -d "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/L${L}/${Jdis}" ]; then
                #     # 目錄 /path/to/dir 存在
                #     echo -e "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/L${L}/${Jdis}_ok" >> "${file}.txt"
                # else
                #     # 目錄 /path/to/dir 不存在
                #     echo -e "mkdir /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/L${L}/${Jdis}" >> "${file}.txt"
                #     mkdir "/home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/slurmOutput/L${L}/${Jdis}"
                # fi

                for (( d=0; d<=${t2}; d=d+1 ))
                do
                        D=$(echo "scale=3; ${D1}+${d}*${space_D}" | bc)
                        D_100=$(echo "scale=0; 100*(${D1}+${d}*${space_D})/1" | bc)

                        if [ $D_100 -lt 10 ]
                        then
                            Dim="Dim00"$D_100
                        elif [ $D_100 -ge 10 ] && [ $D_100 -lt 100 ]
                        then
                            Dim="Dim0"$D_100
                        else
                            Dim="Dim"$D_100
                        fi

                        echo "---------------${Dim}---------------" 
                        echo -e "\n\n---------------${Dim}---------------\n\n" >> "${file}.txt"

                        # if [ -d "/home/aronton/tSDRG_project/tSDRG/Main_${Spin}/jobRecord/script/L${L}/${Jdis}/${Dim}" ]; then
                        #     # 目錄 /path/to/dir 存在
                        #     echo -e "/home/aronton/tSDRG_project/tSDRG/Main_${Spin}/jobRecord/script/L${L}/${Jdis}/${Dim}_ok" >> "${file}.txt"
                        # else
                        #     # 目錄 /path/to/dir 不存在
                        #     echo -e "mkdir /home/aronton/tSDRG_project/tSDRG/Main_${Spin}/jobRecord/script/L${L}/${Jdis}/${Dim}" >> "${file}.txt"
                        #     mkdir "/home/aronton/tSDRG_project/tSDRG/Main_${Spin}/jobRecord/script/L${L}/${Jdis}/${Dim}"
                        # fi
                        
                        # if [ -d "/home/aronton/tSDRG_project/tSDRG/Main_${Spin}/jobRecord/slurmOutput/L${L}/${Jdis}/${Dim}" ]; then
                        #     # 目錄 /path/to/dir 存在
                        #     echo -e "/home/aronton/tSDRG_project/tSDRG/Main_${Spin}/jobRecord/slurmOutput/L${L}/${Jdis}/${Dim}_ok" >> "${file}.txt"
                        # else
                        #     # 目錄 /path/to/dir 不存在
                        #     echo -e "mkdir /home/aronton/tSDRG_project/tSDRG/Main_${Spin}/jobRecord/slurmOutput/L${L}/${Jdis}/${Dim}" >> "${file}.txt"
                        #     mkdir "/home/aronton/tSDRG_project/tSDRG/Main_${Spin}/jobRecord/slurmOutput/L${L}/${Jdis}/${Dim}"
                        # fi     

                        numOfinterval=$(echo "scale=0; (${s2}-${s1}+1)/${sInterval}" | bc)
                        echo -e "numOfinterval=$numOfinterval"

                        for (( s=0; s<${numOfinterval}; s=s+1 ))
                        do      

                                localS1=$(( ${s}*${sInterval}+${s1} ))
                                localS2=$(( (${s}+1)*${sInterval}+${s1}-1 ))

                                name="spin"${Spin}"_L"${L}"_"${Jdis}"_"${Dim}"_B"${bonDim}"_BC="${BC}"_Ncore="${Ncore}"_seed1="${localS1}"_seed2="${localS2}".sh"
                                echo -e ${name}
                                echo -e ${name} >> "${file}.txt"
                                scancel --name=${name}
                        done
                        # cp /home/aronton/tSDRG_project/tSDRG/Main_15/sub/run.sh /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}/${Dim}/spin15_L${L}_${Jdis}_${Dim}_seed1=${s1}_seed2=${s2}.sh 
                        
                        # sed -e "s@scopion@scopion$partition@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}/${Dim}/spin15_L${L}_${Jdis}_${Dim}_seed1=${s1}_seed2=${s2}.sh 
                        
                        # sed -e "s@cpus-per-task@cpus-per-task=$Ncore@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}/${Dim}/spin15_L${L}_${Jdis}_${Dim}_seed1=${s1}_seed2=${s2}.sh 
                        
                        # sed -e "s@fileName@L${L}/${Jdis}/${Dim}/spin15_L${L}_${Jdis}_${Dim}_seed1=${s1}_seed2=${s2}@" -i /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}/${Dim}/spin15_L${L}_${Jdis}_${Dim}_seed1=${s1}_seed2=${s2}.sh 
                        
                        # sbatch /home/aronton/tSDRG_project/tSDRG/Main_15/jobRecord/script/L${L}/${Jdis}/${Dim}/spin15_L${L}_${Jdis}_${Dim}_seed1=${s1}_seed2=${s2}.sh ${L} ${J} ${D} ${s1} ${s2}
                        
                        # date >> /home/aronton/tSDRG_project/tSDRG/Main_1/jobRecord/pending
                        
                        # echo "Partition:", ${partition}, "Number of core", ${Ncore} "L:", ${L}, ",J:", ${J}, ",D:", ${D}, ",seed1:", ${s1}, ",seed2:", ${s2} >> /home/aronton/tSDRG_project/tSDRG/Main_1/jobRecord/pending 
                done
        done
done
# else
#     sh /home/aronton/tSDRG_project/tSDRG/Main_15/sub/sub.sh
# fi

date >> "${file}.txt"

echo -e "\n\nL:" ${L1}"~"${L2}"("${space_L}")""\n""J:"${J1dis}"~"${J2dis}"("${space_Jdis}")""\n""D:"${dim1}"~"${dim2}"("${space_dim}")""\n""seed1="${s1}",seed2="${s2}"\n\n"