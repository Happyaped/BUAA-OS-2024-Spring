all:hello
hello:hello.c
	gcc -o hello hello.c
run:hello
	./hello
clean:hello
	rm -r hello
