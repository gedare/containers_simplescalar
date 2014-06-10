/*by Eugen Leontie*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "components.h"


void UpdateAddressList(addressList *list,md_addr_t addr,int nbytes)
{
	//parse the list
	//try every range , if the new address is inside , ignore
	//if the addr_nbytes overlaps one range, addit and continue searching . If the address hits another range, merge the 2 ranges

	// if the end is reached, add new range
	int found = 0;
	//int ignore = 0;
	addressList lprevious;
	addressList l = *list;

	while(l!= NULL)
	{
		md_addr_t start = l->startAddress;
		md_addr_t end = l->endAddress;
		if( start <= addr && end >= addr+nbytes)
		{
			//printf("already there\n");
			if(found == 0)
			{
				found = 1;
				break;
			}
			else
			{
				joinAddress(l, lprevious);
			}
		}
		else if( addr <= start  && addr + nbytes >= start )
		{
			//printf("overlap 1\n");
			if(found == 1) joinAddress(l, lprevious);
			else
			{
				l->startAddress = addr;
				l->endAddress = ( (addr+nbytes) > l->endAddress) ? addr+nbytes : l->endAddress;
				found = 1;
				lprevious = l;
			}
		}
		else if( addr <= end && addr + nbytes > end )
		{
			//printf("overlap 2\n");
			if(found == 1) joinAddress(l, lprevious);
			else
			{
				l->endAddress = addr + nbytes;
				found = 1;
				lprevious = l;
			}
		}
		l = l->next;
	}
	if(!found)
	{
		//printf("adding new\n");
		//printAddressList(l);
		//printAddressList(*list );
		*list = consAddressList(addr,addr + nbytes,*list);
		//printAddressList(l);
		//printAddressList(*list );
	}


}

void joinAddress(addressList future, addressList present)
{
	//addressList present = *presentPtr;

	//printf("joining addresses \n");
	//printf("present : "); printAddressList(present);
	//printf("future  : "); printAddressList(future);

	present->startAddress = present->startAddress > future->startAddress ? future->startAddress : present->startAddress;
	present->endAddress = present->endAddress < future->startAddress ? future->startAddress : present->endAddress;
	//exit(0);
	//find and delete future
	addressList l = present->next;
	addressList lprev = present;
	while( l != future)
	{
		lprev = l;
		l = l->next;
	}

	lprev->next = l->next;
	//printf("lprev : "); printAddressList(lprev);
	//printf("deleted : "); printAddressList(l);
	free(l);

	printf("end joining addresses \n");

}

void printAddressList( addressList l)
{

	while(l!=NULL)
	{
		printf("[%d,%d) ",l->startAddress, l->endAddress);
		l = l->next;
	}
	printf("*\n");
}

addressList consAddressList(int startAddress, int endAddress, addressList l)
{
	//printf("\tDEBUG in consAddressList %d %d \n", startAddress, endAddress);
	//printAddressList(l);
	//printf("\tDEBUG\n", startAddress, endAddress);
	addressList temp = (addressList) malloc(sizeof(struct addressCell));
    temp -> startAddress = startAddress;
	temp -> endAddress = endAddress;
    temp -> next = l;
    //printf("\tDEBUG in consAddressList %d %d \n", startAddress, endAddress);
	//printAddressList(temp);
	//printf("\tDEBUG\n", startAddress, endAddress);
    return temp;
}
addressList freeAddressList(addressList l)
{
	addressList temp = l -> next;
    free(l);
    return temp;
}


