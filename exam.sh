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
gcc -o test/hello 0.o 1.o 2.o 3.o 4.o 5.o 6.o 7.o 8.o 9.o 10.o 11.o 12.o 13.o 14.o 15.o
./hello 2> err.txt
mv err.txt ~/22371157
cd ~/22371157
chmod +x err.txt
n=$1+$2
sed -n '$np' err.txt >&2
