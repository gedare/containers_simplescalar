
int bar(int a);
char foo(char* buff, int buffLength)
{
	int i;
	int local_b;

	for (i = 0; i<buffLength; i++)
	{
		buff[i] ++;
	}

	return buff[0];
}

int main(void)
{
	char a = 0xA;
	int b = 0xB;
	char *buff;

	buff = (char *) malloc (b);

	foo(buff, b);

	return bar(buff);
}

int bar(int a)
{
	printf("XXXXXXXXXXXXXXXXXXXXX %x",a);
}
