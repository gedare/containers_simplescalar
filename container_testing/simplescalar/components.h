/*by Eugen Leontie*/

#ifndef COMPONENTS_H
#define COMPONENTS_H

#include <stdio.h>

#include "host.h"
#include "misc.h"
#include "machine.h"
#include "regs.h"
#include "memory.h"
#include "target-arm/elf.h"


extern int componentTable;
extern int componentTableSize;
extern byte_t* strsymtab;
extern elf_sym* symbols;


void traceFunctioncall(md_addr_t addr);

#endif /* COMPONENTS_H */

