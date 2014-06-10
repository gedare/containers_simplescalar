@echo off

set SOURCEFOLDER=D:\Gica\GWU\Research\fpgaGuard\gccModifications\insert_noop_functioncall\project_folder
set DESTINATIONFOLDER=/home/gica/crosstool-0.42/build/arm-unknown-linux-gnu/gcc-3.3-glibc-2.3.2/gcc-3.3/gcc
set DESTINATIONREPOSITORY=/home/gica/work/insert_noop_functioncall/gcc

set FILE=gcc\emit-rtl.c
pscp -pw eugenl %SOURCEFOLDER%\%FILE% gica@192.168.223.129:%DESTINATIONFOLDER%
pscp -pw eugenl %SOURCEFOLDER%\%FILE% gica@192.168.223.129:%DESTINATIONREPOSITORY%

set FILE=gcc\function.c
pscp -pw eugenl %SOURCEFOLDER%\%FILE% gica@192.168.223.129:%DESTINATIONFOLDER%
pscp -pw eugenl %SOURCEFOLDER%\%FILE% gica@192.168.223.129:%DESTINATIONREPOSITORY%

REM simplescalar\sim-outorder.c
pscp -pw eugenl D:\Gica\GWU\Research\fpgaGuard\gccModifications\insert_noop_functioncall\project_folder\simpleScalar\sim-outorder.c gica@192.168.223.129:/home/gica/simplescalar-olga-arm
pscp -pw eugenl D:\Gica\GWU\Research\fpgaGuard\gccModifications\insert_noop_functioncall\project_folder\simpleScalar\sim-outorder.c gica@192.168.223.129:/home/gica/work/insert_noop_functioncall/simplescalar
REM simplescalar\memory.c
pscp -pw eugenl D:\Gica\GWU\Research\fpgaGuard\gccModifications\insert_noop_functioncall\project_folder\simpleScalar\memory.c gica@192.168.223.129:/home/gica/simplescalar-olga-arm
pscp -pw eugenl D:\Gica\GWU\Research\fpgaGuard\gccModifications\insert_noop_functioncall\project_folder\simpleScalar\memory.c gica@192.168.223.129:/home/gica/work/insert_noop_functioncall/simplescalar