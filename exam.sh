#!/bin/bash
n=$#
num=0
if(($n==0))
then
let num=num+2
elif(($n==1))
then
let num=$1+1
else
let num=$1+$2
fi
mkdir test
cp -r code test
cd code
cat 14.c
cd ..
cd test
cd code
i=0
while(($i<=15))
do
	gcc -c $i.c -o $i.o
	let i=i+1
done
gcc -o hello 0.o 1.o 2.o 3.o 4.o 5.o 6.o 7.o 8.o 9.o 10.o 11.o 12.o 13.o 14.o 15.o
mv hello ~/22371157/test
cd ..
./hello 2> err.txt
mv err.txt ~/22371157
cd ~/22371157
