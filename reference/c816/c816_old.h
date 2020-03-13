/* Definitions for GCC.  Part of the machine description for CRIS.
   Copyright (C) 1998, 1999, 2000, 2001, 2002 Free Software Foundation, Inc.
   * Christian Iseli
   * Stéphane Clog, Vincent Choplin (Raisonance)

This file is part of GCC.

GCC is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

GCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GCC; see the file COPYING.  If not, write to
the Free Software Foundation, 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* ****************************************************************
   *                                                              *
   * Macro definitions for the CoolRISC processors.               *
   *                                                              *
   * Christian Iseli                                              *
   *                                                              *
   * Stéphane Clog                                                *
   *                                                              *
   * Vincent Choplin                                              *
   *                                                              *
   **************************************************************** */

/*//VC020804: try protecting i2 and i3*/
#define VINCENT 1

#if 1	/*//VC020906 3.2*/
#if !defined HOST_WIDE_INT
#include "hwint.h"
#endif
#endif

#ifndef IN_LIBGCC2
#include <stdio.h> /* So that FILE is defined... */
#endif /* !IN_LIBGCC2 */
#include "machmode.h" /* So that enum machine_mode is defined... */
struct rtx_def; /* Mention what is an rtx */
union tree_node; /* Mention what is a tree_node */

#define TARGET_C816

#define TARGET_CPU_CPP_BUILTINS()		\
  do						\
    {						\
      builtin_define_std ("c816");		\
      builtin_define_std ("C816");		\
      builtin_define_std ("C816_CRIS");		\
      builtin_define ("");	\
      builtin_assert ("cpu=c816");		\
      builtin_assert ("machine=c816");		\
    }						\
  while (0)


/* Define this macro if you want to implement any pragmas.  If defined, it
   should be a C expression to be executed when #pragma is seen.  The
   argument STREAM is the stdio input stream from which the source
   text can be read.  CH is the first character after the #pragma.  The
   result of the expression is the terminating character found
   (newline or EOF).  */



/* C816 specific pragmas.  */
#define REGISTER_TARGET_PRAGMAS(PFILE)					\
  do									\
    {									\
      cpp_register_pragma (PFILE, 0, "interrupt", c816_pr_interrupt);	\
      cpp_register_pragma (PFILE, 0, "extra_output", c816_pr_output);   \
    }									\
  while (0)





/* Set when processing a function with pragma interrupt turned on.  */

extern int pragma_interrupt;

extern int pragma_output;


#define TARGET_VERSION fprintf(stderr, " (CoolRISC 816)")

/* A C string constant that tells the GNU CC driver program options to
 * pass to the assembler.  It can also specify how to translate
 * options you give to GNU CC into options for GNU CC to pass to the
 * assembler.  */
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

/* Macro to define tables used to set the flags.  This is a list in
 * braces of pairs in braces, each pair being { "NAME", VALUE } where
 * VALUE is the bits to set or minus the bits to clear.  An empty
 * string NAME is used to identify the default VALUE.  */

#if 1 /*//SC020717 3.1*/
#define TARGET_SWITCHES  \
{   					\
/* use software call */			\
    { "softcall", 1, N_( "Use software call" ) },			\
    { "nosoftcall", -1, N_( "Use hardware call") },		\
/* use software call for libgcc also */	\
    { "libsoftcall", 2, N_( "Use software call for libgcc" ) },		\
    { "nolibsoftcall", -2, N_( "Use hardware call for libgcc" ) },		\
/* use safe stack pointer adjustment */	\
    { "safe-stackpointer", 4, N_( "Use safe stack pointer adjustement" ) },		\
    { "nosafe-stackpointer", -4, N_( "No safe stack pointer adjustement" ) },	\
/* default */				\
    { "", TARGET_DEFAULT, NULL }		\
}
#else
#define TARGET_SWITCHES  \
{   					\
/* use software call */			\
    { "softcall", 1},			\
    { "nosoftcall", -1},		\
/* use software call for libgcc also */	\
    { "libsoftcall", 2},		\
    { "nolibsoftcall", -2},		\
/* use safe stack pointer adjustment */	\
    { "safe-stackpointer", 4},		\
    { "nosafe-stackpointer", -4},	\
/* default */				\
    { "", TARGET_DEFAULT}		\
}
#endif

#define TARGET_DEFAULT (5)

#define TARGET_SOFTCALL		(target_flags & 1)
#define TARGET_SOFTLIB		(target_flags & 2)
#define TARGET_SAFESTACK	(target_flags & 4)

/* This macro is similar to `TARGET_SWITCHES' but defines names of
 * command options that have values.  Its definition is an initializer
 * with a subgrouping for each command option.
 *
 * Each subgrouping contains a string constant, that defines the fixed
 * part of the option name, and the address of a variable.  The
 * variable, type `char *', is set to the variable part of the given
 * option if the fixed part matches.  The actual option name is made
 * by appending `-m' to the specified name.
 *
 * Here is an example which defines `-mshort-data-NUMBER'.  If the
 * given option is `-mshort-data-512', the variable `m88k_short_data'
 * will be set to the string `"512"'.
 *
 *	extern char *m88k_short_data;
 *	#define TARGET_OPTIONS { { "short-data-", &m88k_short_data } }  */

extern char *cool_page0_cutoff;	/* For -mpage0-mvs=n */

#define TARGET_OPTIONS				\
{						\
  {"page0-mvs=",	&cool_page0_cutoff}	\
}

/* Sometimes certain combinations of command options do not make sense
 * on a particular target machine.  You can define a macro
 * `OVERRIDE_OPTIONS' to take account of this.  This macro, if
 * defined, is executed once just after all the command options have
 * been parsed.
 *
 * On the CoolRISC, it is used to translate target-option strings into
 * numeric values.  */
#define OVERRIDE_OPTIONS override_options ()

/* Some machines may desire to change what optimizations are performed
 * for various optimization levels.  This macro, if defined, is
 * executed once just after the optimization level is determined and
 * before the remainder of the command options have been parsed.
 * Values set in this macro are used as the default values for the
 * other command line options.
 *
 * LEVEL is the optimization level specified; 2 if -O2 is specified, 1
 * if -O is specified, and 0 if neither is specified.  */
#if 1 /*//SC020705*/
#define OPTIMIZATION_OPTIONS(LEVEL,SIZE) \
  c816_opt_options(LEVEL,SIZE)
#else
#define OPTIMIZATION_OPTIONS(LEVEL) \
  c816_opt_options(LEVEL)
#endif

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

#if 1 /*//SC020809 3.1*/
/* The stack goes in 8 bit lumps. I guess! */
#define STACK_BOUNDARY 8
#endif


/* //VC030814 : try not to align arrays and structures*/
#if 0 /* //doesn't work :( */
#define DATA_ALIGNMENT(TYPE, BASIC_ALIGN) 8
#define CONSTANT_ALIGNMENT(CONSTANT, BASIC_ALIGN) 8
#endif

/* Alignment of field after `int : 0' in a structure.  */
#define EMPTY_FIELD_BOUNDARY 8

/* Non zero if move instructions will actually fail to work when
 * given unaligned data.  */
#define STRICT_ALIGNMENT 0

/* An integer expression for the size in bits of the largest integer
 * machine mode that should actually be used.  All integer machine
 * modes of this size or smaller can be used for structures and unions
 * with the appropriate sizes.  If this macro is undefined,
 * GET_MODE_BITSIZE (DImode) is assumed.  */
#define MAX_FIXED_MODE_SIZE 32

/* A C statement to validate the value VALUE (of type double) for mode
 * MODE.  This means that you check whether VALUE fits within the
 * possible range of values for mode MODE on this target machine.  The
 * mode MODE is always a mode of class MODE_FLOAT.  OVERFLOW is
 * nonzero if the value is already known to be out of range.  */
/* CI - FIXME - Should be defined...  */
/* #define CHECK_FLOAT_VALUE(MODE, VALUE, OVERFLOW) */

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

/* Try to save space with enum types... */
#define DEFAULT_SHORT_ENUMS	1


/* Type to use for `size_t'. If undefined, uses `long unsigned
 * int'. */
#define SIZE_TYPE "unsigned int"
#define PTRDIFF_TYPE "int"

/* #define WCHAR_TYPE "short" */
/* #define WCHAR_TYPE_SIZE 16 */

/* Standard character codes.  */
#define TARGET_BELL     007
#define TARGET_BS       010
#define TARGET_TAB      011
#define TARGET_NEWLINE  012
#define TARGET_VT       013
#define TARGET_FF       014
#define TARGET_CR       015
#if 1 /*//SC020709 3.1*/
#define TARGET_ESC      033
#endif





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

/* CI - FIXME - This is needed since we do look at register death
 * notes.  It causes some optimization losses though.  At some point,
 * we should redo the flow analysis right before generating the code,
 * and take the opportunity to perform some further optimizations.
 * Might want to look how the sh uses MACHINE_DEPENDENT_REORG to do
 * some NOTES shuffling.  */
#define PRESERVE_DEATH_INFO_REGNO_P(regno) (optimize)

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

#define N_REG_CLASSES (int) LIM_REG_CLASSES

#define GENERAL_REGS ALL_REGS

/* Give names of register classes as strings for dump file.   */
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

/* Define which registers fit in which classes.  This is an
 * initializer for a vector of HARD_REG_SET of length N_REG_CLASSES.  */
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

/* The same information, inverted: Return the class number of the
 * smallest class containing reg number REGNO.  This could be a
 * conditional expression or could index an array.  */
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

/* The class value for index registers, and the one for base regs.  */
#define BASE_REG_CLASS RAMIDX_REGS
#define INDEX_REG_CLASS GENERAL_REGS

/* Get reg_class from a letter such as appears in the machine
 * description.  */
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


/* ----------------------------------------------------------------
 * Stack layout; function entry, exit and calling.
 * ---------------------------------------------------------------- */

/* Define this if pushing a word on the stack makes the stack pointer
 * a smaller address.  */
#define STACK_GROWS_DOWNWARD

/* Define this if the nominal address of the stack frame is at the
 * high-address end of the local variables; that is, each additional
 * local variable allocated goes at a more negative offset in the
 * frame.  */
/* #define FRAME_GROWS_DOWNWARD */

/* Offset within stack frame to start allocating local variables at.
 * If FRAME_GROWS_DOWNWARD, this is the offset to the END of the first
 * local allocated.  Otherwise, it is the offset to the BEGINNING of
 * the first local allocated.  */
#define STARTING_FRAME_OFFSET current_function_outgoing_args_size

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
		+ current_function_outgoing_args_size);	\
} while (0)

/* If defined, the maximum amount of space required for outgoing
 * arguments will be computed and placed into the variable
 * 'current_function_outgoing_args_size'. No space will be pushed onto
 * the stack for each call; instead, the function prologue should
 * increase the stack frame size by this amount.
 *
 * This provides for more opportunities to suppress the frame pointer
 * than when PUSH_ROUNDING is defined.  */

#if 1 /*//SC020709 3.1*/
#define ACCUMULATE_OUTGOING_ARGS 1
#else
#define ACCUMULATE_OUTGOING_ARGS
#endif

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

/* For an arg passed partly in registers and partly in memory, this is
 * the number of registers used.  For args passed entirely in
 * registers or entirely in memory, zero.  */
#define FUNCTION_ARG_PARTIAL_NREGS(CUM, MODE, TYPE, NAMED) 0

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
#define INIT_CUMULATIVE_ARGS(CUM, FNTYPE, LIBNAME, INDIRECT) \
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

/* Define this macro if a float function always returns float (even in
 * traditional mode). */
#define TRADITIONAL_RETURN_FLOAT

/* Define how to find the value returned by a function.  VALTYPE is
 * the data type of the value (as a tree).  If the precise function
 * being called is known, FUNC is its FUNCTION_DECL; otherwise, FUNC
 * is 0.
 *
 * On CoolRISC, return value goes into registers reg3...reg0 */
#define FUNCTION_VALUE(VALTYPE, FUNC) \
  (TYPE_MODE(VALTYPE) == QImode \
   ? gen_rtx(REG, TYPE_MODE(VALTYPE), REG_1) \
   : gen_rtx(REG, TYPE_MODE(VALTYPE), REG_0))

/* Define how to find the value returned by a library function
 * assuming the value has mode MODE.  */
#define LIBCALL_VALUE(MODE) \
  gen_rtx(REG, MODE, REG_0)

/* 1 if N is a possible register number for a function value as seen
 * by the caller. */
#define FUNCTION_VALUE_REGNO_P(N) \
  ((N) == REG_0 || (N) == REG_1)

/* The definition of this macro implies that there are cases where a
 * scalar value cannot be returned in registers.
 *
 * On CoolRISC, anything bigger than 4 bytes should be returned in
 * memory. */
#define RETURN_IN_MEMORY(TYPE) \
  ((TYPE_MODE(TYPE) == BLKmode)	\
   || (GET_MODE_SIZE(TYPE_MODE(TYPE)) > 4))

/* Define this to be 1 if all structure return values must be in
 * memory. */
#define DEFAULT_PCC_STRUCT_RETURN 0

/* RTX for the place containing the address to store a structure value
 * passed to a function. 0 makes it an invisible first argument. */
#define STRUCT_VALUE 0

#if 0 /*//SC020819 3.1*/
/* This macro generates the assembly code for function entry. */
#define FUNCTION_PROLOGUE(FILE, SIZE) \
  output_function_prologue(FILE, SIZE)

/* Generate the assembly code for function exit. */
#define FUNCTION_EPILOGUE(FILE, SIZE) \
  output_function_epilogue(FILE, SIZE)
#endif


/* ----------------------------------------------------------------
 * Generating code for profiling
 *
 * No profiling on CoolRISC yet.
 * ---------------------------------------------------------------- */

/* Output assembler code to FILE to increment profiler label # LABELNO
 * for profiling a function entry. */
#define FUNCTION_PROFILER(FILE, LABELNO) \
do {							\
  fputs("No profiling available.\n", stderr);		\
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
 * Implicit calls to library routines
 * ---------------------------------------------------------------- */

/* Perform target dependent optabs initialization.  */
#define INIT_TARGET_OPTABS \
  SYMBOL_REF_FLAG(bzero_libfunc) = 1;

/* ----------------------------------------------------------------
 * Addressing modes
 * ---------------------------------------------------------------- */

#if 1 /*//SC020705*/
#define HAVE_POST_INCREMENT 1
#define HAVE_PRE_DECREMENT 1
#else
#define HAVE_POST_INCREMENT
#define HAVE_PRE_DECREMENT
#endif

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

/* GO_IF_LEGITIMATE_ADDRESS recognizes an RTL expression that is a
 * valid memory address for an instruction.  The MODE argument is the
 * machine mode for the MEM expression that wants to use this
 * address. */
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

/* This is included to allow stack push/pop operations.  */
#define PUSH_POP_ADDRESS_P(X)		\
  ((GET_CODE (X) == PRE_DEC		\
    || GET_CODE (X) == POST_INC)	\
   && RTX_OK_FOR_BASE_P(XEXP(X, 0)))

/* Go to ADDR if X is a valid address. */
#define GO_IF_LEGITIMATE_ADDRESS(MODE, X, ADDR) \
{						\
  if (CONSTANT_ADDRESS_P(X)) goto ADDR;		\
  if (RTX_OK_FOR_BASE_P(X)) goto ADDR;		\
  if (INDEXED_ADDRESS_P(X)) goto ADDR;		\
  if (PUSH_POP_ADDRESS_P(X)) goto ADDR;		\
}

/* Nonzero if X is a hard reg that can be used as an index or if it is
 * a pseudo reg.  */
#define REG_OK_FOR_INDEX_P(X) 0

/* Try machine-dependent ways of modifying an illegitimate address to
 * be legitimate.  If we find one, return the new, valid address.
 * This macro is used in only one place: `memory_address' in explow.c.
 *
 * OLDX is the address as it was before break_out_memory_refs was
 * called.  In some cases it is useful to look at this to decide what
 * needs to be done.
 *
 * MODE and WIN are passed so that this macro can use
 * GO_IF_LEGITIMATE_ADDRESS.
 *
 * It is always safe for this macro to do nothing.  It exists to
 * recognize opportunities to optimize the output. */
#define LEGITIMIZE_ADDRESS(X, OLDX, MODE, WIN)

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

 typedef struct _cool_mdep {
   int cmp0_done;
   struct rtx_def *in_accu;
   struct rtx_def *op1;
   struct rtx_def *op2;
 } cool_tdep;

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
#define CONST_COSTS(X, CODE, OUTER_CODE) \
  case CONST_INT:		\
  case CONST_DOUBLE:		\
    return 0;			\
  case CONST:			\
  case SYMBOL_REF:		\
  case LABEL_REF:		\
    return 1;

/* RTX_COSTS is like `CONST_COSTS' but applies to nonconstant RTL
 * expressions.  This can be used, for example, to indicate how costly
 * a multiply instruction is.  In writing this macro, you can use the
 * construct `COSTS_N_INSNS (N)' to specify a cost equal to N fast
 * instructions.
 *
 * This is just a very rough estimate... */
#define LIBCALL_COSTS(X) \
  (COSTS_N_INSNS(20) * GET_MODE_SIZE(GET_MODE(x)))

#define RTX_COSTS(X, CODE, OUTER_CODE) \
  case NEG:				\
    switch (GET_MODE(SET_DEST(X))) {	\
    case QImode:			\
      return COSTS_N_INSNS(1);		\
    case HImode:			\
      return COSTS_N_INSNS(2);		\
    case TQFmode:			\
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

/* An expression giving the cost of an addressing mode that contains
 * ADDRESS.  If not defined, the cost is computed from the ADDRESS
 * expression and the CONST_COSTS values.  */
#define ADDRESS_COST(ADDRESS) 1

/* Nonzero if access to memory by bytes is slow and undesirable.  */
#define SLOW_BYTE_ACCESS 0

/* The number of scalar move insns which should be generated instead
 * of a string move insn or a library call.  Increasing the value will
 * always make code faster, but eventually incurs high cost in
 * increased code size.
 *
 * If you don't define this, a reasonable default is used.  */
#define MOVE_RATIO 3

/* Define this if addresses of constant functions shouldn't be put
 * through pseudo regs where they can be cse'd.  Desirable on machines
 * where ordinary constants are expensive but a CALL with constant
 * address is cheap.  */
#if 1 /*//VC021017 : 3.2*/
#define NO_FUNCTION_CSE 1
#else
#define NO_FUNCTION_CSE
#endif

/* Don't cse the address of the function being compiled.  */
#if 1 /*//VC021017 : 3.2*/
#define NO_RECURSIVE_FUNCTION_CSE 1
#else
#define NO_RECURSIVE_FUNCTION_CSE
#endif


/* ----------------------------------------------------------------
 * Dividing the output into sections
 * ---------------------------------------------------------------- */

/* Output before read-only data.  */
#define TEXT_SECTION_ASM_OP "\t.text\n"

/* Output before writable data.  */
#define DATA_SECTION_ASM_OP "\t.data\n"

/* Output before constant data.  */
#define CONST_SECTION_ASM_OP "\t.section\t.rodata"

/* ELF has support for the .init and .fini sections, and we can put
 * stuff in there to be executed before and after `main'.  We let
 * crtstuff.c and other files know this by defining the following
 * symbols.  The definitions say how to change sections to the .init
 * and .fini sections.  Defining this has the side effect of
 * suppressing the call to __main at the start of the main function.
 * */
#define INIT_SECTION_ASM_OP	".section\t\".init\""
#define FINI_SECTION_ASM_OP	".section\t\".fini\""

/* A list of other sections which we might be "in" at any given time.
 * */
#define EXTRA_SECTIONS in_const

/* A list of extra section function definitions.  */
#define EXTRA_SECTION_FUNCTIONS \
  CONST_SECTION_FUNCTION

#define READONLY_DATA_SECTION() \
  const_section()

/* If we are referencing a global variable outside of page 0 make the
 * SYMBOL_REF special.  */
#define ENCODE_SECTION_INFO(DECL) \
  cool_encode_section_info(DECL)

#define CONST_SECTION_FUNCTION \
void								\
const_section ()						\
{								\
  if (in_section != in_const) {					\
    fprintf (asm_out_file, "%s\n", CONST_SECTION_ASM_OP);	\
    in_section = in_const;					\
  }								\
}


/* ----------------------------------------------------------------
 * The overall framework of an assembler file
 * ---------------------------------------------------------------- */

/* Output at beginning of assembler file.  */
#define ASM_FILE_START(STREAM) asm_file_start(STREAM)

/* Output at end of assembler file.  */
#define ASM_FILE_END(STREAM) asm_file_end(STREAM)

/* Make LBRAC and RBRAC addresses relative to the start of the
 * function.  The native Solaris stabs debugging format works this
 * way, gdb expects it, and it reduces the number of relocation
 * entries.  */
#define DBX_BLOCKS_FUNCTION_RELATIVE 1

/* When using stabs, gcc2_compiled must be a stabs entry, not an
 * ordinary symbol, or gdb won't see it.  The stabs entry must be
 * before the N_SO in order for gdb to find it.  */
/* //VC030804: new cygwin
#define ASM_IDENTIFY_GCC(FILE) \
do {								\
  fputs("; Compiled by GCC for RIDE 816, v1.0\n", FILE);	\
  if (write_symbols != DBX_DEBUG)				\
    fputs ("gcc2_compiled.:\n", FILE);				\
  else								\
    fputs ("\t.stabs\t\"gcc2_compiled.\", 0x3c, 0, 0, 0\n", FILE); \
  output_lang_identify(FILE);					\
} while (0)
*/
/* Like block addresses, stabs line numbers are relative to the
 * current function.  */
#define ASM_OUTPUT_SOURCE_LINE(file, line) \
do {								\
  static int sym_lineno = 1;					\
  fprintf(file, ".stabn 68,0,%d,.LM%d-",			\
	  line, sym_lineno);					\
  assemble_name(file,						\
		XSTR(XEXP(DECL_RTL(current_function_decl), 0), 0)); \
  fprintf(file, "\n.LM%d:\n", sym_lineno);			\
  sym_lineno += 1;						\
} while (0)

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

/* A C statement to output something to the assembler file to switch
 * to section NAME for object DECL which is either a FUNCTION_DECL, a
 * VAR_DECL or NULL_TREE.  RELOC indicates whether the initial value
 * of exp requires link-time relocations.  Some target formats do not
 * support arbitrary sections.  Do not define this macro in such
 * cases.  */
#define ASM_OUTPUT_SECTION_NAME(FILE, DECL, NAME, RELOC) \
   if (strcmp(NAME, ".page0_bss") == 0) {				\
     /* We need to handle this specially.  */				\
     if (DECL_INITIAL (DECL) != 0) {					\
       /* Was put in the wrong one.  Change it now.  */			\
       DECL_SECTION_NAME (decl) = build_string (12, ".page0_data");	\
       NAME = ".page0_data";						\
       if (in_section != in_named || strcmp (NAME, in_named_name))	\
 	fprintf (FILE, "\t.section %s\n", NAME);			\
     } else {								\
       /* Put some stupid name, to make sure we get called even if we	\
          stayed in .page0_bss section.  */				\
       NAME = "/*.page0_bss";						\
       if (in_section != in_named || strcmp (NAME, in_named_name))	\
 	fprintf (FILE, "\t.section .page0_bss\n");			\
     }									\
   } else								\
     fprintf (FILE, "\t.section %s\n", NAME)




/* ----------------------------------------------------------------
 * Output of data
 * ---------------------------------------------------------------- */

/* Floating point conversion.  */
#define REAL_VALUE_TO_TARGET_SINGLE(IN, OUT) \
do {						\
  float f = (float) (IN);			\
  unsigned long v_0, s_0, e_0;			\
  v_0 = *(long *) &f;				\
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

/* Format floating point numbers */
#define ASM_OUTPUT_DOUBLE(STREAM, VALUE)	\
{						\
  unsigned long l[2];				\
  REAL_VALUE_TO_TARGET_DOUBLE(VALUE, &l[0]);	\
  fprintf(STREAM, "\t.long 0x%08x,0x%08x"	\
	  "\t;; %26.16le\n",			\
	  l[0], l[1], VALUE);			\
}

#define ASM_OUTPUT_FLOAT(STREAM, VALUE)	\
{						\
  unsigned long l;				\
  REAL_VALUE_TO_TARGET_SINGLE(VALUE, l);	\
  fprintf(STREAM,				\
	  "\t.long 0x%08x\t;; %26.7e\n",	\
	  l, VALUE);				\
}

#define ASM_OUTPUT_THREE_QUARTER_FLOAT(STREAM, VALUE) \
{						\
  unsigned long l;				\
  REAL_VALUE_TO_TARGET_SINGLE(VALUE, l);	\
  fprintf(STREAM,				\
	  "\t.byte 0x%02x,0x%02x,0x%02x"	\
	  "\t;; 3/4 %26.7e\n",			\
	  l >> 24, (l >> 16) & 0xff,		\
	  (l >> 8) & 0xff, VALUE);		\
}

/* Format integer numbers */
#define ASM_OUTPUT_INT(STREAM, EXP)	\
  fputs("\t.long\t", STREAM);		\
  output_addr_const(STREAM, EXP);	\
  putc('\n', STREAM)

#define ASM_OUTPUT_SHORT(STREAM, EXP)	\
  fputs("\t.short\t", STREAM);		\
  c816_force_positive(EXP);		\
  output_addr_const(STREAM, EXP);	\
  putc('\n', STREAM)

#define ASM_OUTPUT_CHAR(STREAM, EXP)	\
  fputs("\t.byte\t", STREAM);		\
  output_addr_const(STREAM, EXP);	\
  putc('\n', STREAM)

/* This is how to output an assembler line for a numeric constant
 * byte.  */
#define ASM_OUTPUT_BYTE(STREAM, VAL) \
  fprintf(STREAM, "\t.byte\t0x%02x\n", VAL)

/* Pseudo op string for a sequence of single-byte constants */
#define ASM_BYTE_OP ".byte"
#define ASM_SHORT "\t.short"

/* Output an ascii string */
#define ASM_OUTPUT_ASCII(STREAM, PTR, LEN) \
  asm_output_ascii(STREAM, PTR, LEN)

/* Define the parentheses used to group arithmetic operations in
 * assembler code.  */
/* //VC030804 : new cygwin
#define ASM_OPEN_PAREN "("
#define ASM_CLOSE_PAREN ")"
*/

/* ----------------------------------------------------------------
 * Output of uninitialized variables
 * ---------------------------------------------------------------- */



/* This says how to output an assembler line to define a global common
 * symbol.  */
#define ASM_OUTPUT_COMMON(STREAM, NAME, SIZE, ROUNDED) \
do {					\
data_section();			\
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
#define ASM_OUTPUT_LOCAL(STREAM, NAME, SIZE, ROUNDED) \
do {					\
data_section();			\
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

/* ----------------------------------------------------------------
 * Output and generation of labels
 * ---------------------------------------------------------------- */


/* Switch into a generic section.  */
#define TARGET_ASM_NAMED_SECTION  default_elf_asm_named_section




/*unsigned int
elf32_c816_section_type_flags (tree, const char, int);*/

#define TARGET_SECTION_TYPE_FLAGS elf32_c816_section_type_flags


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
    ASM_OUTPUT_INTERNAL_LABEL(STREAM, "Lfe", labelno);	\
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
#define ASM_GLOBALIZE_LABEL(STREAM, NAME) \
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
#define ASM_OUTPUT_INTERNAL_LABEL(STREAM, PREFIX, NUM) \
  fprintf(STREAM, ".%s%d:\n", PREFIX, NUM)

/* This is how to store into STRING the symbol_ref name of an internal
 * numbered label where PREFIX is the class of label and NUM is the
 * number within the class.  This is suitable for output with
 * `assemble_name'.  */
#define ASM_GENERATE_INTERNAL_LABEL(STRING, PREFIX, NUM) \
  sprintf(STRING, "*.%s%d", PREFIX, NUM)

/* Store in OUTVAR a string (made with alloca) containing an
 * assembler-name for a local static variable named NAME.  NUMBER is
 * an integer which is different for each call.  */
#define ASM_FORMAT_PRIVATE_NAME(OUTVAR, NAME, NUMBER) \
do {							\
  (OUTVAR) = (char *) alloca(strlen(NAME) + 10);	\
  sprintf(OUTVAR, "%s.%d", NAME, NUMBER);		\
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


/* Define this macro if GNU CC should generate calls to the System V
   (and ANSI C) library functions `memcpy' and `memset' rather than
   the BSD functions `bcopy' and `bzero'.  */


#define TARGET_MEM_FUNCTIONS 1


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
#define DWARF2_DEBUGGING_INFO

/* Define this if gcc should produce debugging output for dbx in
 * response to the -g flag. */
#undef  PREFERRED_DEBUGGING_TYPE
#define PREFERRED_DEBUGGING_TYPE DBX_DEBUG


/* ----------------------------------------------------------------
 * Miscellaneous parameters
 * ---------------------------------------------------------------- */

/* Optionally define this if you have added predicates to `MACHINE.c'.
 * This macro is called within an initializer of an array of
 * structures.  The first field in the structure is the name of a
 * predicate and the second field is an array of rtl codes.  For each
 * predicate, list all rtl codes that can be in expressions matched by
 * the predicate.  The list should have a trailing comma.  Here is an
 * example of two entries in the list for a typical RISC machine:
 *
 * #define PREDICATE_CODES \
 *   {"gen_reg_rtx_operand", {SUBREG, REG}},  \
 *   {"reg_or_short_cint_operand", {SUBREG, REG, CONST_INT}},
 *
 * Defining this macro does not affect the generated code (however,
 * incorrect definitions that omit an rtl code that may be matched by
 * the predicate can cause the compiler to malfunction).  Instead, it
 * allows the table built by `genrecog' to be more compact and
 * efficient, thus speeding up the compiler.  The most important
 * predicates to include in the list specified by this macro are
 * thoses used in the most insn patterns.  */
#define PREDICATE_CODES \
  {"immediate_inc_operand",	{ CONST_INT }},			\
  {"data_reg_operand",		{ REG }},			\
  {"data_reg1_operand",		{ REG }},			\
  {"data_reg2_operand",		{ REG }},			\
  {"data_reg3_operand",		{ REG }},			\
  {"romidx_operand",		{ REG }},			\
  {"commutative_operator",	{ PLUS, AND, IOR, XOR }},	\
  {"logical_operator",		{ AND, IOR, XOR }},

/* Specify the machine mode that this machine uses for the index in
 * the tablejump instruction.  */
#define CASE_VECTOR_MODE HImode

/* Define this to be the smallest number of different values for which
 * it is best to use a jump-table instead of a tree of conditional
 * branches.  The default is 4 for machines with a casesi instruction
 * and 5 otherwise.  This is just a guess for CoolRISC.  */
#define CASE_VALUES_THRESHOLD 16

/* This is the kind of divide that is easiest to do in the general
 * case.  */
/* //VC030804 : new cygwin
#define EASY_DIV_EXPR TRUNC_DIV_EXPR
*/

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

/* A C expression whose value is nonzero if IDENTIFIER with arguments
 * ARGS is a valid machine specific attribute for DECL.  The
 * attributes in ATTRIBUTES have previously been assigned to DECL.  */
/* //VC030804 : new cygwin
#define VALID_MACHINE_DECL_ATTRIBUTE(DECL, ATTRIBUTES, IDENTIFIER, ARGS) \
  cool_valid_attribute(DECL, ATTRIBUTES, IDENTIFIER, ARGS)
*/

/* In rare cases, correct code generation requires extra machine *
 * dependent processing between the second jump optimization pass and
 * delayed branch scheduling.  On those machines, define this macro as
 * a C statement to act on the code starting at INSN.  */
/* #define MACHINE_DEPENDENT_REORG(INSN) \
  c816_postprocess_insns(INSN) */

#if 1	/*//VC020912 : 3.2*/
/* The number of Pmode words for the setjmp buffer.  */
#define JMP_BUF_SIZE 16
#endif

#ifndef IN_LIBGCC2

/* ----------------------------------------------------------------
 * Global variables
 * ---------------------------------------------------------------- */

extern int frame_pointer_needed;


/* ----------------------------------------------------------------
 * Prototype of the functions declared in cool.c
 *
 * Since this file is read before the definitions in rtl.h we cannot
 * define real prototypes in all cases...
 * ---------------------------------------------------------------- */

extern void override_options(void);
extern int cool_sa_size(void);
extern int cool_const_address_p(struct rtx_def *x, int offset,
				struct rtx_def *reg);
extern int cool_valid_attribute(union tree_node *decl,
				union tree_node *attributes,
				union tree_node *attr, union tree_node *args);
extern void cool_encode_section_info(union tree_node *decl);


extern void cool_output_function_prologue(FILE *stream, int size);
extern void cool_output_function_epilogue(FILE *stream, int size);

extern void asm_file_start(FILE *stream);
extern void asm_file_end(FILE *stream);
extern void asm_output_ascii(FILE *stream, unsigned char *ptr, int len);
extern void print_operand (FILE *stream, struct rtx_def *x, int code);
extern void print_operand_address(FILE *stream, struct rtx_def *x);
extern int immediate_inc_operand(struct rtx_def *op, enum machine_mode mode);
extern int data_reg_operand(struct rtx_def *op, enum machine_mode mode);
extern int data_reg1_operand(struct rtx_def *op, enum machine_mode mode);
extern int data_reg2_operand(struct rtx_def *op, enum machine_mode mode);
extern int data_reg3_operand(struct rtx_def *op, enum machine_mode mode);
extern int romidx_operand(struct rtx_def *op, enum machine_mode mode);
extern int commutative_operator(struct rtx_def *op, enum machine_mode mode);
extern int logical_operator(struct rtx_def *op, enum machine_mode mode);
extern void find_hidden_accu(struct rtx_def *insn, struct rtx_def **operands);
extern const char *output_left_shift(struct rtx_def *insn,
			       struct rtx_def **operands, int signedp);
extern const char *output_right_shift(struct rtx_def *insn,
				struct rtx_def **operands, int signedp);
extern const char *output_branch(struct rtx_def *insn,
			   struct rtx_def **operands, int reverse);
extern int op_in_accu_p(struct rtx_def *op, struct rtx_def *insn);
extern struct rtx_def *function_arg(int cum, enum machine_mode mode,
				    union tree_node *type, int named);
extern const char *output_commutative(struct rtx_def *insn, struct rtx_def **operands);
extern const char *output_move(struct rtx_def *insn, struct rtx_def **operands);
extern const char *output_add_wide(struct rtx_def *insn, struct rtx_def **operands);
extern const char *output_sub_wide(struct rtx_def *insn, struct rtx_def **operands);
extern int only_use_trunc_p(struct rtx_def *insn, struct rtx_def *op);
extern const char *output_extend(struct rtx_def *insn, struct rtx_def **operands,
			   int signed_p);
extern const char *output_libcall(struct rtx_def *insn, struct rtx_def **operands,
			    int n_par_r, int n_par_s, int commutative,
			    const char *template, int fsub, int no_call, int alt_reg);
extern const char *output_fneg(struct rtx_def *insn, struct rtx_def **operands);
extern const char *output_mult(struct rtx_def *insn,
			 struct rtx_def **operands, int signedp,
			 unsigned int mask);
extern const char *output_divmod(struct rtx_def *insn,
			   struct rtx_def **operands, int signedp);
extern const char *output_logical(struct rtx_def *insn, struct rtx_def **operands);
extern const char *output_not(struct rtx_def *insn, struct rtx_def **operands);
extern int page0_mem(struct rtx_def *x);
extern const char *output_to_float(struct rtx_def *insn, struct rtx_def **operands,
			     int uns, unsigned int mask);
extern const char *output_to_int(struct rtx_def *insn, struct rtx_def **operands,
			   int uns);
extern void notice_update_cc(struct rtx_def *exp, struct rtx_def *insn);
extern const char *output_movstr(struct rtx_def *insn, struct rtx_def **operands);
extern void c816_cond_reg_usage(void);

extern void c816_opt_options(int level,int size);

extern void c816_force_positive(struct rtx_def *exp);
extern void expand_a_shift(enum machine_mode mode, int code,
			   struct rtx_def **operands);
extern void c816_prescan_insn(struct rtx_def *insn, struct rtx_def **opvec,
			      int noperands);
extern void c816_tidy_regs(struct rtx_def *insns);



extern int general_operand(struct rtx_def *, enum machine_mode);
extern int register_operand(struct rtx_def *, enum machine_mode);
extern int memory_operand(struct rtx_def *, enum machine_mode);
extern int immediate_operand(struct rtx_def *, enum machine_mode);
extern int nonimmediate_operand(struct rtx_def *, enum machine_mode);
extern int get_frame_size(void);
extern int dead_or_set_regno_p   PARAMS((rtx, unsigned int));
extern int rtx_equal_p           PARAMS((rtx, rtx));
extern void delete_for_peephole  PARAMS ((rtx, rtx));
extern int reg_mentioned_p       PARAMS ((rtx, rtx));
extern void remove_note          PARAMS ((rtx, rtx));
extern int validate_replace_rtx(struct rtx_def *, struct rtx_def *,
				struct rtx_def *);
extern int side_effects_p        PARAMS ((rtx));



#endif /* !IN_LIBGCC2 */
