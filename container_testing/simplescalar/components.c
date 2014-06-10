/*by Eugen Leontie*/
#include <stdio.h>
#include <stdlib.h>

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


int componentTable = 1;
int componentTableSize = 1;

byte_t* strsymtab;
elf_sym* symbols;



void traceFunctioncall(md_addr_t addr)
{

	elf_sym* lastSymbol = (elf_sym*)(((char*)symbols)+componentTableSize) ;
	elf_sym* iterate = symbols;
	for(;iterate<lastSymbol;iterate++){
		if(addr == (*iterate).st_value && ELF32_ST_TYPE((*iterate).st_info) == STT_FUNC && ELF32_ST_BIND((*iterate).st_info) == STB_GLOBAL)
		{
			printf("%x %s \n",(*iterate).st_value,&strsymtab[(*iterate).st_name] );
		}
	}

	//printf("%x \n",addr);
	
}

