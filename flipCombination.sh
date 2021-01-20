#! /bin/bash

function simulateCoinFlip
{
result=$((RANDOM%2))
case $result in 
	0)echo T;;
	1)echo H;;
esac
}
