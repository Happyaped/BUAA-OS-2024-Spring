.PHONY: clean

out: calc case_all
	case_all > gcc -o out calc 
case_add: casegen.c
	gcc -o case_add casegen.c add 100
case_sub: casegen.c
	gcc -o case_sub casegen.c sub 100
case_mul: casegen.c
	gcc -o case_mul casegen.c mul 100 
case_div: casegen.c
	gcc -o case_div casegen.c div 100
case_all: case_add case_sub case_mul case_div
	cat case_add case_sub case_mul case_div > case_all
clean:
	rm -f out calc casegen case_* *.o
