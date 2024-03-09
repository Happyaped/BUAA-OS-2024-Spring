#include <stdio.h>
int main() {
	int n;
	scanf("%d", &n);
	int reverse=0;
	int num=n;
	while(num>0){
	reverse=10*reverse+num%10;
	num = num/10;
		}
	if (reverse == n) {
		printf("Y\n");
	} else {
		printf("N\n");
	}
	return 0;
}
