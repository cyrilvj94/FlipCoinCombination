#! /bin/bash 

function simulateCoinFlip
{
result=$((RANDOM%2))
case $result in 
	0)echo T;;
	1)echo H;;
esac
}

#Get singlet
function simulateCombinations
{
count=$1
result=""
for((i=0;i<$count;i++))
do
	result="$result"`echo $(simulateCoinFlip)`
done
echo $result
}

#find the count of heads and tails
function simulateSinglet
{
declare -a singletArray
declare -A singletCount
singletCount[H]=0;singletCount[T]=0;
for((i=0;i<10;i++))
do
	result=$(simulateCombinations 1)
	singletArray[$i]=$result
	((singletCount[$result]++))
done

echo "${singletArray[@]}   counts :>> ${!singletCount[@]} ${singletCount[@]} "
}

#Doublet Simulation

function simulateDoublet
{
declare -a doubletArray
declare -A doubletCount
doubletCount[HH]=0;doubletCount[HT]=0;doubletCount[TH]=0;doubletCount[TT]=0;
for((i=0;i<10;i++))
do
        result=$(simulateCombinations 2)
        doubletArray[$i]=$result
        ((doubletCount[$result]++))
done

echo "${doubletArray[@]}  counts :>> ${!doubletCount[@]} ${doubletCount[@]} "
}



#echo $(simulateSinglet)
echo $(simulateDoublet)
#countH=0
#countT=0
#for((i=0;i<50;i++))
#do
#        if [ "${singletArray[$i]}" == "H" ]
#        then
#                ((countH++))
#        else
#                ((countT++))
#        fi
#done
#echo  "Head count : "$countH "  | Tail count :"$countT
#echo "Percentage Head count : "$((countH*2)) "%  |Percentage Tail count : "$((countT*2)) "%"

