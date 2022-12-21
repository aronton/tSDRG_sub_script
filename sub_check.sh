sinfo
read -p "partition : " partition
scontrol show partition "scopion${partition}"
read -p "Number of core : " Ncore
read -p "Spin : " Spin
read -p "ProDis : " P
read -p "BonDim : " bonDim
read -p "Init_L : " L1
read -p "Final_L : " L2
read -p "Space_L : " space_L
read -p "Init_J : " J1
read -p "Final_J : " J2