#!/bin/bash
if [ "$#" -ne 0 ] 
then
	argv=$@

	PROCESS=$(ps aux | grep -Eo "${argv[0]} .+ qemu")
	#echo ${PROCESS}
	PROCESS=$(echo ${PROCESS}  | grep -Eo "${argv[0]} *[0-9]+ *")
	#echo ${PROCESS}
	PROCESS=$(echo ${PROCESS}  | grep -Eo " [0-9]+")
	#echo ${PROCESS}
	PROCESS=$(echo ${PROCESS}  | head -1)
	#echo ${PROCESS}

	kill ${PROCESS} > /dev/null 2>&1 && echo "Killing ${PROCESS}"\
					   || echo "Qemu not open"
else
	#echo "-------- Usage --------"
	echo "Usage: ./killqemu username001"
	#echo "-----------------------"
fi
