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
function simulateSinglet
{
echo $(simulateCoinFlip)
}

#find the count of heads and tails
declare -a singletArray
for((i=0;i<50;i++))
do
	singletArray[$i]=$(simulateSinglet)
done
countH=0
countT=0
for((i=0;i<50;i++))
do
        if [ "${singletArray[$i]}" == "H" ]
        then
                ((countH++))
        else
                ((countT++))
        fi
done
echo  "Head count : "$countH "  | Tail count :"$countT
echo "Percentage Head count : "$((countH*2)) "%  |Percentage Tail count : "$((countT*2)) "%"

