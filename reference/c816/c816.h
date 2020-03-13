/*New Definitions for GCC ,part of the machine description  for COOL RISC C816*/



/*****************************************************************
*   Macro definitions for the CoolRISC processors.      **********
******************************************************************/


/* V4 #include "machmode.h" */

struct rtx_def; /* Mention what is an rtx */

union tree_node; /* Mention what is a tree_node */

#define TARGET_C816

#undef LIBGCC2_HAS_SF_MODE
#define LIBGCC2_HAS_SF_MODE 0
#define SF_SIZE 24
#define DF_SIZE 32

/* Globalizing directive for a label.  */
#define GLOBAL_ASM_OP "\t.global "


/*
This function-like macro expands to a block of code that defines 
built-in preprocessor macros and assertions for the target CPU, 
using the functions builtin_define,
builtin_define_std and builtin_assert. When the front end 
calls this macro it
provides a trailing semicolon, and since it has finished 
command line option processing
your code can use those results freely.  */



#define TARGET_CPU_CPP_BUILTINS()		\
  do						\
  {   \
      builtin_assert ("cpu=c816");		\
      builtin_assert ("machine=c816");		\
    }						\
  while (0)
  
/*C816 specific pragma*/  
struct cpp_reader;


#define REGISTER_TARGET_PRAGMAS() \
  do \
    { \
      c_register_pragma ( 0, "interrupt", c816_pr_interrupt);	\
      c_register_pragma ( 0, "extra_output", c816_pr_output);   \
    } \
  while (0)
  
 /* Set when processing a function with pragma interrupt turned on.  */

extern int pragma_interrupt;

extern int pragma_output;


/*This macro is a C statement to print on stderr a string 
describing the particular machine
description choice. Every machine description 
should define TARGET_VERSION.*/

#define TARGET_VERSION fprintf(stderr, " (CoolRISC 816)")

/*A C string constant that tells the GCC driver program options
 to pass to the assembler. It can also specify how to translate options 
 you give to GCC into options for GCC to pass to the assembler*/
#define ASM_SPEC \
 "%{!Wa,:-I" STANDARD_EXEC_PREFIX  \
 DEFAULT_TARGET_MACHINE "/" DEFAULT_TARGET_VERSION "} \
 %{mlibsoftcall:--defsym SOFTLIB=1} %{g:--defsym AS_DEBUG=1}"
 
 
 /* Another C string constant used much like `LINK_SPEC'.  The
 * difference between the two is that `LIB_SPEC' is used at the end of
 * the command given to the linker.
 *
 * If this macro is not defined, a default is provided that loads the
 * standard C library from the usual place.  See `gcc.c'.  */
#define LIB_SPEC  "%{!mlibmodel:%{mlibmodel=huge:-lc_huge -lm_huge}%{mlibmodel=small:-lc_small -lm_small}} %{!mlibmodel*:-lc_huge -lm_huge}"


/* ----------------------------------------------------------------
 * Run-time compilation parameters selecting different hardware
 * subsets.
 * ---------------------------------------------------------------- */



extern int target_flags;


/* Sometimes certain combinations of command options do not make sense
 * on a particular target machine.  You can define a macro
 * `OVERRIDE_OPTIONS' to take account of this.  This macro, if
 * defined, is executed once just after all the command options have
 * been parsed.
 *
 * On the CoolRISC, it is used to translate target-option strings into
 * numeric values.  */
#define OVERRIDE_OPTIONS override_options ()

/*
Some machines may desire to change what optimizations are performed for various
optimization levels. This macro, if defined, is executed once just after the optimization
level is determined and before the remainder of the command options have been
parsed. Values set in this macro are used as the default values for the other command
line options.
level is the optimization level specified; 2 if �-O2� is specified, 1 if �-O� is specified, and
0 if neither is specified.
size is nonzero if �-Os� is specified and zero otherwise.
This macro is run once at program startup and when the optimization options are
changed via #pragma GCC optimize or by using the optimize attribute.
Do not examine write_symbols in this macro! The debugging options are not supposed
to alter the generated code
*/

#define OPTIMIZATION_OPTIONS(LEVEL,SIZE) \
  c816_opt_options(LEVEL,SIZE)
  
  
  
 
/* Show we can debug even without a frame pointer. This has the simple
 * side effect of setting the flag_omit_frame_pointer variable to
 * 1 for optimizing compilations. */
#define CAN_DEBUG_WITHOUT_FP 1



/* ----------------------------------------------------------------
 * target machine storage layout
 * ---------------------------------------------------------------- */

/* Define this if most significant bit is lowest numbered in
 * instructions that operate on numbered bit-fields.  */
#define BITS_BIG_ENDIAN 0

/* Define this if most significant byte of a word is the lowest
 * numbered.  */
#define BYTES_BIG_ENDIAN 1

/* Define this if most significant word of a multiword number is the
 * lowest numbered.  */
#define WORDS_BIG_ENDIAN 1

#define LIBGCC2_WORDS_BIG_ENDIAN    WORDS_BIG_ENDIAN

/* number of bits in an addressable storage unit */
#define BITS_PER_UNIT 8

/* Width in bits of a "word", which is the contents of a machine
 * register.  Note that this is not necessarily the width of data type
 * `int'; if using 16-bit ints on a 68000, this would still be 32.
 * But on a machine with 8-bit registers, this should be 8.  */
#define BITS_PER_WORD 8

/* Width of a word, in units (bytes).  */
#define UNITS_PER_WORD 1

/* Width in bits of a pointer.  See also the macro `Pmode' defined
 * below.  */
#define POINTER_SIZE 16

/* Allocation boundary (in *bits*) for storing arguments in argument
 * list.  */
#define PARM_BOUNDARY 8

/* Allocation boundary (in *bits*) for the code of a function.  */
#define FUNCTION_BOUNDARY 8

/* No data type wants to be aligned rounder than this.  */
#define BIGGEST_ALIGNMENT 8


/*Define this macro to the minimum alignment enforced by hardware for the stack
pointer on this machine. The definition is a C expression for the desired alignment
(measured in bits). This value is used as a default if PREFERRED_STACK_BOUNDARY is
not defined. On most machines, this should be the same as PARM_BOUNDARY.  */
#define STACK_BOUNDARY 8
 
 
 
 /*Alignment in bits to be given to a structure 
 bit-field that follows an empty field such as int : 0;.
If PCC_BITFIELD_TYPE_MATTERS is true, it overrides this macro. */

#define EMPTY_FIELD_BOUNDARY 8


/*Define this macro to be the value 1 if instructions will fail to work if given data not
on the nominal alignment. If instructions will merely go slower in that case, define
this macro as 0.   */


#define STRICT_ALIGNMENT 0



/* An integer expression for the size in bits of the largest integer
 * machine mode that should actually be used.  All integer machine
 * modes of this size or smaller can be used for structures and unions
 * with the appropriate sizes.  If this macro is undefined,
 * GET_MODE_BITSIZE (DImode) is assumed.  */
#define MAX_FIXED_MODE_SIZE 32




/* ----------------------------------------------------------------
 * TYPE SIZES
 * ---------------------------------------------------------------- */


#define INT_TYPE_SIZE		16
#define SHORT_TYPE_SIZE		16
#define LONG_TYPE_SIZE		32
#define LONG_LONG_TYPE_SIZE	32
#define CHAR_TYPE_SIZE		8
#define FLOAT_TYPE_SIZE		24
#define DOUBLE_TYPE_SIZE	32
#define LONG_DOUBLE_TYPE_SIZE	32

/* Define this as 1 if `char' should by default be signed; else as 0.  */
#define DEFAULT_SIGNED_CHAR	1

/* Type to use for `size_t'. If undefined, uses `long unsigned
 * int'. */
#define SIZE_TYPE "unsigned int"
#define PTRDIFF_TYPE "int"

extern const struct real_format c816_single_format;

/* ----------------------------------------------------------------
 * Register characteristics.
 * ---------------------------------------------------------------- */

/* Number of actual hardware registers.  The hardware registers are
 * assigned numbers for the compiler from 0 to just below
 * FIRST_PSEUDO_REGISTER.  All registers that the compiler knows about
 * must be given numbers, even those that are not normally considered
 * general registers.
 *
 * The CoolRISC 816 has 16 registers.
 *
 * The real register are numbered a bit funny, so we use an internal
 * consistent numbering scheme and take care of the real naming when
 * definign the name of the registers.
 *
 * The internal naming is as follows:
 *  0	= accu
 *  1	= reg3
 *  2	= reg2
 *  3	= reg1
 *  4	= reg0
 *  5	= romx0_hi
 *  6	= romx0_lo
 *  7	= ramx0_hi
 *  8	= ramx0_lo
 *  9	= ramx1_hi
 *  10	= ramx1_lo
 *  11	= ramx2_hi
 *  12	= ramx2_lo
 *  13	= ramx3_hi
 *  14	= ramx3_lo
 *  15	= events */
#define ACCU_REG 0
#define REG_0 1
#define REG_1 2
#define REG_2 3
#define REG_3 4
#define ROM_IDX 5
#define RAM_IDX_0 7
#define RAM_IDX_1 9
#define RAM_IDX_2 11
#define RAM_IDX_3 13
#define HARD_FP_REG RAM_IDX_2
#define HARD_SP_REG RAM_IDX_3
#define PSEUDO_AP_REG 16
#define PSEUDO_FP_REG 18
/*
For small values of the integer n (those that are less than FIRST_PSEUDO_
REGISTER), this stands for a reference to machine register number n: a hard
register. For larger values of n, it stands for a temporary value or pseudo
register. The compiler�s strategy is to generate code assuming an unlimited
number of such pseudo registers, and later convert them into hard registers or
into memory references.
*/
#define FIRST_PSEUDO_REGISTER 20


/* 1 for registers that have pervasive standard uses and are not
 * available for the register allocator.
 *
 * On the CoolRISC 816, we have
 * Reg  0	= accumulator (gets clobbered all the time)
 * Reg 13	= stack pointer (RAM index 3 high);
 * Reg 14	= stack pointer (RAM index 3 low);
 * Reg 15	= events;
 * ------- Pseudos -------
 * Reg 16	= argument pointer (high);
 * Reg 17	= argument pointer (low);
 * Reg 18	= frame pointer (high);
 * Reg 19	= frame pointer (low); */

 /*An initializer that says which registers are used for fixed purposes all throughout the
compiled code and are therefore not available for general allocation. These would
include the stack pointer, the frame pointer (except on machines where that can be
used as a general register when no frame pointer is needed), the program counter
on machines where that is considered one of the addressable registers, and any other
numbered register with a standard use.*/
 
 #define FIXED_REGISTERS		\
{				\
  1, 0, 0, 0, 0, 0, 0, 0,	\
  0, 0, 0, 0, 0, 1, 1, 1,	\
  1, 1, 1, 1			\
}

/* 1 for registers not available across function calls.  These must
 * include the FIXED_REGISTERS and also any registers that can be used
 * without being saved.  The latter must include the registers where
 * values are returned and the register where structure-value
 * addresses are passed.  Aside from that, you can include as many
 * other registers as you like.
 *
 * For the CoolRISC 816, the accu is scratch, the next four regs are
 * used as scratch and to return values, and the first two ram
 * pointers can be clobbered */
#define CALL_USED_REGISTERS	\
{				\
  1, 1, 1, 1, 1, 0, 0, 1,	\
  1, 1, 1, 0, 0, 1, 1, 1,	\
  1, 1, 1, 1			\
}


/* Zero or more C statements that may conditionally modify two
 * variables `fixed_regs' and `call_used_regs' (both of type `char
 * []') after they have been initialized from the two preceding
 * macros.
 *
 * This is necessary in case the fixed or call-clobbered registers
 * depend on target flags.
 *
 * You need not define this macro if it has no work to do.
 *
 * If the usage of an entire class of registers depends on the target
 * flags, you may indicate this to GCC by using this macro to modify
 * `fixed_regs' and `call_used_regs' to 1 for each of the registers in
 * the classes which should not be used by GCC.  Also define the macro
 * `REG_CLASS_FROM_LETTER' to return `NO_REGS' if it is called with a
 * letter for a class that shouldn't be used.  */

#define CONDITIONAL_REGISTER_USAGE \
  c816_cond_reg_usage()

/* This is bogus anyway, until we take time to define things properly.  */
#define DONT_USE_BUILTIN_SETJMP


/* Return number of consecutive hard regs needed starting at reg REGNO
 * to hold something of mode MODE. */
 
 /*GET_MODE_SIZE (MODE) Returns the size in bytes of a datum of mode m.  */
#define HARD_REGNO_NREGS(REGNO, MODE) \
  ((GET_MODE_SIZE(MODE) + UNITS_PER_WORD - 1)/UNITS_PER_WORD)
  
  
/* Value is 1 if hard register REGNO can hold a value of machine-mode
 * MODE. */
#define HARD_REGNO_MODE_OK(REGNO, MODE) \
  (GET_MODE_SIZE(MODE) == 1		\
   || (((REGNO) & 1) == 1		\
       && (GET_MODE_SIZE(MODE) == 2	\
	   || (REGNO) <= ROM_IDX)))

	   
/* Value is 1 if it is a good idea to tie two pseudo registers when
 * one has mode MODE1 and one has mode MODE2.  If HARD_REGNO_MODE_OK
 * could produce different values for MODE1 and MODE2, for any hard
 * reg, then this must be 0 for correct output.  */

#define MODES_TIEABLE_P(MODE1, MODE2) \
  (MODE1 == MODE2)

  

/* Define the classes of registers for register constraints in the
 * machine description.  Also define ranges of constants.
 *
 * One of the classes must always be named ALL_REGS and include all
 * hard regs.  If there is more than one class, another class must be
 * named NO_REGS and contain no registers.
 *
 * The name GENERAL_REGS must be the name of a class (or an alias for
 * another name such as ALL_REGS).  This is the class of registers
 * that is allowed by "g" or "r" in a register constraint.  Also,
 * registers outside this class are allocated only when instructions
 * express preferences for them.
 *
 * The classes must be numbered in nondecreasing order; that is, a
 * larger-numbered class must never be contained completely in a
 * smaller-numbered class.
 *
 * For any two classes, it is very desirable that there be another
 * class that represents their union.  */
 #ifndef  AVOID_REDEFINITION_REG_CLASS
 #define  AVOID_REDEFINITION_REG_CLASS
enum reg_class {
  NO_REGS,
  ACCU_REGS,
  REG0_0_REGS,
  REG1_1_REGS,
  REG3_3_REGS,
  REG0_1_REGS,
  REG2_3_REGS,
  REG0_2_REGS,
  DATA_REGS,
  ROMIDX_REGS,
  RAM_1_PTR,
  EDATA_REGS,
  RAM_2_PTR,
  RAM_3_PTR,
  RAMIDX_REGS,
  STD_REGS,
  ALL_REGS,
  LIM_REG_CLASSES
};

#endif
/*N_REG_CLASSES:
 *The number of distinct register classes, defined as follows:*/
 
#define N_REG_CLASSES (int) LIM_REG_CLASSES
 
 
 /*There is nothing terribly special about
the name GENERAL_REGS, but the operand constraint letters �r� and �g� specify this class.
 If GENERAL_REGS is the same as ALL_REGS,
 just define it as a macro which expands to ALL_REGS.*/


#define GENERAL_REGS ALL_REGS



/*REG_CLASS_NAMES 
 *An initializer containing the names of the register classes as C string constants. These
 *names are used in writing some of the debugging dumps.
 */
 
 
 #define REG_CLASS_NAMES \
{			\
  "NO_REGS",		\
  "ACCU_REGS",		\
  "REG0_0_REGS",	\
  "REG1_1_REGS",	\
  "REG3_3_REGS",	\
  "REG0_1_REGS",	\
  "REG2_3_REGS",	\
  "REG0_2_REGS",	\
  "DATA_REGS",		\
  "ROMIDX_REGS",	\
  "RAM_1_PTR",		\
  "EDATA_REGS",		\
  "RAM_2_PTR",		\
  "RAM_3_PTR",		\
  "RAMIDX_REGS",	\
  "STD_REGS",		\
  "ALL_REGS"		\
}




/*
An initializer containing the contents of the register classes, as integers which are bit
masks. The nth integer specifies the contents of class n. The way the integer mask is
interpreted is that register r is in the class if mask & (1 << r) is 1.
When the machine has more than 32 registers, an integer does not suffice. Then the
integers are replaced by sub-initializers, braced groupings containing several integers.
Each sub-initializer must be suitable as an initializer for the type HARD_REG_SET
which is defined in �hard-reg-set.h�. In this situation, the first integer in each subinitializer
corresponds to registers 0 through 31, the second integer to registers 32
through 63, and so on.
*/


#define REG_CLASS_CONTENTS		\
{					\
  0x00000000,	/* NO_REGS     */	\
  0x00000001,	/* ACCU_REGS   */	\
  0x00000002,	/* REG0_0_REGS */	\
  0x00000004,	/* REG1_1_REGS */	\
  0x00000010,	/* REG3_3_REGS */	\
  0x00000006,	/* REG0_1_REGS */	\
  0x00000018,	/* REG2_3_REGS */	\
  0x0000000e,	/* REG0_2_REGS */	\
  0x0000001e,	/* DATA_REGS   */	\
  0x00000060,	/* ROMIDX_REGS */ \
  0x00000080,	/* RAM_1_PTR   */	\
  0x000001fe,	/* EDATA_REGS  */	\
  0x00000200,	/* RAM_2_PTR   */	\
  0x00000800,	/* RAM_3_PTR   */	\
  0x000f7f80,  /* RAMIDX_REGS */ \
  0x00001fff,	/* STD_REGS    */	\
  0x000fffff,	/* ALL_REGS    */	\
}



/*
A C expression whose value is a register class containing hard register regno. In
general there is more than one such class; choose a class which is minimal, meaning
that no smaller class also contains the register.
*/



#define REGNO_REG_CLASS(REGNO)		\
  ((REGNO) == 0 ? ACCU_REGS		\
   : (REGNO) == 1 ? REG0_0_REGS		\
   : (REGNO) == 2 ? REG1_1_REGS		\
   : (REGNO) == 3 ? REG0_2_REGS		\
   : (REGNO) == 4 ? REG3_3_REGS		\
   : (REGNO) < 7 ? ROMIDX_REGS		\
   : (REGNO) == 7 ? RAM_1_PTR		\
   : (REGNO) < 9 ? EDATA_REGS		\
   : (REGNO) == 9 ? RAM_2_PTR		\
   : (REGNO) == 11 ? RAM_3_PTR	\
   : (REGNO) != 15 ? RAMIDX_REGS	\
   : ALL_REGS)

/* The following macro defines cover classes for Integrated Register
   Allocator.  Cover classes is a set of non-intersected register
   classes covering all hard registers used for register allocation
   purpose.  Any move between two registers of a cover class should be
   cheaper than load or store of the registers.  The macro value is
   array of register classes with LIM_REG_CLASSES used as the end
   marker.  */
#define IRA_COVER_CLASSES               \
{                                       \
  GENERAL_REGS, LIM_REG_CLASSES         \
}

 /*A macro whose definition is the name of the class to which a valid base register must
belong. A base register is one used in an address which is the register value plus a
displacement.*/



#define BASE_REG_CLASS RAMIDX_REGS



/*A macro whose definition is the name of the class to which a valid index register must
belong. An index register is one used in an address where its value is either multiplied
by a scale factor or added to another register (as well as added to a displacement).*/


#define INDEX_REG_CLASS GENERAL_REGS


/*A C expression which defines the machine-dependent operand constraint letters for
register classes. If char is such a letter, the value should be the register class corresponding
to it. Otherwise, the value should be NO_REGS. The register letter �r�,
corresponding to class GENERAL_REGS, will not be passed to this macro; you do not
need to handle it.*/

#if 0 /*SC Obsolete in GCC 4 */

#define REG_CLASS_FROM_LETTER(C)	\
  ((C) == 'a' ? RAMIDX_REGS		\
   : (C) == 'z' ? REG0_0_REGS		\
   : (C) == 'y' ? REG3_3_REGS		\
   : (C) == 'b' ? REG1_1_REGS		\
   : (C) == 'w' ? REG0_1_REGS		\
   : (C) == 'e' ? REG2_3_REGS		\
   : (C) == 'c' ? REG0_2_REGS		\
   : (C) == 'f' ? DATA_REGS		\
   : (C) == 'x' ? ROMIDX_REGS		\
   : NO_REGS)

#endif
   
   
   
/* Determine the RAM index registers */
#define RAMIDX_P(REGNO)		\
  ((REGNO) == RAM_IDX_0		\
   || (REGNO) == RAM_IDX_1	\
   || (REGNO) == RAM_IDX_2	\
   || (REGNO) == RAM_IDX_3	\
   || (REGNO) == PSEUDO_AP_REG	\
   || (REGNO) == PSEUDO_FP_REG)

/* These assume that REGNO is a hard or pseudo reg number.  They give
 * nonzero only if REGNO is a hard reg of the suitable class or a
 * pseudo reg currently allocated to a suitable hard reg.  Since they
 * use reg_renumber, they are safe only once reg_renumber has been
 * allocated, which happens in local-alloc.c.  */
#define REGNO_OK_FOR_BASE_P(REGNO)		\
  (RAMIDX_P(REGNO)				\
   || RAMIDX_P((unsigned) reg_renumber[REGNO]))

   
   
/* No index register (in the sense meant by GCC) in CoolRISC */
#define REGNO_OK_FOR_INDEX_P(REGNO) 0



/* Given an rtx X being reloaded into a reg required to be in class
 * CLASS, return the class of reg to actually use.  In general this is
 * just CLASS; but on some machines in some cases it is preferable to
 * use a more restrictive class.  */
#define PREFERRED_RELOAD_CLASS(X, CLASS) \
  ((CLASS == GENERAL_REGS			\
    && GET_MODE_SIZE(GET_MODE(X)) > 2)		\
   ? EDATA_REGS					\
   : CLASS)

   
/* Normally the compiler avoids choosing registers that have been
 * explicitly mentioned in the rtl as spill registers (these registers
 * are normally those used to pass parameters and return values).
 * However, some machines have so few registers of certain classes
 * that there would not be enough registers to use as spill registers
 * if this were done.
 *
 * Define `SMALL_REGISTER_CLASSES' on these machines.  When it is
 * defined, the compiler allows registers explicitly used in the rtl
 * to be used as spill registers but avoids extending the lifetime of
 * these registers.  */
#define SMALL_REGISTER_CLASSES 1


/* Return the maximum number of consecutive registers needed to
 * represent mode MODE in a register of class CLASS.  Same as
 * HARD_REGNO_NREGS in our case */
#define CLASS_MAX_NREGS(CLASS, MODE) \
  ((GET_MODE_SIZE(MODE) + UNITS_PER_WORD - 1)/UNITS_PER_WORD)
  
  
#if 0 /*SC Obsolete for GCC 4 */

/* The letters I, J, K ... P in a register constraint string can be
 * used to stand for particular ranges of immediate operands.  This
 * macro defines what the ranges are.  C is the letter, and VALUE is a
 * constant value.  Return 1 if VALUE is in the range specified by C.

   I		-1 or +1
   J		-64 to 64 (auto[inc,dec] range)
   K		4-bit value
   L		7-bit value
   M		8-bit value
   N		9-bit value
   O		zero */
#define CONST_OK_FOR_LETTER_P(VALUE, C)			\
  ((C) == 'I' ? (VALUE) == -1 || (VALUE) == 1		\
   : (C) == 'J' ? ((VALUE) >= -64 && (VALUE) <= 64)	\
   : (C) == 'K' ? ((VALUE) & ~0xf) == 0			\
   : (C) == 'L' ? ((VALUE) & ~0x7f) == 0		\
   : (C) == 'M' ? ((VALUE) & ~0xff) == 0		\
   : (C) == 'N' ? ((VALUE) & ~0x1ff) == 0		\
   : (C) == 'O' ? (VALUE) == 0				\
   : 0)
   
 /* We can't load any floating point constants as immediates.  */
#define CONST_DOUBLE_OK_FOR_LETTER_P(VALUE, C) 0

/* Optional extra constraints for this machine.
 *
 * For the CoolRISC, `Q' means that this is a page_0 memory operand.
 * */
#define EXTRA_CONSTRAINT(VALUE, C) \
  ((C) == 'Q' ? page0_mem(VALUE)	\
   : 0)
#endif
   
/* ----------------------------------------------------------------
 * Stack layout; function entry, exit and calling.
 * ---------------------------------------------------------------- */

/* Offset from the frame pointer to the first local variable slot to be 
 * allocated.
 * If FRAME_GROWS_DOWNWARD, find the next slot�s offset by subtracting the first 
 * slot�s length from STARTING_FRAME_OFFSET. Otherwise, it is found by adding 
 * the length of the first slot to the value STARTING_FRAME_OFFSET. */
#define STARTING_FRAME_OFFSET  (crtl->outgoing_args_size)

/* Define this if pushing a word on the stack makes the stack pointer
 * a smaller address.  */
#define STACK_GROWS_DOWNWARD

/* Define this if the nominal address of the stack frame is at the
 * high-address end of the local variables; that is, each additional
 * local variable allocated goes at a more negative offset in the
 * frame.  */
/* #define FRAME_GROWS_DOWNWARD */

/* Offset of first parameter from the argument pointer register
 * value. */
#define FIRST_PARM_OFFSET(FNDECL) 0

/* Register to use for pushing function arguments.  */
#define STACK_POINTER_REGNUM HARD_SP_REG

/* Base register for access to local variables of the function.  */
#define FRAME_POINTER_REGNUM PSEUDO_FP_REG
#define HARD_FRAME_POINTER_REGNUM HARD_FP_REG


/* Base register for access to arguments of the function.  */
#define ARG_POINTER_REGNUM PSEUDO_AP_REG

/* Register in which static-chain is passed to a function.  ??? Mostly
 * unused... use RAM index 0 */
#define STATIC_CHAIN_REGNUM RAM_IDX_0


/* Value should be nonzero if functions must have frame pointers.
 * Zero means the frame pointer need not be set up (and parms may be
 * accessed via the stack pointer) in functions that seem suitable.
 * This is computed in `reload', in reload1.c.  */
#define FRAME_POINTER_REQUIRED 0

/* Definitions for register eliminations.
 *
 * This is an array of structures.  Each structure initializes one
 * pair of eliminable registers.  The "from" register number is given
 * first, followed by "to".  Eliminations of the same "from" register
 * are listed in order of preference.
 *
 * We have two registers that are eliminated on CoolRISC. The psuedo
 * arg pointer and pseudo frame pointer registers can always be
 * eliminated; they are replaced with either the stack or the real
 * frame pointer. */
#define ELIMINABLE_REGS					\
{{ARG_POINTER_REGNUM, STACK_POINTER_REGNUM},		\
 {ARG_POINTER_REGNUM, HARD_FRAME_POINTER_REGNUM},	\
 {FRAME_POINTER_REGNUM, STACK_POINTER_REGNUM},		\
 {FRAME_POINTER_REGNUM, HARD_FRAME_POINTER_REGNUM}}

 
 /* Given FROM and TO register numbers, say whether this elimination is
 * allowed.  Frame pointer elimination is automatically handled.
 *
 * All eliminations are valid since the cases where FP can't be
 * eliminated are already handled.  */
#define CAN_ELIMINATE(FROM, TO) 1


/* Define the offset between two registers, one to be eliminated, and
 * the other its replacement, at the start of a routine.
 *
 * Tentatively, we have on the stack:
 *
 * parm n		high address
 * parm n-1		     |
 * ...			     V
 * parm 1
 * parm 0	<- arg pointer
 * saved reg j
 * saved reg j-1
 * ...
 * saved reg 1
 * saved reg 0
 * local i
 * local i-1
 * ...
 * local 1
 * local 0
 * out parm n
 * out parm n-1
 * ...
 * out parm 1
 * out parm 0	<- frame pointer (== stack pointer)
 *
 * If the frame pointer couldn't be eliminated, it means there is
 * dynamically allocated stuff between the stack pointer and the frame
 * pointer.  */
#define INITIAL_ELIMINATION_OFFSET(FROM, TO, OFFSET) \
do {							\
  if ((FROM) == FRAME_POINTER_REGNUM)			\
    (OFFSET) = 0;					\
  else if ((FROM) == ARG_POINTER_REGNUM)		\
    (OFFSET) = (cool_sa_size()				\
		+ get_frame_size()			\
		+ crtl->outgoing_args_size);	\
} while (0)

/* If defined, the maximum amount of space required for outgoing
 * arguments will be computed and placed into the variable
 * 'current_function_outgoing_args_size'. No space will be pushed onto
 * the stack for each call; instead, the function prologue should
 * increase the stack frame size by this amount.
 *
 * This provides for more opportunities to suppress the frame pointer
 * than when PUSH_ROUNDING is defined.  */
#define ACCUMULATE_OUTGOING_ARGS 1

/* Value is the number of byte of arguments automatically popped when
 * returning from a subroutine call.  FUNDECL is the declaration node
 * of the function (as a tree), FUNTYPE is the data type of the
 * function (as a tree), or for a library call it is an identifier
 * node for the subroutine name.  SIZE is the number of bytes of
 * arguments passed on the stack. */
#define RETURN_POPS_ARGS(FUNDECL, FUNTYPE, SIZE) 0

/* Define where to put the arguments to a function.  Value is zero to
 * push the argument on the stack, or a hard register in which to
 * store the argument.
 *
 * CUM is a variable of type CUMULATIVE_ARGS which gives info about
 *     the preceding args and about the function being called.
 * MODE is the argument's machine mode.
 * TYPE is the data type of the argument (as a tree).  This is null
 *     for libcalls where that information may not be available.
 * NAMED is nonzero if this argument is a named parameter (otherwise
 *     it is an extra parameter matching an ellipsis).  */
#define FUNCTION_ARG(CUM, MODE, TYPE, NAMED) \
  function_arg(CUM, MODE, TYPE, NAMED)
  
/* Define a data type for recording info about an argument list during
 * the scan of that argument list.  This data type should hold all
 * necessary information about the function itself and about the args
 * processed so far, enough to enable macros such as FUNCTION_ARG to
 * determine where the next arg should go.
 *
 * On the CoolRISC, this is a single integer, which is a number of
 * bytes of arguments scanned so far.  */
#define CUMULATIVE_ARGS int


/* Initialize a variable CUM of type CUMULATIVE_ARGS for a call to a
 * function whose data type is FNTYPE.  For a library call, FNTYPE is
 * 0.
 *
 * On the CoolRISC, the offset starts at 0.  */
#define INIT_CUMULATIVE_ARGS(CUM, FNTYPE, LIBNAME, FNDECL, N_NAMED_ARGS) \
 ((CUM) = 0)

 /* Update the data in CUM to advance over an argument of mode MODE and
 * data type TYPE.  (TYPE is null for libcalls where that information
 * may not be available.) */
#define FUNCTION_ARG_ADVANCE(CUM, MODE, TYPE, NAMED) \
 ((CUM) += ((MODE) != BLKmode			\
	    ? (GET_MODE_SIZE(MODE))		\
	    : (int_size_in_bytes(TYPE))))

/* 1 if N is a possible register number for function argument
 * passing. */
#define FUNCTION_ARG_REGNO_P(N) \
  ((N) >= REG_0 && (N) <= REG_3)

/* Define how to find the value returned by a library function
 * assuming the value has mode MODE.  */
#define LIBCALL_VALUE(MODE) \
  gen_rtx_REG( MODE, REG_0)

/* 1 if N is a possible register number for a function value as seen
 * by the caller. */
#define FUNCTION_VALUE_REGNO_P(N) \
  ((N) == REG_0 || (N) == REG_1)

/* The definition of this macro implies that there are cases where a
 * scalar value cannot be returned in registers.
 *
 * On CoolRISC, anything bigger than 4 bytes should be returned in
 * memory. */
#define TARGET_RETURN_IN_MEMORY(TYPE,FNTYPE) \
  ((TYPE_MODE(TYPE) == BLKmode)	\
   || (GET_MODE_SIZE(TYPE_MODE(TYPE)) > 4))
  
 /* Define this to be 1 if all structure return values must be in
 * memory. */
#define DEFAULT_PCC_STRUCT_RETURN 0

/* This target hook should return the location of the structure value address 
 * (normally a mem or reg), or 0 if the address is passed as an "invisible" 
 * first argument. Note that fndecl may be NULL, for libcalls. You do not need
 * to define this target hook if the address is always passed as an "invisible"
 * first argument. */
#define TARGET_STRUCT_VALUE_RTX 0


/* ----------------------------------------------------------------
 * Generating code for profiling
 *
 * No profiling on CoolRISC yet.
 * ---------------------------------------------------------------- */

/* Output assembler code to FILE to increment profiler label # LABELNO
 * for profiling a function entry. */
#define FUNCTION_PROFILER(FILE, LABELNO) \
do {							\
  fputs("No profiling available for Cool Risc cpu.\n", stderr);		\
  abort();						\
} while (0)



/* ----------------------------------------------------------------
 * Trampolines for nested functions
 *
 * No trampolines on CoolRISC yet.
 * ---------------------------------------------------------------- */


/* Output assembler code for a block containing the constant parts of
 * a trampoline, leaving space for the variable parts. */
#define TRAMPOLINE_TEMPLATE(FILE) \
do {							\
  fputs("TRAMPOLINE_TEMPLATE called\n", stderr);	\
  abort();						\
} while (0)


/* Length in units of the trampoline for entering a nested function.  */
#define TRAMPOLINE_SIZE 2


/* Emit RTL insns to initialize the variable parts of a trampoline.
 * FNADDR is an RTX for the address of the function's pure code.  CXT
 * is an RTX for the static chain value for the function.  */
#define INITIALIZE_TRAMPOLINE(TRAMP, FNADDR, CXT) \
do {							\
  fputs("INITIALIZE_TRAMPO called\n", stderr);		\
  abort();						\
} while (0)

/* ----------------------------------------------------------------
 * Addressing modes
 * ---------------------------------------------------------------- */
#define HAVE_POST_INCREMENT 1
#define HAVE_PRE_DECREMENT 1


/* Recognize any constant value that is a valid address.  */
#define CONSTANT_ADDRESS_P(X) \
  cool_const_address_p(X, 0, NULL)
  
  
  
/* Maximum number of registers that can appear in a valid memory
 * address.  */
#define MAX_REGS_PER_ADDRESS 1




/* The macros REG_OK_FOR..._P assume that the arg is a REG rtx and
 * check its validity for a certain class.  We have two alternate
 * definitions for each of them.  The usual definition accepts all
 * pseudo regs; the other rejects them unless they have been allocated
 * suitable hard regs.  The symbol REG_OK_STRICT causes the latter
 * definition to be used.
 *
 * Most source files want to accept pseudo regs in the hope that they
 * will get allocated to the class that the insn wants them to be in.
 * Source files for reload pass need to be strict.  After reload, it
 * makes no difference, since pseudo regs have been eliminated by
 * then.  */

#ifndef REG_OK_STRICT
/* Nonzero if X is a hard reg that can be used as a base reg or if it
 * is a pseudo reg.  */
#define REG_OK_FOR_BASE_P(X)		\
  (RAMIDX_P(REGNO(X))			\
   || REGNO(X) >= FIRST_PSEUDO_REGISTER)
#else
/* Nonzero if X is a hard reg that can be used as a base reg.  */
#define REG_OK_FOR_BASE_P(X) \
  REGNO_OK_FOR_BASE_P(REGNO(X))
#endif

/* This is included to allow stack push/pop operations.  */
#define PUSH_POP_ADDRESS_P(X)		\
  ((GET_CODE (X) == PRE_DEC		\
    || GET_CODE (X) == POST_INC)	\
   && RTX_OK_FOR_BASE_P(XEXP(X, 0)))


 
/* GO_IF_LEGITIMATE_ADDRESS recognizes an RTL expression that is a
 * valid memory address for an instruction.  The MODE argument is the
 * machine mode for the MEM expression that wants to use this
 * address. */
 
 
 /* Go to ADDR if X is a valid address. */
#define GO_IF_LEGITIMATE_ADDRESS(MODE, X, ADDR) \
{						\
  if (CONSTANT_ADDRESS_P(X)) goto ADDR;		\
  if (RTX_OK_FOR_BASE_P(X)) goto ADDR;		\
  if (INDEXED_ADDRESS_P(X)) goto ADDR;		\
  if (PUSH_POP_ADDRESS_P(X)) goto ADDR;		\
}
#define RTX_OK_FOR_BASE_P(X)			\
  ((GET_CODE(X) == REG && REG_OK_FOR_BASE_P(X))	\
   || (GET_CODE(X) == SUBREG			\
       && GET_CODE(SUBREG_REG(X)) == REG	\
       && REG_OK_FOR_BASE_P(SUBREG_REG(X))))

	   
	   
	   
#define INDEXED_ADDRESS_P(X)					\
   (GET_CODE(X) == PLUS						\
    && ((RTX_OK_FOR_BASE_P(XEXP(X, 1))				\
	 && cool_const_address_p(XEXP(X, 0), 1, XEXP(X, 1)))	\
	|| (RTX_OK_FOR_BASE_P(XEXP(X, 0))			\
	    && cool_const_address_p(XEXP(X, 1), 1, XEXP(X, 0)))))
   

   
   
/* Go to LABEL if ADDR (a legitimate address expression) has an effect
 * that depends on the machine mode it is used for. */
#define GO_IF_MODE_DEPENDENT_ADDRESS(ADDR, LABEL) \
 if (GET_CODE(ADDR) == POST_INC			\
     || GET_CODE(ADDR) == PRE_DEC) goto LABEL
	 
	 
	 
/* Nonzero if the constant value X is a legitimate general operand.
 * It is given that X satisfies CONSTANT_P or is a CONST_DOUBLE.  */
#define LEGITIMATE_CONSTANT_P(X) 1



/* ----------------------------------------------------------------
 * Condition code status
 * ---------------------------------------------------------------- */

/* C code for a data type which is used for declaring the `mdep'
 * component of `cc_status'.  It defaults to `int'.  */
#define CC_STATUS_MDEP cool_tdep


#ifndef  AVOID_REDEFINITION__cool_mdep
#define  AVOID_REDEFINITION__cool_mdep
 typedef struct _cool_mdep {
   int cmp0_done;
   struct rtx_def *in_accu;
   struct rtx_def *op1;
   struct rtx_def *op2;
 } cool_tdep;
#endif
 
 
 /* A C expression to initialize the `mdep' field to "empty".  */
#define CC_STATUS_MDEP_INIT \
  (cc_status.mdep.cmp0_done = 0,	\
   cc_status.mdep.in_accu = 0,		\
   cc_status.mdep.op1 = 0,		\
   cc_status.mdep.op2 = 0)

   
   /* Store in cc_status the expressions that the condition codes will
 * describe after execution of an instruction whose pattern is EXP.
 * Do not alter them if the instruction would not alter the cc's.  */
#define NOTICE_UPDATE_CC(EXP, INSN) notice_update_cc(EXP, INSN)




/* ----------------------------------------------------------------
 * Describing relative costs of operations
 * ---------------------------------------------------------------- */

/* Compute the cost of computing a constant rtl expression RTX whose
 * rtx-code is CODE.  The body of this macro is a portion of a switch
 * statement.  If the code is computed here, return it with a return
 * statement.  Otherwise, break from the switch.  */
/*#define CONST_COSTS(X, CODE, OUTER_CODE) \
  case CONST_INT:		\
  case CONST_DOUBLE:		\
    return 0;			\
  case CONST:			\
  case SYMBOL_REF:		\
  case LABEL_REF:		\
    return 1;
*/
/* RTX_COSTS is like `CONST_COSTS' but applies to nonconstant RTL
 * expressions.  This can be used, for example, to indicate how costly
 * a multiply instruction is.  In writing this macro, you can use the
 * construct `COSTS_N_INSNS (N)' to specify a cost equal to N fast
 * instructions.
 */

	
	
/* An expression giving the cost of an addressing mode that contains
 * ADDRESS.  If not defined, the cost is computed from the ADDRESS
 * expression and the CONST_COSTS values.  */



/* Nonzero if access to memory by bytes is slow and undesirable.  */
#define SLOW_BYTE_ACCESS 0



/* The number of scalar move insns which should be generated instead
 * of a string move insn or a library call.  Increasing the value will
 * always make code faster, but eventually incurs high cost in
 * increased code size.
 *
 * If you don't define this, a reasonable default is used.  */
#define MOVE_RATIO(speed) 3


/* Define this if addresses of constant functions shouldn't be put
 * through pseudo regs where they can be cse'd.  Desirable on machines
 * where ordinary constants are expensive but a CALL with constant
 * address is cheap.  */
 
#define NO_FUNCTION_CSE 1


/* ----------------------------------------------------------------
 * Dividing the output into sections
 * ---------------------------------------------------------------- */

/* Output before read-only data.  */
#define TEXT_SECTION_ASM_OP "\t.text\n"

/* Output before writable data.  */
#define DATA_SECTION_ASM_OP "\t.data\n"

/* Output before constant data.  */
#define READONLY_DATA_SECTION_ASM_OP "\t.section\t.rodata"

/* Short Data Support */
#define SDATA_SECTION_ASM_OP	"\t.section .page0_data,\"aw\""

#define BSS_SECTION_ASM_OP "\t.section .bss"
#define SBSS_SECTION_ASM_OP "\t.section .page0_bss"

/* ELF has support for the .init and .fini sections, and we can put
 * stuff in there to be executed before and after `main'.  We let
 * crtstuff.c and other files know this by defining the following
 * symbols.  The definitions say how to change sections to the .init
 * and .fini sections.  Defining this has the side effect of
 * suppressing the call to __main at the start of the main function.
 * */
#define INIT_SECTION_ASM_OP	".section\t\".init\""
#define FINI_SECTION_ASM_OP	".section\t\".fini\""

/* ----------------------------------------------------------------
 * The overall framework of an assembler file
 * ---------------------------------------------------------------- */

 


/* Make LBRAC and RBRAC addresses relative to the start of the
 * function.  The native Solaris stabs debugging format works this
 * way, gdb expects it, and it reduces the number of relocation
 * entries.  */
#define DBX_BLOCKS_FUNCTION_RELATIVE 1


/* In order for relative line numbers to work, we must output the
 * stabs entry for the function name first.  */
#define DBX_FUNCTION_FIRST


/* Generate a blank trailing N_SO to mark the end of the .o file,
 * since we can't depend upon the linker to mark .o file boundaries
 * with embedded stabs.  */
#define DBX_OUTPUT_MAIN_SOURCE_FILE_END(FILE, FILENAME) \
  fprintf(FILE,						\
	  "\t.text\n\t.stabs \"\",%d,0,0,.Letext\n.Letext:\n", N_SO)

	  
	  
#define ASM_COMMENT_START  ";"

#define ASM_APP_ON "#APP\n"
#define ASM_APP_OFF "#NO_APP\n"


/* ----------------------------------------------------------------
 * Output of data
 * ---------------------------------------------------------------- */

/* Floating point conversion.  */

#define OLD_REAL_VALUE_TO_TARGET_SINGLE(IN, OUT) \
do {						\
  unsigned long v_0, s_0, e_0;			\
  v_0 = (IN);				\
  if (v_0 == 0) {				\
    (OUT) = 0;					\
    break;					\
  }						\
  e_0 = (v_0 << 1) & 0xff000000;		\
  s_0 = (v_0 & 0x80000000) >> 8;		\
  if (e_0 == 0) {				\
    if (v_0 & 0x00400000)			\
      e_0 = 0x02000000, v_0 <<= 1;		\
    else if (v_0 & 0x00200000)			\
      e_0 = 0x01000000, v_0 <<= 2;		\
    else					\
      e_0 = 0x01000000, v_0 = 0;		\
  } else if (e_0 < 0xfe000000)			\
    e_0 += 0x02000000;				\
  else						\
    e_0 = 0xff000000, v_0 = 0x007fffff;		\
  (OUT) = (v_0 & 0x007fffff) | s_0 | e_0;	\
} while (0)

#undef REAL_VALUE_TO_TARGET_SINGLE
#define REAL_VALUE_TO_TARGET_SINGLE(IN, OUT) \
do {  \
   (*c816_single_format.encode)( NULL, &(OUT), IN ); \
}while (0)

/* Format floating point numbers */
#define ASM_OUTPUT_DOUBLE(STREAM, VALUE)	\
{						\
  unsigned long l[2];				\
  REAL_VALUE_TO_TARGET_DOUBLE(VALUE, &l[0]);	\
  fprintf(STREAM, "\t.long 0x%08x,0x%08x"	\
	  "\t;; %26.16le\n",			\
	  l[0], l[1], VALUE);			\
}


#define ASM_BYTE_OP ".byte"


/* Output an ascii string */
#define ASM_OUTPUT_ASCII(STREAM, PTR, LEN) \
  asm_output_ascii(STREAM, PTR, LEN)
  
  

  
  
/* ----------------------------------------------------------------
 * Output of uninitialized variables
 * ---------------------------------------------------------------- */
 
#undef  TARGET_HAVE_SWITCHABLE_BSS_SECTIONS
#define TARGET_HAVE_SWITCHABLE_BSS_SECTIONS true
  
/* This says how to output an assembler line to define a global common
 * symbol.  */
#define ASM_OUTPUT_COMMON(STREAM, NAME, SIZE, ROUNDED) \
do {					\
  fputs("\n\t.global\t", STREAM);		\
  assemble_name(STREAM, NAME);		\
  fputs("\n\t.section .bss", STREAM);			\
  fputs("\n\t.type\t", STREAM);		\
  assemble_name(STREAM, NAME);		\
  fputs(", #object", STREAM);	\
  fputs("\n\t.size\t", STREAM);		\
  assemble_name(STREAM, NAME);		\
  fprintf(STREAM, ", %u\n", ROUNDED);	\
  assemble_name(STREAM, NAME);		\
  fputs(":\n\t.space ", STREAM);		\
  fprintf(STREAM, "%u\n", ROUNDED);	\
} while (0)


/* This says how to output an assembler line to define a local common
 * symbol.  */
#if 0
#define ASM_OUTPUT_LOCAL(STREAM, NAME, SIZE, ROUNDED) \
do {\
  fputs("\n; ASM_OUTPUT_LOCAL", STREAM); \
  fputs("\n\t.section .bss", STREAM);			\
  fputs("\n\t.type\t", STREAM);		\
  assemble_name(STREAM, NAME);		\
  fputs(", #object", STREAM);	\
  fputs("\n\t.size\t", STREAM);		\
  assemble_name(STREAM, NAME);		\
  fprintf(STREAM, ", %u\n", ROUNDED);	\
  assemble_name(STREAM, NAME);		\
  fputs(":\n\t.space ", STREAM);		\
  fprintf(STREAM, "%u\n", ROUNDED);	\
} while (0)
#endif

#if 0
#define ASM_OUTPUT_BSS(FILE, DECL, NAME, SIZE, ROUNDED)		\
  asm_output_bss ((FILE), (DECL), (NAME), (SIZE), (ROUNDED))
#endif

#define TARGET_ASM_NAMED_SECTION  c816_asm_named_section

#undef  ASM_OUTPUT_ALIGNED_DECL_LOCAL
#define ASM_OUTPUT_ALIGNED_DECL_LOCAL(FILE, DECL, NAME, SIZE, ALIGN)	\
do \
{  \
   c816_output_aligned_decl_local( FILE, DECL, NAME, SIZE, ALIGN ); \
}  \
while( 0 )

/* This is how to output the definition of a user-level label named
 * NAME, such as the label on a static function or variable NAME.  */
#define ASM_OUTPUT_LABEL(STREAM, NAME) \
do {					\
  assemble_name(STREAM, NAME);		\
  fputs (":\n", STREAM);		\
} while (0)


/* Define the strings used for the special svr4 .type and .size
 * directives.  These strings generally do not vary from one system
 * running svr4 to another, but if a given system (e.g. m88k running
 * svr) needs to use different pseudo-op names for these, they may be
 * overridden in the file which includes this one.  */
#define TYPE_ASM_OP	".type"
#define SIZE_ASM_OP	".size"


/* The following macro defines the format used to output the second
 * operand of the .type assembler directive.  Different svr4
 * assemblers expect various different forms for this operand.  The
 * one given here is just a default.  You may need to override it in
 * your machine- specific tm.h file (depending upon the particulars of
 * your assembler).  */
#define TYPE_OPERAND_FMT	"#%s"


/* These macros generate the special .type and .size directives which
 * are used to set the corresponding fields of the linker symbol table
 * entries in an ELF object file under SVR4.  These macros also output
 * the starting labels for the relevant functions/objects.  */

/* Write the extra assembler code needed to declare a function
 * properly.  Some svr4 assemblers need to also have something extra
 * said about the function's return value.  We allow for that here.
 * */
#define ASM_DECLARE_FUNCTION_NAME(STREAM, NAME, DECL) \
do {							\
  fprintf(STREAM, "\t%s\t", TYPE_ASM_OP);		\
  assemble_name(STREAM, NAME);				\
  putc(',', STREAM);					\
  fprintf(STREAM, TYPE_OPERAND_FMT, "function");	\
  putc('\n', STREAM);					\
  ASM_OUTPUT_LABEL(STREAM, NAME);			\
} while (0)


/* Write the extra assembler code needed to declare an object
 * properly.  */
#define ASM_DECLARE_OBJECT_NAME(STREAM, NAME, DECL)			\
do {									\
  fprintf(STREAM, "\t%s\t", TYPE_ASM_OP);				\
  assemble_name(STREAM, NAME);						\
  putc(',', STREAM);							\
  fprintf(STREAM, TYPE_OPERAND_FMT, "object");				\
  putc('\n', STREAM);							\
  size_directive_output = 0;						\
  if (!flag_inhibit_size_directive && DECL_SIZE(DECL)) {		\
    size_directive_output = 1;						\
    fprintf(STREAM, "\t%s\t", SIZE_ASM_OP);				\
    assemble_name(STREAM, NAME);					\
    fprintf(STREAM, ",%d\n",  int_size_in_bytes(TREE_TYPE(DECL)));	\
  }									\
  ASM_OUTPUT_LABEL(STREAM, NAME);					\
} while (0)


/* Output the size directive for a decl in rest_of_decl_compilation in
 * the case where we did not do so before the initializer.  Once we
 * find the error_mark_node, we know that the value of
 * size_directive_output was set by ASM_DECLARE_OBJECT_NAME when it
 * was run for the same decl.  */
#define ASM_FINISH_DECLARE_OBJECT(STREAM, DECL, TOP_LEVEL, AT_END) \
do {									\
  char *name = XSTR(XEXP(DECL_RTL(DECL), 0), 0);			\
  if (!flag_inhibit_size_directive && DECL_SIZE(DECL)			\
      && ! AT_END && TOP_LEVEL						\
      && DECL_INITIAL(DECL) == error_mark_node				\
      && !size_directive_output) {					\
    size_directive_output = 1;						\
    fprintf(STREAM, "\t%s\t", SIZE_ASM_OP);				\
    assemble_name(STREAM, name);					\
    fprintf(STREAM, ",%d\n",  int_size_in_bytes(TREE_TYPE(DECL)));	\
  }									\
} while (0)


/* This is how to declare the size of a function.  */
#define ASM_DECLARE_FUNCTION_SIZE(STREAM, FNAME, DECL) \
do {							\
  if (!flag_inhibit_size_directive) {			\
    char label[256];					\
    static int labelno;					\
    labelno++;						\
    ASM_GENERATE_INTERNAL_LABEL(label, "Lfe", labelno);	\
    ASM_OUTPUT_INTERNAL_LABEL(STREAM, label);	\
    fprintf(STREAM, "\t%s\t", SIZE_ASM_OP);		\
    assemble_name(STREAM, (FNAME));			\
    fprintf(STREAM, ",");				\
    assemble_name(STREAM, label);			\
    fprintf(STREAM, "-");				\
    assemble_name(STREAM, (FNAME));			\
    fputs("\n\n\n", STREAM);				\
  }							\
} while (0)


/* This is how to output a command to make the user-level label named
 * NAME defined for reference from other files.  */
#define TARGET_ASM_GLOBALIZE_LABEL(STREAM, NAME) \
do {					\
  fputs("\t.global\t", STREAM);		\
  assemble_name(STREAM, NAME);		\
  fputs ("\n", STREAM);		\
} while (0)


/* This is how to output a command to make the external label named
 * NAME, which is not defined in the file, to be referable */
#define ASM_OUTPUT_EXTERNAL(STREAM, DECL, NAME) \
do {					\
  fputs("\t.import\t", STREAM);		\
  assemble_name(STREAM, NAME);		\
  fputs ("\n", STREAM);		\
} while (0)



/* This is how to output a reference to a user-level label named NAME.
 * `assemble_name' uses this.  */
#define ASM_OUTPUT_LABELREF(STREAM, NAME) \
  fputs(NAME, STREAM)
  
  
  

/* This is how to output a definition of an internal numbered label
 * where PREFIX is the class of label and NUM is the number within the
 * class.  */
#define ASM_OUTPUT_INTERNAL_LABEL(FILE, NAME) \
  do  { \
  assemble_name_raw ((FILE), (NAME)); \
        fputs (":\n", (FILE));  \
  }while(0)
  
  /* This is how to store into STRING the symbol_ref name of an internal
 * numbered label where PREFIX is the class of label and NUM is the
 * number within the class.  This is suitable for output with
 * `assemble_name'.  */
#define ASM_GENERATE_INTERNAL_LABEL(STRING, PREFIX, NUM) \
  sprintf(STRING, "*.%s%ld", PREFIX, (unsigned long)NUM)

/* Store in OUTVAR a string (made with alloca) containing an
 * assembler-name for a local static variable named NAME.  NUMBER is
 * an integer which is different for each call.  */
#define ASM_FORMAT_PRIVATE_NAME(OUTVAR, NAME, NUMBER) \
do {							\
  (OUTVAR) = (char *) alloca(strlen(NAME) + 10);	\
  sprintf(OUTVAR, "%s.%ld", NAME, (unsigned long)NUMBER);		\
} while (0)


/* This is how to equate one symbol to another symbol.  The syntax
 * used is `.set NAME, VALUE'. */
#define ASM_OUTPUT_DEF(STREAM, NAME, VALUE) \
do {				\
  fputs("\t.set\t", STREAM);	\
  assemble_name(STREAM, NAME);	\
  fputs(", ", STREAM);		\
  assemble_name(STREAM, VALUE);	\
  fputs("\n", STREAM);		\
} while (0)


/* ----------------------------------------------------------------
 * Output of assembler instructions
 * ---------------------------------------------------------------- */

/* How to refer to registers in assembler output.  This sequence is
 * indexed by compiler's hard-register-number.  */
#define REGISTER_NAMES \
{					\
  "%a", "%r3", "%r2", "%r1", "%r0",	\
  "%iph", "%ipl",			\
  "%i0h", "%i0l", "%i1h", "%i1l",	\
  "%i2h", "%i2l", "%i3h", "%i3l",	\
  "%stat",				\
  "%ap_hi", "%ap_lo",			\
  "%fp_hi", "%fp_lo"			\
}


/* If defined, a C statement to be executed just prior to the output
 * of assembler code for INSN, to modify the extracted operands so
 * they will be output differently.
 *
 * Here the argument OPVEC is the vector containing the operands
 * extracted from INSN, and NOPERANDS is the number of elements of the
 * vector which contain meaningful data for this insn.  The contents
 * of this vector are what will be used to convert the insn template
 * into assembler code, so you can change the assembler output by
 * changing the contents of the vector. */
#define FINAL_PRESCAN_INSN(INSN, OPVEC, NOPERANDS) \
  c816_prescan_insn(INSN, OPVEC, NOPERANDS)
  
  

/* A C compound statement to output to stdio stream STREAM the
 * assembler syntax for an instruction operand X.  X is an RTL
 * expression.
 *
 * CODE is a value that can be used to specify one of several ways of
 * printing the operand.  It is used when identical operands must be
 * printed differently depending on the context.  CODE comes from the
 * `%' specification that was used to request printing of the operand.
 * If the specification was just `%DIGIT' then CODE is 0; if the
 * specification was `%LTR DIGIT' then CODE is the ASCII code for LTR.
 *
 * If X is a register, this macro should print the register's name.
 * The names can be found in an array `reg_names' whose type is `char
 * *[]'.  `reg_names' is initialized from `REGISTER_NAMES'.
 *
 * When the machine description has a specification `%PUNCT' (a `%'
 * followed by a punctuation character), this macro is called with a
 * null pointer for X and the punctuation character for CODE. */
#define PRINT_OPERAND(STREAM, X, CODE) \
  print_operand(STREAM, X, CODE)

  
  
/* A C compound statement to output to stdio stream STREAM the
 * assembler syntax for an instruction operand that is a memory
 * reference whose address is X.  X is an RTL expression.
 *
 * On some machines, the syntax for a symbolic address depends on the
 * section that the address refers to.  On these machines, define the
 * macro `ENCODE_SECTION_INFO' to store the information into the
 * `symbol_ref', and then check for it here.  */
#define PRINT_OPERAND_ADDRESS(STREAM, X) \
  print_operand_address(STREAM, X)

  
  
/* This is how to output an insn to push a register on the stack.  It
 * need not be very fast code (used only in profiling...).  */
#define ASM_OUTPUT_REG_PUSH(STREAM, REGNO) \
  fprintf (STREAM, "; Profile push register %s\n", reg_names[REGNO])

  
  

/* This is how to output an insn to pop a register from the stack.  It
 * need not be very fast code (used only in profiling...).  */
#define ASM_OUTPUT_REG_POP(STREAM, REGNO) \
  fprintf (STREAM, "; Profile pop register %s\n", reg_names[REGNO])

  
  
  
/* ----------------------------------------------------------------
 * Output of dispatch tables
 * ---------------------------------------------------------------- */

 
 /* This is how to output an element of a case-vector that is absolute.  */
#define ASM_OUTPUT_ADDR_VEC_ELT(STREAM, VALUE) \
  fprintf(STREAM, "\t.short .L%d\n", VALUE)

  
  
/* ----------------------------------------------------------------
 * Assembler commands for alignment
 * ---------------------------------------------------------------- */
/* This is how to output an assembler line that says to advance the
 * location counter by NBYTES bytes.  */
#define ASM_OUTPUT_SKIP(STREAM, NBYTES) \
  fprintf(STREAM, "\t.space %d\n", NBYTES)
  
  
  
/* This is how to output an assembler line that says to advance the
 * location counter to a multiple of 2**POWER bytes.  */
#define ASM_OUTPUT_ALIGN(STREAM, POWER)	\
  if ((POWER) != 0)			\
    fprintf (STREAM, "\t.align %d\n", POWER)
	
	

/* ----------------------------------------------------------------
 * Controlling debugging information format
 * ---------------------------------------------------------------- */

 
 /* How to renumber registers for dbx and gdb. */
#define DBX_REGISTER_NUMBER(REGNO) (REGNO)


/* gcc support stabs (DBX) and Dwarf-2 debugging information. */
#define DBX_DEBUGGING_INFO
#define DWARF2_DEBUGGING_INFO 1
//#define DWARF2_ASM_LINE_DEBUG_INFO 1

#define PREFERRED_DEBUGGING_TYPE DBX_DEBUG


/* ----------------------------------------------------------------
 * Miscellaneous parameters
 * ---------------------------------------------------------------- */
 
 
 
 
 
 /* Specify the machine mode that this machine uses for the index in
 * the tablejump instruction.  */
#define CASE_VECTOR_MODE HImode


/* Max number of bytes we can move from memory to memory in one
 * reasonably fast instruction.  */
#define MOVE_MAX 4


/* Define if shifts truncate the shift count which implies one can
 * omit a sign-extension or zero-extension of a shift count.  */
#define SHIFT_COUNT_TRUNCATED 1

/* Value is 1 if truncating an integer of INPREC bits to OUTPREC bits
 * (OUTPREC < INPREC) is done just by pretending it is already
 * truncated.  */
#define TRULY_NOOP_TRUNCATION(OUTPREC, INPREC) 1


/* We assume that the store-condition-codes instructions store 0 for
 * false and some other value for true.  This is the value stored for
 * true.  */
#define STORE_FLAG_VALUE 1



/* Specify the machine mode that pointers have.  After generation of
 * rtl, the compiler makes no further distinction between pointers and
 * any other objects of this machine mode.  */
#define Pmode HImode

/* A function address in a call instruction is a byte address (for
 * indexing purposes) so give the MEM rtx a byte's mode.  */
#define FUNCTION_MODE QImode

/* The number of Pmode words for the setjmp buffer.  */
#define JMP_BUF_SIZE 16

#undef TARGET_RTX_COSTS
#define TARGET_RTX_COSTS(X, CODE, OUTER_CODE) \
  case NEG:				\
    switch (GET_MODE(SET_DEST(X))) {	\
    case QImode:			\
      return COSTS_N_INSNS(1);		\
    case HImode:			\
      return COSTS_N_INSNS(2);		\
 			\
    case SFmode:			\
      return COSTS_N_INSNS(1);		\
    default:				\
      return COSTS_N_INSNS(4);		\
    }					\
  case NOT:				\
  case AND:				\
  case IOR:				\
  case XOR:				\
  case ASHIFT:				\
  case ASHIFTRT:			\
  case LSHIFTRT:			\
  case PLUS:				\
  case MINUS:				\
    switch (GET_MODE(X)) {		\
    case QImode:			\
      return COSTS_N_INSNS(1);		\
    case HImode:			\
      return COSTS_N_INSNS(2);		\
    case SImode:			\
      return COSTS_N_INSNS(4);		\
    default:			\
      return COSTS_N_INSNS(8);		\
    }					\
    return LIBCALL_COSTS(X);		\
  case MULT:				\
    switch (GET_MODE(X)) {		\
    case QImode:			\
      return COSTS_N_INSNS(2);		\
    case HImode:			\
      return COSTS_N_INSNS(8);		\
    case SImode:			\
      return COSTS_N_INSNS(20);		\
    default:			\
      return COSTS_N_INSNS(40);		\
    }					\
    return LIBCALL_COSTS(X);		\
  case COMPARE:				\
    switch (GET_MODE(XEXP(X, 0))) {	\
    case QImode:			\
      return COSTS_N_INSNS(2);		\
    case HImode:			\
      return COSTS_N_INSNS(8);		\
    case SImode:			\
      return COSTS_N_INSNS(20);		\
    default:			\
      return COSTS_N_INSNS(40);		\
    }					\
    return LIBCALL_COSTS(X);		\
  case DIV:				\
  case MOD:				\
  case UDIV:				\
  case UMOD:				\
  case FLOAT:				\
  case UNSIGNED_FLOAT:			\
  case FIX:				\
  case UNSIGNED_FIX:			\
    return LIBCALL_COSTS(X);

#undef  TARGET_ASM_GLOBALIZE_LABEL
#define TARGET_ASM_GLOBALIZE_LABEL default_globalize_label
#undef TARGET_ADDRESS_COST
#define TARGET_ADDRESS_COST     cool_address_cost

#undef TARGET_STRICT_ARGUMENT_NAMING
#define TARGET_STRICT_ARGUMENT_NAMING hook_bool_CUMULATIVE_ARGS_true

#define REAL_VALUE_TO_DECIMAL(r, fmt, s) (sprintf (s, fmt, r))
