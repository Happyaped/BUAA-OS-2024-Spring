.PHONY: clean

out: calc case_all
	gcc -o case_tem calc
	cat case_all | ./case_tem > out 
case_add: casegen.c
	gcc -o case_tem casegen.c
	./case_tem add 100 > case_add
case_sub: casegen.c
	gcc -o case_tem casegen.c
	./case_tem sub 100 > case_sub
case_mul: casegen.c
	gcc -o case_tem casegen.c 
	./case_tem mul 100 > case_mul 
case_div: casegen.c
	gcc -o case_tem casegen.c
	./case_tem div 100 > case_div
case_all: case_add case_sub case_mul case_div
	cat case_add case_sub case_mul case_div > case_all
clean:
	rm -f out calc casegen case_* *.o
