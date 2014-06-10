/*by Eugen Leontie*/

#ifndef COMPONENTS_H
#define COMPONENTS_H


#define STRINGTABLEID 24

#include <stdio.h>

typedef int md_addr_t;

typedef struct addressCell * addressList; //address access list

struct addressCell
{
  int startAddress;
  int endAddress;
  addressList next;
};

extern addressList consAddressList(int startAddress, int endAddress, addressList l);
extern addressList freeAddressList(addressList l);
void UpdateAddressList(addressList *l,md_addr_t addr,int nbytes);
void joinAddress(addressList future, addressList present);
void printAddressList( addressList l);

#endif /* COMPONENTS_H */

