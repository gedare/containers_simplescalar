sim-outorder: SimpleScalar/ARM Tool Set version 3.0 of November, 2000.
Copyright (c) 1994-2000 by Todd M. Austin.  All Rights Reserved.
This version of SimpleScalar is licensed for academic non-commercial use only.

sim: command line: sim-outorder -config simconfig/cache-trace-in.cfg -redir:sim simpletest.staticnop.res simpletest.ss.nop 

sim: simulation started @ Tue Jul 15 14:25:50 2008, options follow:

sim-outorder: This simulator implements a very detailed out-of-order issue
superscalar processor with a two-level memory system and speculative
execution support.  This simulator is a performance simulator, tracking the
latency of all pipeline operations.

# -config                     # load configuration from a file
# -dumpconfig                 # dump configuration to a file
# -h                    false # print help message    
# -v                    false # verbose operation     
# -d                    false # enable debug message  
# -i                    false # start in Dlite debugger
-seed                       1 # random number generator seed (0 for timer seed)
# -q                    false # initialize and terminate immediately
# -chkpt               <null> # restore EIO trace execution from <fname>
# -redir:sim     simpletest.staticnop.res # redirect simulator output to file (non-interactive only)
# -redir:prog    simpletest.progoutput # redirect simulated program output to file
# -redir:trace         <null> # redirect simulation trace to file 
# -containers:traceFileOut       <null> # this is for the first run, this is where the trace information is stored for the second run
# -containers:traceFileIn simpletest.trace.in # this is the second run, after the trace data is gathered, the param is the trace file name
# -containers:compileTraceOut simpletest.trace.compiler # this information is used for the second compilation, it marks the functions that access heap memory
# -containers:FullTraceOut simpletest.trace.full # this file has the full trace of functions and memory calls (it gets HUGE) use for debug only
-nice                       0 # simulator scheduling priority
-max:inst                   0 # maximum number of inst's to execute
# -ptracepipe               0 # The pipe for the ptrace communications
-profile                false # look for areas with significant IPCs
-fastfwd                    0 # number of insts skipped before timing starts
# -ptrace              <null> # generate pipetrace, i.e., <fname|stdout|stderr> <range>
-fetch:ifqsize              1 # instruction fetch queue size (in insts)
-fetch:mplat                3 # extra branch mis-prediction latency
-fetch:speed                1 # speed of front-end of machine relative to execution core
-bpred                  bimod # branch predictor type {nottaken|taken|perfect|bimod|2lev|comb}
-bpred:bimod     2048 # bimodal predictor config (<table size>)
-bpred:2lev      1 1024 8 0 # 2-level predictor config (<l1size> <l2size> <hist_size> <xor>)
-bpred:comb      1024 # combining predictor config (<meta_table_size>)
-bpred:ras                  8 # return address stack size (0 for no return stack)
-bpred:btb       512 4 # BTB config (<num_sets> <associativity>)
# -bpred:spec_update       <null> # speculative predictors update in {ID|WB} (default non-spec)
-decode:width               4 # instruction decode B/W (insts/cycle)
-issue:width                4 # instruction issue B/W (insts/cycle)
-issue:inorder           true # run pipeline with in-order issue
-issue:wrongpath        false # issue instructions down wrong execution paths
-commit:width               4 # instruction commit B/W (insts/cycle)
-ruu:size                  16 # register update unit (RUU) size
-lsq:size                   8 # load/store queue (LSQ) size
-lsq:perfect            false # perfect memory disambiguation
-cache:dl1       dl1:16:32:64:l # l1 data cache config, i.e., {<config>|none}
-cache:dl1lat               1 # l1 data cache hit latency (in cycles)
-cache:dl2               none # l2 data cache config, i.e., {<config>|none}
-cache:dl2lat               1 # l2 data cache hit latency (in cycles)
-cache:il1       il1:32:32:32:l # l1 inst cache config, i.e., {<config>|dl1|dl2|none}
-cache:il1lat               1 # l1 instruction cache hit latency (in cycles)
-cache:il2               none # l2 instruction cache config, i.e., {<config>|dl2|none}
-cache:il2lat               1 # l2 instruction cache hit latency (in cycles)
-cache:flush            false # flush caches on system calls
-cache:icompress        false # convert 64-bit inst addresses to 32-bit inst equivalents
-mem:lat         15 2 # memory access latency (<first_chunk> <inter_chunk>)
-mem:width                  8 # memory access bus width (in bytes)
-mem:pipelined          false # memory accesses are fully pipelined
-tlb:itlb        itlb:16:4096:4:l # instruction TLB config, i.e., {<config>|none}
-tlb:dtlb        dtlb:32:4096:4:l # data TLB config, i.e., {<config>|none}
-tlb:lat                   30 # inst/data TLB miss latency (in cycles)
-res:ialu                   2 # total number of integer ALU's available
-res:imult                  1 # total number of integer multiplier/dividers available
-res:memport                1 # total number of memory system ports available (to CPU)
-res:fpalu                  1 # total number of floating point ALU's available
-res:fpmult                 1 # total number of floating point multiplier/dividers available
# -pcstat              <null> # profile stat(s) against text addr's (mult uses ok)
-bugcompat              false # operate in backward-compatible bugs mode (for testing only)

  Pipetrace range arguments are formatted as follows:

    {{@|#}<start>}:{{@|#|+}<end>}

  Both ends of the range are optional, if neither are specified, the entire
  execution is traced.  Ranges that start with a `@' designate an address
  range to be traced, those that start with an `#' designate a cycle count
  range.  All other range values represent an instruction count range.  The
  second argument, if specified with a `+', indicates a value relative
  to the first argument, e.g., 1000:+100 == 1000:1100.  Program symbols may
  be used in all contexts.

    Examples:   -ptrace FOO.trc #0:#1000
                -ptrace BAR.trc @2000:
                -ptrace BLAH.trc :1500
                -ptrace UXXE.trc :
                -ptrace FOOBAR.trc @main:+278

  Branch predictor configuration examples for 2-level predictor:
    Configurations:   N, M, W, X
      N   # entries in first level (# of shift register(s))
      W   width of shift register(s)
      M   # entries in 2nd level (# of counters, or other FSM)
      X   (yes-1/no-0) xor history and address for 2nd level index
    Sample predictors:
      GAg     : 1, W, 2^W, 0
      GAp     : 1, W, M (M > 2^W), 0
      PAg     : N, W, 2^W, 0
      PAp     : N, W, M (M == 2^(N+W)), 0
      gshare  : 1, W, 2^W, 1
  Predictor `comb' combines a bimodal and a 2-level predictor.

  The cache config parameter <config> has the following format:

    <name>:<nsets>:<bsize>:<assoc>:<repl>

    <name>   - name of the cache being defined
    <nsets>  - number of sets in the cache
    <bsize>  - block size of the cache
    <assoc>  - associativity of the cache
    <repl>   - block replacement strategy, 'l'-LRU, 'f'-FIFO, 'r'-random

    Examples:   -cache:dl1 dl1:4096:32:1:l
                -dtlb dtlb:128:4096:32:r

  Cache levels can be unified by pointing a level of the instruction cache
  hierarchy at the data cache hiearchy using the "dl1" and "dl2" cache
  configuration arguments.  Most sensible combinations are supported, e.g.,

    A unified l2 cache (il2 is pointed at dl2):
      -cache:il1 il1:128:64:1:l -cache:il2 dl2
      -cache:dl1 dl1:256:32:1:l -cache:dl2 ul2:1024:64:2:l

    Or, a fully unified cache hierarchy (il1 pointed at dl1):
      -cache:il1 dl1
      -cache:dl1 ul1:256:32:1:l -cache:dl2 ul2:1024:64:2:l



sim: ** starting performance simulation **
warning: invalid/unimplemented syscall 122, PC=0x0000f2a0, winging it
warning: invalid/unimplemented syscall 221, PC=0x0000f474, winging it
warning: invalid/unimplemented syscall 221, PC=0x0000f474, winging it
warning: invalid/unimplemented syscall 221, PC=0x0000f474, winging it
warning: invalid/unimplemented syscall 201, PC=0x0001fba8, winging it
warning: invalid/unimplemented syscall 199, PC=0x0001fba0, winging it
warning: invalid/unimplemented syscall 202, PC=0x0001fbb8, winging it
warning: invalid/unimplemented syscall 200, PC=0x0001fbb0, winging it
warning: invalid/unimplemented syscall 197, PC=0x0000f2e8, winging it
warning: invalid/unimplemented syscall 91, PC=0x0000f760, winging it

sim: ** simulation statistics **
sim_num_insn                  13245 # total number of instructions committed
sim_num_uops                  21658 # total number of UOPs executed
sim_avg_flowlen              1.6352 # uops per instruction
sim_num_refs                   5806 # total number of loads and stores committed
sim_num_loads                  3941 # total number of loads committed
sim_num_stores            1865.0000 # total number of stores committed
sim_num_branches               2316 # total number of branches committed
sim_elapsed_time                  1 # total simulation time in seconds
sim_inst_rate            13245.0000 # simulation speed (in insts/sec)
sim_total_insn                21657 # total number of instructions executed
sim_total_refs                 5806 # total number of loads and stores executed
sim_total_loads                3941 # total number of loads executed
sim_total_stores          1865.0000 # total number of stores executed
sim_total_branches             2316 # total number of branches executed
sim_cycle                     35356 # total simulation time in cycles
sim_IPC                      0.3746 # instructions per cycle
sim_CPI                      2.6694 # cycles per instruction
sim_exec_BW                  0.6125 # total instructions (mis-spec + committed) per cycle
sim_IPB                      5.7189 # instruction per branch
IFQ_count                     21048 # cumulative IFQ occupancy
IFQ_fcount                    21048 # cumulative IFQ full count
ifq_occupancy                0.5953 # avg IFQ occupancy (insn's)
ifq_rate                     0.6125 # avg IFQ dispatch rate (insn/cycle)
ifq_latency                  0.9719 # avg IFQ occupant latency (cycle's)
ifq_full                     0.5953 # fraction of time (cycle's) IFQ was full
RUU_count                     59674 # cumulative RUU occupancy
RUU_fcount                        0 # cumulative RUU full count
ruu_occupancy                1.6878 # avg RUU occupancy (insn's)
ruu_rate                     0.6125 # avg RUU dispatch rate (insn/cycle)
ruu_latency                  2.7554 # avg RUU occupant latency (cycle's)
ruu_full                     0.0000 # fraction of time (cycle's) RUU was full
LSQ_count                     28670 # cumulative LSQ occupancy
LSQ_fcount                      344 # cumulative LSQ full count
lsq_occupancy                0.8109 # avg LSQ occupancy (insn's)
lsq_rate                     0.6125 # avg LSQ dispatch rate (insn/cycle)
lsq_latency                  1.3238 # avg LSQ occupant latency (cycle's)
lsq_full                     0.0097 # fraction of time (cycle's) LSQ was full
sim_slip                     132123 # total number of slip cycles
avg_sim_slip                 9.9753 # the average slip between issue and retirement
bpred_bimod.lookups            2326 # total number of bpred lookups
bpred_bimod.updates            2316 # total number of updates
bpred_bimod.addr_hits          1975 # total number of address-predicted hits
bpred_bimod.dir_hits           2078 # total number of direction-predicted hits (includes addr-hits)
bpred_bimod.misses              238 # total number of misses
bpred_bimod.jr_hits               0 # total number of address-predicted hits for JR's
bpred_bimod.jr_seen               0 # total number of JR's seen
bpred_bimod.jr_non_ras_hits.PP            0 # total number of address-predicted hits for non-RAS JR's
bpred_bimod.jr_non_ras_seen.PP            0 # total number of non-RAS JR's seen
bpred_bimod.bpred_addr_rate    0.8528 # branch address-prediction rate (i.e., addr-hits/updates)
bpred_bimod.bpred_dir_rate    0.8972 # branch direction-prediction rate (i.e., all-hits/updates)
bpred_bimod.bpred_jr_rate <error: divide by zero> # JR address-prediction rate (i.e., JR addr-hits/JRs seen)
bpred_bimod.bpred_jr_non_ras_rate.PP <error: divide by zero> # non-RAS JR addr-pred rate (ie, non-RAS JR hits/JRs seen)
bpred_bimod.retstack_pushes          231 # total number of address pushed onto ret-addr stack
bpred_bimod.retstack_pops            0 # total number of address popped off of ret-addr stack
bpred_bimod.used_ras.PP            0 # total number of RAS predictions used
bpred_bimod.ras_hits.PP            0 # total number of RAS hits
bpred_bimod.ras_rate.PP <error: divide by zero> # RAS prediction rate (i.e., RAS hits/used RAS)
il1.accesses                  13794 # total number of accesses
il1.hits                      13417 # total number of hits
il1.misses                      377 # total number of misses
il1.replacements                  0 # total number of replacements
il1.writebacks                    0 # total number of writebacks
il1.invalidations                 0 # total number of invalidations
il1.miss_rate                0.0273 # miss rate (i.e., misses/ref)
il1.repl_rate                0.0000 # replacement rate (i.e., repls/ref)
il1.wb_rate                  0.0000 # writeback rate (i.e., wrbks/ref)
il1.inv_rate                 0.0000 # invalidation rate (i.e., invs/ref)
dl1.accesses                   5801 # total number of accesses
dl1.hits                       5553 # total number of hits
dl1.misses                      248 # total number of misses
dl1.replacements                  0 # total number of replacements
dl1.writebacks                    0 # total number of writebacks
dl1.invalidations                 0 # total number of invalidations
dl1.miss_rate                0.0428 # miss rate (i.e., misses/ref)
dl1.repl_rate                0.0000 # replacement rate (i.e., repls/ref)
dl1.wb_rate                  0.0000 # writeback rate (i.e., wrbks/ref)
dl1.inv_rate                 0.0000 # invalidation rate (i.e., invs/ref)
itlb.accesses                 13794 # total number of accesses
itlb.hits                     13772 # total number of hits
itlb.misses                      22 # total number of misses
itlb.replacements                 0 # total number of replacements
itlb.writebacks                   0 # total number of writebacks
itlb.invalidations                0 # total number of invalidations
itlb.miss_rate               0.0016 # miss rate (i.e., misses/ref)
itlb.repl_rate               0.0000 # replacement rate (i.e., repls/ref)
itlb.wb_rate                 0.0000 # writeback rate (i.e., wrbks/ref)
itlb.inv_rate                0.0000 # invalidation rate (i.e., invs/ref)
dtlb.accesses                  5806 # total number of accesses
dtlb.hits                      5784 # total number of hits
dtlb.misses                      22 # total number of misses
dtlb.replacements                 0 # total number of replacements
dtlb.writebacks                   0 # total number of writebacks
dtlb.invalidations                0 # total number of invalidations
dtlb.miss_rate               0.0038 # miss rate (i.e., misses/ref)
dtlb.repl_rate               0.0000 # replacement rate (i.e., repls/ref)
dtlb.wb_rate                 0.0000 # writeback rate (i.e., wrbks/ref)
dtlb.inv_rate                0.0000 # invalidation rate (i.e., invs/ref)
sim_invalid_addrs                 0 # total non-speculative bogus addresses seen (debug var)
ld_text_base           0x000080b4 # program text (code) segment base
ld_text_bound          0x00055920 # program text (code) segment bound
ld_text_size                 317548 # program text (code) size in bytes
ld_data_base           0x00055920 # program initialized data segment base
ld_data_bound          0x00069e48 # program initialized data segment bound
ld_data_size                  83240 # program init'ed `.data' and uninit'ed `.bss' size in bytes
ld_stack_base          0xc0000000 # program stack segment base (highest address in stack)
ld_stack_size                 16384 # program initial stack size
ld_prog_entry          0x000080d0 # program entry point (initial PC)
ld_environ_base        0xbfffc000 # program environment base address address
ld_target_big_endian              0 # target executable endian-ness, non-zero if big endian
mem.page_count                  102 # total number of pages allocated
mem.page_mem                   408k # total size of memory pages allocated
mem.ptab_misses                 102 # total first level page table misses
mem.ptab_accesses            863260 # total page table accesses
mem.ptab_miss_rate           0.0001 # first level page table miss rate
__default_morecore 2 1
getgid 0 0
printf 3 1
_dl_important_hwcaps 2 0
_IO_new_file_xsputn 6 3
_IO_file_sync 4 0
_IO_file_write 3 1
__init_misc 2 1
geteuid 0 0
munmap 3 1
__libc_fcntl 5 1
__write 1 0
__mmap 0 0
getenv 8 1
getegid 0 0
getpagesize 2 0
__read 2 0
_IO_funlockfile 5 0
_IO_default_xsputn 3 0
_IO_default_setbuf 4 2
_IO_flockfile 7 0
_dl_non_dynamic_init 4 3
getuid 0 0
malloc 14 4
__open 2 0
__new_exitfn 3 0
__libc_csu_fini 1 1
__libc_init_secure 2 4
_IO_file_setbuf 2 1
_Exit 0 0
_init 4 0
uname 2 1
strrchr 1 1
__libc_check_standard_fds 2 2
_IO_file_stat 2 1
__umodsi3 0 0
_dl_init_paths 21 8
_IO_cleanup 13 2
_IO_new_do_write 7 1
_IO_file_overflow 5 2
___fxstat64 2 1
_start 1 1
_IO_flush_all 1 1
_IO_flush_all_lockp 19 3
__libc_init_first 6 3
__register_atfork 2 1
qcount 2 0
__cxa_atexit 2 1
__brk 2 0
sbrk 3 1
__libc_close 1 0
__libc_csu_init 1 1
index 1 0
main 1 2
_IO_setb 4 1
_fini 4 0
_IO_file_doallocate 5 3
_int_malloc 12 1
foo 1 2
_IO_doallocbuf 5 1
__errno_location 9 0
exit 4 3
_IO_vfprintf 15 4
_dl_aux_init 1 0
__setfpucw 0 0
bar 2 2
__libc_start_main 9 7
strlen 2 0

