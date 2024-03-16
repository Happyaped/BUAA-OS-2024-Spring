#!/bin/bash
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
gcc -o ../hello *.o
cd ..
./hello 2> err.txt
mv err.txt ..
cd ..
chmod 655 err.txt
num=0
if(($#==0))
then
let num=num+2
elif(($#==1))
then
let num=$1+1
else
let num=$1+$2
fi
sed -n "${num}p" err.txt   
