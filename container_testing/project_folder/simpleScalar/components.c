/*by Eugen Leontie*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#include "host.h"
#include "misc.h"
#include "machine.h"
#include "endian.h"
#include "regs.h"
#include "memory.h"
#include "sim.h"
#include "eio.h"
#include "loader.h"



#include "components.h"

//External Variables
container containerTable[3000]; 	//this array contains all containers( functions and is loaded in Loader.c)
int containerSize = 0;				//keps the size of the containerList
int componentTableSize = 1;			
		

//end External Variables

//local variables
mystack returnAddressStack; 	//this is the main Container stack
int containerInitialized = 0; 	//local flag to track wheater the containers were initialized
md_addr_t return_addr;			//monitors the return addresses ( saved before a function call and stored to stack)


//end local variables

void container_initialize(void)
{
	if(containerInitialized == 0)
	{
		containerInitialized = 1;
		returnAddressStack = stack_create();
		//containerTable = (container *)malloc(size * sizeof(container));
	}
	else 
	{
		exit(printf("\n\n Runtime ERROR ('initializeContainers' called twice"));		
	}
}

void container_add(md_addr_t addr, char * name)
{
	container newContainer;
	newContainer.entryAddress = addr;
	newContainer.totalChildContainersCalled = 0;
	newContainer.totalNumberOfReads = 0;
	newContainer.totalNumberOfBytesRead = 0;
	newContainer.totalNumberOfBytesWritten = 0;
	newContainer.totalNumberOfWrites = 0;
	newContainer.totalStackPushes = 0;
	newContainer.uniqueChildContainersCalled = 0;
	newContainer.childFunctions = NULL;

	strncpy(&newContainer.name,name, 100);
	containerTable[containerSize++] = newContainer;
}


void container_traceFunctioncall(md_addr_t addr)
{
	int i,j=0;
	
	//first verify if the containers were initialized . report exception and quit if not
	if(containerInitialized == 0)
	{
		exit(printf("\n\n Runtime ERROR (call 'initializeContainers' before using the container component"));
	}

	//first verify if the containers were initialized . report exception and quit if not
	if(containerInitialized == 0)
	{
		exit(printf("\n\n Runtime ERROR (call 'initializeContainers' before using the container component"));
	}

	//check for function return
	if(!stack_empty(returnAddressStack))
	{
		stackObject t = stack_top(returnAddressStack);
		if( t.returnAddress == addr)
		{
			//printf("return from function , popping container\n");
			stack_pop(returnAddressStack);
			for(i = 0; i< returnAddressStack->size; i++) printf("|\t");
			printf("*\n");
			return;
		}
	}

	for ( i=0 ; i < containerSize; i++)
	{
		if(addr == containerTable[i].entryAddress)
		{
			if(!stack_empty(returnAddressStack)){

				int found = 0;
				stackObject currentContainer = stack_top(returnAddressStack);
				currentContainer.container->totalChildContainersCalled++;

				
				list l = currentContainer.container->childFunctions;
				while(l!= NULL)
				{
					if(l->element.container->entryAddress == addr)
					{
						found = 1;
						break;
					}
					l = l->next;
				}
				if(!found)
				{
					currentContainer.container->uniqueChildContainersCalled ++;
					stackObject t ;
					t.container = &containerTable[i];
					currentContainer.container->childFunctions = cons(t,l);
				}
			}
			for(j = 0; j< returnAddressStack->size; j++) printf("|\t");
			printf("%x %s \n",addr,&containerTable[i].name);
			stackObject t;
			containerTable[i].totalStackPushes ++;
			
			t.container = &containerTable[i];
			t.returnAddress = return_addr;
			stack_push(returnAddressStack, t);
			return;
		}
	}

	//end of search list reached without finding the function, save the address as possible return address
	return_addr = addr+4;
	
}

void container_MemoryCall(enum mem_cmd cmd,md_addr_t addr, int nbytes)
{
	int i;
	
	if(containerInitialized == 1 && !stack_empty(returnAddressStack))
	{
		
		stackObject t = stack_top(returnAddressStack);

		if(cmd == Read)
		{
			t.container->totalNumberOfReads++;
			t.container->totalNumberOfBytesRead +=nbytes;
		}
		else 
		{
			t.container->totalNumberOfBytesWritten +=nbytes;
			t.container->totalNumberOfWrites++;
		}
	}

}


void container_printStatistics()
{
	int i;
	printf("max-stack-size: %d\n",returnAddressStack->maxsize);
	printf("container-table-size: %d\n",containerSize);

	printf("Container statistics :\n");
	printf("Address \t Name \t Reads \t BytesRead \t Writes \t BytesWritten \t totalChildContainersCalled \t totalStackPushes \t uniqueChildContainersCalled\n");
	for ( i=0 ; i < containerSize; i++)
	{
		printf("%x \t %s \t %d \t %d \t %d \t %d \t %d \t %d \t %d \n",
				containerTable[i].entryAddress,
				&(containerTable[i].name),
				containerTable[i].totalNumberOfReads,
				containerTable[i].totalNumberOfBytesRead,
				containerTable[i].totalNumberOfWrites,
				containerTable[i].totalNumberOfBytesWritten,
				containerTable[i].totalChildContainersCalled,
				containerTable[i].totalStackPushes,
				containerTable[i].uniqueChildContainersCalled
				);
	}

}



list cons(stackObject element, list l){
    list temp = malloc(sizeof(struct cell));
    temp -> element = element;
    temp -> next = l;
    return temp;
}

list cdr_and_free(list l){
    list temp = l -> next; 
    free(l);
    return temp;
  }

mystack stack_create(void)
{
  mystack temp = malloc(sizeof(struct mystack));
  temp -> elements = NULL;
  temp->size = 0;
  temp->maxsize = 0;
  return temp;
}
  
void stack_push(mystack s,stackObject element)
{
  s -> elements = cons(element, s -> elements);
  s->size++;
  if(s->size > s->maxsize) s->maxsize = s->size;
}
  
int stack_empty(mystack s)
{
  return s -> elements == NULL;
}
  
void stack_pop(mystack s)
{
  //assert(!empty(s));
  s -> elements = cdr_and_free(s -> elements);
  s->size--;
}

stackObject stack_top(mystack s)
{
  //assert(!empty(s));
  return s -> elements -> element;
}


