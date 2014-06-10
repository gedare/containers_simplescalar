/*by Eugen Leontie*/

#ifndef COMPONENTS_H
#define COMPONENTS_H


#define STRINGTABLEID 24

#include <stdio.h>

#include "host.h"
#include "misc.h"
#include "machine.h"
#include "regs.h"
#include "memory.h"
#include "target-arm/elf.h"

typedef struct container_def container; 
typedef struct stack_Object_def stackObject;
typedef struct cell *list;//Linked List


struct container_def
{
	md_addr_t entryAddress; // the entry address in the container
	char name[100];			 //name of the function
	int totalStackPushes; 
	int totalNumberOfReads;
	int totalNumberOfBytesRead;
	int totalNumberOfBytesWritten;
	int totalNumberOfWrites;
	int totalChildContainersCalled;
	int uniqueChildContainersCalled; // count the number of child functions
	list childFunctions; 			 //keep the id of the child function ( or the entire container )
};

struct stack_Object_def
{
	container * container;
	md_addr_t returnAddress; //dynamic location . keeps the return address of the last f. call. each return should equal this value ( other wise it is an attack)	
};

extern container containerTable[];
extern int componentTableSize ;
extern int containerSize ;

struct cell
{
  stackObject element;
  list next;
};
extern list cons(stackObject element, list l);
extern list cdr_and_free(list l);
//end Linked List

//Stack

struct mystack
{
  list elements;
  int size;
  int maxsize;
};

typedef struct mystack *mystack;

/* create a new, empty stack */
extern mystack stack_create(void);

/* push a new element on top of the stack */
extern void stack_push(mystack s, stackObject element);

/* pop the top element from the stack.	The stack must not be
   empty. */
extern void stack_pop(mystack s);

/* return the top element of the stack */
extern stackObject stack_top(mystack s);

/* return a true value if and only if the stack is empty */
extern int stack_empty(mystack s);


//end Stack


void container_initialize(void);
void container_add(md_addr_t addr, char * name);

void container_traceFunctioncall(md_addr_t addr);
void container_printStatistics();
void container_MemoryCall(enum mem_cmd cmd,md_addr_t addr, int nbytes);


#endif /* COMPONENTS_H */

