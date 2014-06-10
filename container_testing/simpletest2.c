#include <stdio.h>

int bar(char* a);
int bar2(char* a);
int bar3(char* a,char *b);
char foo(char a, char b)
{
	int local_a;
	int local_b;

	return a+b;
}

int main(void)
{
	char a = 0xA;
	int b = 0xB;
	char * string;
	char * string2;
	char * staticString = "DFDFSFSFSDFSDFSDFSF";

	a = foo(a, 5);

    string = (char *)malloc (100 * sizeof(char));
    strcpy(string,"Ana are mere");

	string2 = (char *)malloc (200 * sizeof(char));
	strcpy(string2,staticString);

	bar(string);
	bar(string2);

	bar2(string);
	bar2(string2);
	bar2(staticString);

	bar3(staticString, staticString);
	bar3(string, staticString);
	bar3(string, string);
	bar3(string, string2);

	return 0;
}

int bar(char* a)
{
	printf("%s",a);
	return 1;
}

int bar2(char* a)
{
	int i = 0;
	printf("%s",a);
	printf("\n%x\n",a);

	for(;a[i]!=0;i++){putc(a[i],stdout);}

	return 1;
}

int bar3(char* a,char *b)
{
	int i = 0;
	printf("%s",a);
	printf("\n%x\n",a);

	for(;a[i]!=0;i++){putc(a[i],stdout);}
	for(;b[i]!=0;i++){putc(b[i],stdout);}


	return 1;
}
