#include <stdio.h>
#include <stdlib.h>
int g_qCount = 10;

int qcount (void)
{
  return(g_qCount);
}

int bar(char * a);
char * foo(void)
{
	printf("aafoo");
	return (char *)malloc(100);
}

int main(void)
{
	int a;
	a = bar(foo());
	return a;
}

int bar(char* a)
{
	int i = qcount();
	int sum = 0;
	while (qcount() > 0) {
		foo();
		g_qCount --;
	}
	for (i=0;i<90;i+=1) {sum = a[i];}
	return sum;
}
