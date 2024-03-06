.PHONY: clean

out: calc case_all
	case_all > gcc calc > out
case_add: casegen.c
	gcc casegen.c add 100 > case_add
case_sub: casegen.c
	gcc casegen.c sub 100 > case_sub
case_mul: casegen.c
	gcc casegen.c mul 100 > case_mul
case_div: casegen.c
	gcc casegen.c div 100 > case_div
case_all: case_add case_sub case_mul case_div
	cat case_add case_sub case_mul case_div > case_all
clean:
	rm -f out calc casegen case_* *.o
