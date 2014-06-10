
#include "components.h"


int main(void)
{
    addressList l = NULL;

	printf("Starting interval verification...\n");

	UpdateAddressList(&l,5,1);

	printAddressList(l);


	UpdateAddressList(&l,10,1);
	printAddressList(l);
	UpdateAddressList(&l,6,1);
	printAddressList(l);

	UpdateAddressList(&l,9,8);
	printAddressList(l);

	UpdateAddressList(&l,6,4);
	printAddressList(l);


	UpdateAddressList(&l,3,7);
	printAddressList(l);

	UpdateAddressList(&l,5,15);
	printAddressList(l);


	UpdateAddressList(&l,25,1);
	printAddressList(l);


	UpdateAddressList(&l,30,2);
	printAddressList(l);

	UpdateAddressList(&l,2,23);
	printAddressList(l);
	return 1;
}


