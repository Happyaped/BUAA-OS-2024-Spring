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
cd ..
gcc -o hello code/0.o code/1.o code/2.o code/3.o code/4.o code/5.o code/6.o code/7.o code/8.o code/9.o code/10.o code/11.o code/12.o code/13.o code/14.o code/15.o
./hello 2> err.txt
mv err.txt ~/22371157
cd ~/22371157
chmod +x err.txt 
