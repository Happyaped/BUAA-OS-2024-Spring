.PHONY: clean

out: calc case_all
	case_all > gcc -o case_tem calc
	./case_tem > out 
case_add: casegen.c
	gcc -o case_tem casegen.c add 100
	./case_tem > case_add
case_sub: casegen.c
	gcc -o case_tem casegen.c sub 100
	./case_tem > case_sub
case_mul: casegen.c
	gcc -o case_tem casegen.c mul 100
	./case_tem > case_mul 
case_div: casegen.c
	gcc -o case_tem casegen.c div 100
	./case_tem > case_div
case_all: case_add case_sub case_mul case_div
	cat case_add case_sub case_mul case_div > case_all
clean:
	rm -f out calc casegen case_* *.o
