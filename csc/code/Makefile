all:fibo.o main.o
fibo.o:fibo.c
	gcc -I../include -c fibo.c -o fibo.o
main.o:main.c
	gcc -I../include -c main.c -o main.o
clean:fibo.o main.o
	rm -f fibo.o
	rm -f main.o
