/* Definitions for GCC.  Part of the machine description for CRIS.
   Copyright (C) 1998, 1999, 2000, 2001, 2002 Free Software Foundation, Inc.

   * Christian Iseli, Philippe Moeschler
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

/*
******************************************************************
*                                                                *
* Subroutines for gcc2 for the CoolRISC processors.              *
*                                                                *
* Christian Iseli, Philippe Moeschler                            *
*                                                                *
* Stéphane Clog                                                  *
*                                                                *
* Vincent Choplin                                                *
*                                                                *
****************************************************************** */

#include "config.h"
#include "system.h"
#include "coretypes.h"
#include "tm.h"
#include "rtl.h"
#include "regs.h"
#include "hard-reg-set.h"
#include "real.h"
#include "insn-config.h"
#include "conditions.h"
#include "insn-attr.h"
#include "flags.h"
#include "reload.h"
#include "tree.h"
#include "output.h"
#include "expr.h"
#include "toplev.h"
#include "tree.h"
#include "obstack.h"
#include "function.h"
#include "recog.h"
#include "ggc.h"
#include "tm_p.h"

#include "target.h"
#include "target-def.h"
#include "params.h"
#include "df.h"
#include "safe-ctype.h"

static void c816_asm_file_start( void );
static void c816_asm_file_end( void );
static void c816_default_short_enums( void );
static bool c816_handle_option( size_t code, const char* arg, int value );
static void c816_encode_section_info( tree decl, rtx rtl, int new_decl_p );
static rtx c816_function_value (const_tree type, const_tree func ATTRIBUTE_UNUSED,  bool outgoing ATTRIBUTE_UNUSED);
static void c816_asm_init_sections( void );
static section* c816_select_section( tree exp, int reloc, unsigned HOST_WIDE_INT align ATTRIBUTE_UNUSED );
static bool c816_assemble_integer( rtx x, unsigned int size, int aligned_p );
static bool c816_in_small_data_p (const_tree decl);

/* Routines to encode/decode c816 floats */
static void encode_c816_single( const struct real_format *fmt, long *, const REAL_VALUE_TYPE *);
static void decode_c816_single( const struct real_format *, REAL_VALUE_TYPE *, const long *);

#undef  TARGET_ASM_FILE_START
#define TARGET_ASM_FILE_START          c816_asm_file_start

#undef  TARGET_ASM_FILE_END
#define TARGET_ASM_FILE_END            c816_asm_file_end

/* Try to save space with enum types... */
#undef TARGET_DEFAULT_SHORT_ENUMS
#define TARGET_DEFAULT_SHORT_ENUMS     c816_default_short_enums

#undef TARGET_HANDLE_OPTION
#define TARGET_HANDLE_OPTION           c816_handle_option

/* If we are referencing a global variable outside of page 0 make the
 * SYMBOL_REF special.  */
#undef TARGET_ENCODE_SECTION_INFO
#define TARGET_ENCODE_SECTION_INFO     c816_encode_section_info

#undef TARGET_FUNCTION_VALUE
#define TARGET_FUNCTION_VALUE          c816_function_value

#undef TARGET_ASM_INIT_SECTIONS
#define TARGET_ASM_INIT_SECTIONS       c816_asm_init_sections

#undef TARGET_ASM_SELECT_SECTION
#define TARGET_ASM_SELECT_SECTION      c816_select_section

#undef TARGET_ASM_INTEGER
#define TARGET_ASM_INTEGER             c816_assemble_integer

/* The following extra sections are only used by C816.  */
static section* page0_bss_section;
static section* page0_data_section;

/* Page0 sections */
#define SECTION_C816_PAGE0 SECTION_MACH_DEP

#undef TARGET_IN_SMALL_DATA_P
#define TARGET_IN_SMALL_DATA_P         c816_in_small_data_p

/* ----------------------------------------------------------------
* PMr - Interrupt stuff
* ---------------------------------------------------------------- */
/* This is set by #pragma interrupt and #pragma trapa, and causes gcc to
output code for the next function appropriate for an interrupt handler.  */
int pragma_interrupt;

/* ----------------------------------------------------------------
* SC - Extra output in asm listing.
* ---------------------------------------------------------------- */
int pragma_output = 0;  /* TODO V4.x reset to 0 */

/* ----------------------------------------------------------------
* A few prototypes to make sure things are clean
* ---------------------------------------------------------------- */

/* extern void error (const char *, ...) ATTRIBUTE_GCC_DIAG(1,2); */
extern void debug_rtx (const_rtx);
extern void print_inline_rtx (FILE *, const_rtx, int);
extern int reg_referenced_p (const_rtx, const_rtx);
/* Return 1 if register REGNO is the subject of a clobber in insn INSN.  */
extern int regno_clobbered_p (unsigned int, rtx, enum machine_mode, int);
extern int reg_overlap_mentioned_p (const_rtx, const_rtx);

extern int refers_to_regno_p (unsigned int, unsigned int, const_rtx, rtx *);
extern void add_insn_after (rtx, rtx, struct basic_block_def *);

unsigned int elf32_c816_section_type_flags (tree, const char *, int);

void c816_asm_named_section (const char *name, unsigned int flags ATTRIBUTE_UNUSED, tree decl ATTRIBUTE_UNUSED);


void c816_asm_named_section (const char *name, unsigned int flags ATTRIBUTE_UNUSED, tree decl ATTRIBUTE_UNUSED)
{
  fprintf (asm_out_file, "\t.section %s\n", name);
}

/* ----------------------------------------------------------------
* Global variables
* ---------------------------------------------------------------- */

/* Cutoff value to decide where to put global variables.  */
static int page0_cutoff = 4;

/* ----------------------------------------------------------------
* Local variables
* ---------------------------------------------------------------- */

/* Registers used in address */
static rtx addr_regs[4];

/* Stuff needed to cope with huge frames.  */
static const char *spill_name = "__spill";
static rtx spill_rtx[] = {NULL, NULL};

#define VA_OUVRE(AP, VAR)  { va_list AP; va_start(AP, VAR); { struct Qdmy
#define VA_FERME(AP)    } va_end(AP); }
#define VA_FIXEDARG_MOMO(AP, T, N)  struct Qdmy

/************************************************************/

static rtx gen_rtx_CONST_DOUBLE (enum machine_mode mode, HOST_WIDE_INT arg0, HOST_WIDE_INT arg1)
{
  rtx r = rtx_alloc (CONST_DOUBLE);
  int i;

  PUT_MODE (r, mode);
  X0EXP (r, 0) = NULL_RTX;
  XWINT (r, 1) = arg0;
  XWINT (r, 2) = arg1;

  for (i = GET_RTX_LENGTH (CONST_DOUBLE) - 1; i > 2; --i)
    XWINT (r, i) = 0;

  return r;
}

rtx gen_rtx(enum rtx_code code, enum machine_mode mode, ...)
{
  int i;    /* Array indices...        */
  const char *fmt;   /* Current rtx's format...    */
  rtx rt_val;     /* RTX to return to caller...    */

  VA_OUVRE (p, mode);
  VA_FIXEDARG_MOMO (p, enum rtx_code, code);
  VA_FIXEDARG_MOMO (p, enum machine_mode, mode);

  switch (code)
    {
    case CONST_INT:
      rt_val = gen_rtx_CONST_INT (mode, va_arg (p, HOST_WIDE_INT));
      break;

    case CONST_DOUBLE:
      {
   HOST_WIDE_INT arg0 = va_arg (p, HOST_WIDE_INT);
   HOST_WIDE_INT arg1 = va_arg (p, HOST_WIDE_INT);

        rt_val = gen_rtx_CONST_DOUBLE (mode, arg0, arg1);
      }
      break;

    case REG:
      rt_val = gen_rtx_REG (mode, va_arg (p, int));
      break;

    case MEM:
      rt_val = gen_rtx_MEM (mode, va_arg (p, rtx));
      break;

    default:
      rt_val = rtx_alloc (code); /* Allocate the storage space.  */
      rt_val->mode = mode;    /* Store the machine mode...  */

      fmt = GET_RTX_FORMAT (code);  /* Find the right format...  */
      for (i = 0; i < GET_RTX_LENGTH (code); i++)
   {
     switch (*fmt++)
       {
       case '0':     /* Unused field.  */
         break;

       case 'i':     /* An integer?  */
         XINT (rt_val, i) = va_arg (p, int);
         break;

       case 'w':     /* A wide integer? */
         XWINT (rt_val, i) = va_arg (p, HOST_WIDE_INT);
         break;

       case 's':     /* A string?  */
         XSTR (rt_val, i) = va_arg (p, char *);
         break;

       case 'e':     /* An expression?  */
       case 'u':     /* An insn?  Same except when printing.  */
         XEXP (rt_val, i) = va_arg (p, rtx);
         break;

       case 'E':     /* An RTX vector?  */
         XVEC (rt_val, i) = va_arg (p, rtvec);
         break;

       case 'b':           /* A bitmap? */
         XBITMAP (rt_val, i) = va_arg (p, bitmap);
         break;

       case 't':           /* A tree? */
         XTREE (rt_val, i) = va_arg (p, tree);
         break;

       default:
         abort ();
       }
   }
      break;
    }

  VA_FERME (p);
  return rt_val;
}

/* ----------------------------------------------------------------
* Local data types
* ---------------------------------------------------------------- */

/* Structure for qsort() used in output_move */
typedef struct _rtx_couple {
   long key;
   rtx elt;
} rtx_couple;

/* ----------------------------------------------------------------
* Utilities
* ---------------------------------------------------------------- */

/* templates for the utility functions.  */
#ifdef __GNUC__
/* VC020909 : ??? volatile */
static void abort_with_insn(rtx insn, const char *reason, ...) __attribute__ ((format (printf, 2, 3)));
#endif
static void c816_split_const(rtx op, int size, unsigned char *ret_val);
static void split_mem(rtx op, int size, rtx *ret_val);
static void split_reg(rtx op, int size, rtx *ret_val);
static void split_any(rtx op, int size, rtx *ret_val);
static int trunc_if_used_p(rtx x, unsigned int regno);
static rtx next_nnote_nclob_insn(rtx insn);
static rtx next_nnote_nclob_nuse_insn(rtx insn);
static void cancel_insn(rtx insn);
static int find_regs_in_addr(rtx addr, int cur);
static rtx modif_address(rtx mem, unsigned int regno, int modif);
static rtx modif_mem_address(rtx mem, enum machine_mode mode,int regno, int modif);
static void set_branch_opcode(rtx insn, enum rtx_code code, char *s);
static int compare_rtx_couple(const void *x, const void *y);
static char *xtoimm(unsigned long x, char *s, int nohash);
static int cool_regs_ever_live(int i);
static void output_branch_0_equ(enum rtx_code code, int size, rtx *op1, rtx *operands, rtx op);
static void output_branch_0(rtx insn, rtx *operands,
enum rtx_code code, rtx op);
static rtx output_logical_1(rtx insn, rtx *ops, int is_dead, int has_auto);
static int is_power_of_2(int n);
static int use_large_frame(rtx op, int size);
void print_operand_address(FILE *stream, rtx x);
const char * output_libcall(rtx insn, rtx *operands, int n_par_r, int n_par_s,
int commutative, const char *_template, int fsub, int no_call,int alt_reg) ;
static tree cool_handle_page_0_attribute PARAMS ((tree *, tree, tree, int, bool *));
static tree cool_handle_indirect_attribute PARAMS ((tree *, tree, tree, int, bool *));
static int part_dead_or_set_p(rtx insn, rtx x);
const char* output_move(rtx insn, rtx *operands);
const char * output_not(rtx insn, rtx *operands);

/* Abort after printing out a specific insn.  */
/* VC020909 : ??? volatile*/
static void abort_with_insn(rtx insn, const char *reason, ...)
{
   va_list ap;

   error("Assembler output error");
   va_start(ap, reason);
   vfprintf(stderr, reason, ap);
   va_end(ap);
   fputs("\nrtx code is: ", stderr);
   debug_rtx(insn);
   abort();
}

/* Given a constant value rtx, split it into an array of bytes, most
 * significant bytes in the lower addresses. Size is one less than the
 * expected number of returned bytes.  */
static void c816_split_const(rtx op, int size, unsigned char *ret_val)
{
   enum rtx_code code = GET_CODE(op);
   int i;

   if( pragma_output )
      {
      char buffer[510];
      
      sprintf( buffer, ";in c816_split_const (%d)", size );

      output_asm_insn( buffer, (struct rtx_def**)op );
      }

   if (code == CONST_INT) 
   {
      long val = INTVAL(op);
      for (i = 0; i < size; i++)
         ret_val[i] = val >> ((size - i) << 3);
      ret_val[size] = val;
      
      if( pragma_output )
         output_asm_insn( ";out c816_split_const (CONST_INT)", (struct rtx_def**)op );
      return;
   }
   
   if (code == CONST_DOUBLE)
   {
      REAL_VALUE_TYPE r;
      long val[2] = {0, 0};

      REAL_VALUE_FROM_CONST_DOUBLE(r, op);

      if (size > 3)
         REAL_VALUE_TO_TARGET_DOUBLE(r, val);
      else
      {
         encode_c816_single( NULL, val, &r );
#if 0
         if( size == 3 )
            val[0] <<= 8;
#endif
      }

      if (size == 2)
         size = 3;

      for (i = size; i > 3; i--)
         ret_val[size - i] = val[0] >> ((i - 4) << 3);

      if (size > 3)
         val[0] = val[1];

      for ( ; i > 0; i--)
         ret_val[size - i] = val[0] >> (i << 3);

      ret_val[size] = val[0];
      
      if( pragma_output )
         output_asm_insn( ";out c816_split_const (CONST_DOUBLE)", (struct rtx_def**)op );

      return;
   }

   abort_with_insn(op, "Can't compute this constant's value");
}

/* Given a memory address rtx, split it into an array of rtx to access
 * (size + 1) consecutive bytes in memory.  */
static void split_mem(rtx op, int size, rtx *ret_val)
{
   int i;

   if (GET_CODE(op) != MEM)
      abort_with_insn(op, "split_mem called with bad operand");

   if (size == 0) 
   {
      ret_val[0] = op;
      return;
   }

   for (i = size; i >= 0; i--)
      ret_val[i] = modif_mem_address(op, QImode, -1, i);
}

/* Given a register rtx, split it into an array of rtx to access (size
 * + 1) consecutive registers.  */
static void split_reg( rtx op, int size, rtx* ret_val )
{
   int regno = REGNO(op), i;

   for (i = size; i >= 0; i--)
      ret_val[i] = gen_rtx(REG, QImode, regno + i);
}

/* Given a register, a mem or a const rtx, split it into an array of
 * rtx to access (size + 1) consecutive registers.  */
static void split_any(rtx op, int size, rtx *ret_val)
{
   unsigned char val[20];
   int i;
   enum rtx_code code = GET_CODE(op);
   
   if( pragma_output )
      {
      char buffer[510];

      sprintf( buffer, ";in split_any (%d)", size );

      output_asm_insn( buffer, (struct rtx_def**)op );
      }

   if( code == REG )
   {
      split_reg(op, size, ret_val);
      return;
   }

   if( code == MEM )
   {
      split_mem(op, size, ret_val);
      return;
   }

   if (size == 0) 
   {
      ret_val[0] = op;
      return;
   }

   if (size == 1 && code != CONST_INT && CONSTANT_P(op)) 
   {
      ret_val[0] = gen_rtx(HIGH, Pmode, op);
      ret_val[1] = gen_rtx(LO_SUM, Pmode,
      gen_rtx(REG, QImode, ACCU_REG), op);
      return;
   }

   if (code != CONST_INT && code != CONST_DOUBLE)
      abort_with_insn(op, "Bad op to split");

   c816_split_const(op, size, val);

   for (i = 0; i <= size; i++)
      ret_val[i] = gen_rtx(CONST_INT, VOIDmode, val[i]);
}

/* Return true if register regno is used only as a truncated 8-bit
value in x.  */
static int
trunc_if_used_p(rtx x, unsigned int regno)
{
   const char *fmt;
   enum rtx_code code = GET_CODE(x);
   int i;

   switch (code) {
      case REG:
      return (REGNO(x) != regno)
      ||
      (GET_MODE(x) == QImode);
      case SUBREG:
      if (REGNO(SUBREG_REG(x)) == regno)
         /* SC020810 3.1*/
         return GET_MODE(x) == QImode && SUBREG_BYTE(x) == 1;
      return 1;
      case SCRATCH:
      case CLOBBER:
      case CC0:
      case PC:
      case CONST_INT:
      case CONST_DOUBLE:
      return 1;
      default:
      break;
   }
   fmt = GET_RTX_FORMAT(code);
   for (i = GET_RTX_LENGTH(code) - 1; i >= 0; i--) {
      if (fmt[i] == 'E') {
         int j;
         for (j = XVECLEN (x, i) - 1; j >= 0; j--)
         if (!trunc_if_used_p(XVECEXP(x, i, j), regno))
         return 0;
      } else if (fmt[i] == 'e'
      && !trunc_if_used_p(XEXP(x, i), regno))
      return 0;
   }
   return 1;
}

/* Return the next non-note insn that isn't a clobber either.  */
static rtx next_nnote_nclob_insn(rtx insn)
{
   rtx next = next_nonnote_insn(insn);
   while (next && GET_CODE(next) == INSN
   && GET_CODE(PATTERN(next)) == CLOBBER)
   next = next_nonnote_insn(next);
   return next;
}

/* Return the next non-note insn that isn't a clobber or a use either.  */
static rtx next_nnote_nclob_nuse_insn(rtx insn)
{
   rtx next = next_nonnote_insn(insn);
   while (next && GET_CODE(next) == INSN
   && (GET_CODE(PATTERN(next)) == CLOBBER
   || GET_CODE(PATTERN(next)) == USE))
   next = next_nonnote_insn(next);
   return next;
}
#define LOG_LINKS_MOMO(INSN)  XEXP(INSN, 5)
#define NOTE_LINE_NUMBER_MOMO(INSN) XCINT (INSN, 4, NOTE)
#define NOTE_SOURCE_FILE_MOMO(INSN)    XCSTR (INSN, 3, NOTE)
/* Change insn into a note */
static void cancel_insn(rtx insn)
{
   LOG_LINKS_MOMO(insn) = 0;
   REG_NOTES(insn) = 0;
   PUT_CODE(insn, NOTE);
   NOTE_LINE_NUMBER_MOMO(insn) = NOTE_INSN_DELETED;
   NOTE_SOURCE_FILE_MOMO(insn) = 0;
}

/* Scan addr for registers; the registers found are stored in the
* addr_regs global.  Returns the number of registers found.  */
static int
find_regs_in_addr(rtx addr, int cur)
{
   switch (GET_CODE(addr)) {
      case REG:
      addr_regs[cur] = addr;
      return cur + 1;
      case PLUS:
      cur = find_regs_in_addr(XEXP(addr, 0), cur);
      return find_regs_in_addr(XEXP(addr, 1), cur);
      case POST_INC:
      case PRE_DEC:
      return find_regs_in_addr(XEXP(addr, 0), cur);
      case CONST:
      case CONST_INT:
      case SYMBOL_REF:
      return cur;
      default:
      break;
   }
   abort_with_insn(addr, "Error finding regs in addr");
   return 0;
}

/* Modify register regno in the address by modif.  If regno is -1,
* simply modify the address.  Return the new address.  */
static rtx
modif_address(rtx addr, unsigned int regno, int modif)
{
   enum rtx_code code;
   if (modif == 0)
      return addr;

   code = GET_CODE(addr);

   if (code == REG && (REGNO(addr) == regno || regno == (unsigned int)(-1)))
   {
      return gen_rtx(PLUS, Pmode, addr, gen_rtx(CONST_INT, VOIDmode, modif));
   }

   if (regno == (unsigned int)(-1))
   {
      rtx op1, op2;
      if (GET_CODE(addr) == CONST)
         addr = XEXP(addr, 0);

      switch (GET_CODE(addr))
      {
         case CONST_INT:
            return gen_rtx(CONST_INT, VOIDmode, INTVAL(addr) + modif);

         case SYMBOL_REF:
            return gen_rtx(CONST, Pmode, gen_rtx(PLUS, Pmode, addr, gen_rtx(CONST_INT, VOIDmode, modif)));

         case PLUS:
            if (GET_CODE(XEXP(addr, 0)) == CONST_INT)
               op1 = XEXP(addr, 1), op2 = XEXP(addr, 0);
            else
               op1 = XEXP(addr, 0), op2 = XEXP(addr, 1);

            if (GET_CODE(op2) != CONST_INT || GET_CODE(op1) != SYMBOL_REF)
               break;

            return gen_rtx(CONST, Pmode, gen_rtx(PLUS, Pmode, op1, gen_rtx(CONST_INT, VOIDmode, INTVAL(op2) + modif)));

         default:
            /* No luck... */
            break;
      }
   }

   if (code == PLUS)
   {
      rtx r, off;
      if (GET_CODE(XEXP(addr, 0)) == REG)
         r = XEXP(addr, 0), off = XEXP(addr, 1);
      else
         r = XEXP(addr, 1), off = XEXP(addr, 0);
      if (GET_CODE(r) == REG
      && (REGNO(r) == regno || regno == (unsigned int)(-1))) {
         rtx op1, op2;
         if (GET_CODE(off) == CONST)
         off = XEXP(off, 0);
         switch (GET_CODE(off)) {
            case CONST_INT:
            return gen_rtx(PLUS, Pmode, r,
            gen_rtx(CONST_INT, VOIDmode, INTVAL(off) + modif));
            case SYMBOL_REF:
            return gen_rtx(PLUS, Pmode, r,
            gen_rtx(CONST, Pmode,
            gen_rtx(PLUS, Pmode, off,
            gen_rtx(CONST_INT,
            VOIDmode, modif))));
            case PLUS:
            if (GET_CODE(XEXP(off, 0)) == CONST_INT)
            op1 = XEXP(addr, 1), op2 = XEXP(addr, 0);
            else
            op1 = XEXP(addr, 0), op2 = XEXP(addr, 1);
            if (GET_CODE(op2) != CONST_INT)
            break;
            return gen_rtx(PLUS, Pmode, r,
            gen_rtx(CONST, Pmode,
            gen_rtx(PLUS, Pmode, op1,
            gen_rtx(CONST_INT, VOIDmode,
            INTVAL(op2) + modif))));
            default:
            /* No luck... */
            break;
         }
      }
   }

   {
   char buffer[500];
   
   sprintf(buffer, "; Can't change this address, regno: %d, modif: %d", regno, modif);
   output_asm_insn( buffer, (struct rtx_def**)addr );
   }

   return addr;
}

/* Modify register regno in the memory reference by modif.  If regno
* is -1, simply modify the address.  Return a new memory reference
* with mode mode.  */
static rtx
modif_mem_address(rtx mem, enum machine_mode mode, int regno, int modif)
{
   if (GET_CODE(mem) != MEM)
      return mem;
   return gen_rtx(MEM, mode, modif_address(XEXP(mem, 0), regno, modif));
}

/* Put the macro name for the branch code in s */
static void
set_branch_opcode(rtx insn, enum rtx_code code, char *s)
{
   switch (code) {
      case EQ:
      strcpy(s, "jmpeq");
      break;
      case NE:
      strcpy(s, "jmpne");
      break;
      case LT:
      strcpy(s, "jmplt");
      break;
      case LTU:
      strcpy(s, "jmpltuns");
      break;
      case GT:
      strcpy(s, "jmpgt");
      break;
      case GTU:
      strcpy(s, "jmpgtuns");
      break;
      case LE:
      strcpy(s, "jmple");
      break;
      case LEU:
      strcpy(s, "jmpleuns");
      break;
      case GE:
      strcpy(s, "jmpge");
      break;
      case GEU:
      strcpy(s, "jmpgeuns");
      break;
      default:
      abort_with_insn(insn, "Bad comparison code: %s", GET_RTX_NAME(code));
   }
}

/* Compare two rtx_couple to sort them */
static int
compare_rtx_couple(const void *x, const void *y)
{
   rtx_couple *a = (rtx_couple *) x;
   rtx_couple *b = (rtx_couple *) y;

   return a->key == b->key ? 0 : a->key < b->key ? -1 : 1;
}

/* Return the hexadecimal ascii representation of x.  */
static char* xtoimm(unsigned long x, char *s, int nohash)
{
   int i = 0;
   if (!nohash)
   s[i++] = '#';
   if (x > 9) {
      s[i++] = '0';
      s[i++] = 'x';
      sprintf(s + i, "%02lx", x);
   } else {
      s[i++] = '0' + x;
      s[i++] = 0;
   }
   return s;
}

/* Take frame_pointer_needed into account to compute regs_ever_live */
static int
cool_regs_ever_live(int i)
{
   /* VC020804 : try to protect i3 all the time*/
   if( (i == RAM_IDX_3) || (i == RAM_IDX_3 + 1) )
      return 1;

   return df_regs_ever_live_p(i);
}

/* return 1 iff n is a power of 2 */
static int
is_power_of_2(int n)
{
   return (n & (n-1)) == 0;
}

/* Return true if the operand is a stack operand which needs a big
* displacement.  */
static int
use_large_frame(rtx op, int size)
{
   if (GET_CODE(op) == MEM) {
      rtx tem = XEXP(op, 0);
      if (GET_CODE(tem) == CONST)
      tem = XEXP(tem, 0);
      if (GET_CODE(tem) == PLUS) {
         rtx reg = XEXP(tem, 0);
         rtx off = XEXP(tem, 1);
         if (GET_CODE(off) == REG) {
            rtx t = reg;
            reg = off;
            off = t;
         }
         if (GET_CODE(reg) == REG
         && REGNO(reg) == HARD_SP_REG
         && GET_CODE(off) == CONST_INT
         && INTVAL(off) + size - 1 > 255) {
            return 1;
         }
      }
   }
   return 0;
}

/* Return nonzero if X's old contents don't survive after INSN.
This will be true if X is (cc0) or if X is a register and
X dies in INSN or because INSN partially sets X.  */
static int
part_dead_or_set_p (rtx insn, rtx x)
{
   int regno, last_regno;
   int i;

   /* Can't use cc0_rtx below since this file is used by genattrtab.c.  */
   if (GET_CODE (x) == CC0)
   return 1;

   if (GET_CODE (x) != REG)
   abort ();

   regno = REGNO (x);
   /*VC020903   protect i3*/
   /*VC020904   protect i2*/
   if(    (regno == HARD_SP_REG) || (regno == HARD_SP_REG + 1)
       || (regno == RAM_IDX_2) || (regno == RAM_IDX_2 + 1))
      return 0;

   last_regno = (regno >= FIRST_PSEUDO_REGISTER ? regno
   : regno + HARD_REGNO_NREGS (regno, GET_MODE (x)) - 1);

   for (i = regno; i <= last_regno; i++)
   if (dead_or_set_regno_p (insn, i))
   return 1;

   return 0;
}
void override_options( void );
/* Parse target option strings. */
void override_options( void )
{
   if( c816_page0_cutoff )
   {
      char* res;
      long val;

      if( c816_page0_cutoff[0] == '=' )
      {
         c816_page0_cutoff++;
      }

      val = strtol( c816_page0_cutoff, &res, 0 );

      if( !strcmp( c816_page0_cutoff, "none" ) )
         page0_cutoff = 0;
      else if( !strcmp( c816_page0_cutoff, "all" ) )
         page0_cutoff = -1;
      else if( *res || ( val < 0 ) )
         error( "bad value `%s' for -mpage0-mvs switch, acceptable values: all | none | <number>", c816_page0_cutoff );
      else
         page0_cutoff = val;
   }
}

/* VC021024 : avoid "incorrect section" warning*/
unsigned int
elf32_c816_section_type_flags (tree decl, const char* name, int reloc)
{
   unsigned int flags;

   flags = default_section_type_flags (decl, name, reloc);

   if( (!(flags & SECTION_BSS)) &&(!strncmp(name, ".page0_bss",9)) )
      flags |= SECTION_BSS;
#if 0
  if (decl && DECL_ATTRIBUTES (decl)
      && lookup_attribute ("page_0", DECL_ATTRIBUTES (decl)))
    flags |= SECTION_C816_PAGE0;
#endif
   return flags;
}

/* Return true if x is a valid constant address or offset.  */
int cool_const_address_p(rtx x, int offset, rtx reg);
int cool_const_address_p(rtx x, int offset, rtx reg)
{
   switch (GET_CODE(x))
   {
      case LABEL_REF:
         return !offset;

      case CONST_INT:
         /*SC020611 SC020726 0 -> 1*/
         if (reg != NULL && REGNO(reg) == HARD_SP_REG)
         /* Try to allow large frames...  */
            return 1;

         /* SC020614 SC020726 1 -> 0*/
         return INTVAL(x) >= 0 && INTVAL(x) <= 255;

      case SYMBOL_REF:
         /* See the ENCODE_SECTION_INFO macro.  */
         return SYMBOL_REF_FLAG(x);

      case CONST:
         return cool_const_address_p(XEXP(x, 0), offset, reg);

      case PLUS:
         return cool_const_address_p(XEXP(x, 0), offset, NULL) && cool_const_address_p(XEXP(x, 1), offset, NULL);
         default:

      /* No luck... */
      break;
   }
   return 0;
}

/* Return nonzero if ATTR is a valid attribute for DECL.  ATTRIBUTES
* are any existing attributes and ARGS are the arguments supplied
* with ATTR.
*
* Supported attributes:
*
* interrupt_handler: output a prologue and epilogue suitable for an
* interrupt handler.
*
* page_0: This variable lives in the page zero data area and can be
* referenced with 8-bit absolute memory references.
*
* indirect: This variable lives in general data memory (i.e., not in
* page zero) and must be referenced through a register index.  */
int
cool_valid_attribute(tree, tree, tree, tree);

int cool_valid_attribute(tree decl, tree attributes ATTRIBUTE_UNUSED, tree attr, tree args)
{
   if (args != NULL_TREE)
      return 0;

   if (is_attribute_p ("interrupt_handler", attr))
      return TREE_CODE (decl) == FUNCTION_DECL;

   /* VC020903: output for debug...*/
   if (is_attribute_p ("extra_output", attr))
   {
      pragma_output = 1;
      return 1;
   }

   if (is_attribute_p ("page_0", attr) && (TREE_STATIC (decl) || DECL_EXTERNAL (decl))) 
   {
      if (lookup_attribute ("indirect", DECL_ATTRIBUTES (decl)) != NULL_TREE)
      {
         error("Cannot specify both page_0 and indirect attributes");
         return 0;
      }
#if 0
      DECL_SECTION_NAME (decl) = DECL_INITIAL (decl) != 0
      ? build_string (12, ".page0_data")
      : build_string (11, ".page0_bss");
#endif
      DECL_COMMON (decl) = 0;
      return 1;
   }
   if (is_attribute_p ("indirect", attr)
   && (TREE_STATIC (decl) || DECL_EXTERNAL (decl)))
   if (lookup_attribute ("page_0",
   /* SC020810 3.1*/
   DECL_ATTRIBUTES (decl)) != NULL_TREE)
   {
      error("Cannot specify both page_0 and indirect attributes");
      return 0;
   }
   return 1;
   return 0;
}

/* If we are referencing a global variable in page 0 make the
 * SYMBOL_REF special.  Adjust section for page 0.  Function symbols
 * are also made special.  */
static void c816_encode_section_info( tree decl, rtx rtl, int new_decl_p ATTRIBUTE_UNUSED )
{
   if (TREE_CODE (decl) == FUNCTION_DECL)
   {
      SYMBOL_REF_FLAG(XEXP( rtl, 0)) = 1;
      return;
   }

   if(TREE_CODE (decl) == VAR_DECL && (TREE_STATIC (decl) || DECL_EXTERNAL (decl)))
   {
      int size = 0;
      tree a = lookup_attribute ("indirect",
      /* SC020810 3.1*/
      DECL_ATTRIBUTES (decl));

      if (a != NULL_TREE)
         return;

      /* Read-only data section is not in page 0.  */
      if (TREE_READONLY (decl))
         return;

      a = lookup_attribute ("page_0",
      /* SC020810 3.1*/
      DECL_ATTRIBUTES (decl));

      if (a == NULL_TREE && TYPE_SIZE (TREE_TYPE (decl)) != NULL_TREE && TREE_CODE (TYPE_SIZE (TREE_TYPE (decl))) == INTEGER_CST)
         size = TREE_INT_CST_LOW (TYPE_SIZE (TREE_TYPE (decl))) / BITS_PER_UNIT;

      if (a != NULL_TREE || (page0_cutoff != 0 && (page0_cutoff == -1 || (size > 0 && size <= page0_cutoff))))
      {
         SYMBOL_REF_FLAG (XEXP (DECL_RTL (decl), 0)) = 1;
         /* Set the section if necessary.  */
         if( ( DECL_SECTION_NAME (decl) == NULL_TREE ) ||
             ( TREE_CODE (DECL_SECTION_NAME (decl)) != STRING_CST ) ||
             ( strncmp(TREE_STRING_POINTER (DECL_SECTION_NAME (decl)), ".page0_", 7) != 0 ) )
         {
#if 1
            rtx symbol = XEXP (rtl, 0);
            DECL_SECTION_NAME (decl) = DECL_INITIAL (decl) != 0 ? build_string (12, ".page0_data")
                                                                : build_string (11, ".page0_bss");     /* Set the section if necessary.  */

            SYMBOL_REF_FLAGS( symbol ) |= SECTION_C816_PAGE0;
#endif
         }
         DECL_COMMON (decl) = 0;
      }
   }
}

static void c816_output_page0_bss_section_asm_op (const void *data)
{
  in_section = NULL;
  output_section_asm_op (data);
}

static void c816_asm_init_sections( void )
{
   page0_bss_section  = get_unnamed_section (0, c816_output_page0_bss_section_asm_op, "\t.section\t.page0_bss,\"aw\",@nobits" );
   page0_data_section = get_unnamed_section (0, c816_output_page0_bss_section_asm_op, "\t.section\t.page0_data,\"aw\",@nobits" );
}

static section* c816_select_section( tree exp, int reloc ATTRIBUTE_UNUSED, unsigned HOST_WIDE_INT align ATTRIBUTE_UNUSED )
{
   int size    = 0;

   if( TYPE_SIZE (TREE_TYPE (exp)) != NULL_TREE && TREE_CODE (TYPE_SIZE (TREE_TYPE (exp))) == INTEGER_CST)
      size = TREE_INT_CST_LOW (TYPE_SIZE (TREE_TYPE (exp))) / BITS_PER_UNIT;

   if( (page0_cutoff != 0 && (page0_cutoff == -1 || (size > 0 && size <= page0_cutoff))))
      {
      return DECL_INITIAL( exp ) != 0 ? page0_data_section : page0_bss_section;
      }

   if(TREE_CODE (exp) == VAR_DECL && (TREE_STATIC (exp) || DECL_EXTERNAL (exp)))
    if( exp && DECL_ATTRIBUTES( exp ) && lookup_attribute( "page_0", DECL_ATTRIBUTES( exp ) ) )
       {
       return DECL_INITIAL( exp ) != 0 ? page0_data_section : page0_bss_section;
       }

   return default_elf_select_section (exp, reloc, align);
}

static int c816_string_begins_with (const_tree name, const char *prefix)
{
  const int prefix_len = strlen (prefix);

  /* Remember: NAME's length includes the null terminator.  */
  return (TREE_STRING_LENGTH (name) > prefix_len
	  && strncmp (TREE_STRING_POINTER (name), prefix, prefix_len) == 0);
}

static bool c816_in_small_data_p( const_tree decl )
{
  HOST_WIDE_INT size;
  const_tree section_name;

  /* Don't apply the -G flag to internal compiler structures.  We
     should leave such structures in the main data section, partly
     for efficiency and partly because the size of some of them
     (such as C++ typeinfos) is not known until later.  */
  if (TREE_CODE (decl) != VAR_DECL || DECL_ARTIFICIAL (decl))
    return false;

  /* If we already know which section the decl should be in, see if
     it's a small data section.  */
  section_name = DECL_SECTION_NAME (decl);
  if (section_name)
    {
      gcc_assert (TREE_CODE (section_name) == STRING_CST);

      if(c816_string_begins_with (section_name, ".page_0"))
	     return true;

      return false;

    }

  size = int_size_in_bytes (TREE_TYPE (decl));
  if( (page0_cutoff != 0 && (page0_cutoff == -1 || (size > 0 && size <= page0_cutoff))))
    return true;

  return false;
}

/* Return a nonzero value if DECL has a section attribute.  */
#ifndef IN_NAMED_SECTION
#define IN_NAMED_SECTION(DECL) \
  ((TREE_CODE (DECL) == FUNCTION_DECL || TREE_CODE (DECL) == VAR_DECL) \
   && DECL_SECTION_NAME (DECL) != NULL_TREE)
#endif

void c816_output_aligned_decl_local( FILE* file, tree decl, char* name, unsigned HOST_WIDE_INT size, unsigned HOST_WIDE_INT align );
void c816_output_aligned_decl_local( FILE* file, tree decl, char* name, unsigned HOST_WIDE_INT size, unsigned HOST_WIDE_INT align )
{
   const_tree section_name;

   if ((decl) != NULL && IN_NAMED_SECTION (decl))
	   switch_to_section (get_named_section (decl, NULL, 0));		  
   else
      {
      if( page0_cutoff != 0 && (page0_cutoff == -1 || (size> 0 && size <= (unsigned HOST_WIDE_INT)page0_cutoff) ) )
         switch_to_section( page0_bss_section );
      else                                                           
	      switch_to_section (bss_section);				                  
	   }
									                                          
   ASM_OUTPUT_ALIGN( file, floor_log2 (align / BITS_PER_UNIT));	
   ASM_OUTPUT_LABEL( file, name);					
   fprintf( file, "\t.space\t%d\n", size ? (int)(size) : 1);		
   /*fprintf( file, "\t; ASM_OUTPUT_ALIGNED_DECL_LOCAL\n" );*/
}									

static bool c816_assemble_integer (rtx x, unsigned int size, int aligned_p)
{
   /* Means 24 bit float! */
   if( size == 3 )
   {
      assemble_integer( GEN_INT( ( INTVAL( x ) >> 24 ) & 0xFF ), 1, aligned_p, 0 );
      assemble_integer( GEN_INT( ( INTVAL( x ) >> 16 ) & 0xFF ), 1, aligned_p, 0 );
      assemble_integer( GEN_INT( ( INTVAL( x ) >> 8 ) & 0xFF ), 1, aligned_p, 0 );

      return true;
    }
  return default_assemble_integer (x, size, aligned_p);
}

/* ----------------------------------------------------------------
* Function prologue and epilogue.
* ---------------------------------------------------------------- */

/* Compute the size of the save area in the stack.  */
int cool_sa_size(void);
int cool_sa_size(void)
{
   int size = 0;
   int i;

   for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
      if((!fixed_regs[i] && !call_used_regs[i] && cool_regs_ever_live(i)) ||
         (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1) )
         size++;

   return size;
}

/* stream is a stdio stream to output the code to.  size is an int:
* how many units of temporary storage to allocate.  Refer to the
* array `regs_ever_live' to determine which registers to save;
* `regs_ever_live[I]' is nonzero if register number I is ever used in
* the function.  This macro is responsible for knowing which
* registers should not be saved even if used.  */
void cool_output_function_prologue( FILE* stream, HOST_WIDE_INT size ATTRIBUTE_UNUSED );
void cool_output_function_prologue( FILE* stream, HOST_WIDE_INT size ATTRIBUTE_UNUSED )
{
   int i;
   int frame    = get_frame_size();
   int sa       = cool_sa_size();
   int sr_start = crtl->outgoing_args_size + frame;

   fprintf(stream, "\n;\t/* function prologue %s */\n", current_function_name() );
   fprintf(stream, "; frame_pointer_needed = %d\n"
                   "; crtl->outgoing_args_size = %d\n"
                   "; cool_sa_size() = %d\n"
                   "; get_frame_size() = %d\n"
                   "; Live registers:\n",
                   frame_pointer_needed, crtl->outgoing_args_size, sa, frame);

   for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
      if (cool_regs_ever_live(i))
         fprintf(stream, ";  %s (%s, %s)\n", reg_names[i], fixed_regs[i] ? "fixed" : "_", call_used_regs[i] ? "call_clobbered" : "_");

   if ( write_symbols == DBX_DEBUG) {
      /* Output some debugging info.  */
      fprintf(stream, "\t.stabs  \"%s%%fp:c=i%d\",%d,0,0,0\n",
      current_function_name (), frame_pointer_needed ? 1 : 0,
      0x20);
      fprintf(stream, "\t.stabs  \"%s%%fph:c=i%d\",%d,0,0,0\n",
      current_function_name (), cool_regs_ever_live(HARD_FP_REG) ? 1 : 0,
      0x20);
      fprintf(stream, "\t.stabs  \"%s%%fpl:c=i%d\",%d,0,0,0\n",
      current_function_name (), cool_regs_ever_live(HARD_FP_REG + 1) ? 1 : 0,
      0x20);
      fprintf(stream, "\t.stabs  \"%siph:c=i%d\",%d,0,0,0\n",
      current_function_name (), cool_regs_ever_live(ROM_IDX) ? 1 : 0,
      0x20);
      fprintf(stream, "\t.stabs  \"%sipl:c=i%d\",%d,0,0,0\n",
      current_function_name (), cool_regs_ever_live(ROM_IDX + 1) ? 1 : 0,
      0x20);
      fprintf(stream, "\t.stabs  \"%s%%sa:c=i%d\",%d,0,0,0\n",
      current_function_name (), sa,
      0x20);
      fprintf(stream, "\t.stabs  \"%s%%fr:c=i%d\",%d,0,0,0\n",
      current_function_name (), frame,
      0x20);
      fprintf(stream, "\t.stabs  \"%s%%oa:c=i%d\",%d,0,0,0\n",
      current_function_name (), crtl->outgoing_args_size,
      0x20);
   }

   /* PMr - save all regs for interrupt handler.  */
   if (pragma_interrupt)
   {
      fprintf(stream, "\t;Save interrupt context\n");

      /* Harware calls
         or
         ip must be saved => there is a call => save all registers! */
      if( !TARGET_SOFTCALL || ( cool_regs_ever_live( 5 ) && !fixed_regs[ 5 ] ) )
      {
         fprintf(stream, "\tMOVE   -(%%i3), %%ipl\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%iph\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%i0l\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%i0h\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%i1l\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%i1h\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%i2l\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%i2h\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%r0\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%r1\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%r2\n");
         fprintf(stream, "\tMOVE   -(%%i3), %%r3\n");
      }
      else
         for (i = FIRST_PSEUDO_REGISTER - 1; i >= 0; i--)
            if((!fixed_regs[i] && /*!call_used_regs[i] && */ cool_regs_ever_live(i)) ||
               (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1))
            {
               fprintf(stream, "\tMOVE   -(%%sp,1),%s\n", reg_names[i]);
            }
   }

   if (sr_start + sa > 0)
   {
      /* Save regs, unless we are an interrupt handler
      ('cause it's been done already).  */
      if (!pragma_interrupt)
      {
         for (i = FIRST_PSEUDO_REGISTER - 1; i >= 0; i--)
            if( (!fixed_regs[i] && !call_used_regs[i] && cool_regs_ever_live(i)) ||
                (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1) )
               fprintf(stream, "\tMOVE   -(%%sp,1),%s\n", reg_names[i]);
      }

      if (sr_start > 0)
      {
         if ((sr_start & 0xff) == 0)
         {
            /* Lucky: only need to subtract the high bits...  */
            fprintf(stream, "\tSUBS %%i3h,#%d\n", (sr_start >> 8) & 0xff);
         } 
         else
         {
            if (TARGET_SAFESTACK || sr_start <= 254)
            {
               /* VC021216 : far less code like that!!!*/
               /* VC030130 : keep the stack safe*/
               int space = sr_start;
         
               if( space & 0xff00 )
               {
                  fprintf(stream, "\tSUBS   %%i3h,#%d\n", (sr_start >> 8) & 0xff);
                  space&=0xff;
               }
         
               while( space > 0 )
               {
                  fprintf(stream, "\tMOVE   %%a,-(%%sp,%d)\n", space > 127 ? 127 : space);
                  space -= 127;
               }
            } 
            else 
            {
               fprintf(stream, "\tSUBS   %%i3l,#%d\n", sr_start & 0xff);
               fprintf(stream, "\tSUBSC  %%i3h,#%d\n", (sr_start >> 8) & 0xff);
            }
         }
      }

      if (frame_pointer_needed)
         fputs("\tMOVE   %i2h,%i3h\n\tMOVE   %i2l,%i3l\n", stream);
   }

   fputs(";\t/* end of prologue */\n\n", stream);
}

/* SC020819 3.1*/
void cool_output_function_epilogue( FILE* stream, HOST_WIDE_INT size ATTRIBUTE_UNUSED );
void cool_output_function_epilogue( FILE* stream, HOST_WIDE_INT size ATTRIBUTE_UNUSED )
{
   int i;
   int frame = get_frame_size(), sa = cool_sa_size();
   int sr_start = crtl->outgoing_args_size + frame;

   fprintf(stream, "\n;\t/* function epilogue %s */\n",
   current_function_name ());

   if (sr_start > 0)
   {
      if ((sr_start & 0xff) == 0)
      {
         /* Lucky: only need to add the high bits...  */
         fprintf(stream, "\tADD  %%i3h,#%d\n", (sr_start >> 8) & 0xff);
      }
      else
      {
         if (TARGET_SAFESTACK || sr_start <= 254)
         {
            /* VC021216 : far less code like that!!!*/
            /* VC030130 : keep the stack safe*/
            int space = sr_start;
            if(space & 0xff00)
            {
               fprintf(stream, "\tADD  %%i3h,#%d\n", (sr_start >> 8) & 0xff);
               space&=0xff;
            }
            while (space > 0) {
               fprintf(stream, "\tMOVE %%a,(%%sp,%d)+\n",
               space > 127 ? 127 : space);
               space -= 127;
            }
         }
         else
         {
            fprintf(stream, "\tADD  %%i3l,#%d\n", sr_start & 0xff);
            fprintf(stream, "\tADDC %%i3h,#%d\n", (sr_start >> 8) & 0xff);
         }
      }
   }

   if (pragma_interrupt)
   {
      fprintf(stream, "\t;Restore interrupt context\n");

      /* Hardware calls
         or
         ip was be saved => there was a call => restore all registers! */
      if( !TARGET_SOFTCALL || ( cool_regs_ever_live( 5 ) && !fixed_regs[ 5 ] ) )
      {
         fprintf(stream, "\tMOVE   %%r3,  (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%r2,  (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%r1,  (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%r0,  (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%i2h, (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%i2l, (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%i1h, (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%i1l, (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%i0h, (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%i0l, (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%iph, (%%i3)+\n");
         fprintf(stream, "\tMOVE   %%ipl, (%%i3)+\n");
      }
      else
         for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
         if ((!fixed_regs[i] && /*!call_used_regs[i] && */ cool_regs_ever_live(i))
            || (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1)
         )
         fprintf(stream, "\tMOVE   %s,(%%sp,1)+\n", reg_names[i]);

         if (TARGET_SOFTCALL)
         fputs("\tRETS\n", stream);
         else
         fputs("\tRET\n", stream);
   }
   else
   {
      if (sa > 0)
      {
         for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
         if ((!fixed_regs[i] && !call_used_regs[i] && cool_regs_ever_live(i))
         || (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1)
         )
         fprintf(stream, "\tMOVE   %s,(%%sp,1)+\n", reg_names[i]);
      }
      if (TARGET_SOFTCALL)
         fputs("\tRETS\n", stream);
      else
         fputs("\tRET\n", stream);
   }

   fputs(";\t/* end of epilogue */\n\n", stream);

   /* Clear spill stuff, 'cause they were allocated on a temporary
      obstack (probably).  */
   spill_rtx[0] = spill_rtx[1] = NULL;

   /* PMr - clear the interrupt stuff at the end of the function */
   pragma_interrupt = 0;
}

/* ----------------------------------------------------------------
* Assembler output routines
* ---------------------------------------------------------------- */

/* Output at beginning of assembler file.  */
static void c816_asm_file_start( void )
{
   time_t the_time;
   time(&the_time);

   fprintf( asm_out_file, "; Compiled by GCC on %s\n", ctime( &the_time ) );
   fputs("\t.cpu  816\n"
         "\t.altregsyn  1\n"
         "\t.include \"msc816.inc\"\n\n", asm_out_file );

   default_file_start();
}

/* Output at end of assembler file.  */
static void c816_asm_file_end( void )
{
   fputs( "; End of file\n", asm_out_file );
}

/* Try to save space with enum types... */
static void c816_default_short_enums( void )
{
   return; /* true; */
}

static bool c816_handle_option( size_t code ATTRIBUTE_UNUSED, const char* arg ATTRIBUTE_UNUSED, int value ATTRIBUTE_UNUSED )
{
   return true;
}

/*extern int  isprint(int);  VC020909 : including sys-protos.h does not work */

/* Output an ascii string.  */
void asm_output_ascii(FILE *stream, unsigned char *ptr, int len);
void asm_output_ascii(FILE *stream, unsigned char *ptr, int len)
{
   int i = 0, p = 0;
   unsigned int c;
   /* beginning of the line */
   fputs("\t.ascii \"", stream);

   /* write all input chars one by one. */
   do {
      c = ptr[i++];
     /*check if the char is printable */
      if ( (c < 0x80) && (ISPRINT(c)) ) {
       /*when printing " or \, we must add a \ before*/
         switch (c) {
            case '"': fputs("\\\"", stream); p += 2; break;
            case '\\': fputs("\\\\", stream); p += 2; break;
            default:
         /*standard char*/
            fputc(c, stream); p++;
         }
      } else {
         switch (c) {
         /* when printing special chars, we must add a \ before */
            case '\b': fputs("\\b", stream); p += 2; break;
            case '\f': fputs("\\f", stream); p += 2; break;
            case '\n': fputs("\\n", stream); p += 2; break;
            case '\r': fputs("\\r", stream); p += 2; break;
            case '\t': fputs("\\t", stream); p += 2; break;
            case '\v': fputs("\\v", stream); p += 2; break;
            default:
         /* for other chars, put \<asciicode> */
            fprintf(stream,"\\%03o",c); p += 4;
         }
      }
     /* for readibality of the asm file, split string in sub-strings of max 70 chars. */
      if (p >= 70 && i < len) {
         fputs("\"\n\t.ascii \"", stream);
         p = 0;
      }
   } while (i < len);
   /* end of the line */
   fputs("\"\n", stream);
}

/* Output to stream STREAM the assembler syntax for an instruction
* operand X.  X is an RTL expression.
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
void print_operand(FILE *stream, rtx x, int code);
void print_operand(FILE *stream, rtx x, int code)
{
   char s[16];
   switch (code) {
      case 0:
      /* No special treatment.  */
      break;
      case '%':
     /*  putc('%', stream); */
      return;
      case 'o':
      /* Print the opcode of the operator */
      switch(GET_CODE(x)) {
         case PLUS:
         fputs("ADD", stream);
         break;
         case AND:
         fputs("AND", stream);
         break;
         case IOR:
         fputs("OR ", stream);
         break;
         case XOR:
         fputs("XOR", stream);
         break;
         default:
         abort_with_insn(x, "Bad operator code for letter o");
      }
      return;
      case 'm':
      /* Put float quotes (") around some macro arguments.  */
      if (GET_CODE(x) == MEM) {
         putc('"', stream);
         print_operand_address(stream, XEXP(x, 0));
         putc('"', stream);
         return;
      }
      break;
      case 'c':
      /* Output const without the preceding hash (#) sign.  */
      if (GET_CODE(x) != CONST_INT)
      abort_with_insn(x, "Bad operator code for letter c");
      fputs(xtoimm(INTVAL(x), s, 1), stream);
      return;
      case 't': {
         /* Output 3/4 float const.  */
         unsigned long l;
         REAL_VALUE_TYPE r;
         if (GET_CODE(x) != CONST_DOUBLE)
            abort_with_insn(x, "Bad operator code for letter c");
         REAL_VALUE_FROM_CONST_DOUBLE (r, x);
         REAL_VALUE_TO_TARGET_SINGLE(r, l);
         fputs(xtoimm(l >> 8, s, 1), stream);
         return;
      }
      case 's': {
         /* Output float const.  */
         unsigned long l;
         REAL_VALUE_TYPE r;
         if (GET_CODE(x) != CONST_DOUBLE)
         abort_with_insn(x, "Bad operator code for letter c");
         REAL_VALUE_FROM_CONST_DOUBLE (r, x);
         REAL_VALUE_TO_TARGET_SINGLE(r, l);
         fputs(xtoimm(l, s, 1), stream);
         return;
      }
      case 'd' : {
         /* Output any added offset divided by 4. */
         if (GET_CODE(XEXP(x, 0)) == PLUS) {
            print_operand_address(stream,XEXP(x, 0));
            fputs( "/4", stream);
         }
         else
         {
            print_operand_address(stream,x);
         }
         return;
      }
      default:
      abort_with_insn(x, "Bad code letter %c", code);
   }
   switch (GET_CODE(x)) {
      case REG:
      fputs(reg_names[REGNO(x)], stream);
      break;
      case MEM:
      print_operand_address(stream, XEXP(x, 0));
      break;
      case HIGH:
      fputs("#HIWORD(", stream);
      output_addr_const(stream, XEXP(x, 0));
      fputs(")", stream);
      break;
      case LO_SUM:
      fputs("#LOWORD(", stream);
      output_addr_const(stream, XEXP(x, 1));
      fputs(")", stream);
      break;
      case CONST_INT:
      fputs(xtoimm(INTVAL(x), s, 0), stream);
      break;
      case CONST_DOUBLE: {
         struct real_value  r;
         char s[20];
         REAL_VALUE_FROM_CONST_DOUBLE (r, x);
         fputs(s, stream);
         break;
      }
      default:
      output_addr_const(stream, x);
   }
}

/* Output to stream STREAM the assembler syntax for an instruction
* operand that is a memory reference whose address is X.  X is an RTL
* expression.
*
* On some machines, the syntax for a symbolic address depends on the
* section that the address refers to.  On these machines, define the
* macro `ENCODE_SECTION_INFO' to store the information into the
* `symbol_ref', and then check for it here.  */
 void
print_operand_address(FILE *stream, rtx x)
{
   rtx op0, op1;

   if (CONSTANT_P(x)) {
      output_addr_const(stream, x);
      return;
   }
   switch(GET_CODE(x)) {
      case REG:
      fprintf(stream, "(%%i%d)", (REGNO(x) - RAM_IDX_0) >> 1);
      break;
      case PRE_DEC:
      fprintf(stream, "-(%%i%d)", (REGNO(XEXP(x, 0)) - RAM_IDX_0) >> 1);
      break;
      case POST_INC:
      fprintf(stream, "(%%i%d)+", (REGNO(XEXP(x, 0)) - RAM_IDX_0) >> 1);
      break;
      case PLUS:
      op0 = XEXP(x, 0), op1 = XEXP(x, 1);
      if (CONSTANT_P(op0) && CONSTANT_P(op1)) {
         /* Somehow not considered constant as a whole... */
         output_addr_const(stream, x);
         break;
      }
      if (CONSTANT_P(op0)) {
         rtx tem = op0;
         op0 = op1;
         op1 = tem;
      }
      if (!CONSTANT_P(op1) || GET_CODE(op0) != REG)
      abort_with_insn(x, "PRINT_OPERAND_ADDRESS, illegal plus");
      fprintf(stream, "(%%i%d,", (REGNO(op0) - RAM_IDX_0) >> 1);
      output_addr_const(stream, op1);
      fputs(")", stream);
      break;
      default:
      abort_with_insn(x, "PRINT_OPERAND_ADDRESS, illegal insn");
   }
}

#if 0 /*SC pour V4 */

int
immediate_inc_operand( rtx op,  enum machine_mode   mode   ATTRIBUTE_UNUSED)

{
   return (GET_CODE(op) == CONST_INT
   && (INTVAL(op) == 1 || INTVAL(op) == -1));
}

/* Return true if OP is the REG_0 register.  */
int
data_reg_operand(rtx op, enum machine_mode mode)
{
   if (GET_CODE(op) != REG || REGNO(op) != REG_0)
   return 0;
   return register_operand(op, mode);
}

/* Return true if OP is the REG_1 register.  */
int
data_reg1_operand(rtx op, enum machine_mode mode)
{
   if (GET_CODE(op) != REG || REGNO(op) != REG_1)
   return 0;
   return register_operand(op, mode);
}

/* Return true if OP is the REG_2 register.  */
int
data_reg2_operand(rtx op, enum machine_mode mode)
{
   if (GET_CODE(op) != REG || REGNO(op) != REG_2)
   return 0;
   return register_operand(op, mode);
}

/* Return true if OP is the REG_3 register.  */
int
data_reg3_operand(rtx op, enum machine_mode mode)
{
   if (GET_CODE(op) != REG || REGNO(op) != REG_3)
   return 0;
   return register_operand(op, mode);
}

/* Return true if OP is the ROM index register.  */
int
romidx_operand(rtx op, enum machine_mode mode)
{
   if (GET_CODE(op) != REG || REGNO(op) != ROM_IDX)
   return 0;
   return register_operand(op, mode);
}

/* Return true if OP is a commutative operator, except MULT.  */
int commutative_operator(rtx op, enum machine_mode mode)
{
   if (GET_MODE(op) != mode || GET_CODE(op) == MULT)
   return 0;
   return (GET_RTX_CLASS(GET_CODE(op)) == 'c');
}
#endif

int op_in_accu_p(rtx op, rtx insn);
void find_hidden_accu(rtx insn, rtx *operands);

/* Try to find a value in operands 1 or 2 that can in fact be replaced
* by accu */
void find_hidden_accu(rtx insn, rtx *operands)
{
   if ((GET_CODE(operands[1]) == REG
   && REGNO(operands[1]) == ACCU_REG)
   || (GET_CODE(operands[2]) == REG
   && REGNO(operands[2]) == ACCU_REG))
   return;
   if (op_in_accu_p(operands[1], insn)) {
      operands[1] = gen_rtx(REG, QImode, ACCU_REG);
      return;
   }
   if (op_in_accu_p(operands[2], insn))
   operands[2] = gen_rtx(REG, QImode, ACCU_REG);
}

int only_use_trunc_p(rtx insn, rtx op);

/* Output a sequence of assembler instructions for a left shift
* operation. Op0 is the destination and is a register, op1 the value
* to shift and op2 the count.  signedp is true for sign extended
* operands.  */
const char* output_left_shift(rtx insn, rtx *operands, int signedp);
const char* output_left_shift(rtx insn, rtx *operands, int signedp)
{
   enum machine_mode mode = GET_MODE(operands[0]);
   rtx ops[4];

   if( pragma_output )
      output_asm_insn( ";in output_left_shift", operands );

   if (GET_CODE(operands[1]) == CONST_INT
   && GET_CODE(operands[2]) == CONST_INT) {
      /* Stupid case, but arises...  */
      unsigned int uval = INTVAL(operands[1]), cnt = INTVAL(operands[2]);
      operands[1] = gen_rtx(CONST_INT, VOIDmode, uval << cnt);
      return output_move(insn, operands);
   }

   operands[3] = operands[0];
   if (mode == HImode
   && only_use_trunc_p(insn, operands[0])
   && ((GET_MODE(operands[1]) == QImode
   || GET_MODE(operands[1]) == VOIDmode)
   || (GET_CODE(operands[2]) == CONST_INT
   && INTVAL(operands[2]) < 8))) {
      rtx nexti = next_nnote_nclob_nuse_insn(insn);
      rtx body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;
      if (body && GET_CODE(body) == SET
      && SET_DEST(body) != cc0_rtx
      && part_dead_or_set_p(nexti, operands[0])
      && (GET_CODE(operands[2]) == CONST_INT
      || !reg_overlap_mentioned_p(operands[2], SET_DEST(body)))
      && ((GET_CODE(SET_SRC(body)) == SUBREG
      && REGNO(SUBREG_REG(SET_SRC(body))) == REGNO(operands[0]))
      || (GET_CODE(SET_SRC(body)) == REG
      && REGNO(SET_SRC(body)) == REGNO(operands[0]) + 1))) {
         operands[0] = SET_DEST(body);
         cancel_insn(nexti);
         if (GET_CODE(operands[0]) == REG
         && REGNO(operands[0]) == ACCU_REG) {
            nexti = next_nnote_nclob_nuse_insn(nexti);
            if (nexti && GET_CODE(nexti) == INSN) {
               body = PATTERN(nexti);
               if (GET_CODE(body) == SET
               && SET_DEST(body) != cc0_rtx
               && (GET_CODE(SET_SRC(body)) == REG
               && REGNO(SET_SRC(body)) == ACCU_REG)
               && part_dead_or_set_p(nexti, operands[0])) {
                  operands[0] = SET_DEST(body);
                  cancel_insn(nexti);
               }
            }
         }
      } else
      operands[0] = gen_rtx(REG, QImode, REGNO(operands[0]) + 1);
      mode = QImode;
   }
   if (mode == QImode) {
      if (GET_CODE(operands[1]) != CONST_INT
      && GET_MODE(operands[1]) != QImode) {
         rtx part[8];
         int size = GET_MODE_SIZE(GET_MODE(operands[1])) - 1;
         split_any(operands[1], size, part);
         operands[1] = part[size];
      }
      if (GET_CODE(operands[2]) == CONST_INT) {
         if (GET_CODE(operands[0]) == REG
         && INTVAL(operands[2]) == 1)
         return "SHL %0,%1";
         operands[3] = NULL;
         if (GET_CODE(operands[0]) != REG
         || REGNO(operands[0]) != ACCU_REG)
         operands[3] = operands[0];
         if (INTVAL(operands[2]) == 1)
         return "SHL %%a,%1";
         if (GET_CODE(operands[1]) == REG
         && (REGNO(operands[1]) == ACCU_REG
         || part_dead_or_set_p(insn, operands[1])))
            output_asm_insn("MSHL   %1,%2", operands);
         else
            output_asm_insn("MOVE   %%a,%1\n\tMSHL %%a,%2", operands);
         if (operands[3])
            return "MOVE   %0,%%a";
         return "";
      }
      if (GET_CODE(operands[0]) != REG
      || REGNO(operands[0]) == ACCU_REG) {
         rtx tem = operands[3];
         operands[3] = operands[0];
         if (GET_CODE(operands[1]) == REG
         && part_dead_or_set_p(insn, operands[1]))
         operands[0] = operands[1];
         else {
            if (GET_MODE(tem) == QImode)
            operands[0] = tem;
            else {
               rtx part[8];
               int size = GET_MODE_SIZE(GET_MODE(tem)) - 1;
               split_reg(tem, size, part);
               operands[0] = part[size];
            }
         }
      } else
      operands[3] = NULL;
      if (GET_CODE(operands[1]) != REG
      || REGNO(operands[1]) != REGNO(operands[0]))
      output_asm_insn("MOVE   %0,%1", operands);
      output_asm_insn("lshlqi3   %m0,%m2", operands);
      if (operands[3])
      return "MOVE   %3,%0";
      return "";
   }
   if (mode == HImode) {
      rtx reg0[2];
      split_reg(operands[0], 1, reg0);
      if (GET_CODE(operands[2]) == CONST_INT) {
         rtx op1[2];
         int count = INTVAL(operands[2]);
         if (GET_MODE(operands[1]) == QImode) {
            operands[3] = reg0[1];
            if (count == 1) {
               if (signedp) {
                  if (GET_CODE(operands[1]) != REG
                  || REGNO(operands[1]) != REGNO(operands[0]))
                  output_asm_insn("MOVE   %0,%1", operands);
                  output_asm_insn("MULA   %0,#1", reg0);
                  return "SHL %3,%1\n\t"
                  "SHLC %0,%0";
               }
               return "SHL %3,%1\n\t"
               "MOVE %0,#0\n\t"
               "SHLC %0,%0";
            }
            if (count == 9)
            return "MOVE   %3,#0\n\tSHL   %0,%1\n\t";
            if (GET_CODE(operands[1]) != REG
            || REGNO(operands[1]) != REGNO(operands[0]))
            output_asm_insn("MOVE   %0,%1", operands);
            if (count > 8) {
               operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 8);
               return "MOVE   %3,#0\n\t"
               "MSHL %0,%2\n\tMOVE  %0,%%a";
            } else if (count == 8)
            return "MOVE   %3,#0";
            return "MSHL   %0,%2\n\tMOVE  %3,%%a";
         }
         split_any(operands[1], 1, op1);
         if (count == 1) {
            ops[0] = reg0[1], ops[1] = op1[1];
            output_asm_insn("SHL %0,%1", ops);
            return "SHLC   %0,%1";
         }
         if (count == 9) {
            ops[0] = reg0[0], ops[1] = op1[1];
            output_asm_insn("SHL %0,%1", ops);
            operands[0] = reg0[1];
            return "MOVE   %0,#0";
         }
         if (count >= 8) {
            operands[3] = reg0[1];
            if (GET_CODE(operands[1]) != REG
            || REGNO(op1[1]) != REGNO(reg0[0])) {
               ops[0] = reg0[0], ops[1] = op1[1];
               output_asm_insn("MOVE   %0,%1", ops);
            }
            if (count == 8)
            return "MOVE   %3,#0";
            operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 8);
            return "MOVE   %3,#0\n\t"
            "MSHL %0,%2\n\tMOVE  %0,%%a";
         }
         if (GET_CODE(operands[1]) != REG
         || REGNO(operands[1]) != REGNO(operands[0])) {
            ops[0] = operands[0];
            ops[1] = operands[1];
            output_asm_insn(output_move(insn, ops), ops);
         }
         operands[1] = reg0[1];
         return "lshlihi3  %m0,%m1,%c2";
      }
      if (GET_MODE(operands[1]) == QImode) {
         if (GET_CODE(operands[1]) != REG
         || REGNO(operands[1]) != REGNO(reg0[1])) {
            ops[0] = reg0[1], ops[1] = operands[1];
            output_asm_insn("MOVE   %0,%1", ops);
         }
         if (signedp)
         output_asm_insn("MOVE   %0,%1\n\tMULA  %0,#1", reg0);
         else
         output_asm_insn("MOVE   %0,#0", operands);
      } else if (GET_CODE(operands[1]) != REG
      || REGNO(operands[1]) != REGNO(operands[0])) {
         ops[0] = operands[0], ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
      }
      operands[1] = reg0[1];
      return "lshlhi3   %m0,%m1,%m2";
   }
   /* mode is SImode */
   if (GET_CODE(operands[2]) == CONST_INT) {
      int count = INTVAL(operands[2]), i;
      rtx op0[4], op1[4];
      split_any(operands[0], 3, op0);
      split_any(operands[1], 3, op1);
      if (count == 8 || count == 16 || count == 24 || count >= 32) {
         int j;
         count >>= 3;
         for (i = 3, j = 0; i >= count; i--, j++) {
            ops[0] = op0[3 - i], ops[1] = op1[count + j];
            output_asm_insn(output_move(insn, ops), ops);
         }
         ops[1] = const0_rtx;
         for (i = 0; i <= 3 && i < count; i++) {
            ops[0] = op0[3 - i];
            output_asm_insn(output_move(insn, ops), ops);
         }
         return "";
      }
      if (GET_CODE(operands[1]) != REG
      || REGNO(operands[1]) != REG_0) {
         ops[0] = op0[3], ops[1] = op1[3];
         output_asm_insn("SHL %0,%1", ops);
         for (i = 2; i >= 0; i--) {
            ops[0] = op0[i], ops[1] = op1[i];
            output_asm_insn("SHLC   %0,%1", ops);
         }
         if (count == 1)
         return "";
         operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 1);
      }
      return "lshlisi3  %c2";
   }
   ops[1] = operands[2];

   if (GET_CODE(ops[1]) != REG)
   {
      debug_rtx(ops[1]);
      output_asm_insn("MOVE   %%a,%1\n\tMOVE -(%%sp),%%a", ops);
   }
   else
      output_asm_insn("MOVE   -(%%sp),%1", ops);

   if (GET_CODE(operands[1]) == MEM) {
      int nregs = find_regs_in_addr(XEXP(operands[1], 0), 0);
      int i, found = 0;
      for (i = 0; !found && i < nregs; i++)
      found = REGNO(addr_regs[i]) == HARD_SP_REG;
      if (found)
      operands[1] = modif_mem_address(operands[1], GET_MODE(operands[1]), HARD_SP_REG, 1);
   }
   output_asm_insn(output_move(insn, operands), operands);
   return "lshlsi3";
}

/* Output a sequence of assembler instructions for a right shift
* operation. Op0 is the destination (register), op1 the value to
* shift and op2 the count. Do an arithmetic shift if signedp is
* true. */
const char* output_right_shift( rtx insn, rtx* operands, int signedp );
const char* output_right_shift( rtx insn, rtx* operands, int signedp )
{
   enum machine_mode mode = GET_MODE(operands[0]);
   rtx ops[4];

   if( pragma_output )
      output_asm_insn( ";in output_right_shift", operands );

   if (GET_CODE(operands[1]) == CONST_INT && GET_CODE(operands[2]) == CONST_INT)
   {
      /* Stupid case, but arises...  */
      int val = INTVAL(operands[1]);
      unsigned int uval = val, cnt = INTVAL(operands[2]);

      if (signedp)
         operands[1] = gen_rtx(CONST_INT, VOIDmode, val >> cnt);
      else
         operands[1] = gen_rtx(CONST_INT, VOIDmode, uval >> cnt);
      return output_move(insn, operands);
   }

   operands[3] = operands[0];

   if( pragma_output )
   {
      if(mode == HImode)
         output_asm_insn( ";mode = HImode", operands );
      if(only_use_trunc_p(insn, operands[0]))
         output_asm_insn( ";only_use_trunc_p(insn, operands[0])=true", operands );
      if(GET_MODE(operands[1]) == QImode)
         output_asm_insn( ";GET_MODE(operands[1]) = QImode", operands );
      if(GET_MODE(operands[1]) == HImode)
         output_asm_insn( ";GET_MODE(operands[1]) = HImode", operands );
      if(GET_MODE(operands[1]) == VOIDmode)
         output_asm_insn( ";GET_MODE(operands[1]) = VOIDmode", operands );

      output_asm_insn( "; %0 - %1 - %2", operands );
   }

   if( mode == HImode
      && only_use_trunc_p(insn, operands[0])
      && (  GET_MODE(operands[1]) == QImode
/* VC030903: bug shr/shra...
         || GET_MODE(operands[1]) == VOIDmode   */
         )
     )
   {
      rtx nexti = next_nnote_nclob_nuse_insn(insn);
      rtx body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;

      if( body && GET_CODE(body) == SET
      && SET_DEST(body) != cc0_rtx
      && part_dead_or_set_p(nexti, operands[0])
      && (GET_CODE(operands[2]) == CONST_INT || !reg_overlap_mentioned_p(operands[2], SET_DEST(body)))
      && ((GET_CODE(SET_SRC(body)) == SUBREG && REGNO(SUBREG_REG(SET_SRC(body))) == REGNO(operands[0]))
      || (GET_CODE(SET_SRC(body)) == REG  && REGNO(SET_SRC(body)) == REGNO(operands[0]) + 1)))
      {
         operands[0] = SET_DEST(body);
         cancel_insn(nexti);
         if (GET_CODE(operands[0]) == REG  && REGNO(operands[0]) == ACCU_REG)
         {
            nexti = next_nnote_nclob_nuse_insn(nexti);
            if (nexti && GET_CODE(nexti) == INSN)
            {
               body = PATTERN(nexti);
               if (GET_CODE(body) == SET && SET_DEST(body) != cc0_rtx
               && GET_CODE(SET_SRC(body)) == REG
               && REGNO(SET_SRC(body)) == ACCU_REG
               && part_dead_or_set_p(nexti, operands[0]))
               {
                  operands[0] = SET_DEST(body);
                  cancel_insn(nexti);
               }
            }
         }
      }
      else
      {
         operands[0] = gen_rtx(REG, QImode, REGNO(operands[0]) + 1);
      }

      mode = QImode;
   }

   if (mode == QImode)
   {
      if (GET_CODE(operands[0]) != REG || REGNO(operands[0]) == ACCU_REG)
      {
         rtx tem = operands[3];
         operands[3] = operands[0];
         if (GET_CODE(operands[1]) == REG && part_dead_or_set_p(insn, operands[1]))
         operands[0] = operands[1];
         else
         {
            if (GET_MODE(tem) == QImode)
            operands[0] = tem;
            else
            {
               rtx part[8];
               int size = GET_MODE_SIZE(GET_MODE(tem)) - 1;
               split_reg(tem, size, part);
               operands[0] = part[size];
            }
         }
      }
      else
      operands[3] = NULL;

      if (GET_CODE(operands[2]) == CONST_INT)
      {
         if (INTVAL(operands[2]) == 1)
         output_asm_insn(signedp ? "SHRA  %0,%1" : "SHR  %0,%1", operands);
         else
         {
            if (GET_CODE(operands[1]) != REG || REGNO(operands[0]) != REGNO(operands[1]))
            output_asm_insn("MOVE   %0,%1", operands);

            output_asm_insn(signedp ? "MSHRA %0,%2" : "MSHR %0,%2", operands);
         }

         if (operands[3])
         return "MOVE   %3,%0";

         return "";
      }

      if (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(operands[0]))
      output_asm_insn("MOVE   %0,%1", operands);

      output_asm_insn(signedp ? "ashrqi3  %m0,%m2" : "lshrqi3  %m0,%m2", operands);
      if (operands[3])
      return "MOVE   %3,%0";
      return "";
   }

   if( mode == HImode )
   {
      rtx reg0[2];
      split_reg(operands[0], 1, reg0);

      if (GET_CODE(operands[2]) == CONST_INT)
      {
         rtx op1[2];
         int count = INTVAL(operands[2]);

         if (GET_MODE(operands[1]) == QImode)
         {
            operands[3] = reg0[1];

            if (count == 1)
               output_asm_insn(signedp ? "SHRA  %3,%1" : "SHR   %3,%1", operands);
            else if (count < 8)
            {
               if (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(operands[0]))
               output_asm_insn("MOVE   %3,%1", operands);

               output_asm_insn(signedp ? "MSHRA %3,%2" : "MSHR  %3,%2", operands);
            }
            else
            {
               if (signedp)
               {
                  if (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(operands[3]))
                  output_asm_insn("MOVE   %3,%1", operands);

#if 1 /* SC020801 (_1014)*/
                  output_asm_insn("MULA   %3,#1", operands );
#else
                  output_asm_insn("MULA   %3,#1", reg0);
#endif
               }
               else
               output_asm_insn("MOVE   %3,#0", operands);
            }

            if (signedp && (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(operands[0])))
            output_asm_insn("MOVE   %0,%3", operands);

            return signedp ? "MULA  %0,#1" : "MOVE %0,#0";
         }

         split_any(operands[1], 1, op1);

         if (count == 9)
         {
            operands[3] = reg0[1];

            output_asm_insn(signedp ? "SHRA  %3,%1" : "SHR  %3,%1", operands);

            if (signedp && (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(operands[0])))
            {
               output_asm_insn("MOVE   %0,%3", operands);
            }
            return signedp ? "MULA  %0,#1" : "MOVE %0,#0";
         }

         if (count >= 8)
            {
            operands[3] = reg0[1];
            if (GET_CODE(operands[1]) != REG || REGNO(op1[1]) != REGNO(reg0[0]))
               output_asm_insn("MOVE   %3,%1", operands);
            if (count != 8)
               {
               operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 8);
               output_asm_insn(signedp ? "MSHRA %3,%2" : "MSHR  %3,%2", operands);
               }

            if (signedp && (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(operands[0])))
               {
               output_asm_insn("MOVE   %0,%3", operands);
               }

            return signedp ? "MULA  %0,#1" : "MOVE  %0,#0";
            }

         if (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(operands[0]))
            {
            ops[0] = operands[0], ops[1] = operands[1],
            ops[2] = reg0[1], ops[3] = op1[1];
            output_asm_insn(signedp ? "SHRA  %0,%1\n\tSHRC  %2,%3" : "SHR   %0,%1\n\tSHRC  %2,%3", ops);
            if (count == 1)
               return "";
            operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 1);
            }

         operands[1] = reg0[1];

         return signedp ? "ashrihi3 %m0,%m1,%c2" : "lshrihi3 %m0,%m1,%c2";
      }

      if (GET_MODE(operands[1]) == QImode)
         {
         if (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(reg0[1]))
            {
            ops[0] = reg0[1], ops[1] = operands[1];
            output_asm_insn("MOVE   %0,%1", ops);
            }

         if (signedp)
            output_asm_insn("MOVE   %0,%1\n\tMULA  %0,#1", reg0);
         else
            output_asm_insn("MOVE   %0,#0", operands);
         }
      else if (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REGNO(operands[0]))
         {
         ops[0] = operands[0], ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
         }

      operands[1] = gen_rtx(REG, SImode, REGNO( reg0[1] ) );

      return signedp ? "ashrhi3  %m0,%m1,%m2" : "lshrhi3  %m0,%m1,%m2";
   }

   /* mode is SImode */
   if (GET_CODE(operands[2]) == CONST_INT)
   {
      int count = INTVAL(operands[2]), i;
      rtx op0[4], op1[4];
      split_any(operands[0], 3, op0);
      split_any(operands[1], 3, op1);

      if (count == 8 || count == 16 || count == 24 || count >= 32)
      {
         int j;
         i = count >> 3;
         for (j = 3; i <= 3; i++, j--)
         {
            ops[0] = op0[j], ops[1] = op1[3 - i];
            output_asm_insn("MOVE   %0,%1", ops);
         }

         ops[0] = op0[0], ops[1] = op1[0];

         if (signedp
         && (GET_CODE(operands[1]) != REG
         || REGNO(operands[1]) != REGNO(operands[0])))
         {
            output_asm_insn("MOVE   %0,%1", operands);
         }

         output_asm_insn(signedp
         ? "MULA  %0,#1"
         : "MOVE  %0,#0", ops);

         for (i = 1; i <= 3 && (i << 3) < count; i++)
         {
            ops[1] = op0[i];
            output_asm_insn("MOVE   %1,%0", ops);
         }
         return "";
      }

      if (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REG_0)
      {
         ops[0] = op0[0], ops[1] = op1[0];

         output_asm_insn(signedp
         ? "SHRA  %0,%1"
         : "SHR   %0,%1", ops);

         for (i = 1; i < 4; i++)
         {
            ops[0] = op0[i], ops[1] = op1[i];
            output_asm_insn("SHRC   %0,%1", ops);
         }

         if (count == 1)
            return "";

         operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 1);
      }

      return signedp
      ? "ashrisi3 %c2"
      : "lshrisi3 %c2";
   }
   ops[1] = operands[2];

   if (GET_CODE(ops[1]) != REG)
      output_asm_insn("MOVE   %%a,%1\n\tMOVE -(%%sp),%%a", ops);
   else
      output_asm_insn("MOVE   -(%%sp),%1", ops);

   if (GET_CODE(operands[1]) == MEM)
   {
      int nregs = find_regs_in_addr(XEXP(operands[1], 0), 0);
      int i, found = 0;

      for (i = 0; !found && i < nregs; i++)
         found = REGNO(addr_regs[i]) == HARD_SP_REG;

      if (found)
         operands[1] = modif_mem_address(operands[1], GET_MODE(operands[1]), HARD_SP_REG, 1);
   }

   output_asm_insn(output_move(insn, operands), operands);

   return signedp ? "ashrsi3" : "lshrsi3";
}

/* Output assembler code to perform a equality comparison with zero
* followed by a branch instruction.  Works for QI, HI, SI, TQF and SF
* modes. To test only MSB (i.e., the exponent) for floats, caller must
* set size to 1.  */
static void
output_branch_0_equ(enum rtx_code code, int size,
rtx *op1, rtx *operands, rtx op)
{
   int i = 1;

   if( pragma_output )
   output_asm_insn( ";in output_branch_0_equ", operands );

   if (GET_CODE(op) == REG && size > 1)
   {
      output_asm_insn("OR     %%a,%0,%1", op1);
      i = 2;
   }
   else
      output_asm_insn("MOVE   %%a,%0", op1);

   for (; i < size; i++)
   {
      rtx ops[1];
      ops[0] = op1[i];
      output_asm_insn("OR     %%a,%0", ops);
   }

   output_asm_insn( ( (code == EQ) || (code == LEU) ) ? "JEQ   %l1"  : "JNE   %l1", operands);
}

/* Output assembler code to perform a comparison with zero followed by
* a branch instruction.  Works for HI, SI, TQF and SF modes.  */
static void
output_branch_0(rtx insn, rtx *operands, enum rtx_code code, rtx op)
{
   int size = GET_MODE_SIZE(GET_MODE(op));
   int is_reg = GET_CODE(op) == REG;
   rtx op1[8], ops[3];

   if( pragma_output )
   output_asm_insn( ";in output_branch_0", operands );

   if (GET_CODE(op) == CONST_DOUBLE) {
      /* Stupid case, but arises...  */
      int do_jump = 0;
       struct real_value  r;
      REAL_VALUE_FROM_CONST_DOUBLE(r, op);
      switch (code) {
         case EQ:
         do_jump = (REAL_EXP(&r) == 0);
         break;
         case NE:
         do_jump = (REAL_EXP(&r)!= 0);
         break;
         case LT:
         do_jump = (REAL_EXP(&r) < 0);
         break;
         case GT:
         do_jump = (REAL_EXP(&r) > 0);
         break;
         case LE:
         do_jump = (REAL_EXP(&r) <= 0);
         break;
         case GE:
         do_jump = (REAL_EXP(&r) >= 0);
         break;
         default:
         abort_with_insn(insn, "Bad branch");
      }
      if (do_jump)
      output_asm_insn("JUMP   %l1", operands);
      return;
   }

   split_any(op, size - 1, op1);

   ops[0] = op1[0], ops[1] = op1[1], ops[2] = operands[1];

   if (GET_MODE_CLASS(GET_MODE(op)) == MODE_INT)
   {
      switch (code) {
         case GT:
            output_asm_insn(is_reg
            ? "TSTB  %0,#7\n\tJZC   .Lgt%="
            : "MOVE  %%a,%0\n\tTSTB %%a,#7\n\tJZC  .Lgt%=", ops);
            output_branch_0_equ(NE, size, op1, operands, op);
            output_asm_insn("\n.Lgt%=:", ops);
            break;

         case GE:
            output_asm_insn(is_reg
            ? "TSTB  %0,#7\n\tJZS   %l2"
            : "MOVE  %%a,%0\n\tTSTB %%a,#7\n\tJZS  %l2", ops);
            break;

         case LT:
            output_asm_insn(is_reg
            ? "TSTB  %0,#7\n\tJZC   %l2"
            : "MOVE  %%a,%0\n\tTSTB %%a,#7\n\tJZC  %l2", ops);
            break;

         case LE:
            output_asm_insn(is_reg
            ? "TSTB  %0,#7\n\tJZC   %l2"
            : "MOVE  %%a,%0\n\tTSTB %%a,#7\n\tJZC  %l2", ops);
            output_branch_0_equ(EQ, size, op1, operands, op);
            break;
         default:
            output_branch_0_equ(code, size, op1, operands, op);
      }

      return;
   }

   /* Handle floats.  */
   switch (code)
   {
      case GT:
         output_asm_insn(is_reg
         ? ("MOVE %%a,%0\n\tJZS  .Lgt%=\n\t"
         "TSTB %1,#7\n\tJZS   %l2\n.Lgt%=:")
         : ("MOVE %%a,%0\n\tJZS  .Lgt%=\n\t"
         "MOVE %%a,%1\n\tTSTB %%a,#7\n\tJZS  %l2\n.Lgt%=:"),ops);
         break;
      case GE:
         output_asm_insn(is_reg
         ? ("MOVE %%a,%0\n\tJZS  %l2\n\t"
         "TSTB %1,#7\n\tJZS   %l2")
         : ("MOVE %%a,%0\n\tJZS  %l2\n\t"
         "MOVE %%a,%1\n\tTSTB %%a,#7\n\tJZS  %l2"), ops);
         break;
      case LT:
         output_asm_insn(is_reg
         ? ("MOVE %%a,%0\n\tJZS  .Lgt%=\n\t"
         "TSTB %1,#7\n\tJZC   %l2\n.Lgt%=:")
         : ("MOVE %%a,%0\n\tJZS  .Lgt%=\n\t"
         "MOVE %%a,%1\n\tTSTB %%a,#7\n\tJZC  %l2\n.Lgt%=:"), ops);
         break;
      case LE:
         output_asm_insn(is_reg
         ? ("MOVE %%a,%0\n\tJZS  %l2\n\t"
         "TSTB %1,#7\n\tJZC   %l2")
         : ("MOVE %%a,%0\n\tJZS  %l2\n\t"
         "MOVE %%a,%1\n\tTSTB %%a,#7\n\tJZC  %l2"), ops);
         break;
      default:
         output_branch_0_equ(code, 1, op1, operands, op);
   }
}

/* Output assembler code to perform a branch instruction */
const char* output_branch(rtx insn, rtx *operands, int reverse);
const char* output_branch(rtx insn, rtx *operands, int reverse)
{
   enum rtx_code code = GET_CODE(operands[0]);
   enum machine_mode mode;
   rtx ops[2];
   char s[256];

   if( pragma_output )
      output_asm_insn( ";in output_branch", operands );

   if (reverse)
      code = reverse_condition(code);

   ops[0] = cc_status.mdep.op1;
   ops[1] = cc_status.mdep.op2;

   if (ops[0] == 0 || ops[1] == 0)
      abort_with_insn(insn, "No values to compare...\n");

   if (GET_CODE(ops[0]) == CONST_INT && GET_CODE(ops[1]) == CONST_INT)
      {
      /* Stupid case, but arises...  */
      int do_jump = 0;
      int val0 = INTVAL(ops[0]), val1 = INTVAL(ops[1]);
      unsigned int uval0 = val0, uval1 = val1;

      switch (code)
      {
         case EQ:
            do_jump = val0 == val1;
            break;
         case NE:
            do_jump = val0 != val1;
            break;
         case LT:
            do_jump = val0 < val1;
            break;
         case GT:
            do_jump = val0 > val1;
            break;
         case LE:
            do_jump = val0 <= val1;
            break;
         case GE:
            do_jump = val0 >= val1;
            break;
         case LTU:
            do_jump = uval0 < uval1;
            break;
         case GTU:
            do_jump = uval0 > uval1;
            break;
         case LEU:
            do_jump = uval0 <= uval1;
            break;
         case GEU:
            do_jump = uval0 >= uval1;
            break;
         default:
            abort_with_insn(insn, "Bad branch");
      }

      if (do_jump)
         return "JUMP   %l1";
      return "";
   }

   mode = GET_MODE(ops[0]);

   if (mode == VOIDmode)
      mode = GET_MODE(ops[1]);

   if (ops[1] != const0_rtx && (GET_CODE(ops[0]) == CONST_INT || GET_CODE(ops[0]) == CONST_DOUBLE))
   {
      rtx tem = ops[0];
      ops[0] = ops[1];
      ops[1] = tem;
      code = swap_condition(code);
   }

   if (mode == QImode)
   {
      int signedp = (code == LT || code == LE || code == GT || code == GE);

      if( pragma_output )
         output_asm_insn( ";++ Mode is QI\n", operands );

      if (!((code == EQ || code == NE) && cc_status.mdep.cmp0_done))
      {
         if( pragma_output )
            output_asm_insn( ";++ Complex stuff", operands );

         if (GET_CODE(ops[0]) != REG && GET_CODE(ops[1]) != REG)
         {
            if (ops[0] == cc_status.mdep.in_accu)
            {
               /* PMr fprintf(asm_out_file,";++ Gen_rtx 0\n");*/
               ops[0] = gen_rtx(REG, QImode, ACCU_REG);
            }
            else if (ops[1] == cc_status.mdep.in_accu)
            {
               /* PMr fprintf(asm_out_file,";++ Gen_rtx 1\n");*/
               ops[1] = gen_rtx(REG, QImode, ACCU_REG);
            }
         }

         if (GET_CODE(ops[1]) == REG && GET_CODE(ops[0]) != REG)
         {
            rtx tem = ops[0];
            ops[0] = ops[1];
            ops[1] = tem;
            code = swap_condition(code);
         }

         if (GET_CODE(ops[0]) != REG)
         {
            if (ops[1] == const0_rtx && (code == EQ || code == NE))
               output_asm_insn("MOVE   %%a,%0", ops);
            else
               output_asm_insn( signedp ? "MOVE  %%a,%0\n\tCMPA %%a,%1" : "MOVE  %%a,%0\n\tCMP  %%a,%1", ops);
         }
         else
            output_asm_insn(signedp ? "CMPA  %0,%1" : "CMP   %0,%1", ops);
      }

      if( pragma_output )
         output_asm_insn( ";---> Middle output branch <---", operands );

      switch (code)
      {
         case EQ:
            return "JEQ %l1";
         case NE:
            return "JNE %l1";
         case LT:
         case LTU:
            return "JLT %l1";
         case GT:
         case GTU:
            return "JGT %l1";
         case LE:
         case LEU:
            return "JLE %l1";
         case GE:
         case GEU:
            return "JGE %l1";
         default:
            break;
         /* return below */
      }

      abort_with_insn( insn, "Bad branch" );
   }

   if ((mode == HImode || mode == SImode) && GET_CODE(ops[0]) != REG && GET_CODE(ops[1]) == REG)
   {
      rtx tem = ops[0];
      ops[0] = ops[1];
      ops[1] = tem;
      code = swap_condition(code);

      if( pragma_output )
         output_asm_insn( "; condition swapped!", operands );
   }

   if (ops[1] == const0_rtx)
   {
      /* All the remaining comparisons with zero are handled there.  */
      output_branch_0(insn, operands, code, ops[0]);

      return "";
   }

   if (mode == HImode)
   {
      rtx op1[2], op2[2], parm[5];
      
      if( pragma_output )
         output_asm_insn( "; mode == HImode", operands );

      set_branch_opcode(insn, code, s);

      if( GET_CODE(ops[0]) != REG)
      {
         op1[0] = gen_rtx(REG, HImode, REG_0);
         op1[1] = ops[0];

         output_asm_insn( output_move( insn, op1 ), op1 );

         ops[0] = op1[0];
      }

      split_reg(ops[0], 1, op1);
      parm[0] = operands[1], parm[1] = op1[0], parm[2] = op1[1];

      if (GET_CODE(ops[1]) == CONST_INT)
      {
         strcat(s, "ihi3   %l0,%m1,%m2,%c3");
         parm[3] = ops[1];
         output_asm_insn(s, parm);
         return "";
      }

      strcat(s, "hi3 %l0,%m1,%m2,%m3,%m4");
      split_any(ops[1], 1, op2);
      parm[3] = op2[0], parm[4] = op2[1];

      output_asm_insn(s, parm);

      return "";
   }

   if (mode == SImode)
   {
      rtx op1[4], parm[6];
      set_branch_opcode(insn, code, s);

      if (GET_CODE(ops[0]) != REG)
      {
         op1[0] = gen_rtx(REG, SImode, REG_0), op1[1] = ops[0];
         output_asm_insn(output_move(insn, op1), op1);
         ops[0] = op1[0];
      }
      split_reg(ops[0], 3, op1);
      parm[0] = operands[1], parm[1] = op1[0],
      parm[2] = op1[1], parm[3] = op1[2], parm[4] = op1[3];

      if (GET_CODE(ops[1]) == CONST_INT)
      {
         strcat(s, "isi3   %l0,%m1,%m2,%m3,%m4,%c5");
         parm[5] = ops[1];
         output_asm_insn(s, parm);
         return "";
      }

      strcat(s, "si3 %l0,%m1,%m2,%m3,%m4");
      output_asm_insn(output_libcall(insn, ops, 0, 1, 0, "", 0, 1, 0), ops);
      output_asm_insn(s, parm);
      return "";
   }

   if( (GET_CODE(ops[1]) == REG && REGNO(ops[1]) == REG_0) ||
       (GET_CODE(ops[0]) == REG && REGNO(ops[0]) != REG_0 && GET_CODE(ops[1]) == MEM))
   {
      rtx tem = ops[0];
      ops[0] = ops[1];
      ops[1] = tem;
      code = swap_condition(code);
   }

   if (mode == TQFmode)
   {
      rtx op1[3], parm[4];
      set_branch_opcode(insn, code, s);
      parm[0] = operands[1];
      if (GET_CODE(ops[1]) == CONST_DOUBLE) {
         if (GET_CODE(ops[0]) != REG
         || REGNO(ops[0]) != REG_0) {
            op1[0] = gen_rtx(REG, TQFmode, REG_0);
            op1[1] = ops[0];
            output_asm_insn(output_move(insn, op1), op1);
         }
         strcat(s, "itqf3  %l0,%t1");
         parm[1] = ops[1];
         output_asm_insn(s, parm);
         return "";
      }
      strcat(s, "tqf3   %l0");
      op1[1] = ops[0], op1[2] = ops[1];
      output_asm_insn(output_libcall(insn, op1, 1, 1, 0, "", 0, 1, 0), op1);
      output_asm_insn(s, parm);
      return "";
   }

   if (mode == SFmode)
   {
      rtx op1[4], parm[5];
      set_branch_opcode(insn, code, s);
      parm[0] = operands[1];

      if (GET_CODE(ops[1]) == CONST_DOUBLE)
      {
         if (GET_CODE(ops[0]) != REG || REGNO(ops[0]) != REG_0)
         {
            op1[0] = gen_rtx(REG, SFmode, REG_0);
            op1[1] = ops[0];
            output_asm_insn(output_move(insn, op1), op1);
         }

         strcat(s, "isf3   %l0,%s1");
         parm[1] = ops[1];
         output_asm_insn(s, parm);
         return "";
      }

      strcat(s, "sf3 %l0");
      op1[1] = ops[0], op1[2] = ops[1];
      output_asm_insn(output_libcall(insn, op1, 1, 1, 0, "", 0, 1, 0), op1);
      output_asm_insn(s, parm);
      return "";
   }
   abort_with_insn(insn, "Bad comparison mode: %s", GET_MODE_NAME(mode));
   return "";
}

/* Return true if op can be found in the accumulator */
int op_in_accu_p(rtx op, rtx insn)
{
   rtx previ = prev_nonnote_insn(insn);

   if (GET_CODE(op) == REG
   && REGNO(op) == ACCU_REG)
   {
      return 1;
   }
   while (previ && GET_CODE(previ) == INSN)
   {
      rtx body = PATTERN(previ);

      if (GET_CODE(body) == SET)
      {
         enum rtx_code code_src = GET_CODE(SET_SRC(body));


         if (use_large_frame(SET_SRC(body), 1)
         || use_large_frame(SET_DEST(body), 1))
         return 0;
         if (code_src == REG
         && REGNO(SET_SRC(body)) == ACCU_REG)
         {
            if (rtx_equal_p(op, SET_DEST(body)))
            {
               return 1;
            }
            previ = prev_nonnote_insn(previ);
            continue;
         }
         if (code_src == ASHIFT || code_src == ASHIFTRT || code_src == LSHIFTRT)
         return 0;
         if (GET_CODE(SET_DEST(body)) == MEM
         && code_src == REG)
         {
            if (rtx_equal_p(op, SET_DEST(body)))
            return op_in_accu_p(SET_SRC(body), previ);
            previ = prev_nonnote_insn(previ);
            continue;
         }

         /*
         // PMr - 10.03.98 - MOVE rx,rx will be wiped out during
         //              code generation, thus, we have to take care
         //              of this case !!!
         */

         if (GET_CODE(SET_DEST(body)) == REG && code_src == REG
         && REGNO(SET_DEST(body)) == REGNO(SET_SRC(body)))
         {
            previ = prev_nonnote_insn(previ);
            continue;
         }
         if (rtx_equal_p(op, SET_DEST(body))
         || rtx_equal_p(op, SET_SRC(body)))
         {
            return GET_CODE(SET_DEST(body)) != MEM
            || (code_src != REG && code_src != CONST_INT);
         }
         return 0;
      }
      else
      return 0;
   }
   return 0;
}

/* Return true if op is found in accu and condition codes have been set correctly

   Function added in order to solve the case of MULT, AND, IOR which do not set the Z flag
*/
int cc_set_with_accu_p(rtx op, rtx insn);
int cc_set_with_accu_p(rtx op, rtx insn)
{
   rtx previ = prev_nonnote_insn(insn);

   while (previ && GET_CODE(previ) == INSN)
   {
      rtx body = PATTERN(previ);

      if (GET_CODE(body) == SET)
      {
         enum rtx_code code_src = GET_CODE(SET_SRC(body));


         if (use_large_frame(SET_SRC(body), 1)
         || use_large_frame(SET_DEST(body), 1))
         return 0;
         if (code_src == REG
         && REGNO(SET_SRC(body)) == ACCU_REG)
         {
            if (rtx_equal_p(op, SET_DEST(body)))
            {
               return 1;
            }
            previ = prev_nonnote_insn(previ);
            continue;
         }

         /*
         // PMr - 11.02.99 - All these operators does not set the Z flag
         */
         if (code_src == ASHIFT || code_src == ASHIFTRT || code_src == LSHIFTRT
         || code_src == MULT || code_src == AND || code_src == IOR)
         return 0;
         if (GET_CODE(SET_DEST(body)) == MEM
         && code_src == REG)
         {
            if (rtx_equal_p(op, SET_DEST(body)))
            return cc_set_with_accu_p(SET_SRC(body), previ);
            previ = prev_nonnote_insn(previ);
            continue;
         }

         /*
         // PMr - 10.03.98 - MOVE rx,rx will be wiped out during
         //              code generation, thus, we have to take care
         //              of this case !!!
         */
         if (GET_CODE(SET_DEST(body)) == REG && code_src == REG
         && REGNO(SET_DEST(body)) == REGNO(SET_SRC(body)))
         {
            previ = prev_nonnote_insn(previ);
            continue;
         }
         if (rtx_equal_p(op, SET_DEST(body))
         || rtx_equal_p(op, SET_SRC(body)))
         {
            return GET_CODE(SET_DEST(body)) != MEM
            || (code_src != REG && code_src != CONST_INT);
         }
         return 0;
      }
      else
      return 0;
   }
   return 0;
}

/* -------------------------------------------------------------------------- */
/* Output a sequence of assembler instructions for a commutative operator.    */
/* Op0 is the destination, Op1 and Op2 are the operands, and Op3 is the       */
/* operator. Op0 and Op1 are registers.                                       */
/* -------------------------------------------------------------------------- */
const char* output_commutative(rtx insn, rtx *operands);
const char* output_commutative(rtx insn, rtx *operands)
{
   /* CI - Might want check for stupid operations with immediate.  */
   int to_reg = GET_CODE(operands[0]) == REG;

   if( pragma_output )
   output_asm_insn( ";in output_commutative", operands );

   /* Put reg first...  */
   if (GET_CODE(operands[2]) == REG && GET_CODE(operands[1]) != REG)
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   if (to_reg && GET_CODE(operands[1]) == REG && REGNO(operands[0]) == REGNO(operands[1]))
   {
      if( pragma_output )
      output_asm_insn( ";out output_commutative (+)", operands );

      return "%o3 %0,%2";
   }

   find_hidden_accu(insn, operands);

   /* Have to do it again...  */
   if (GET_CODE(operands[2]) == REG && GET_CODE(operands[1]) != REG)
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   if (GET_CODE(operands[1]) == REG)
   {
      int is_dead;

      if (GET_CODE(operands[2]) == REG)
      {
         if( pragma_output )
         output_asm_insn( ";out output_commutative (+)", operands );

         return to_reg ? "%o3 %0,%1,%2" : "%o3  %%a,%1,%2\n\tMOVE %0,%%a";
      }

      is_dead = REGNO(operands[1]) == ACCU_REG  || part_dead_or_set_p(insn, operands[1]);

      if (is_dead)
      {
         if( pragma_output )
         output_asm_insn( ";out output_commutative (+)", operands );

         return "%o3 %1,%2\n\tMOVE  %0,%1";
      }

      /* Special case of AND with immediate.  */
      if( ( GET_CODE(operands[3]) == AND ) && ( GET_CODE(operands[2]) == CONST_INT ) )
      {
         unsigned char mask = INTVAL( operands[ 2 ] ) & 0xFF;

         /* TSTB accepts only mask with a single bit set. */
         if( ( mask == 0x01 ) || ( mask == 0x02 ) || ( mask == 0x04 ) || ( mask == 0x08 ) ||
             ( mask == 0x10 ) || ( mask == 0x20 ) || ( mask == 0x40 ) || ( mask == 0x80 ) )
         {
            if( pragma_output )
            {
               output_asm_insn( ";out output_commutative (+)", operands );
            }

            return "TSTPAT %1,%2\n\tMOVE  %0,%%a";
         }
      }
   }

   /* General case.  */
   if( pragma_output )
   output_asm_insn( ";out output_commutative (+)", operands );

   return to_reg
   ? "MOVE  %0,%1\n\t%o3   %0,%2"
   : "MOVE  %%a,%1\n\t%o3  %%a,%2\n\tMOVE %0,%%a";
}

int page0_mem(rtx x);

/* -------------------------------------------------------------------------- */
/* Output a sequence of assembler instructions to perform a move.             */
/* Op0 is the destination, Op1 is the source.                                 */
/* -------------------------------------------------------------------------- */
const char* output_move(rtx insn, rtx *operands)
{
   enum machine_mode mode = GET_MODE(operands[0]);
   enum rtx_code code = GET_CODE(operands[1]);
   int size, i, ordered = 0;
   int fix_hi = 0, fix_lo = 0;
   rtx mem0[8], mem1[8];

   /* VC021216 : have to save i2*/
#if 1 /* VC021217 : use the best possible index*/
   rtx tmpFP[3];
   int tmpFPreg=2;
#else
   bool i2used = false;
#endif
   bool tempFPlives = true;   /* VC021216 : LATER: check if temp FP is dead and don't save/restore it*/
   bool i3changed=false;


   if (rtx_equal_p(operands[0], operands[1]))
      goto move_cleanup;
   if (mode == VOIDmode)
      mode = GET_MODE(operands[1]);
   size = GET_MODE_SIZE(mode) - 1;
   /* Detect move with big stack frames.  These must have been
   pre-arranged by prescan insn so that at most one of the operands
   is a far stack frame reference.  */

   if( pragma_output )
      output_asm_insn( ";in output_move", operands );

   for (i = 0; i < 2; i++)
   {
      if (GET_CODE(operands[i]) == MEM)
      {
         rtx tem = XEXP(operands[i], 0);
         if (GET_CODE(tem) == CONST)
         tem = XEXP(tem, 0);
         if (GET_CODE(tem) == PLUS)
         {
            rtx reg = XEXP(tem, 0);
            rtx off = XEXP(tem, 1);
            if (GET_CODE(off) == REG)
            {
               rtx t = reg;
               reg = off;
               off = t;
            }

#if 1 /* SC020614 SC020726 0 -> 1*/
            if( ( GET_CODE(reg) == REG )  && ( REGNO(reg) == HARD_SP_REG ) &&
                ( GET_CODE(off) == CONST_INT ) && ( (INTVAL(off) + size) > 255) )
            {
               /* Have to use a temporary frame pointer.  */
               int offset = INTVAL(off);
#if 1
               rtx ops[4];
#else
               rtx ops[2];
               rtx newop;
#endif

               /* check that offset is not larger than data space!!!*/
               fix_hi = offset >> 8;
               if (fix_hi > 255)
               /* No chance in this case...  */
               abort_with_insn(insn, "Stack frame larger than memory");



               {/* choose the index to use.*/
               /* first, try i2... */


#if 1          /* VC021216 : have to save i2*/
               /* VC021216 : may have to use i0 instead of i2 for big stack frames*/
#if 1
               bool tmpFPfound = false;

               while(tmpFPreg>=0 && !tmpFPfound)
               {
                  tmpFP[0] = gen_rtx(REG, HImode, RAM_IDX_0 + (tmpFPreg*2) );
                  /*if this operand is used in the other operand, use another one!*/
                  if(reg_overlap_mentioned_p(tmpFP[0], operands[1-i]))
                  tmpFPreg--;
                  else
                  tmpFPfound = true;
               }

               if(!tmpFPfound)
               abort_with_insn(insn,"\nbad move insn:\n an operand uses i0, i1 AND i2!!!\n");

#if 0 /*VC021217 : try to find one that we can modify...*/
               {
                  int bestFPreg = tmpFPreg;
                  if (bestFPreg==2) bestFPreg --;

                  while( (bestFPreg>=0) && (tempFPlives) )
                  {
                     rtx bestFP = gen_rtx(REG, HImode, RAM_IDX_0 + (bestFPreg*2) );
                     if (  (  (!dead_or_set_regno_p(insn, bestFPreg*2))
                     && (!dead_or_set_regno_p(insn, bestFPreg*2 + 1))
                     )
                     || reg_overlap_mentioned_p(bestFP, operands[1-i])
                     )
                     {
                        bestFPreg--;
                     }
                     else
                     {
                        tmpFPreg = bestFPreg;
                        tmpFP[0] = bestFP;
                        tempFPlives = false;
                     }
                  }
               }
#endif

               /*high part*/
               tmpFP[1] = gen_rtx(REG, QImode, RAM_IDX_0 + (tmpFPreg*2) );
               /*low part*/
               tmpFP[2] = gen_rtx(REG, QImode, RAM_IDX_0 + 1 + (tmpFPreg*2) );
#else
               /* VC021216 : may have to use i0 instead of i2 for big stack frames*/
               /*
               rtx i2 = gen_rtx(REG, QImode, RAM_IDX_2 );
               rtx newop = gen_rtx( MEM, mode, gen_rtx( REG, QImode, RAM_IDX_2 ) );

               check if i2 is used in the other operand
               i2used =
               (     GET_CODE(operands[1-i]) == MEM
               && reg_overlap_mentioned_p(i2, operands[1-i])
               )
               ||(   (GET_CODE(operands[1-i]) == REG)
               && (REGNO(operands[1-i]) <= RAM_IDX_2 + 1)
               && ((REGNO(operands[1-i]) + size ) >= RAM_IDX_2)
               )
               ;

               if i2 is already used, use i1 instead (both can't be used at the same time...)
               if(i2used)
               {
               newop = gen_rtx( MEM, mode, gen_rtx( REG, QImode, RAM_IDX_0 ) );
               }*/
#endif
            }

            /* LATER: check if temp FP is dead (i2 is never dead!)*/
            if(tempFPlives)
            {
               /*save the "temporary frame pointer"*/

               output_asm_insn(
               "MOVE  -(%%i3),%2\n\t"
               "MOVE  -(%%i3),%1\n\t"
               , tmpFP);


#if 1
               i3changed=true;

               /*VC021216 : check if i3 is used in the other operand...*/
               {

                  rtx opi3 = gen_rtx( REG, HImode, RAM_IDX_3 );
                  if(   (  GET_CODE(operands[1-i]) == MEM
                  && reg_overlap_mentioned_p(opi3, operands[1-i])
                  )
                  ||(   GET_CODE(operands[1-i]) == REG
                  && (REGNO(operands[1-i]) <= RAM_IDX_3 + 1)
                  && (REGNO(operands[1-i]) + size >= RAM_IDX_3)
                  )
                  )
                  {
#if 1
#if 1
                     if( (i==1) && (GET_CODE(operands[0]) == REG) )
                     abort_with_insn(insn,"reading stack pointer directly from stack...");
#endif
                     i3changed=false;
                     output_asm_insn(
                     "MOVE  %%a,(%%i3,2)+\n\t"
                     , operands);
#else /*VC021216 : LATER: debug this... keep i3 modified and update the other operand's offset.*/
                     rtx tem2 = XEXP(operands[1-i], 0);
                     if (GET_CODE(tem2) == PLUS)
                     {
                        rtx off2 = XEXP(tem2, 0);
                        int offset2;

                        if (GET_CODE(off2) == REG)
                        off2 = XEXP(tem2, 1);
                        offset2 = INTVAL(off2);


                        if(offset2+size+2 > 0xff)
                        {
                           i3changed=false;
                           output_asm_insn(
                           "MOVE  %%a,(%%i3,2)+\n\t"
                           , operands);
                        }
                        else
                        {
                           offset2+=2; /*i3 is 2 more than expected*/
                        }
                     }
#endif
                  }
               }

               if(i3changed)
               {
                  offset += 2;
               }
#endif
#endif
            }

            fix_lo = offset & 0xff;
            fix_hi = offset >> 8;
            ops[0] = gen_rtx(CONST_INT, VOIDmode, fix_lo);
            ops[1] = gen_rtx(CONST_INT, VOIDmode, fix_hi);
            ops[2] = tmpFP[1];
            ops[3] = tmpFP[2];

            if ( (fix_lo + size) > 255 )
            {
               /* Have to change both bytes of the stack pointer.  */

#if 1 /*SC020826*/
#if 1 /*VC021216 : may have to use i0 instead of i2 for big stack frames*/
#if 1 /*VC021217 : could use i0 or i1...*/
               output_asm_insn(
               "MOVE  %3,%%i3l\n\t"
               "MOVE  %2,%%i3h\n\t"
               "ADD  %3,%0\n\t"
               "ADDC %2,%1", ops);
               operands[i] = gen_rtx( MEM, mode, tmpFP[1] );
#else
               /*                  if(i2used)
               {
               output_asm_insn(
               "MOVE  i0l,i3l\n\t"
               "MOVE  i0h,i3h\n\t"
               "ADD  i0l,%0\n\t"
               "ADDC i0h,%1", ops);

               operands[i] = gen_rtx( MEM, mode, gen_rtx( REG, QImode, RAM_IDX_0 ) );
               }
               else
               {
               output_asm_insn(
               "MOVE  i2l,i3l\n\t"
               "MOVE  i2h,i3h\n\t"
               "ADD  i2l,%0\n\t"
               "ADDC i2h,%1", ops);

               operands[i] = gen_rtx( MEM, mode, gen_rtx( REG, QImode, RAM_IDX_2 ) );
               }

               operands[i] = gen_rtx( MEM, mode, tmpFP[0] );
               */
#endif
#endif

#else
               /*                  output_asm_insn("ADD  i3l,%0\n\t"
               "ADDC i3h,%1", ops);

               operands[i] = gen_rtx(MEM, mode, reg);*/
#endif
            }
            else
            {
#if 1 /*SC020826*/
               /*                  ops[0] = gen_rtx(CONST_INT, VOIDmode, fix_hi);*/
#if 1 /*VC021216 : may have to use i0 instead of i2 for big stack frames*/
#if 1 /*VC021217 : could use i0 or i1...*/
               output_asm_insn(
               "MOVE  %3,%%i3l\n\t"
               "MOVE  %2,%%i3h\n\t"
               "ADD  %2,%1\n\t", ops);
               operands[ i ] = gen_rtx( MEM, mode, gen_rtx( PLUS, Pmode, tmpFP[1], gen_rtx( CONST_INT, VOIDmode, fix_lo ) ) );
#else
               /*                  if(i2used)
               {
                                    rtx i2;
               output_asm_insn(
               "MOVE  i0l,i3l\n\t"
               "MOVE  i0h,i3h\n\t"
               "ADD  i0h,%0", ops);

               operands[ i ] = gen_rtx( MEM, mode, gen_rtx( PLUS, Pmode, gen_rtx( REG, QImode, RAM_IDX_0 ), gen_rtx( CONST_INT, VOIDmode, fix_lo ) ) );
               }
               else
               {
                                    rtx i2;
               output_asm_insn( "MOVE  i2l,i3l\n\t"
               "MOVE  i2h,i3h\n\t"
               "ADD  i2h,%0", ops);

               operands[ i ] = gen_rtx( MEM, mode, gen_rtx( PLUS, Pmode, gen_rtx( REG, QImode, RAM_IDX_2 ), gen_rtx( CONST_INT, VOIDmode, fix_lo ) ) );
               }
               */
#endif

#endif
#else
               /*                   Modify the high byte of the stack pointer.
               ops[0] = gen_rtx(CONST_INT, VOIDmode, fix_hi);
               output_asm_insn("ADD i3h,%0", ops);

               operands[i] = gen_rtx(MEM, mode,
               gen_rtx(PLUS, Pmode, reg,gen_rtx(CONST_INT,VOIDmode, offset)));*/
#endif
            }
            break;
         }
#endif
      }
   }
}

   if (GET_CODE(operands[0]) == REG)
   {
      rtx reg0[8];
   
      split_reg(operands[0], size, reg0);
   
      if( code == REG )
      {
         rtx reg1[8];
         if (REGNO(operands[0]) == REGNO(operands[1])) /* PMr - wipe out MOVE rx,rx ! Cf. op_in_accu_p bug !*/
         goto move_cleanup;
   
         split_reg(operands[1], size, reg1);
   
         if (REGNO(operands[0]) > REGNO(operands[1]))
         {
            for (i = size; i >= 0; i--)
            {
               rtx ops[2];
               ops[0] = reg0[i];
               ops[1] = reg1[i];
               output_asm_insn("MOVE   %0,%1", ops);
            }
            goto move_cleanup;
         }
   
         for (i = 0; i <= size; i++)
         {
            rtx ops[2];
            ops[0] = reg0[i];
            ops[1] = reg1[i];
            output_asm_insn("MOVE   %0,%1", ops);
         }
   
         goto move_cleanup;
      }
   
      /*VC020906 bug SI*/
      if (immediate_operand(operands[1], mode))
      {
         if( !( ( ( code == SYMBOL_REF || code == LABEL_REF || code == CONST ) && mode == HImode ) ||
             code == CONST_INT || code == CONST_DOUBLE ) )
         abort_with_insn(insn, "Bad immediate value");
      }
   
      {
         /* CI - fixme - Search for sequences of type "move reg,imm; move
         x,reg" where reg is dead after the second move. Transform these
         in a single "move x,imm", 'cause we might win a few
         instructions. */
         if ( code == SYMBOL_REF || code == LABEL_REF || code == CONST )
         {
            if(mode == HImode)
            {
               rtx ops[2];
               output_asm_insn("MOVE   %0,#HIWORD(%1)", operands);
               ops[0] = reg0[1], ops[1] = operands[1];
               output_asm_insn("MOVE   %0,#LOWORD(%1)", ops);
               
               if( pragma_output )
                  output_asm_insn( ";output_move (LH1)", ops );

               goto move_cleanup;
            }
         }
   
         if (code == CONST_INT || code == CONST_DOUBLE)
         {
            unsigned char val[8];
            c816_split_const(operands[1], size, val);
   
            for (i = size; i >= 0; i--)
            {
               rtx ops[2];
   
               ops[0] = reg0[i];
               ops[1] = gen_rtx(CONST_INT, VOIDmode, val[i]);
               output_asm_insn("MOVE   %0,%1", ops);
            }
            goto move_cleanup;
         }
      }
   
      if (code == HIGH || code == LO_SUM)
      {
         if (mode != QImode)
         abort_with_insn(insn, "Bad mode for this move");
         return "MOVE   %0,%1";
      }
   
      /* thus, operands[1] is a memory... */
      if (GET_CODE(XEXP(operands[1], 0)) == POST_INC)
      {
         rtx ops[2];
         ops[1] = operands[1];
   
         for (i = 0; i <= size; i++)
         {
            ops[0] = reg0[i];
            output_asm_insn("MOVE   %0,%1", ops);
         }
         goto move_cleanup;
      }
   
      if (GET_CODE(XEXP(operands[1], 0)) == PRE_DEC)
      {
         rtx ops[2];
         ops[1] = operands[1];
         for (i = size; i >= 0; i--)
         {
            ops[0] = reg0[i];
            output_asm_insn("MOVE   %0,%1", ops);
         }
         goto move_cleanup;
      }
   
      split_mem(operands[1], size, mem1);
   
      if (size > 0)
      {
         /* Check that we are not clobbering an index before being done
         using it.  */
         int nregs = find_regs_in_addr(XEXP(operands[1], 0), 0);
         int found = 0;
   
         for (i = 0; !found && i < nregs; i++)
         found = (REGNO(addr_regs[i]) >= REGNO(operands[0]) && REGNO(addr_regs[i]) <= REGNO(operands[0]) + size);
   
         if (found)
         {
            rtx ops[2];
            if (nregs > 1)
            abort_with_insn(insn, "This move has a strange memory address");
   
            /* Move stuff in the stack.  */
            /* CI - fixme - When the destination reg size is bigger than
            2, we could be smarter and move less things on the stack.  */
            for (i = 0; i < size; i++)
            {
               ops[0] = mem1[i];
               output_asm_insn("MOVE   %%a,%0\n\tMOVE -(%%sp,1),%%a", ops);
            }
   
            /* Move last byte directly.  */
            ops[0] = reg0[size];
            ops[1] = mem1[size];
            output_asm_insn("MOVE   %0,%1", ops);
   
            /* Retrieve stuff from the stack.  */
            for (i = size - 1; i >= 0; i--)
            {
               ops[0] = reg0[i];
               output_asm_insn("MOVE   %0,(%%sp,1)+", ops);
            }
            goto move_cleanup;
         }
      }
   
      for (i = size; i >= 0; i--)
      {
         rtx ops[2];
         ops[0] = reg0[i];
         ops[1] = mem1[i];
         output_asm_insn("MOVE   %0,%1", ops);
      }
   
      goto move_cleanup;
   }

   /* operands[0] is a memory... */
   if (code == HIGH || code == LO_SUM)
   {
      if (mode != QImode)
         abort_with_insn(insn, "Bad mode for this move");
      return "MOVE   %%a,%1\n\tMOVE %0,%%a";
   }
   
   if( GET_CODE(XEXP(operands[0], 0)) == POST_INC)
   {
      ordered = 1;
      for (i = 0; i <= size; i++)
         mem0[i] = operands[0];
   }
   else if (GET_CODE(XEXP(operands[0], 0)) == PRE_DEC)
   {
      ordered = -1;
      for (i = 0; i <= size; i++)
         mem0[i] = operands[0];
   }
   else
   {
/*
char buffer[512];
sprintf( buffer, "; Split => mem0, operands[0] : %s, size: %d", rtx_name[ GET_CODE( operands[0] ) ], size );
output_asm_insn( buffer, operands );
*/
      split_mem( operands[0], size, mem0 );
/*
sprintf( buffer, "; Splitted : %s", rtx_name[ GET_CODE( mem0[ 0 ] ) ] );
output_asm_insn( buffer, operands );
*/
   }
   
   {
      enum rtx_code code2 = GET_CODE(mem0[0]);
   
      if( code2 == CONST_INT )
      {
      }
   }
   
   if (code == REG)
   {
      rtx reg1[8];

      split_reg(operands[1], size, reg1);

      for (i = (ordered == -1) ? size : 0; (ordered == -1) ? i >= 0 : i <= size; (ordered == -1) ? i-- : i++)
      {
         rtx ops[2];
         ops[0] = mem0[i];
         ops[1] = reg1[i];
         output_asm_insn("MOVE   %0,%1", ops);
      }
      goto move_cleanup;
   }
   
   if (code == CONST_INT || code == CONST_DOUBLE)
   {
      unsigned char val[8];
      rtx_couple rc[8];
      c816_split_const(operands[1], size, val);
   
      if (ordered)
      {
         /* CI - fixme - By fiddling with offsets and post-incrementing
         * by different values, we could probably still try to sort the
         * constants.  */
         if (ordered == -1)
         {
            for (i = size; i >= 0; i--)
            {
               rtx ops[2];
               ops[0] = mem0[i];
               ops[1] = gen_rtx(CONST_INT, VOIDmode, val[i]);
   
               if (i < size && val[i] == val[i + 1])
               output_asm_insn("MOVE   %0,%%a", ops);
               else
               output_asm_insn("MOVE   %%a,%1\n\tMOVE %0,%%a", ops);
            }
         }
         else
         {
            for (i = 0; i <= size; i++)
            {
               rtx ops[2];
               ops[0] = mem0[i];
               ops[1] = gen_rtx(CONST_INT, VOIDmode, val[i]);
               if (i > 0 && val[i] == val[i - 1])
               output_asm_insn("MOVE   %0,%%a", ops);
               else
               output_asm_insn("MOVE   %%a,%1\n\tMOVE %0,%%a", ops);
            }
         }
   
         goto move_cleanup;
      }
   
      for (i = 0; i <= size; i++)
         rc[i].key = val[i], rc[i].elt = mem0[i];
   
      qsort(rc, size + 1, sizeof(rtx_couple), compare_rtx_couple);
   
      for (i = 0; i <= size; i++)
      {
         rtx ops[2];
         ops[0] = rc[i].elt;
         ops[1] = gen_rtx(CONST_INT, VOIDmode, rc[i].key);
   
         if (page0_mem(ops[0]))
            output_asm_insn("MOVE   %0,%1", ops);
         else if (i > 0 && rc[i].key == rc[i - 1].key)
            output_asm_insn("MOVE   %0,%%a", ops);
         else
            output_asm_insn("MOVE   %%a,%1\n\tMOVE %0,%%a", ops);
      }
      goto move_cleanup;
   }
   
   if ((code == SYMBOL_REF || code == LABEL_REF || code == CONST) && mode == HImode)
   {
      rtx ops[2];
      if (ordered == -1)
      {
         ops[0] = mem0[0], ops[1] = operands[1];
         output_asm_insn("MOVE   %%a,#LOWORD(%1)\n\tMOVE %0,%%a", ops);
         output_asm_insn("MOVE   %%a,#HIWORD(%1)\n\tMOVE %0,%%a", ops);
         
         if( pragma_output )
            output_asm_insn( ";output_move (LH2)", ops );
         goto move_cleanup;
      }
   
      ops[0] = mem0[0], ops[1] = operands[1];
      output_asm_insn("MOVE   %%a,#HIWORD(%1)\n\tMOVE %0,%%a", ops);
      ops[0] = mem0[1];
      output_asm_insn("MOVE   %%a,#LOWORD(%1)\n\tMOVE %0,%%a", ops);
      
      if( pragma_output )
         output_asm_insn( ";output_move (LH3)", ops );
      goto move_cleanup;
   }
   
   /* and operands[1] should also be a memory... */
   if (code != MEM)
      abort_with_insn(insn, "Bad move");
   
   if (GET_CODE(XEXP(operands[1], 0)) == POST_INC)
   {
output_asm_insn( "; POST_INC 1", operands );
      for (i = 0; i <= size; i++)
         mem1[i] = operands[1];
   }
   else if (GET_CODE(XEXP(operands[1], 0)) == PRE_DEC)
   {
      if (ordered == 1)
         abort_with_insn(insn, "Bad move with post-inc and pre-dec");
      ordered = -1;

      for (i = 0; i <= size; i++)
         mem1[i] = operands[1];
   }
   else
      split_mem(operands[1], size, mem1);
   
   for (i = (ordered == -1) ? size : 0; (ordered == -1) ? i >= 0 : i <= size; (ordered == -1) ? i-- : i++)
   {
char buffer[512];
      rtx ops[2];
      ops[0] = mem0[i];
      ops[1] = mem1[i];
sprintf( buffer, "; size: %d, ordered: %d, i: %d, name0: %s, name1: %s\n", size, ordered, i, rtx_name[ GET_CODE( mem0[0] ) ], rtx_name[ GET_CODE( mem1[0] ) ] );
output_asm_insn( buffer, operands );
      output_asm_insn("MOVE   %%a,%1\n\tMOVE %0,%%a", ops);

      if( pragma_output )
         output_asm_insn( "; classical output_move", operands );
   }

move_cleanup:
#if 1          /*VC021216 : have to restore i2*/
#if 1          /*VC021216 : could be i0 or i1...*/
if (  (fix_hi || fix_lo) && (tempFPlives))
{
   if(!i3changed)
      output_asm_insn( "MOVE  %%a,-(%%i3,2)\n\t" , operands);

   output_asm_insn( "MOVE  %1,(%%i3)+\n\t" "MOVE  %2,(%%i3)+\n\t" , tmpFP);

}

#else
if (fix_hi || fix_lo)
{
   /*VC021216 : may have to use i0 instead of i2 for big stack frames*/
   /*LATER : check if the temp frame pointer is dead...*/

   if(!i3changed)
      output_asm_insn( "MOVE  %%a,-(%%i3,2)\n\t" , operands);

   if(i2used)
   {
      output_asm_insn( "MOVE  %%i0h,(%%i3)+\n\t"
                       "MOVE  %%i0l,(%%i3)+\n\t", operands);
   }
   else
   {
      output_asm_insn(
      "MOVE  %%i2h,(%%i3)+\n\t"
      "MOVE  %%i2l,(%%i3)+\n\t"
      , operands);
   }
}
#endif
#else
/* Thanx to the i2 use, no need to restore i3. */
#if 0 /*SC020726*/
/* Restore correct stack pointer in some cases.  */
if (fix_hi || fix_lo) {
   rtx ops[2];
   if (!fix_lo) {
      /* Restore the high byte of the stack pointer.  */
      ops[0] = gen_rtx(CONST_INT, VOIDmode, fix_hi);
      output_asm_insn("SUBS   %%i3h,%0", ops);
   } else {
      /* Have to change both bytes of the stack pointer.  */
      ops[0] = gen_rtx(CONST_INT, VOIDmode, fix_lo);
      ops[1] = gen_rtx(CONST_INT, VOIDmode, fix_hi);
#if 1 /*SC020615*/
#else
      output_asm_insn("SUBS   %%i3l,%0\n\t" "SUBSC   %%i3h,%1", ops);
#endif
   }
}
#endif
#endif

   if( pragma_output )
      output_asm_insn( ";out output_move", operands );

   return "";
}

/* Output a sequence of assembler instructions for an addition
 * operator on 16+-bit (i.e., 16, 32, 64, ...) integers. Op0 is the
 * destination, Op1 and Op2 are the operands.  */
const char* output_add_wide(rtx insn, rtx *operands);
const char* output_add_wide(rtx insn, rtx *operands)
{
   enum machine_mode mode = GET_MODE(operands[0]);
   int size = GET_MODE_SIZE(mode) - 1, i;
   int to_mem = GET_CODE(operands[0]) != REG;
   int is_reg, is_dead, same_reg;
   int delay_clobber = 0, delay_clobber2 = 0;
   rtx op0[8], op1[8], op2[8], saved[8], ops[3];

   if( pragma_output )
      output_asm_insn( ";in output_add_wide", operands );

   split_any(operands[0], size, op0);

   if (GET_CODE(operands[1]) == LABEL_REF || GET_CODE(operands[1]) == SYMBOL_REF || GET_CODE(operands[1]) == CONST)
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   if (GET_CODE(operands[1]) == CONST_INT)
   {
      rtx tem = operands[1];
      if (GET_CODE(operands[2]) == CONST_INT)
      {
         /* Yet more stupid cases...  */
         operands[1] = gen_rtx(CONST_INT, VOIDmode,INTVAL(operands[1]) + INTVAL(operands[2]));
         return output_move(insn, operands);
      }

      if (GET_CODE(operands[2]) == LABEL_REF || GET_CODE(operands[2]) == SYMBOL_REF || GET_CODE(operands[2]) == CONST)
      {
         operands[1] = modif_address(operands[2], -1, INTVAL(operands[1]));
         return output_move(insn, operands);
      }

      operands[1] = operands[2];
      operands[2] = tem;
   }

   if (GET_CODE(operands[2]) == REG)
   {
      rtx tem = operands[1];

      if (GET_CODE(operands[1]) == REG)
      {
         split_reg(operands[1], size, op1);
         split_reg(operands[2], size, op2);
         ops[0] = op0[size];
         ops[1] = op1[size];
         ops[2] = op2[size];

         output_asm_insn(to_mem ? "ADD   %%a,%1,%2\n\tMOVE %0,%%a" : "ADD   %0,%1,%2", ops);

         for (i = size - 1; i > 0; i--)
         {
            ops[0] = op0[i];
            ops[1] = op1[i];
            ops[2] = op2[i];

            output_asm_insn(to_mem ? "ADDC  %%a,%1,%2\n\tMOVE %0,%%a" : "ADDC  %0,%1,%2", ops);
         }

         if( pragma_output )
            output_asm_insn( ";out output_add_wide (+)", operands );

         return to_mem ? "ADDC  %%a,%1,%2\n\tMOVE %0,%%a" : "ADDC  %0,%1,%2";
      }

      operands[1] = operands[2];
      operands[2] = tem;
   }

   if (!to_mem && (GET_CODE(operands[1]) == MEM || GET_CODE(operands[2]) == MEM))
   {
      /* Check that we are not clobbering an index before being done using it.  */
      delay_clobber = (GET_CODE(operands[1]) == MEM && reg_overlap_mentioned_p(operands[0], operands[1]));
      delay_clobber2 = (GET_CODE(operands[2]) == MEM && reg_overlap_mentioned_p(operands[0], operands[2]));

      if (delay_clobber2 && !delay_clobber)
      {
         rtx tem = operands[1];
         operands[1] = operands[2];
         operands[2] = tem;
         delay_clobber = 1, delay_clobber2 = 0;
      }
   }

   is_reg   = GET_CODE(operands[1]) == REG;
   is_dead  = is_reg && part_dead_or_set_p(insn, operands[1]);
   same_reg = is_reg && !to_mem && (REGNO(operands[0]) == REGNO(operands[1]));

   if (is_dead && GET_CODE(operands[2]) == MEM)
   {
      int nregs = find_regs_in_addr(XEXP(operands[2], 0), 0);

      for (i = 0; is_dead && i < nregs; i++)
         is_dead = REGNO(addr_regs[i]) != REGNO(operands[1]);
   }

   if (delay_clobber)
   {
      /* We have something that looks like (reg ix) = (mem (reg ix)) +
      Y.  Y might be in the first part of the __spill area, but the
      rest of __spill is free.  We avoid pushing things on the stack,
      as Y might use the stack pointer.  */
      if (spill_rtx[0] == NULL)
      {
         spill_rtx[0] = gen_rtx(SYMBOL_REF, Pmode, spill_name);
         SYMBOL_REF_FLAG(spill_rtx[0]) = 1;
      }

      for (i = size; i > 0; i--)
      {
         saved[i] = op0[i];
         op0[i] = gen_rtx(MEM, QImode, gen_rtx(PLUS, Pmode, spill_rtx[0], gen_rtx(CONST_INT, VOIDmode, i + 3)));
      }
   }

   split_any(operands[1], size, op1);

   if (GET_CODE(operands[2]) == CONST_INT)
   {
      unsigned char val[8];
      int was_zero = 1;
      c816_split_const(operands[2], size, val);

      /*SC040315*/
      if( size == 1 )
      {
         if( ( REGNO( op0[ 0 ] ) == REGNO( op1[ 1 ] ) ) || ( REGNO( op0[ 1 ] ) == REGNO( op1[ 0 ] ) ) )
         {
            output_move( insn, operands );

            operands[ 1 ] = operands[ 0 ];

            output_asm_insn(output_add_wide(insn, operands), operands);

            return "";
         }
      }

      for (i = size; i >= 0; i--)
      {
         ops[0] = op0[i];
         ops[1] = op1[i];

         if (was_zero)
         {
            was_zero = (val[i] == 0);
            if (val[i] == 0)
            {
               if (!same_reg)
                  output_asm_insn( (to_mem || (delay_clobber && i > 0)) && !is_reg ?
                                   "MOVE  %%a,%1\n\tMOVE %0,%%a" : "MOVE  %0,%1", ops);
            }
            else if (val[i] == 1)
               output_asm_insn((to_mem || (delay_clobber && i > 0)) ? "INC   %%a,%1\n\tMOVE %0,%%a" : "INC   %0,%1", ops);
            else if (val[i] == 0xff)
               output_asm_insn((to_mem || (delay_clobber && i > 0)) ? "DEC   %%a,%1\n\tMOVE %0,%%a" : "DEC   %0,%1", ops);
            else
            {
               ops[2] = gen_rtx(CONST_INT, VOIDmode, val[i]);

               if (same_reg)
                  output_asm_insn("ADD %0,%2", ops);
               else
                  output_asm_insn((to_mem || (delay_clobber && i > 0)) ? (is_dead ?
                  "ADD   %1,%2\n\tMOVE  %0,%1" :
                  "MOVE  %%a,%1\n\tADD  %%a,%2\n\tMOVE %0,%%a") :
                  "MOVE  %0,%1\n\tADD   %0,%2", ops);
            }
         }
         else
         {
            if (val[i] == 0)
               output_asm_insn((to_mem || (delay_clobber && i > 0)) ? "INCC  %%a,%1\n\tMOVE %0,%%a" : "INCC  %0,%1", ops);
            else if (val[i] == 0xff)
               output_asm_insn((to_mem || (delay_clobber && i > 0)) ? "DECC  %%a,%1\n\tMOVE %0,%%a" : "DECC  %0,%1", ops);
            else
            {
               ops[2] = gen_rtx(CONST_INT, VOIDmode, val[i]);

               if (!same_reg)
                  output_asm_insn((to_mem || (delay_clobber && i > 0)) ? (is_dead ?
                  "ADDC  %1,%2\n\tMOVE  %0,%1" :
                  "MOVE  %%a,%1\n\tADDC %%a,%2\n\tMOVE %0,%%a") :
                  "MOVE  %0,%1\n\tADDC  %0,%2", ops);
               else
                  output_asm_insn("ADDC   %0,%2", ops);
            }
         }
      }

      if (delay_clobber)
      {
         /* Retrieve result from the spill area.  */
         for (i = 1; i <= size; i++)
         {
            ops[0] = saved[i];
            ops[1] = op0[i];
            output_asm_insn("MOVE   %0,%1", ops);
         }
      }

      if( pragma_output )
         output_asm_insn( ";out output_add_wide", operands );
      return "";
   }

   if (GET_CODE(operands[2]) == LABEL_REF || GET_CODE(operands[2]) == SYMBOL_REF || GET_CODE(operands[2]) == CONST)
   {
      ops[0] = op0[size];
      ops[1] = op1[size];
      ops[2] = operands[2];

      output_asm_insn((to_mem || delay_clobber)
      ? (is_dead
      ? "ADD   %1,#LOWORD(%2)\n\tMOVE  %0,%1"
      : "MOVE  %%a,%1\n\tADD  %%a,#LOWORD(%2)\n\tMOVE %0,%%a")
      : (same_reg
      ? "ADD   %0,#LOWORD(%2)"
      : "MOVE  %0,%1\n\tADD   %0,#LOWORD(%2)"), ops);

      ops[0] = op0[0];
      ops[1] = op1[0];

      output_asm_insn(to_mem
      ? (is_dead
      ? "ADDC  %1,#HIWORD(%2)\n\tMOVE  %0,%1"
      : "MOVE  %%a,%1\n\tADDC %%a,#HIWORD(%2)\n\tMOVE %0,%%a")
      : (same_reg
      ? "ADDC  %0,#HIWORD(%2)"
      : "MOVE  %0,%1\n\tADDC  %0,#HIWORD(%2)"), ops);

      if (delay_clobber)
      {
         /* Retrieve result from the spill area.  */
         ops[0] = saved[1];
         ops[1] = op0[1];
         output_asm_insn("MOVE   %0,%1", ops);
      }

      if( pragma_output )
         output_asm_insn( ";out output_add_wide", operands );

      return "";
   }

   /*VC030225 : in case operands[0] and operands[1] share some regs (but not all of them)...*/
   if(!(to_mem || delay_clobber || same_reg))
   {
      /*put operand 1 in operand 0 BEFORE AND NOT WHILE adding operand 2 to operand 0*/
      output_asm_insn(output_move(insn, operands), operands);
      same_reg = 1;
   }

   /* operands[2] might not be a MEM if we have a delay_clobber.  */
   split_any(operands[2], size, op2);
   ops[0] = op0[size];
   ops[1] = op1[size];
   ops[2] = op2[size];

   output_asm_insn((to_mem || delay_clobber)
   ? (is_dead
   ? "ADD   %1,%2\n\tMOVE  %0,%1"
   : "MOVE  %%a,%1\n\tADD  %%a,%2\n\tMOVE %0,%%a")
   : (same_reg
   ? "ADD   %0,%2"
   : "MOVE  %0,%1\n\tADD   %0,%2"), ops);

   for (i = size - 1; i >= 0; i--)
   {
      ops[0] = op0[i];
      ops[1] = op1[i];
      ops[2] = op2[i];
      output_asm_insn((to_mem || (delay_clobber && (i > 0 || delay_clobber2)))
      ? (is_dead
      ? "ADDC  %1,%2\n\tMOVE  %0,%1"
      : "MOVE  %%a,%1\n\tADDC %%a,%2\n\tMOVE %0,%%a")
      : (same_reg
      ? "ADDC  %0,%2"
      : "MOVE  %0,%1\n\tADDC  %0,%2"), ops);
   }

   if (delay_clobber)
   {
      /* Retrieve result from the spill area.  */
      for (i = 1; i <= size; i++)
      {
         ops[0] = saved[i];
         ops[1] = op0[i];
         output_asm_insn("MOVE   %0,%1", ops);
      }
   }

   if( pragma_output )
      output_asm_insn( ";out output_add_wide", operands );

   return "";
}

/* Output a sequence of assembler instructions for a subtraction
* operator on 8+-bit (i.e., 8, 16, 32, 64, ...) integers. Op0 is the
* destination, Op1 and Op2 are the operands.  */
const char* output_sub_wide(rtx insn, rtx *operands);
const char* output_sub_wide(rtx insn, rtx *operands)
{
   enum machine_mode mode = GET_MODE(operands[0]);
   int size = GET_MODE_SIZE(mode) - 1, i;
   int to_mem = GET_CODE(operands[0]) != REG;
   int is_reg1 = GET_CODE(operands[1]) == REG;
   int is_reg2 = GET_CODE(operands[2]) == REG;
   int is_dead = 0, same_reg = 0;
   rtx op0[8], op1[8], op2[8], ops[3];

   if( pragma_output )
   output_asm_insn( ";in output_sub_wide", operands );

   split_any(operands[0], size, op0);
   if (GET_CODE(operands[1]) == CONST_INT) {
      unsigned char val[8];
      if (GET_CODE(operands[2]) == CONST_INT) {
         /* Stupid case, but arises... sigh.  */
         operands[1] = gen_rtx(CONST_INT, VOIDmode,
         INTVAL(operands[1]) - INTVAL(operands[2]));
         return output_move(insn, operands);
      }
      same_reg = is_reg2 && !to_mem && (REGNO(operands[2])
      == REGNO(operands[0]));
      is_dead = is_reg2 && part_dead_or_set_p(insn, operands[2]);
      if (is_reg2 && !same_reg && !is_dead && mode == QImode) {
         is_dead = op_in_accu_p(operands[2], insn);
         if (is_dead)
         operands[2] = gen_rtx(REG, QImode, ACCU_REG);
      }
      c816_split_const(operands[1], size, val);
      split_any(operands[2], size, op2);
      ops[0] = op0[size];
      ops[2] = op2[size];
#if 0 /* CI */
      /* This does not work.  Maybe there is a way, but have to look
      closely at what the assembler and linker support.  */
      if (GET_CODE(op2[0]) == HIGH) {
         /* Handle special case #<const> - #<symbol>.  */
         /* Have to do it this way, since the assembler doesn't like
         subtractions too much.  */
         char s[32];
         ops[2] = XEXP(op2[0], 0);
         sprintf(s, "MOVE  %%0,#LOWORD(~%%2+%d)", val[size] + 1);
         output_asm_insn(s, ops);
         ops[0] = op0[0];
         sprintf(s, "MOVE  %%0,#HIWORD(~%%2+%d)", val[0] + 1);
         output_asm_insn(s, ops);
         return "";
      }
#endif /* 0 CI */
      if (val[size] == 0 && GET_CODE(op2[0]) != HIGH)
      output_asm_insn(to_mem
      ? "CPL2  %%a,%2\n\tMOVE %0,%%a"
      : "CPL2  %0,%2", ops);
      else {
         ops[1] = gen_rtx(CONST_INT, VOIDmode, val[size]);
         output_asm_insn(to_mem
         ? (is_dead
         ? "SUBD  %2,%1\n\tMOVE  %0,%2"
         : (is_reg2
         ? "CMP   %2,%1\n\tMOVE  %0,%%a"
         : "MOVE  %%a,%2\n\tSUBD %%a,%1\n\tMOVE %0,%%a"))
         : (same_reg
         ? "SUBD  %0,%1"
         : "MOVE  %0,%2\n\tSUBD  %0,%1"), ops);
      }
      for (i = size - 1; i >= 0; i--) {
         ops[0] = op0[i];
         ops[2] = op2[i];
         if (val[i] == 0 && GET_CODE(op2[0]) != HIGH)
         output_asm_insn(to_mem
         ? "CPL2C %%a,%2\n\tMOVE %0,%%a"
         : "CPL2C %0,%2", ops);
         else {
            ops[1] = gen_rtx(CONST_INT, VOIDmode, val[i]);
            output_asm_insn(to_mem
            ? (is_dead
            ? "SUBDC %2,%1\n\tMOVE  %0,%2"
            : "MOVE  %%a,%2\n\tSUBDC   %%a,%1\n\tMOVE %0,%%a")
            : (same_reg
            ? "SUBDC %0,%1"
            : "MOVE  %0,%2\n\tSUBDC %0,%1"), ops);
         }
      }
      return "";
   }
   if (GET_CODE(operands[1]) == REG
   && GET_CODE(operands[2]) == REG) {
      split_reg(operands[1], size, op1);
      split_reg(operands[2], size, op2);
      ops[0] = op0[size];
      ops[1] = op1[size];
      ops[2] = op2[size];
      output_asm_insn(to_mem
      ? "SUBD  %%a,%1,%2\n\tMOVE %0,%%a"
      : "SUBD  %0,%1,%2", ops);
      for (i = size - 1; i >= 0; i--) {
         ops[0] = op0[i];
         ops[1] = op1[i];
         ops[2] = op2[i];
         output_asm_insn(to_mem
         ? "SUBDC %%a,%1,%2\n\tMOVE %0,%%a"
         : "SUBDC %0,%1,%2", ops);
      }
      return "";
   }
   split_any(operands[1], size, op1);
   split_any(operands[2], size, op2);
   is_dead = ((is_reg1
   && (REGNO(operands[1]) == ACCU_REG
   || part_dead_or_set_p(insn, operands[1])))
   || (is_reg2
   && (REGNO(operands[2]) == ACCU_REG
   || part_dead_or_set_p(insn, operands[2]))));
   same_reg = !to_mem && ((is_reg1 && (REGNO(operands[1])
   == REGNO(operands[0])))
   || (is_reg2 && (REGNO(operands[2])
   == REGNO(operands[0]))));
   if (is_reg1 && !same_reg && !is_dead && mode == QImode) {
      is_dead = op_in_accu_p(operands[1], insn);
      if (is_dead)
      operands[1] = gen_rtx(REG, QImode, ACCU_REG);
   }
   if (is_reg2 && !same_reg && !is_dead && mode == QImode) {
      is_dead = op_in_accu_p(operands[2], insn);
      if (is_dead)
      operands[2] = gen_rtx(REG, QImode, ACCU_REG);
   }
   ops[0] = op0[size];
   ops[1] = op1[size];
   ops[2] = op2[size];
   output_asm_insn(to_mem
   ? (is_reg1
   ? (is_dead
   ? "SUBS  %1,%2\n\tMOVE  %0,%1"
   : "MOVE  %%a,%1\n\tSUBS %%a,%2\n\tMOVE %0,%%a")
   : (is_reg2
   ? "CMP   %2,%1\n\tMOVE  %0,%%a"
   : "MOVE  %%a,%1\n\tSUBS %%a,%2\n\tMOVE %0,%%a"))
   : (is_reg1
   ? (same_reg
   ? "SUBS  %0,%2"
   : "MOVE  %0,%1\n\tSUBS  %0,%2")
   : (is_reg2
   ? (same_reg
   ? "SUBD  %0,%1"
   : "CMP   %2,%1\n\tMOVE  %0,%%a")
   : "MOVE  %0,%1\n\tSUBS  %0,%2")), ops);
   for (i = size - 1; i >= 0; i--) {
      ops[0] = op0[i];
      ops[1] = op1[i];
      ops[2] = op2[i];
      output_asm_insn(to_mem
      ? (is_reg1
      ? (is_dead
      ? "SUBSC %1,%2\n\tMOVE  %0,%1"
      : "MOVE  %%a,%1\n\tSUBSC   %%a,%2\n\tMOVE %0,%%a")
      : (is_reg2 && is_dead
      ? "SUBDC %2,%1\n\tMOVE  %0,%2"
      : "MOVE  %%a,%1\n\tSUBSC   %%a,%2\n\tMOVE %0,%%a"))
      : (is_reg1
      ? (same_reg
      ? "SUBSC %0,%2"
      : "MOVE  %0,%1\n\tSUBSC %0,%2")
      : (is_reg2
      ? (same_reg
      ? "SUBDC %0,%1"
      : "MOVE  %0,%1\n\tSUBSC %0,%2")
      : "MOVE  %0,%1\n\tSUBSC %0,%2")), ops);
   }
   return "";
}

/* Return true if the 16-bit value in regno is immediately truncated
* to 8 bits and the high-order bits are never used.  */
int only_use_trunc_p(rtx insn, rtx op)
{
   rtx nexti = next_nnote_nclob_insn(insn);
   rtx body;
   rtx r_part = gen_rtx(REG, QImode, REGNO(op) + 1);
   while (nexti && GET_CODE(nexti) == INSN) {
      body = PATTERN(nexti);
      if (!trunc_if_used_p(body, REGNO(op)))
      return 0;
      /* Check that the register is actually used if it is marked dead.
      This is because the reload pass does not preserve completely
      accurate REG_DEAD notes.  */
      if ((part_dead_or_set_p(nexti, op)
      && reg_mentioned_p(op, body))
      || (part_dead_or_set_p(nexti, r_part)
      && reg_mentioned_p(r_part, body)))
      return 1;
      nexti = next_nnote_nclob_insn(nexti);
   }
   return 0;
}

/* Output a sequence of assembler instructions for an operand
 * extension. Op0 is the destination, Op1 is the source.  */
const char* output_extend(rtx insn, rtx *operands, int signed_p);
const char* output_extend(rtx insn, rtx *operands, int signed_p)
{
   enum machine_mode mode = GET_MODE(operands[0]);
   int is_reg = GET_CODE(operands[0]) == REG;
   rtx ops[2];

   if( pragma_output )
      output_asm_insn( ";in output_extend", operands );

   if (GET_CODE(operands[1]) == CONST_INT)
   /* Strange, but happens...  */
   return output_move(insn, operands);

   if (GET_MODE(operands[1]) == QImode)
   {
      rtx op0[8];
      int size = GET_MODE_SIZE(mode) - 1;
      split_any(operands[0], size, op0);
      ops[0] = op0[size], ops[1] = operands[1];
      output_asm_insn(output_move(insn, ops), ops);
      ops[0] = op0[size - 1];

      if (is_reg && size == 1 && only_use_trunc_p(insn, operands[0]))
      {
         if( pragma_output )
            output_asm_insn( ";out output_extend (nothing to do)", operands );

         return "";
      }

      if (signed_p) {
         if (is_reg) {
            ops[1] = op0[size];
            if (!is_reg
            || GET_CODE(operands[1]) != REG
            || REGNO(ops[0]) != REGNO(operands[1]))
            output_asm_insn(output_move(insn, ops), ops);
            output_asm_insn("MULA   %0,#1", ops);
            if (size == 3)
            output_asm_insn("MOVE   %1,%2\n\tMOVE  %0,%2", op0);
            return "";
         }
         if (GET_CODE(operands[1]) == REG
         && part_dead_or_set_p(insn, operands[1])) {
            output_asm_insn("MULA   %1,#1", operands);
            output_asm_insn(output_move(insn, ops), ops);
            op0[2] = operands[1];
            if (size == 3)
            output_asm_insn("MOVE   %1,%2\n\tMOVE  %0,%2", op0);
            return "";
         }
         if (GET_CODE(operands[1]) == REG)
         output_asm_insn("MOVE   %%a,%1", operands);
         output_asm_insn("AND %%a,#0x80\n\t"
         "JZS  .Lex%=\n\t"
         "MOVE %%a,#0xff\n"
         ".Lex%=:\n\t"
         "MOVE %0,%%a", ops);
         if (size == 3)
         output_asm_insn("MOVE   %1,%%a\n\tMOVE %0,%%a", op0);
         return "";
      }
      ops[1] = const0_rtx;
      output_asm_insn(output_move(insn, ops), ops);
      if (size == 3) {
         if (page0_mem(ops[0]))
         output_asm_insn("MOVE   %1,#0\n\tMOVE  %0,#0", op0);
         else
         output_asm_insn("MOVE   %1,%%a\n\tMOVE %0,%%a", op0);
      }
      return "";
   }
   if (mode == SImode) {
      rtx op0[4];
      split_any(operands[0], 3, op0);
      if (is_reg && GET_CODE(operands[1]) == MEM) {
         /* We use output_move here, since it knows how to deal with
         the potential clobbering of index registers.  */
         ops[0] = gen_rtx(REG, HImode, REGNO(op0[2]));
         ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
      } else {
         rtx op1[2];
         split_any(operands[1], 1, op1);
         ops[0] = op0[3], ops[1] = op1[1];
         output_asm_insn(output_move(insn, ops), ops);
         ops[0] = op0[2], ops[1] = op1[0];
         output_asm_insn(output_move(insn, ops), ops);
      }
      if (signed_p) {
         if (is_reg) {
            ops[0] = op0[1], ops[1] = op0[2];
            output_asm_insn(output_move(insn, ops), ops);
            output_asm_insn("MULA   %0,#1", ops);
            ops[1] = op0[0];
            output_asm_insn("MOVE   %1,%0", ops);
            return "";
         }
         if (GET_CODE(operands[1]) == REG
         && REGNO(operands[1]) != ACCU_REG
         && part_dead_or_set_p(insn, operands[1])) {
            output_asm_insn("MULA   %1,#1", ops);
            ops[0] = op0[1];
            output_asm_insn(output_move(insn, ops), ops);
            ops[0] = op0[0];
            output_asm_insn(output_move(insn, ops), ops);
            return "";
         }
         if (GET_CODE(operands[1]) == REG)
         output_asm_insn("MOVE   %%a,%1", ops);
         output_asm_insn("AND %%a,#0x80\n\t"
         "JZS  .Lex%=\n\t"
         "MOVE %%a,#0xff\n"
         ".Lex%=:\n\t"
         "MOVE %1,%%a\n\t"
         "MOVE %0,%%a", op0);
         return "";
      }
      ops[0] = gen_rtx(GET_CODE(operands[0]), HImode, XEXP(operands[0], 0)),
      ops[1] = const0_rtx;
      output_asm_insn(output_move(insn, ops), ops);
      return "";
   }
   if (mode == SFmode) {
      rtx op0[4];
      ops[0] = gen_rtx(GET_CODE(operands[0]), TQFmode, XEXP(operands[0], 0)); /*c816 momo*/
      ops[1] = operands[1];
      output_asm_insn(output_move(insn, ops), ops);
      split_any(operands[0], 3, op0);
      ops[0] = op0[3], ops[1] = const0_rtx;
      output_asm_insn(output_move(insn, ops), ops);
      return "";
   }
   abort_with_insn(insn, "Unknown extension");
   return "";
}

/* Output a sequence of assembler instructions to call a library
 * routine. n_par_r is the number of operands to pass in registers and
 * n_par_s is the number of operands to pass in the stack for the
 * routine.  commutative is true if operands[1] and operands[2] can be
 * swapped.  Pop the stack, as the library routines do not do it
 * themselves.  Do not emit a call if no_call is true (i.e., only do
 * parameters setup).  Use r1:r0 as parameter if alt_reg is true.
 * Negate the second argument (a floating point value) when fsub is
 * true.  */
const char* output_libcall(rtx insn, rtx *operands, int n_par_r, int n_par_s,
                           int commutative, const char *_template, int fsub, int no_call,
                           int alt_reg)
{
   enum machine_mode mode = GET_MODE(operands[1]);
   int size = GET_MODE_SIZE(mode), offset = 0;
   rtx ops[2];
   int nregs, found, i, curop = n_par_r + 1, rem_s = n_par_s;
   char s[256];

   if( pragma_output )
      output_asm_insn( ";in output_libcall", operands );

   if (fsub)
      fsub = 2;

   if (mode == VOIDmode)
   {
      mode = GET_MODE(operands[2]);
      size = GET_MODE_SIZE(mode);
   }

   if ((commutative || fsub)
   && ((GET_CODE(operands[2]) == REG
   && REGNO(operands[2]) == REG_0)
   || (GET_CODE(operands[1]) == REG
   && REGNO(operands[1]) != REG_0
   && GET_CODE(operands[2]) == MEM))) 
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
      if (fsub)
         fsub = 1;
   }

   if (n_par_s > 1 && commutative && use_large_frame(operands[2], (size << 1) - 1))
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   while (rem_s > 0)
   {
      offset += size;
      found = 0;

      if (GET_CODE(operands[curop]) == MEM)
      {
         nregs = find_regs_in_addr(XEXP(operands[curop], 0), 0);
      
         for (i = 0; !found && i < nregs; i++)
            found = REGNO(addr_regs[i]) == HARD_SP_REG;

         if (found)
         {
            ops[0] = modif_mem_address(operands[curop], QImode, HARD_SP_REG, offset - 1);
            for (i = size - 1; i >= 0; i--)
               if (fsub == curop && i == 1)
                  output_asm_insn("MOVE   %%a,%0\n\t" "INVB %%a,#7\n\t" "MOVE -(%%sp),%%a", ops);
               else
                  output_asm_insn("MOVE   %%a,%0\n\t" "MOVE -(%%sp),%%a", ops);
         }
      }

      if (!found)
      {
         rtx part[8];
         split_any(operands[curop], size - 1, part);

         if (GET_CODE(operands[curop]) == REG)
            strcpy(s, "MOVE   -(%%sp),%0");
         else
            strcpy(s, "MOVE   %%a,%0\n\tMOVE -(%%sp),%%a");

         for (i = size - 1; i >= 0; i--)
         {
            ops[0] = part[i];
            if (fsub == curop && i == 1)
            {
               if (GET_CODE(operands[curop]) == REG
               && (REGNO(operands[curop]) == REG_0
               || part_dead_or_set_p(insn, operands[curop])))
                  output_asm_insn("INVB   %0,#7\n\t" "MOVE -(%%sp),%0", ops);
               else
                  output_asm_insn("MOVE   %%a,%0\n\t" "INVB %%a,#7\n\t" "MOVE -(%%sp),%%a", ops);
            }
            else
               output_asm_insn(s, ops);
         }
      }

      rem_s -= 1;
      curop += 1;
   }

   if (n_par_r > 0)
   {
      if (GET_CODE(operands[1]) == MEM)
      {
         nregs = find_regs_in_addr(XEXP(operands[1], 0), 0);
         for (found = 0, i = 0; !found && i < nregs; i++)
            found = REGNO(addr_regs[i]) == HARD_SP_REG;
         if (found)
            operands[1] = modif_mem_address(operands[1], GET_MODE(operands[1]), HARD_SP_REG, offset);
      }

      if (n_par_r > 1)
      {
         if (n_par_r > 2)
            abort_with_insn(insn, "Too many parameters in registers (%d)", n_par_r);
         if (size != 2)
            abort_with_insn(insn, "Unimplemented two parameters of size %d", size);

         if (GET_CODE(operands[1]) == REG
         && (REGNO(operands[1]) == REG_0
         || REGNO(operands[1]) == REG_2))
         {
            if (GET_CODE(operands[2]) == REG
            && (REGNO(operands[2]) == REG_0
            || REGNO(operands[2]) == REG_2))
            {
               if (REGNO(operands[2]) == REG_0)
               {
                  if (REGNO(operands[1]) != REG_2)
                  {
                     ops[0] = gen_rtx(REG, HImode, REG_2), ops[1] = operands[1];
                     output_asm_insn(output_move(insn, ops), ops);
                  }
               }
               else
               {
                  if (REGNO(operands[1]) != REG_0)
                  {
                     ops[0] = gen_rtx(REG, HImode, REG_0), ops[1] = operands[1];
                     output_asm_insn(output_move(insn, ops), ops);
                  }
               }
            }
            else
            {
               if (REGNO(operands[1]) == REG_0)
               {
                  ops[0] = gen_rtx(REG, HImode, REG_2), ops[1] = operands[2];
                  output_asm_insn(output_move(insn, ops), ops);
               }
               else
               {
                  ops[0] = gen_rtx(REG, HImode, REG_0), ops[1] = operands[2];
                  output_asm_insn(output_move(insn, ops), ops);
               }
            }
         }
         else if (GET_CODE(operands[2]) == REG && (REGNO(operands[2]) == REG_0 || REGNO(operands[2]) == REG_2))
         {
            if (REGNO(operands[2]) == REG_0)
            {
               ops[0] = gen_rtx(REG, HImode, REG_2), ops[1] = operands[1];
               output_asm_insn(output_move(insn, ops), ops);
            }
            else
            {
               ops[0] = gen_rtx(REG, HImode, REG_0), ops[1] = operands[1];
               output_asm_insn(output_move(insn, ops), ops);
            }
         }
         else
         {
            ops[0] = gen_rtx(REG, HImode, REG_0), ops[1] = operands[1];
            output_asm_insn(output_move(insn, ops), ops);
            ops[0] = gen_rtx(REG, HImode, REG_2), ops[1] = operands[2];
            output_asm_insn(output_move(insn, ops), ops);
         }
      }
      else
      {
         if (alt_reg)
            ops[0] = gen_rtx(REG, mode, mode == QImode ? REG_3 : REG_2);
         else
            ops[0] = gen_rtx(REG, mode, REG_0);
         ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
         if (fsub == 1)
         {
            ops[0] = gen_rtx(REG, QImode, REG_1);
            output_asm_insn("INVB   %0,#7", ops);
         }
      }
   }

   if (!no_call)
   {
      sprintf( s, "%s   %s", TARGET_SOFTLIB ? "CALLS" : "CALL", _template );
      output_asm_insn(s, operands);

      if( (n_par_s > 0) &&
          (strcmp(_template, "divmodsi4") != 0) && (strcmp(_template, "udivmodsi4") != 0))
      {

         /* divmodsi4 and udivmodsi4 are exceptions because they return some result on the stack.
         * A nicer/better way would be to add a "nopop" parameter to output_libcall, and
         * set it appropriately when the function is called. (pvt/cis) */

         sprintf(s, "MOVE  %%%%a,(%%%%i3,%d)+", n_par_s * size);
         output_asm_insn(s, operands);
      }
   }

   if( pragma_output )
      output_asm_insn( ";out output_libcall", operands );

   return "";
}

/* Output a sequence of assembler instructions to perform the
* floating-point negation of Op1 and put the result in Op0.  */
const char* output_fneg(rtx insn, rtx *operands);
const char* output_fneg(rtx insn, rtx *operands)
{
   rtx op0[8], op1[8];
   int size = GET_MODE_SIZE(GET_MODE(operands[0])) - 1;
   int i;

   if( pragma_output )
      output_asm_insn( ";in output_fneg", operands );

   split_any(operands[0], size, op0);
   split_any(operands[1], size, op1);
   operands[0] = op0[1], operands[1] = op1[1];
   if (GET_CODE(operands[0]) == REG) {
      if (GET_CODE(operands[1]) != REG) {
         output_asm_insn("MOVE   %0,%1\n\tINVB  %0,#7", operands);
         for (i = 0; i <= size; i++)
         if (i != 1) {
            operands[0] = op0[i], operands[1] = op1[i];
            output_asm_insn("MOVE   %0,%1", operands);
         }
         return "";
      }
      if (REGNO(operands[0]) != REGNO(operands[1])) {
         if (REGNO(operands[1]) > REGNO(operands[0]))
         for (i = 0; i <= size; i++) {
            operands[0] = op0[i], operands[1] = op1[i];
            if (i != 1)
            output_asm_insn("MOVE   %0,%1", operands);
            else
            output_asm_insn("MOVE   %0,%1\n\tINVB  %0,#7", operands);
         }
         else
         for (i = size; i >= 0; i--) {
            operands[0] = op0[i], operands[1] = op1[i];
            if (i != 1)
            output_asm_insn("MOVE   %0,%1", operands);
            else
            output_asm_insn("MOVE   %0,%1\n\tINVB  %0,#7", operands);
         }
         return "";
      }
      return "INVB   %0,#7";
   }
   if (GET_CODE(operands[1]) == REG) {
      if (part_dead_or_set_p(insn, operands[1]))
      output_asm_insn("INVB   %1,#7\n\tMOVE  %0,%1", operands);
      else
      output_asm_insn("MOVE   %%a,%1\n\t"
      "INVB %%a,#7\n\tMOVE %0,%%a", operands);
      for (i = 0; i <= size; i++)
      if (i != 1) {
         operands[0] = op0[i], operands[1] = op1[i];
         output_asm_insn("MOVE   %0,%1", operands);
      }
      return "";
   }
   if (rtx_equal_p(operands[0], operands[1]))
   return "MOVE   %%a,%1\n\t"
   "INVB %%a,#7\n\tMOVE %0,%%a";
   for (i = 0; i <= size; i++) {
      operands[0] = op0[i], operands[1] = op1[i];
      if (i != 1)
      output_asm_insn("MOVE   %%a,%1\n\tMOVE %0,%%a", operands);
      else
      output_asm_insn("MOVE   %%a,%1\n\t"
      "INVB %%a,#7\n\tMOVE %0,%%a", operands);
   }
   return "";
}

/* Output a sequence of assembler instructions for a multiplication
* operation. Op0 is the destination (register), op1 and op2 are the
* operands.  Do a signed multiplication when signedp is true. */
const char* output_mult(rtx insn, rtx *operands, int signedp, unsigned int mask);
const char* output_mult(rtx insn, rtx *operands, int signedp, unsigned int mask)
{
   enum machine_mode mode = GET_MODE(operands[0]);

   if( pragma_output )
   output_asm_insn( ";in output_mult", operands );

   if (GET_CODE(operands[1]) == CONST_INT
   && GET_CODE(operands[2]) == CONST_INT)
   {
      /* Strange case, where the optimizer fails to optimize all the
      way...  */
      unsigned int c1 = INTVAL(operands[1]);
      unsigned int c2 = INTVAL(operands[2]);
      if (!signedp) {
         c1 &= mask;
         c2 &= mask;
      }
      operands[1] = gen_rtx(CONST_INT, VOIDmode, c1*c2);
      if( pragma_output )
      output_asm_insn( ";out output_mult => output_move", operands );

      return output_move(insn, operands);
   }


   if (GET_CODE(operands[1]) == CONST_INT)
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   operands[3] = operands[0];

   if (mode == QImode)
   {
      int is_reg1, is_reg2, is_dead = 0;
      if (GET_CODE(operands[2]) == CONST_INT
      && INTVAL(operands[2]) == 2)
      {
         if( pragma_output )
         output_asm_insn( ";out output_mult", operands );
         return GET_CODE(operands[0]) == REG
         ? "SHL   %0,%1"
         : "SHL   %%a,%1\n\tMOVE %0,%%a";
      }
      if (GET_CODE(operands[0]) != REG
      || REGNO(operands[0]) != ACCU_REG)
      operands[0] = gen_rtx(REG, QImode, ACCU_REG);
      is_reg1 = GET_CODE(operands[1]) == REG;
      is_reg2 = GET_CODE(operands[2]) == REG;
      find_hidden_accu(insn, operands);
      if (is_reg1 && !is_reg2)
      is_dead = REGNO(operands[1]) == ACCU_REG
      || part_dead_or_set_p(insn, operands[1]);
      if (is_reg2 && !is_reg1)
      is_dead = REGNO(operands[2]) == ACCU_REG
      || part_dead_or_set_p(insn, operands[2]);
      if (is_reg1 && is_reg2)
      output_asm_insn("MUL %0,%1,%2", operands);
      else if (is_reg1 && is_dead)
      output_asm_insn("MUL %1,%2", operands);
      else if (is_reg2 && is_dead)
      output_asm_insn("MUL %2,%1", operands);
      else
      output_asm_insn("MOVE   %0,%1\n\tMUL   %0,%2", operands);
      if( pragma_output )
      output_asm_insn( ";out output_mult", operands );
      if (operands[0] != operands[3])
      return "MOVE   %3,%0";
      return "";
   }
   if (mode == HImode && only_use_trunc_p(insn, operands[0])) {
      rtx nexti = next_nnote_nclob_nuse_insn(insn);
      rtx body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;
      if (body && GET_CODE(body) == SET
      && SET_DEST(body) != cc0_rtx
      && part_dead_or_set_p(nexti, operands[0])
      && ((GET_CODE(SET_SRC(body)) == SUBREG
      && REGNO(SUBREG_REG(SET_SRC(body))) == REGNO(operands[0]))
      || (GET_CODE(SET_SRC(body)) == REG
      && REGNO(SET_SRC(body)) == REGNO(operands[0]) + 1))) {
         operands[0] = SET_DEST(body);
         cancel_insn(nexti);
      } else
      operands[0] = gen_rtx(REG, QImode, REGNO(operands[0]) + 1);
      mode = QImode;
   }
   if (mode == QImode) {
      if (GET_CODE(operands[1]) != CONST_INT
      && GET_MODE(operands[1]) != QImode) {
         rtx part[8];
         int size = GET_MODE_SIZE(GET_MODE(operands[1])) - 1;
         split_any(operands[1], size, part);
         operands[1] = part[size];
      }
      if (GET_CODE(operands[2]) != CONST_INT
      && GET_MODE(operands[2]) != QImode) {
         rtx part[8];
         int size = GET_MODE_SIZE(GET_MODE(operands[2])) - 1;
         split_any(operands[2], size, part);
         operands[2] = part[size];
      }
      if (GET_CODE(operands[0]) == REG
      && GET_CODE(operands[2]) == CONST_INT
      && INTVAL(operands[2]) == 2)
      {
         if( pragma_output )
         output_asm_insn( ";out output_mult", operands );
         return "SHL %0,%1";
      }
      if( pragma_output )
      output_asm_insn( ";out output_mult", operands );
      return output_mult(insn, operands, 0, 0xff);
   }
   if (mode == HImode) {
      if (GET_MODE(operands[1]) == QImode) {
         /* mulqihi */
         /* CI - fixme - check next instruction for move from operands[0]
         to somewhere else and try to suppress the move.  */
         rtx reg0[2];
         split_reg(operands[0], 1, reg0);
         operands[3] = reg0[1];
         if (GET_CODE(operands[1]) == REG) {
            if (GET_CODE(operands[2]) == REG)
            {
               if( pragma_output )
               output_asm_insn( ";out output_mult", operands );
               if (signedp)
               return "MULA   %0,%1,%2\n\tMOVE  %3,%%a";
               return "MUL %0,%1,%2\n\tMOVE  %3,%%a";
            }
            if (REGNO(operands[1]) != REGNO(reg0[0]))
            output_asm_insn("MOVE   %0,%1", operands);
            if( pragma_output )
            output_asm_insn( ";out output_mult", operands );

            if (signedp)
            return "MULA   %0,%2\n\tMOVE  %3,%%a";
            return "MUL %0,%2\n\tMOVE  %3,%%a";
         }
         if (GET_CODE(operands[2]) != REG
         || REGNO(operands[2]) != REGNO(reg0[0])) {
            /* Avoid clobbering an index register used in operands[1] too
            early.  */
            if (reg_mentioned_p(reg0[0], operands[1]))
            {
#if 1 /*VC020910 : Avoid clobbering an index register used in operands[2] too*/
               if
               (
               (reg_mentioned_p(reg0[0], operands[2]))
               && (GET_CODE(operands[1]) == MEM)
               && (GET_CODE(operands[2]) == MEM)
               )
               {
#if 1 /*VC020910 : could be better...*/
                  /*check if operands 1 and 2 are the same
                  we know that the index is the same, just check offsets*/
                  if (rtx_equal_p (operands[1], operands[2]))
                  {
                     output_asm_insn("MOVE   %%a,%2", operands);
                     output_asm_insn("MUL %0,%%a,%%a", operands);
                     output_asm_insn("MOVE   %3,%%a", operands);
                     if( pragma_output )
                     output_asm_insn( ";out output_mult", operands );
                     return "";
                  }
#endif

#if 1 /*VC020910 : protect indexes with spill like in output_add_wide*/
                  /* We have something that looks like
                  (reg ix) = (mem (reg ix)) + (mem (reg ix)).*/
#if 1 /*VC020910 : push an operand (assume ix is not i3, or we'd have to spill :-< )*/
                  output_asm_insn("MOVE   %%a,%2", operands);
                  output_asm_insn("MOVE   -(%%i3,1),%%a", operands);
                  output_asm_insn("MOVE   %0,%1", operands);
                  output_asm_insn("MOVE   %%a,(%%i3,1)+", operands);

                  if (signedp)
                     output_asm_insn( "MULA  %0,%%a", operands );
                  else
                     output_asm_insn( "MUL   %0,%%a", operands );

                  output_asm_insn( "MOVE  %3,%%a", operands );

                  if( pragma_output )
                     output_asm_insn( ";out output_mult", operands );

                  return "";

#else /*VC020910 : that's how it's done in output_add_wide*/
                  /*We avoid pushing things on the stack,
                  as ix might be the stack pointer.  */
                  if (spill_rtx[0] == NULL)
                  {
                     spill_rtx[0] = gen_rtx(SYMBOL_REF, Pmode, spill_name);
                     SYMBOL_REF_FLAG(spill_rtx[0]) = 1;
                  }
                  for (i = size; i > 0; i--)
                  {
                     saved[i] = op0[i];
                     op0[i] = gen_rtx(MEM, QImode,
                     gen_rtx(PLUS, Pmode,
                     spill_rtx[0],
                     gen_rtx(CONST_INT, VOIDmode, i + 3)));
                  }
#endif
               }
#endif


#endif
               output_asm_insn("MOVE   %0,%1", operands);
               if( pragma_output )
                  output_asm_insn( ";out output_mult", operands );
#if 1 /*just to be able to do something between that and return...*/
               if (signedp)
                  output_asm_insn( "MULA  %0,%2", operands );
               else
                  output_asm_insn( "MUL   %0,%2", operands );
               output_asm_insn( "MOVE  %3,%%a", operands );



               return "";
#else
               if (signedp)
               return "MULA   %0,%2\n\tMOVE  %3,%%a";
               return "MUL %0,%2\n\tMOVE  %3,%%a";
#endif
            }
            output_asm_insn("MOVE   %0,%2", operands);
         }

         if( pragma_output )
            output_asm_insn( ";out output_mult", operands );
         if (signedp)
            return "MULA   %0,%1\n\tMOVE  %3,%%a";
         return "MUL %0,%1\n\tMOVE  %3,%%a";
      }


      if (GET_CODE(operands[2]) == CONST_INT
      && is_power_of_2(INTVAL(operands[2]))) {
         unsigned int val = INTVAL(operands[2]), count = 0;
         for (val >>= 1; val; val >>= 1)
         count += 1;
         operands[2] = gen_rtx(CONST_INT, VOIDmode, count);
         if( pragma_output )
         output_asm_insn( ";out output_mult=>output_left_shift", operands );
         return output_left_shift(insn, operands, 0);
      }
      if( pragma_output )
      output_asm_insn( ";out output_mult => output_libcall", operands );
      return output_libcall(insn, operands, 2, 0, 1, "mulhi3", 0, 0, 0);
   }

   /* mode is SImode */
   if (GET_MODE(operands[1]) == HImode)
   {
      /* mulhisi */
      if( pragma_output )
      output_asm_insn( ";out output_mult => output_libcall", operands );
      return output_libcall(insn, operands, 2, 0, 1,
      signedp ? "mulhisi3" : "umulhisi3", 0, 0, 0);
   }

   if (GET_CODE(operands[2]) == CONST_INT
   && is_power_of_2(INTVAL(operands[2]))) {
      unsigned int val = INTVAL(operands[2]), count = 0;
      for (val >>= 1; val; val >>= 1)
      count += 1;
      operands[2] = gen_rtx(CONST_INT, VOIDmode, count);
      if( pragma_output )
      output_asm_insn( ";out output_mult => output_left_shift", operands );
      return output_left_shift(insn, operands, 0);
   }

   if( pragma_output )
      output_asm_insn( ";out output_mult => output_libcall", operands );
   return output_libcall(insn, operands, 0, 2, 1, "mulsi3", 0, 0, 0);
}

/* Output a sequence of assembler instructions for a division
* operation. Op0 is the destination (register) for the quotient, op1
* and op2 are the operands, and op3 is the destination for the
* remainder.  Op0 or op3 may be const0_rtx when this result may be
* discarded.  Do a signed division when signedp is true. */
/* CI - FIXME - This could (and should) be heavily simplified, since
the md has now been rewritten to place the output in the correct
registers.  */
const char* output_divmod(rtx insn, rtx *operands, int signedp);
const char* output_divmod(rtx insn, rtx *operands, int signedp)
{
   rtx ops[8], div_dest_hi = NULL, mod_dest_hi = NULL;
#if 1 /*VC020916 : modulo also gives mode*/

#if 1 /*VC020918 : mode could be SI*/
   enum machine_mode mode = GET_MODE(operands[0]);

   if(GET_MODE_SIZE(GET_MODE(operands[3])) > GET_MODE_SIZE(mode) )
      mode = GET_MODE(operands[3]);
#else
   enum machine_mode mode =
   (GET_MODE(operands[0])==HImode)
   ||(GET_MODE(operands[3])==HImode)?
   HImode:QImode
   ;
#endif

#else
   enum machine_mode mode = GET_MODE(operands[0]);
#endif

   if( pragma_output )
   output_asm_insn( ";in output_divmod", operands );

   if (mode == VOIDmode)
      mode = GET_MODE(operands[3]);
   /* First, let's see if both results are needed */

#if 1

   /* VC020913 : for some reason, it happens that both operands are unused.
   bug in the front-end?
   act as if they were both used...*/
   {
      bool unused_op0 = false;
      bool unused_op3 = false;

      if (GET_CODE(operands[0]) == REG
      && find_regno_note(insn, REG_UNUSED, REGNO(operands[0])))
      unused_op0 = true;
      if (GET_CODE(operands[3]) == REG
      && find_regno_note(insn, REG_UNUSED, REGNO(operands[3])))
      unused_op3 = true;

      if(unused_op0 && (!unused_op3))
      operands[0] = const0_rtx;
      if((!unused_op0) && unused_op3)
      operands[3] = const0_rtx;
   }

#if 1    /*VC020916 : yes, this happens too!*/
   if((GET_CODE(operands[2]) == CONST_INT)
   && INTVAL(operands[2]) == 0)
   return ""; /*VC020916 : shouldn't we generate an error?*/
#endif

#else

   if (GET_CODE(operands[0]) == REG
   && find_regno_note(insn, REG_UNUSED, REGNO(operands[0])))
   operands[0] = const0_rtx;
   if (GET_CODE(operands[3]) == REG
   && find_regno_note(insn, REG_UNUSED, REGNO(operands[3])))
   operands[3] = const0_rtx;

#endif

   if (GET_CODE(operands[1]) == CONST_INT
   && GET_CODE(operands[2]) == CONST_INT) {
      /* Stupid case again...  */
      /* CI - fixme - maybe we should truncate the operands to the
      * result mode before computing ???  */
      if (operands[0] != const0_rtx) {
         ops[0] = operands[0];
         ops[1] = gen_rtx(CONST_INT, VOIDmode,
         INTVAL(operands[1]) / INTVAL(operands[2]));
         output_asm_insn(output_move(insn, ops), ops);
      }
      if (operands[3] != const0_rtx) {
         ops[0] = operands[3];
         ops[1] = gen_rtx(CONST_INT, VOIDmode,
         INTVAL(operands[1]) % INTVAL(operands[2]));
         output_asm_insn(output_move(insn, ops), ops);
      }
      return "";
   }
#if 1 /*VC020918 : ->1 integral promotion...*/
   if
   (
   (mode == HImode)
   && (GET_MODE(operands[1]) == QImode)
   && (GET_MODE(operands[2]) == QImode)
   )
#else
   if (mode == HImode
   && ((GET_MODE(operands[1]) == QImode
   || GET_CODE(operands[1]) == CONST_INT)
   && (GET_MODE(operands[2]) == QImode
   || GET_CODE(operands[2]) == CONST_INT)))
#endif
   {
      if (operands[0] == const0_rtx
      || only_use_trunc_p(insn, operands[0]))
      {
         rtx nexti = next_nnote_nclob_nuse_insn(insn);
         rtx body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;
         if (operands[0] != const0_rtx) {
            if (body && GET_CODE(body) == SET
            && SET_DEST(body) != cc0_rtx
            && part_dead_or_set_p(nexti, operands[0])
            && ((GET_CODE(SET_SRC(body)) == SUBREG
            && REGNO(SUBREG_REG(SET_SRC(body))) == REGNO(operands[0]))
            || (GET_CODE(SET_SRC(body)) == REG
            && REGNO(SET_SRC(body)) == REGNO(operands[0]) + 1))) {
               operands[0] = SET_DEST(body);
               cancel_insn(nexti);
            }
            if (GET_MODE(operands[0]) == HImode) {
               split_reg(operands[0], 1, ops);
               operands[0] = ops[1];
            }
         }
         if (GET_CODE(operands[3]) == REG
         && only_use_trunc_p(insn, operands[3]))
         {
            nexti = next_nnote_nclob_nuse_insn(insn);
            body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;
            if (body && GET_CODE(body) == SET
            && SET_DEST(body) != cc0_rtx
            && part_dead_or_set_p(nexti, operands[3])
            && ((GET_CODE(SET_SRC(body)) == SUBREG
            && REGNO(SUBREG_REG(SET_SRC(body))) == REGNO(operands[3]))
            || (GET_CODE(SET_SRC(body)) == REG
            && REGNO(SET_SRC(body)) == REGNO(operands[3]) + 1)))
            {
               operands[3] = SET_DEST(body);
               cancel_insn(nexti);
            }
            if (GET_MODE(operands[3]) == HImode)
            {
               split_reg(operands[3], 1, ops);
               operands[3] = ops[1];
            }
         }
         else
         {
            /* Have to generate a (probably useless) 16-bit result... */
            split_any(operands[3], 1, ops);
            operands[3] = ops[1];
            mod_dest_hi = ops[0];
         }
      }
      else
      {
         /* Have to generate 16-bit results... */
         if (operands[0] != const0_rtx)
         {
            split_any(operands[0], 1, ops);
            operands[0] = ops[1];
            div_dest_hi = ops[0];
         }
         if (operands[3] != const0_rtx)
         {
            split_any(operands[3], 1, ops);
            operands[3] = ops[1];
            mod_dest_hi = ops[0];
         }
      }
#if 1 /*VC020916 : ->0 integral promotion... VC020918 ->1 : done above (if)*/
      mode = QImode;
#endif
   }
   if (mode == QImode)
   {
      if (GET_CODE(operands[1]) == REG)
      {
         if (REGNO(operands[1]) != REG_3)
         {
            if (GET_CODE(operands[2]) == REG)
            {
               if (REGNO(operands[2]) != REG_2)
               {
                  if (REGNO(operands[1]) == REG_2)
                  {
                     if (REGNO(operands[2]) == REG_3)
                     /* Have to swap the operands... */
                     output_asm_insn("MOVE   %%r2,%%r0\n\t"
                     "MOVE %%r0,%%r1\n\t"
                     "MOVE %%r1,%%r2", operands);
                     else
                     output_asm_insn("MOVE   %%r0,%%r1\n\t"
                     "MOVE %%r1,%2", operands);
                  }
                  else if (REGNO(operands[2]) == REG_3)
                     output_asm_insn("MOVE   %%r1,%%r0\n\t"
                                     "MOVE   %%r0,%1", operands);
                  else
                     output_asm_insn("MOVE   %%r0,%1\n\t"
                                     "MOVE   %%r1,%2", operands);
               }
               else
                  output_asm_insn("MOVE   %%r0,%1", operands);
            }
            else
               output_asm_insn("MOVE   %%r0,%1", operands);
         }
         else if (GET_CODE(operands[2]) == REG && REGNO(operands[2]) != REG_2)
            output_asm_insn("MOVE   %%r1,%2", operands);
      }
      else if (GET_CODE(operands[2]) == REG && REGNO(operands[2]) != REG_2)
         output_asm_insn("MOVE   %%r1,%2", operands);

      if (GET_CODE(operands[1]) != REG)
      {
         ops[0] = gen_rtx(REG, QImode, REG_3), ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
      }

      if (GET_CODE(operands[2]) != REG)
      {
         ops[0] = gen_rtx(REG, QImode, REG_2), ops[1] = operands[2];
         output_asm_insn(output_move(insn, ops), ops);
      }

      if (operands[0] == const0_rtx)
      {
         /* Only modulo is needed */
         output_asm_insn(signedp
         ? (TARGET_SOFTLIB
         ? "CALLS modqi3" : "CALL   modqi3")
         : (TARGET_SOFTLIB
         ? "CALLS umodqi3" : "CALL  umodqi3"),
         operands);
         if (mod_dest_hi)
         {
#if 0 /*VC020913 : wrong if operand 3 is not r2*/
            if (signedp)
               output_asm_insn("MOVE   %%r3,%%r2\n\tMULA %%r3,#1", operands);
            else
               output_asm_insn("MOVE   %%r3,#0", operands);
#if 1
            if (GET_CODE(operands[3]) != REG
            || REGNO(operands[3]) != REG_2)
            {
               operands[0] = operands[3];
               operands[1] = gen_rtx(REG, HImode, REG_2);
               return output_move(insn, operands);
            }
            return "";
#endif
#else
            if (signedp)
            return "MOVE   %%r3,%%r2\n\t"
            "MULA %%r3,#1";
            return "MOVE   %%r3,#0";
#endif
         }
         if (GET_CODE(operands[3]) != REG
         || REGNO(operands[3]) != REG_1)
         {
            operands[0] = operands[3];
#if 0 /*VC020913 : wrong if operand 3 is not mode QI*/
            operands[1] = gen_rtx(REG, mod_dest_hi?HImode:QImode, REG_1);
#else
            operands[1] = gen_rtx(REG, QImode, REG_1);
#endif
            return output_move(insn, operands);
         }
         return "";
      }
      output_asm_insn(signedp
      ? (TARGET_SOFTLIB
      ? "CALLS divmodqi4" : "CALL   divmodqi4")
      : (TARGET_SOFTLIB
      ? "CALLS udivmodqi4" : "CALL  udivmodqi4"), operands);
      if (operands[3] == const0_rtx) {
         if (GET_CODE(operands[0]) != REG
         || REGNO(operands[0]) != REG_3) {
            operands[1] = gen_rtx(REG, QImode, REG_3);
            if (div_dest_hi) {
               output_asm_insn(output_move(insn, operands), operands);
               if (signedp)
               output_asm_insn("MULA   %1,#1", operands);
               else
               operands[1] = const0_rtx;
               operands[0] = div_dest_hi;
            }
            return output_move(insn, operands);
         }
         if (div_dest_hi) {
            operands[1] = div_dest_hi;
            if (signedp)
            output_asm_insn("MOVE   %1,%0\n\t"
            "MULA %1,#1", operands);
            else
            output_asm_insn("MOVE   %1,#0", operands);
         }
         return "";
      }
      if (GET_CODE(operands[0]) == REG
      && REGNO(operands[0]) == REG_1) {
         if (GET_CODE(operands[3]) == REG
         && REGNO(operands[3]) == REG_3) {
            /* Have to swap the results... */
            output_asm_insn("MOVE   %%r1,%3\n\t"
            "MOVE %3,%0\n\t"
            "MOVE %0,%%r1", operands);
            if (div_dest_hi) {
               operands[1] = div_dest_hi;
               if (signedp)
               output_asm_insn("MOVE   %1,%0\n\t"
               "MULA %1,#1", operands);
               else
               output_asm_insn("MOVE   %1,#0", operands);
            }
            if (mod_dest_hi) {
               operands[1] = mod_dest_hi;
               if (signedp)
               output_asm_insn("MOVE   %1,%3\n\t"
               "MULA %1,#1", operands);
               else
               output_asm_insn("MOVE   %1,#0", operands);
            }
            return "";
         }

         /* Save r1 first... */
         ops[0] = operands[3], ops[1] = gen_rtx(REG, QImode, REG_1);
         output_asm_insn(output_move(insn, ops), ops);

         if (mod_dest_hi)
         {
            ops[0] = mod_dest_hi;
            if (signedp)
            output_asm_insn("MULA   %1,#1", ops);
            else
            ops[1] = const0_rtx;
            output_asm_insn(output_move(insn, ops), ops);
         }

         operands[1] = gen_rtx(REG, QImode, REG_3);

         if (div_dest_hi)
         {
            output_asm_insn(output_move(insn, operands), operands);
            if (signedp)
               output_asm_insn("MULA   %1,#1", operands);
            else
               operands[1] = const0_rtx;
            operands[0] = div_dest_hi;
         }
         return output_move(insn, operands);
      }

      /* Save r0 first... */
      if (GET_CODE(operands[0]) == REG && REGNO(operands[0]) == REG_3)
      {
         if (div_dest_hi)
         {
            ops[0] = div_dest_hi;
            if (signedp)
            {
               ops[1] = operands[0];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MULA   %0,#1", ops);
            } else
            {
               ops[1] = const0_rtx;
               output_asm_insn(output_move(insn, ops), ops);
            }
         }
      }
      else
      {
         ops[0] = operands[0], ops[1] = gen_rtx(REG, QImode, REG_3);
         output_asm_insn(output_move(insn, ops), ops);

         if (div_dest_hi)
         {
            ops[0] = div_dest_hi;
            if (signedp)
               output_asm_insn("MULA   %1,#1", ops);
            else
               ops[1] = const0_rtx;
            output_asm_insn(output_move(insn, ops), ops);
         }
      }

      if (GET_CODE(operands[3]) == REG && REGNO(operands[3]) == REG_1)
      {
         if (mod_dest_hi)
         {
            ops[0] = mod_dest_hi;
            if (signedp)
            {
               ops[1] = operands[3];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MULA   %0,#1", ops);
            }
            else
            {
               ops[1] = const0_rtx;
               output_asm_insn(output_move(insn, ops), ops);
            }
         }
         return "";
      }

      operands[0] = operands[3], operands[1] = gen_rtx(REG, QImode, REG_1);

      if (mod_dest_hi)
      {
         output_asm_insn(output_move(insn, operands), operands);
         if (signedp)
            output_asm_insn("MULA   %1,#1", operands);
         else
            operands[1] = const0_rtx;
         operands[0] = mod_dest_hi;
      }
      return output_move(insn, operands);
   }

   if (mode == HImode)
   {
#if 0 /* CI */
      rtx nexti = next_nnote_nclob_nuse_insn(insn);
      rtx body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;
      while (body && GET_CODE(operands[3]) == REG
      && GET_CODE(body) == SET) {
         if (GET_CODE(SET_SRC(body)) == REG
         && REGNO(SET_SRC(body)) == REGNO(operands[3])
         && SET_DEST(body) != cc0_rtx
         && part_dead_or_set_p(nexti, operands[3])) {
            operands[3] = SET_DEST(body);
            cancel_insn(nexti);
            break;
         }
         if (GET_CODE(SET_SRC(body)) == REG
         && REGNO(SET_SRC(body)) == REGNO(operands[0])) {
            nexti = next_nnote_nclob_nuse_insn(nexti);
            body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;
            continue;
         }
         break;
      }
#endif /* 0 CI */

      if (GET_MODE(operands[1]) == QImode)
      {
         /* Happens only for signed extension.  */
         if (GET_CODE(operands[2]) != REG || REGNO(operands[2]) != REG_2) {
            if (GET_CODE(operands[1]) == REG)
            {
               if (REGNO(operands[1]) != REG_3)
                  output_asm_insn("MOVE   %%r0,%1", operands);
               if (REGNO(operands[1]) != REG_2)
                  output_asm_insn("MOVE   %%r1,r0", operands);
            }
            else
            {
               ops[0] = gen_rtx(REG, QImode, REG_3);
               ops[1] = operands[1];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MOVE   %%r1,%%r0", operands);
            }
            output_asm_insn("MULA   r1,#1", operands);
            operands[1] = gen_rtx(REG, HImode, REG_2);
         }
         else
         {
            /* Do the call directly.  */
            output_asm_insn("MOVE   -(%%sp),%%r0", operands);
            output_asm_insn("MOVE   -(%%sp),%%r1", operands);

            if (GET_CODE(operands[1]) == MEM)
            {
               int nregs = find_regs_in_addr(XEXP(operands[1], 0), 0);
               int found, i;
               for (found = 0, i = 0; !found && i < nregs; i++)
                  found = REGNO(addr_regs[i]) == HARD_SP_REG;
               if (found)
                  operands[1] = modif_mem_address(operands[1], QImode, HARD_SP_REG, 2);

            }
            ops[0] = gen_rtx(REG, QImode, REG_3);
            ops[1] = operands[1];
            output_asm_insn(output_move(insn, ops), ops);

            output_asm_insn(TARGET_SOFTLIB
            ? ("MOVE %%r1,%%r0\n\t"
            "MULA %%r1,#1\n\t"
            "CALLS   divmodhi4")
            : ("MOVE %%r1,%%r0\n\t"
            "MULA %%r1,#1\n\t"
            "CALL divmodhi4"), operands);
            output_asm_insn("MOVE   %%a,(%%i3,2)+", operands); /* pvt*/

            return "";
         }
      }

      if (GET_MODE(operands[2]) == QImode)
      {
         /* Happens only for signed extension.  */
         if (GET_CODE(operands[1]) != REG || REGNO(operands[1]) != REG_0)
         {
            if (GET_CODE(operands[2]) == REG)
            {
               if (REGNO(operands[2]) != REG_1)
                  output_asm_insn("MOVE   r2,%2", operands);
               if (REGNO(operands[2]) != REG_0)
                  output_asm_insn("MOVE   r3,r2", operands);
            }
            else
            {
               ops[0] = gen_rtx(REG, QImode, REG_1);
               ops[1] = operands[2];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MOVE   %%r3,%%r2", operands);
            }

            output_asm_insn("MULA   r3,#1", operands);
            operands[2] = gen_rtx(REG, HImode, REG_0);
         }
         else
         {
            if (GET_CODE(operands[2]) == REG)
            {
               if (REGNO(operands[2]) != REG_3)
                  output_asm_insn("MOVE   %%r0,%2", operands);
               if (REGNO(operands[2]) != REG_2)
                  output_asm_insn("MOVE   %%r1,%%r0", operands);
            }
            else
            {
               ops[0] = gen_rtx(REG, QImode, REG_3);
               ops[1] = operands[2];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MOVE   %%r1,%%r0", operands);
            }

            output_asm_insn("MULA   %%r1,#1", operands);
            operands[2] = gen_rtx(REG, HImode, REG_2);
         }
      }

      output_asm_insn(output_libcall(insn, operands, 1, 1, 0,
      signedp ? "divmodhi4" : "udivmodhi4",
      0, 0, 1),
      operands);
#if 0 /* CI */
      if (operands[3] != const0_rtx) {
         operands[0] = operands[3], operands[1] = gen_rtx(REG, HImode, REG_0);
         return output_move(insn, operands);
      }
#endif /* 0 CI */
      return "";
   }

   /* mode is SImode */
   if (operands[3] != const0_rtx)
   {
      rtx nexti = next_nnote_nclob_nuse_insn(insn);
      rtx body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;

      if (body && GET_CODE(body) == SET && GET_CODE(SET_SRC(body)) == REG)
      {
         if (REGNO(SET_SRC(body)) == REGNO(operands[3])
         && SET_DEST(body) != cc0_rtx
         && part_dead_or_set_p(nexti, operands[3]))
         {
            operands[3] = SET_DEST(body);
            cancel_insn(nexti);
         }
         else if (REGNO(SET_SRC(body)) == REG_0)
         {
            nexti = next_nnote_nclob_nuse_insn(nexti);
            body = nexti && GET_CODE(nexti) == INSN ? PATTERN(nexti) : NULL;

            if (body && GET_CODE(body) == SET
            && SET_DEST(body) != cc0_rtx
            && GET_CODE(SET_SRC(body)) == REG
            && REGNO(SET_SRC(body)) == REGNO(operands[3])
            && part_dead_or_set_p(nexti, operands[3]))
            {
               operands[3] = SET_DEST(body);
               cancel_insn(nexti);
            }
         }
      }
   }

   output_asm_insn(output_libcall(insn, operands, 1, 1, 0,
   signedp ? "divmodsi4" : "udivmodsi4",
   0, 0, 0),
   operands);

   if (operands[3] != const0_rtx)
   {
      int found = 0, nregs, i;
      char s[256];

      if (GET_CODE(operands[3]) == MEM)
      {
         nregs = find_regs_in_addr(XEXP(operands[3], 0), 0);
         for (i = 0; !found && i < nregs; i++)
            found = REGNO(addr_regs[i]) == HARD_SP_REG;
         if (found)
         {
            ops[0] = modif_mem_address(operands[3], QImode, HARD_SP_REG, 3);
            for (i = 0; i < 4; i++)
               output_asm_insn("MOVE   %%a,(%%sp)+\n\tMOVE  %0,%%a", ops);
         }
      }

      if (!found)
      {
         rtx part[8];
         split_any(operands[3], 3, part);
         if (GET_CODE(operands[3]) == REG)
            strcpy(s, "MOVE   %0,(%%sp)+");
         else
            strcpy(s, "MOVE   %%a,(%%sp)+\n\tMOVE  %0,%%a");

         for (i = 0; i < 4; i++)
         {
            ops[0] = part[i];
            output_asm_insn(s, ops);
         }
      }
   }
      else
   /* Pop the unused modulo result.  */
   output_asm_insn("MOVE   %%a,(%%sp,4)+", ops);
   return "";
}

/* Output a sequence of assembler instructions to perform the binary
 * logical operation described by code.  Op1 and Op2 are the operands
 * and the result goes in Op0.  If the result is a constant, return
 * the destination so that all constants can be assigned together.  */
static rtx output_logical_1(rtx insn, rtx *ops, int is_dead, int has_auto)
{
   if( pragma_output )
      output_asm_insn( ";in output_logical_1", ops );

   if( !has_auto && GET_CODE(ops[2]) == CONST_INT )
   {
      /* Handle special cases.  */
      if( INTVAL(ops[2]) == 0xff )
      {
         switch( GET_CODE(ops[3]) )
         {
            case IOR:
               return ops[0];
            case AND:
               output_asm_insn(output_move(insn, ops), ops);
               break;
            case XOR:
               output_asm_insn(output_not(insn, ops), ops);
               break;
            default:
               abort_with_insn(insn, "Bad logical operation.");
         }
         
         if( pragma_output )
            output_asm_insn( ";out output_logical_1 (f)", ops );

         return 0;
      }

      if( INTVAL(ops[2]) == 0 )
      {
         switch (GET_CODE(ops[3]))
         {
            case AND:
               return ops[0];
            case IOR:
            case XOR:
               output_asm_insn(output_move(insn, ops), ops);
               break;
            default:
               abort_with_insn(insn, "Bad logical operation.");
         }
         
         if( pragma_output )
            output_asm_insn( ";out output_logical_1 (g)", ops );

         return 0;
      }
   }

   if( GET_CODE(ops[0]) == REG )
   {
      if( GET_CODE(ops[1]) == REG && GET_CODE(ops[2]) == REG )
      {
         output_asm_insn("%o3 %0,%1,%2", ops);
      
         if( pragma_output )
            output_asm_insn( ";out output_logical_1 (e)", ops );
         return 0;
      }

      output_asm_insn(output_move(insn, ops), ops);
      output_asm_insn("%o3 %0,%2", ops);
      
      if( pragma_output )
         output_asm_insn( ";out output_logical_1 (a)", ops );
      return 0;
   }

   if( is_dead )
   {
      output_asm_insn("%o3 %1,%2\n\tMOVE  %0,%1", ops);
      
      if( pragma_output )
         output_asm_insn( ";out output_logical_1 (d)", ops );
      return 0;
   }

   /* Special case for AND */
   if (GET_CODE(ops[1]) == REG && GET_CODE(ops[3]) == AND && GET_CODE(ops[2]) == CONST_INT)
   {
      output_asm_insn("TSTPAT %1,%2 ; set accu implicitly\n\t"
                      "MOVE %0,%%a", ops);
                      
      if( pragma_output )
         output_asm_insn( ";out output_logical_1 (h)", ops );

      return 0;
   }

   if (GET_CODE(ops[1]) == REG && GET_CODE(ops[2]) == REG)
   {
      output_asm_insn("%o3 %%a,%1,%2\n\t"
                      "MOVE %0,%%a", ops);
                      
      if( pragma_output )
         output_asm_insn( ";out output_logical_1 (b) ", ops );
      return 0;
   }

   output_asm_insn("MOVE   %%a,%1\n\t"
                   "%o3  %%a,%2\n\t"
                   "MOVE %0,%%a", ops);

   if( pragma_output )
      output_asm_insn( ";out output_logical_1 (c)", ops );

   return 0;
}

/* Output a sequence of assembler instructions to perform the binary
 * logical operation described by Op3.  Op1 and Op2 are the operands
 * and the result goes in Op0.  */
const char* output_logical(rtx insn, rtx *operands);
const char* output_logical(rtx insn, rtx *operands)
{
   int size = GET_MODE_SIZE(GET_MODE(operands[0]));
   int i, j = 0, is_dead;
   int autoinc = 0;
   rtx op[3][8], ops[4], cst[8], stacked[8];

   /*SC060405 */
   for( i = 0; i < 8; i++ )
      {
      stacked[ i ] = 0;
      }

   if( pragma_output )
      output_asm_insn( ";in output_logical", operands );

   if(GET_CODE(operands[1]) == CONST_INT ||
      (GET_CODE(operands[2]) == REG && GET_CODE(operands[1]) != REG) ||
      (GET_CODE(operands[0]) != REG && GET_CODE(operands[2]) == REG && part_dead_or_set_p(insn, operands[2])))
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   is_dead = GET_CODE(operands[1]) == REG && part_dead_or_set_p(insn, operands[1]);

   for (i = 0; i < 3; i++)
   {
      if(GET_CODE(operands[i]) == MEM &&
         (GET_CODE(XEXP(operands[i], 0)) == POST_INC || GET_CODE(XEXP(operands[i], 0)) == PRE_DEC))
      {
         int inc = GET_CODE(XEXP(operands[i], 0)) == POST_INC ? 1 : -1;
         rtx tem;

         if (autoinc != 0 && autoinc != inc)
         abort_with_insn(insn,
         "Auto inc and dec in the same instruction"
         " not implemented");
         autoinc = inc;
         tem = gen_rtx(MEM, QImode, XEXP(operands[i], 0));
         for (inc = 0; inc < size; inc++)
            op[i][inc] = tem;
      }
      else
         split_any(operands[i], size - 1, op[i]);
   }

   ops[3] = operands[3];

   for (i = (autoinc == -1) ? size - 1 : 0; (autoinc == -1) ? i >= 0 : i < size; (autoinc == -1) ? i-- : i++)
   {
      ops[0] = op[0][i];
      ops[1] = op[1][i];
      ops[2] = op[2][i];

      /*VC021128 : check that an index that is a destination is not also used for the source(s)
      //avoids things like this:
      //   ...
      // MOVE  i0h,(i0,2)
      // AND   i0h,#0x7f
      // MOVE  i0l,(i0,3)
      // AND   i0l,#0xf0
      //   ...
      */

      if(   ((autoinc==-1) ? i!=0 : i<size-1)      /*don't check for the last one*/
         && (GET_CODE(ops[0]) == REG)              /*check if dest is a register*/
         &&(   (GET_CODE(operands[1]) == MEM       /*check if dest is used in operand 1*/
         && reg_overlap_mentioned_p(ops[0], operands[1]) )
         || (   GET_CODE(operands[2]) == MEM   /*check if dest is used in operand 2*/
         && reg_overlap_mentioned_p(ops[0], operands[2]) ) ) )
      {
         stacked[i]=ops[0];   /*mark this register as stacked*/
         ops[0]=gen_rtx(REG, QImode, ACCU_REG);        /*put first result in a...*/
      }
      else
         /*SC060331, in a set of logical instructions, avoid that a destination register
                 is later used as a source. */
         if( ((autoinc==-1) ? i!=0 : i<size-1) )     /*don't check for the last one*/
         {
            if( GET_CODE( ops[ 0 ] ) == REG )
            {
               int k;

               stacked[ i ] = 0;

               /* Look at next instructions.*/
               for( k = ( autoinc == -1 ) ? i - 1 : i + 1;
                     ( autoinc == -1 ) ? k >= 0 : k < size;
                     ( autoinc == -1 ) ? k-- : k++ )
               {
                  /* If current instruction destination register is used later as source,
                     put result in a and push it! */
                  if( ( ( GET_CODE( op[ 1 ][ k ] ) == REG ) && ( output_asm_insn( "; -- 1", operands ), reg_overlap_mentioned_p( ops[ 0 ], op[ 1 ][ k ] ) ) ) ||
                      ( ( GET_CODE( op[ 2 ][ k ] ) == REG ) && ( output_asm_insn( "; -- 2", operands ), reg_overlap_mentioned_p( ops[ 0 ], op[ 2 ][ k ] ) ) ) )
                  {
                     stacked[ i ] = ops[ 0 ];
                     ops[0]=gen_rtx(REG, QImode, ACCU_REG);        /*put first result in a...*/
                  }
               }
            }
         }
      else
         stacked[i] = 0;

      cst[j] = output_logical_1(insn, ops, is_dead, autoinc);

      if (cst[j])
      {
         /*         ops[0] = stacked[i];*/
         if(stacked[i])
         {
            cst[j]=stacked[i]; /*the result is constant and will be assigned at the end, so there is no need to stack...*/
            stacked[i] = 0;
         }
         cst[++j] = 0;
      }
      else
      {
         /*VC021128 : an index that is a destination is also used for the source(s) => stack the result*/
         if(stacked[i])
            output_asm_insn("MOVE  -(%%i3,1), %%a",operands);
      }
   }

   /*VC021128 : in case an index is also a destination...*/
   for (i = (autoinc != -1) ? size - 1 : 0; (autoinc != -1) ? i >= 0 : i < size; (autoinc != -1) ? i-- : i++)
   {
      /*      i3 = gen_rtx(REG, QImode, HARD_SP_REG );*/
      ops[1] = gen_rtx( MEM, QImode, gen_rtx( POST_INC, Pmode, gen_rtx(REG, QImode, HARD_SP_REG ), gen_rtx( CONST_INT, VOIDmode, 1 ) ) );

      if(stacked[i])
      {
         /*an index that is a destination is also used for the source(s) => result stacked => pop it now!*/
         ops[0]=stacked[i];
         output_move(insn, ops);
      }

   }

   if (cst[0])
   {
      /* Do the constant assignments.  */
      int is_reg;

      if( pragma_output )
         output_asm_insn( "; output_logical: Do the constant assignments.", ops );

      if (GET_CODE(operands[3]) == AND)
      {
         is_reg = GET_CODE(cst[0]) == REG || page0_mem(cst[0]);
         ops[1] = const0_rtx;
      }
      else
      {
         is_reg = GET_CODE(cst[0]) == REG;
         ops[1] = gen_rtx(CONST_INT, VOIDmode, 0xff);
      }

      if (!is_reg)
         output_asm_insn("MOVE   %%a,%1", ops);

      for (j = 0; cst[j]; j++)
      {
         ops[0] = cst[j];
         output_asm_insn(is_reg ? "MOVE  %0,%1" : "MOVE  %0,%%a", ops);
      }
   }
   
   if( pragma_output )
      output_asm_insn( ";out output_logical", ops );

   return "";
}

/* Output a sequence of assembler instructions to perform the binary
* negation of Op1 and store the result in Op0.  */
 const char *
output_not(rtx insn, rtx *operands)
{
   /*VC020909 : cpl1 does not accept an immediate value as operand*/
   enum rtx_code code = GET_CODE(operands[1]);
   int size = GET_MODE_SIZE(GET_MODE(operands[0]));
   int i;
   rtx op0[8], op1[8], ops[2];

   /*VC020909 : cpl1 does not accept an immediate value as operand*/
   if( pragma_output )
      output_asm_insn( ";in output_not", operands );

   if( (code == CONST) || (code == CONST_INT) || (code == CONST_DOUBLE) )
   {
      /* More stupid cases...  */
      operands[1] = gen_rtx(code, VOIDmode, ~INTVAL(operands[1]));
      if( pragma_output )
         output_asm_insn( ";out output_not => output_move", operands );

      return output_move(insn, operands);
   }

   split_any(operands[0], size - 1, op0);
   split_any(operands[1], size - 1, op1);

   /*VC020909 : cpl1 does not accept an immediate value as operand*/
   if(     (code == SYMBOL_REF)
   || (code == LABEL_REF)
   || (code == HIGH)
   || (code == LO_SUM) )
   {
      /* More stupid cases...  */
      /*    operands[1] = gen_rtx(code, VOIDmode,
      ~INTVAL(operands[1]));*/
      /*VC020909: to be improved...*/
      if (GET_CODE(operands[0]) == REG)
      {
         for (i = size - 1; i >= 0; i--) {
            ops[0] = op0[i], ops[1] = op1[i];
            output_asm_insn("MOVE   %%a,%1\n\t"
            "CPL1 %0, %%a", ops);
         }
         if( pragma_output )
            output_asm_insn( ";out output_not (label)", operands );
         return "";
      }

      for (i = size - 1; i >= 0; i--)
      {
         ops[0] = op0[i], ops[1] = op1[i];
         output_asm_insn("MOVE   %%a,%1\n\t"
         "CPL1 %%a\n\t"
         "MOVE %0,%%a", ops);
      }

      if( pragma_output )
         output_asm_insn( ";out output_not (label)", operands );
      return "";
   }

   if (GET_CODE(operands[0]) == REG)
   {
      for (i = size - 1; i >= 0; i--) {
         ops[0] = op0[i], ops[1] = op1[i];
         output_asm_insn("CPL1   %0,%1", ops);
      }

      if( pragma_output )
         output_asm_insn( ";out output_not", operands );
      return "";
   }

   for (i = size - 1; i >= 0; i--)
   {
      ops[0] = op0[i], ops[1] = op1[i];
      output_asm_insn("CPL1   %%a,%1\n\t"
      "MOVE %0,%%a", ops);
   }

   if( pragma_output )
      output_asm_insn( ";out output_not", operands );

   return "";
}

/* Return true if x is a page 0 memory reference.  */
int page0_mem(rtx x)
{
   if (GET_CODE(x) == MEM)
   {
      rtx addr = XEXP(x, 0);

      switch (GET_CODE(addr))
      {
         case SYMBOL_REF:
         case CONST:
            return 1;
         case PLUS:
            return CONSTANT_ADDRESS_P(XEXP(addr, 0)) && CONSTANT_ADDRESS_P(XEXP(addr, 1));
         default:
            break;
      }

      return 0;
   }
   return 0;
}

/* Output a sequence of assembler instructions to perform the
 * conversion of Op1 (an integer) to its corresponding floating point
 * representation and store the result in Op0.  Perform an unsigned
 * conversion when uns is true.  */
const char* output_to_float(rtx insn, rtx *operands, int uns, unsigned int mask);
const char* output_to_float(rtx insn, rtx *operands, int uns, unsigned int mask)
{
   const char * call = NULL;
   enum machine_mode mode = GET_MODE(operands[1]);
   rtx ops[2];

   if( pragma_output )
   output_asm_insn( ";in output_to_float", operands );

   if (GET_CODE(operands[1]) == CONST_INT) {
      /* Strange case, where the optimizer fails to optimize all the
      way...  */
      unsigned int c1 = INTVAL(operands[1]);
      REAL_VALUE_TYPE r;

      if (uns)
         c1 &= mask;

      real_from_target(&r,(long) c1,VOIDmode);
      operands[1] = CONST_DOUBLE_FROM_REAL_VALUE(r, GET_MODE(operands[0]));

      return output_move(insn, operands);
   }

   switch (mode)
   {
      case QImode:
         call = TARGET_SOFTLIB ? "CALLS   floatqisf2" : "CALL  floatqisf2";
         ops[0] = gen_rtx(REG, QImode, REG_3);
         break;
      case HImode:
         call = TARGET_SOFTLIB ? "CALLS   floathisf2" : "CALL  floathisf2";
         ops[0] = gen_rtx(REG, HImode, REG_1);
         break;
      case SImode:
         call = TARGET_SOFTLIB ? "CALLS   floatsisf2" : "CALL  floatsisf2";
         ops[0] = gen_rtx(REG, SImode, REG_0);
         break;
      default:
         abort_with_insn(insn, "Bad integer mode in output_to_float()");
   }

   ops[1] = operands[1];
   output_asm_insn(output_move(insn, ops), ops);
   if (uns)
      output_asm_insn("MOVE   %%a,#0", operands);
   else
      output_asm_insn("MOVE   %%a,#1", operands);

   output_asm_insn(call, operands);

   return "";
}

/* Output a sequence of assembler instructions to perform the
* conversion of Op1 (a floating point value) to its corresponding
* integer representation and store the result in Op0.  Perform an
* unsigned conversion when uns is true.  */
const char* output_to_int(rtx insn, rtx *operands, int uns);
const char* output_to_int(rtx insn, rtx *operands, int uns)
{
   const char *call = NULL;
   rtx ops[2];

   if( pragma_output )
      output_asm_insn( ";in output_to_int", operands );

   switch (GET_MODE(operands[0]))
   {
      case QImode:
         call = uns
         ? (TARGET_SOFTLIB
         ? "CALLS fixuns_truncsfqi2"
         : "CALL  fixuns_truncsfqi2")
         : (TARGET_SOFTLIB
         ? "CALLS fix_truncsfqi2"
         : "CALL  fix_truncsfqi2");
         break;
      case HImode:
         call = uns
         ? (TARGET_SOFTLIB
         ? "CALLS fixuns_truncsfhi2"
         : "CALL  fixuns_truncsfhi2")
         : (TARGET_SOFTLIB
         ? "CALLS fix_truncsfhi2"
         : "CALL  fix_truncsfhi2");
         break;
      case SImode:
         call = uns
         ? (TARGET_SOFTLIB
         ? "CALLS fixuns_truncsfsi2"
         : "CALL  fixuns_truncsfsi2")
         : (TARGET_SOFTLIB
         ? "CALLS fix_truncsfsi2"
         : "CALL  fix_truncsfsi2");
         break;
      default:
         abort_with_insn(insn, "Bad integer mode in output_to_int()");
   }

   ops[0] = gen_rtx(REG, GET_MODE(operands[1]), REG_0);
   ops[1] = operands[1];

   output_asm_insn(output_move(insn, ops), ops);

   if (GET_MODE(operands[1]) == TQFmode)
      output_asm_insn("MOVE   %%r0,#0", operands);

   output_asm_insn(call, operands);
   return "";
}

/* Store in cc_status the expressions that the condition codes will
 * describe after execution of an instruction whose pattern is EXP.
 * Do not alter them if the instruction would not alter the cc's.  */
 void notice_update_cc(rtx exp, rtx insn);
void notice_update_cc(rtx exp, rtx insn)
{
   /*PMr fprintf(asm_out_file,";@@ notice_update_cc\n");
     PMr print_inline_rtx(asm_out_file,insn,1);*/
   if (GET_CODE(insn) != INSN)
      return;

   if (GET_CODE(insn) == MULT)
   {
      /*PMr fprintf(asm_out_file,";@@ code is MULT\n"); */
   }

   if (GET_CODE(exp) == PARALLEL)
   {
      /*PMr fprintf(asm_out_file,";@@ code ia PARALLEL\n");PMr*/
      CC_STATUS_INIT;
      exp = XVECEXP(exp, 0, 0);

      if (GET_CODE(exp) == SET && SET_DEST(exp) == cc0_rtx) {
         cc_status.value1 = SET_SRC(exp);

         /*SC020810 3.1*/
         cc_status.mdep.op1 = recog_data.operand[0];

         if (GET_CODE(SET_SRC(exp)) == COMPARE)
         /*SC020810 3.1*/
            cc_status.mdep.op2 = recog_data.operand[1];
         else
            cc_status.mdep.op2 = const0_rtx;
      }
      return;
   }

   if (GET_CODE(exp) == SET)
   {
      /* PMr fprintf(asm_out_file,";@@ code is SET !!!\n");*/
      if (SET_DEST(exp) == cc0_rtx)
      {
         /*PMr fprintf(asm_out_file,";@@ dest is cc0_rtx\n");*/
         CC_STATUS_INIT;
         cc_status.value1 = SET_SRC(exp);
         /*SC020810 3.1*/
         cc_status.mdep.op1 = recog_data.operand[0];

         if (GET_CODE(SET_SRC(exp)) == COMPARE)
         {
            /*PMr fprintf(asm_out_file,";@@ code is COMPARE\n");*/
            /*SC020810 3.1*/
            cc_status.mdep.op2 = recog_data.operand[1];
         }
         else
         {
            /*PMr fprintf(asm_out_file,";@@ code is NOT COMPARE\n");*/
            cc_status.mdep.op2 = const0_rtx;
         }

         if (GET_MODE(cc_status.mdep.op1) == QImode)
         {
            /* Record some info about the comparison.  */
            if (op_in_accu_p(cc_status.mdep.op1, insn))
            {
               /*PMr fprintf(asm_out_file,";@@ cc_status.mdep.op1\n");*/
               cc_status.mdep.in_accu = cc_status.mdep.op1;
            }

            if (op_in_accu_p(cc_status.mdep.op2, insn))
            {
               /*PMr fprintf(asm_out_file,";@@ cc_status.mdep.op2\n");*/
               cc_status.mdep.in_accu = cc_status.mdep.op2;
            }

            if (cc_status.mdep.op2 == const0_rtx
            && cc_status.mdep.in_accu == cc_status.mdep.op1
            && cc_set_with_accu_p(cc_status.mdep.op1,insn))
            {
               /*PMr fprintf(asm_out_file,";@@ cc_status.mdep.cmp0_done = 1 !!!\n");*/
               cc_status.mdep.cmp0_done = 1;
            }
         }
         return;
      }

      if (GET_CODE(SET_DEST(exp)) == MEM
      && GET_CODE(SET_SRC(exp)) == REG)
      {
         /*PMr fprintf(asm_out_file,";@@ code is MEM\n");*/
         return;
      }
      /*PMr fprintf(asm_out_file,";@@ code is NOTHING\n");*/
      CC_STATUS_INIT;
   }
}

/* Output a sequence of assembler instructions to perform a block move.
 * Op0 is the destination, Op1 is the source, and Op2 the byte count. */
 const char* output_movstr(rtx insn, rtx *operands);
const char* output_movstr(rtx insn, rtx *operands)
{
   /*VC030324 : the length could be zero...*/
   rtx ops[5];
   enum machine_mode mode = GET_MODE(operands[2]);

   if( pragma_output )
      output_asm_insn( ";in output_movstr", operands );

   ops[0] = ops[1] = operands[2];
   ops[2] = gen_rtx(CONST_INT, VOIDmode, -1);
   ops[3] = gen_rtx(MEM, BLKmode,
   gen_rtx(POST_INC, Pmode, operands[0]));
   ops[4] = gen_rtx(MEM, BLKmode,
   gen_rtx(POST_INC, Pmode, operands[1]));

   /*VC030324 : check if length is zero*/
   {
      /*   rtx *op=&(operands[2]);*/
      rtx op1[8];
      int size = GET_MODE_SIZE(mode);
      int i=1;
      split_any(operands[2], size - 1, op1);
      /*
      rtx *labelop
      output_branch_0_equ( EQ, GET_MODE_SIZE(mode),
      op1, rtx *labelop, rtx op);
      output_branch_0_equ(NE, size, op1, operands, op);
      */
      if (GET_CODE(operands[2]) == REG && size > 1)
      {
         output_asm_insn("OR     %%a,%0,%1", op1);
         i = 2;
      }
      else
         output_asm_insn("MOVE   %%a,%0", op1);

      for (; i < size; i++)
      {
         rtx ops[1];
         ops[0] = op1[i];
         output_asm_insn("OR     %%a,%0", ops);
      }

      output_asm_insn("JEQ .Lmovend%=", operands);
   }

   if (mode != QImode)
      output_asm_insn(output_add_wide(insn, ops), ops);

   output_asm_insn("\n.Lmov%=:\tMOVE   %%a,%4\n\tMOVE %3,%%a", ops);
   output_asm_insn(output_add_wide(insn, ops), ops);

   if (mode == QImode)
      output_asm_insn("\n\tJNE   .Lmov%=",ops);
   else
      output_asm_insn("\n\tJCC   .Lmov%=",ops);

   output_asm_insn("\n.Lmovend%=:",operands);

   return "";
}

/* Set conditional register usage.  */
void c816_cond_reg_usage(void);
void c816_cond_reg_usage(void)
{
   if (optimize == 0)
      fixed_regs[HARD_FP_REG] = fixed_regs[HARD_FP_REG + 1] = call_used_regs[HARD_FP_REG] = call_used_regs[HARD_FP_REG + 1] = 1;
}

/* Set optimization options.  */
void c816_opt_options(int,int);

void c816_opt_options(int level ATTRIBUTE_UNUSED,int size ATTRIBUTE_UNUSED)
{
   /*flag_force_mem = 0; */
   /*flag_c816_tidy_regs = 1; */
   /* flag_move_all_movables = 1; */
   /* flag_reduce_all_givs = 1; */
   /* flag_rerun_loop_opt = 1; */
   /* nothing to do */
   return ;

   }

#if 0 /* SC 4.x to remove */
/* Check that the expression has a positive addend.  */
static void c816_force_positive(rtx exp)
{
   enum rtx_code code = GET_CODE(exp);

   switch (code)
   {
      case CONST:
         c816_force_positive(XEXP(exp, 0));
         return;

      case PLUS:
         if (GET_CODE(XEXP(exp, 0)) == SYMBOL_REF && GET_CODE(XEXP(exp, 1)) == CONST_INT && INTVAL(XEXP(exp, 1)) < 0)
            INTVAL(XEXP(exp, 1)) &= (1 << POINTER_SIZE) - 1;

         if (GET_CODE(XEXP(exp, 0)) == CONST_INT && GET_CODE(XEXP(exp, 1)) == SYMBOL_REF && INTVAL(XEXP(exp, 0)) < 0)
            INTVAL(XEXP(exp, 0)) &= (1 << POINTER_SIZE) - 1;
         return;

      default:
         break;
      /* do nothing.  */
   }
}
#endif

/* Called from the .md file to emit code to do shifts.  */
bool expand_a_shift (enum machine_mode mode, int code, rtx operands[]);
bool expand_a_shift (enum machine_mode mode, int code, rtx operands[])
{
   if( pragma_output )
   {
      char  buffer[200];
      char* buffer2;

      switch(code)
      {
         case ASHIFTRT: 
            buffer2  = "ASHIFTRT"; 
            break;
         case LSHIFTRT: 
            buffer2  = "LSHIFTRT"; 
            break;
         case ASHIFT: 
            buffer2  = "ASHIFT"; 
            break;
         default: 
            buffer2  = "???"; 
            break;
      }

      sprintf(buffer,";in expand_a_shift, code=%d=%s",code,buffer2);
      output_asm_insn( buffer, operands );
   }

   if( GET_CODE(operands[2]) != CONST_INT )
   {
      rtx tem = gen_reg_rtx(QImode);
      emit_move_insn(tem, operands[2]);
      operands[2] = tem;
   }

   if (mode != SImode)
   {
      output_asm_insn( ";SIMode", operands );
      emit_insn(gen_rtx
               (PARALLEL, VOIDmode,
                         gen_rtvec(2,
                                   gen_rtx(SET, VOIDmode, operands[0],
                                           gen_rtx(code, mode,
                                                   operands[1], operands[2])),
                                   gen_rtx(CLOBBER, VOIDmode, operands[2]))));
   }

   if( pragma_output )
   {
      output_asm_insn( "; out expand_a_shift", operands );
   }

   return true;
}

/* Currently, this looks for large function frames and correctly
 * computes the stack offsets and/or brings stuff in page 0.  */
void c816_prescan_insn(rtx insn, rtx *opvec, int noperands);
void c816_prescan_insn(rtx insn, rtx *opvec, int noperands)
{
   int i;
   int count = 0, is_move = 0;
   struct {
      int needed;
      int is_dest;
   } fix[8];
   rtx set;
   if (noperands > 8)
   abort_with_insn(insn, "Too many operands ???");
   for (i = 0; i < noperands; i++) {
      int size = GET_MODE_SIZE(GET_MODE(opvec[i]));
      fix[i].needed = 0;
      fix[i].is_dest = 0;
      if (use_large_frame(opvec[i], size)) {
         count += 1;
         fix[i].needed = 1;
      }
   }
   if ((set = single_set(insn)) != NULL) {
      enum rtx_code code = GET_CODE(SET_DEST(set));
      enum rtx_code code_src = GET_CODE(SET_SRC(set));
      enum machine_mode mode = GET_MODE(SET_DEST(set));
      int size = GET_MODE_SIZE(mode) - 1;
      if (code == REG
      && (code_src == MINUS || code_src == NEG)
      && size > 0
      && GET_MODE_CLASS(mode) == MODE_INT) {
         /* Check that we are not clobbering an index before being done
         using it.  CI - FIXME - This is a harsh way to do it.  The
         more subtle way would be more painful to code though.
         However, this forces the use of some bytes in Page 0 memory
         in some cases, and this could be a problem.  */
         for (i = 1; i <= (code_src == NEG ? 1 : 2); i++)
         if (GET_CODE(opvec[i]) == MEM) {
            int nregs = find_regs_in_addr(XEXP(opvec[i], 0), 0);
            int found = 0, j;
            for (j = 0; !found && j < nregs; j++)
            found = (REGNO(addr_regs[j]) >= REGNO(opvec[0])
            && REGNO(addr_regs[j]) <= REGNO(opvec[0]) + size);
            if (found && fix[i].needed != 1)
            fix[i].needed = 1, count += 1;
         }
      }
      if ((code_src == PLUS || code_src == MINUS
      || code_src == NEG || code_src == ASHIFT)
      && size > 0
      && GET_MODE_CLASS(mode) == MODE_INT) {
         /* Check if we are post-incrementing.  If so, must move things
         around first.  */
         for (i = 0; i <= (code_src == NEG ? 1 : 2); i++)
         if (GET_CODE(opvec[i]) == MEM
         && GET_CODE(XEXP(opvec[i], 0)) == POST_INC) {
            fix[i].needed = 1, count += 1;
         }
      }
      if (code == REG || code == SUBREG || code == MEM) {
         if (code_src == MOD || code_src == UMOD)
         fix[3].is_dest = 1;
         else
         fix[0].is_dest = 1;
         if (CONSTANT_P(SET_SRC(set))
         || code_src == REG || code_src == SUBREG || code_src == MEM)
         is_move = 1;
      }
   } else if (GET_CODE (PATTERN (insn)) == PARALLEL) {
      set = XVECEXP (PATTERN (insn), 0, 0);
      if (GET_CODE(set) == SET) {
         enum rtx_code code = GET_CODE(SET_DEST(set));
         if (code == REG || code == SUBREG || code == MEM) {
            fix[0].is_dest = 1;
            code = GET_CODE(SET_SRC(set));
            if (noperands == 4 &&
            (code == DIV || code == UDIV))
            fix[3].is_dest = 1;
         }
      }
   }
   if (count == 0)
   return;
   /* We will need to modify the stack pointer.  Check that it is not
   used as a register operand.  */
   for (i = 0; i < noperands; i++) {
      if (GET_CODE(opvec[i]) == REG && REGNO(opvec[i]) == HARD_SP_REG) {
         count += 1;
         fix[i].needed = 1;
      }
   }
   if (is_move && count == 1) {
      /* Check that the other operand does not use the stack pointer.  */
      if (fix[0].needed) {
         if (!(GET_CODE(opvec[1]) == MEM
         && refers_to_regno_p(HARD_SP_REG, HARD_SP_REG + 1,
         opvec[1], NULL)))
         return;
      } else {
         if (!(GET_CODE(opvec[0]) == MEM
         && refers_to_regno_p(HARD_SP_REG, HARD_SP_REG + 1,
         opvec[1], NULL)))
         return;
      }
   }
   count = 0;
   for (i = 0; i < noperands; i++)
   if (fix[i].needed && !fix[i].is_dest) {
      /* Get the inputs.  */
      rtx ops[2];
      if (count > 1)
      abort_with_insn(insn, "Too many stack operands");
      if (spill_rtx[count] == NULL) {
/*output_asm_insn( "; Spill NULL", ops );*/
         if (count == 0) {
/*output_asm_insn( "; count == 0", ops );*/
            spill_rtx[count] = gen_rtx_SYMBOL_REF( Pmode, spill_name);
            SYMBOL_REF_FLAG(spill_rtx[count]) = 1;
            
         } else {
/*output_asm_insn( "; count <> 0", ops );*/
            spill_rtx[count] = gen_rtx(PLUS, Pmode,
            spill_rtx[0],
            gen_rtx(CONST_INT, VOIDmode,
            count << 2));
         }
      }
      ops[0] = gen_rtx(MEM, GET_MODE(opvec[i]), spill_rtx[count]);
      ops[1] = opvec[i];
/*output_asm_insn( "; Je suis là!", ops );*/
      output_asm_insn(output_move(insn, ops), ops);
      opvec[i] = ops[0];
      count += 1;
   }
   
   if (is_move)
      return;
   
   count = 0;
   for (i = 0; i < noperands; i++)
   {
      if (fix[i].needed && fix[i].is_dest) 
      {
         /* Handle results.  */
         rtx tem, pattern;
         struct basic_block_def *  ptr;

         if (count > 1)
            abort_with_insn(insn, "Too many stack operands");
      
         if (spill_rtx[count] == NULL) 
         {
            if (count == 0) 
            {
               spill_rtx[count] = gen_rtx(SYMBOL_REF, Pmode, spill_name);
               SYMBOL_REF_FLAG(spill_rtx[count]) = 1;
            }
            else 
            {
               spill_rtx[count] = gen_rtx(PLUS, Pmode,
               spill_rtx[0],
               gen_rtx(CONST_INT, VOIDmode,
               count << 2));
            }
         }
      
         tem = gen_rtx(MEM, GET_MODE(opvec[i]), spill_rtx[count]);
         pattern = gen_rtx(SET, VOIDmode, opvec[i], tem);
     
         add_insn_after(make_insn_raw(pattern), insn,ptr);
         opvec[i] = tem;
         count += 1;
      }
   }
}

#if 1 /*VC020816: attributes...*/

/* Handle an "page_0" attribute; arguments as in
struct attribute_spec.handler.  */
static tree cool_handle_page_0_attribute( tree* node, tree name, tree args ATTRIBUTE_UNUSED, int flags ATTRIBUTE_UNUSED, bool* no_add_attrs )
{
   tree decl = *node;

   if(TREE_STATIC (decl) || DECL_EXTERNAL (decl) )
   {
      if (lookup_attribute ("indirect", DECL_ATTRIBUTES (decl)) != NULL_TREE)
      {
         error("Cannot specify both page_0 and indirect attributes");
         return NULL_TREE;
      }
#if 0
      DECL_SECTION_NAME (decl) = DECL_INITIAL (decl) != 0 ? build_string (12, ".page0_data") : build_string (11, ".page0_bss");
#endif
      DECL_COMMON (decl) = 0;
   }
   else
   {
      warning( OPT_Wattributes, "%qs attribute ignored", IDENTIFIER_POINTER (name));
      *no_add_attrs = true;
   }

   return NULL_TREE;
}


/* Handle an "indirect" attribute; arguments as in
struct attribute_spec.handler.  */
static tree cool_handle_indirect_attribute(tree* node, tree name, tree args ATTRIBUTE_UNUSED, int flags ATTRIBUTE_UNUSED , bool* no_add_attrs )
{
   tree decl = *node;

   if ((TREE_STATIC (decl) || DECL_EXTERNAL (decl) ) )
   {
      if( (lookup_attribute ("page_0",
      DECL_ATTRIBUTES (decl)) != NULL_TREE)
      ||(lookup_attribute ("direct",
      DECL_ATTRIBUTES (decl)) != NULL_TREE) )
      {
         error("Cannot specify both page_0 and indirect attributes");
         return NULL_TREE;
      }
   }
   else
   {
      warning( OPT_Wattributes, "%qs attribute ignored", IDENTIFIER_POINTER (name));
      *no_add_attrs = true;
   }
   return NULL_TREE;
}


/* Supported attributes:

interrupt_handler: output a prologue and epilogue suitable for an
interrupt handler.

page_0 or direct: This variable lives in page 0.

indirect: This variable does not live in page 0.

tiny_data: This variable lives in the tiny data area and can be
referenced with 16-bit absolute memory references.  */

const struct attribute_spec cool_attribute_table[] =
{
   { "page_0",            0, 0, true,  false, false, cool_handle_page_0_attribute },
   { "direct",            0, 0, true,  false, false, cool_handle_page_0_attribute },
   { "indirect",          0, 0, true,  false, false, cool_handle_indirect_attribute },
   { NULL,                0, 0, false, false, false, NULL }
};

#endif


/* Handle machine specific pragmas to be semi-compatible with Hitachi
   compiler.  */
void c816_pr_interrupt( struct cpp_reader* pfile ATTRIBUTE_UNUSED )
{
   pragma_interrupt = 1;
}

void c816_pr_output( struct cpp_reader* pfile ATTRIBUTE_UNUSED )
{
   pragma_output = 1;
}

/* Define where to put the arguments to a function.  Value is zero to
* push the argument on the stack, or a hard register in which to
* store the argument.
*
* MODE is the argument's machine mode.
* TYPE is the data type of the argument (as a tree).  This is null
*     for libcalls where that information may not be available.
* CUM is a variable of type CUMULATIVE_ARGS which gives info about
*     the preceding args and about the function being called.
* NAMED is nonzero if this argument is a named parameter (otherwise
*     it is an extra parameter matching an ellipsis).  */


#ifndef MUST_PASS_IN_STACK_MOMO
#define MUST_PASS_IN_STACK_MOMO(MODE,TYPE)         \
  ((TYPE) != 0                \
   && (TREE_CODE (TYPE_SIZE (TYPE)) != INTEGER_CST \
       || TREE_ADDRESSABLE (TYPE)         \
       || ((MODE) == BLKmode           \
      && ! ((TYPE) != 0 && TREE_CODE (TYPE_SIZE (TYPE)) == INTEGER_CST \
       && 0 == (int_size_in_bytes (TYPE)  \
           % (PARM_BOUNDARY / BITS_PER_UNIT))) \
      && (FUNCTION_ARG_PADDING (MODE, TYPE)  \
          == (BYTES_BIG_ENDIAN ? upward : downward)))))
#endif

rtx function_arg(int cum, enum machine_mode mode, tree type, int named)
{
   int size = (mode == BLKmode) ? int_size_in_bytes(type) : GET_MODE_SIZE(mode);

   if( (!type) || (TYPE_SIZE( type ) == 0) )
      return (rtx) NULL;

   if (!named || MUST_PASS_IN_STACK_MOMO(mode, type))
      return (rtx) NULL;
   if (cum + size <= 4)
      return gen_rtx(REG, mode, cum + 1);
   else
      return (rtx) NULL;
}

/* ----------------------------------------------------------------
* Initialize the GCC target structure
* ---------------------------------------------------------------- */

/* Initialize the GCC target structure.  */
#undef TARGET_ASM_ALIGNED_HI_OP
#define TARGET_ASM_ALIGNED_HI_OP "\t.word\t"
#undef TARGET_ASM_ALIGNED_SI_OP
#define TARGET_ASM_ALIGNED_SI_OP "\t.long\t"
#undef TARGET_ASM_UNALIGNED_HI_OP
#define TARGET_ASM_UNALIGNED_HI_OP "\t.word\t"
#undef TARGET_ASM_UNALIGNED_SI_OP
#define TARGET_ASM_UNALIGNED_SI_OP "\t.long\t"

#undef TARGET_ASM_FILE_START_FILE_DIRECTIVE
#define TARGET_ASM_FILE_START_FILE_DIRECTIVE true

#undef TARGET_ASM_FUNCTION_RODATA_SECTION
#define TARGET_ASM_FUNCTION_RODATA_SECTION default_no_function_rodata_section

#undef TARGET_SECTION_TYPE_FLAGS
#define TARGET_SECTION_TYPE_FLAGS elf32_c816_section_type_flags

#define LIBCALL_COSTS(X) \
  (COSTS_N_INSNS(20) * GET_MODE_SIZE(GET_MODE(x)))


int cool_address_cost (rtx op ATTRIBUTE_UNUSED, unsigned char ch ATTRIBUTE_UNUSED)
{
  return 1;
}

/* const struct attribute_spec cool_attribute_table[]; */

#undef TARGET_ATTRIBUTE_TABLE
#define TARGET_ATTRIBUTE_TABLE cool_attribute_table


/*#undef TARGET_ASM_ALIGNED_HI_OP*/
/*#define TARGET_ASM_ALIGNED_HI_OP "\t.word\t"*/

#undef TARGET_ASM_FUNCTION_PROLOGUE
#define TARGET_ASM_FUNCTION_PROLOGUE cool_output_function_prologue
#undef TARGET_ASM_FUNCTION_EPILOGUE
#define TARGET_ASM_FUNCTION_EPILOGUE cool_output_function_epilogue


struct gcc_target targetm = TARGET_INITIALIZER;

/* These two are taken from the corresponding vax descriptors
   in real.c, changing only the encode/decode routine pointers.  */
const struct real_format c816_single_format =
  {
    encode_c816_single,
    decode_c816_single,
    2,
    16,
    16,
    -126,
    129, /* 128 */
    23,
    23,
    false,
    false,
    true,
    true,
    false,
    false,
    false,
    false
  };

static void encode_c816_single (const struct real_format *fmt ATTRIBUTE_UNUSED, long *buf ATTRIBUTE_UNUSED, const REAL_VALUE_TYPE *r ATTRIBUTE_UNUSED)
{
   long lbuf;

   (*ieee_single_format.encode)( fmt, &lbuf, r );

   OLD_REAL_VALUE_TO_TARGET_SINGLE( lbuf, buf[0] );

   /*buf[0] >>= 8;*/

   /*fprintf( stderr, "%8.8x :: %8.8x\n", lbuf, buf[0] );*/
}

static void decode_c816_single (const struct real_format *fmt ATTRIBUTE_UNUSED, REAL_VALUE_TYPE *r ATTRIBUTE_UNUSED, const long *buf ATTRIBUTE_UNUSED)
{
   fprintf( stderr, ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n" );
}

/* Define how to find the value returned by a function.  VALTYPE is
 * the data type of the value (as a tree).  If the precise function
 * being called is known, FUNC is its FUNCTION_DECL; otherwise, FUNC
 * is 0.
 *
 * On CoolRISC, return value goes into registers reg3...reg0 */
static rtx c816_function_value (const_tree type, const_tree func ATTRIBUTE_UNUSED,  bool outgoing ATTRIBUTE_UNUSED)
{
   unsigned int offs;
   offs = int_size_in_bytes (type);

#if 0 /* SC to be removed */
   switch( TYPE_MODE( type ) )
   {
      case QImode :
         fprintf( stderr, "QImode: %d\n", offs );
         break;

      case HImode :
         fprintf( stderr, "HImode: %d\n", offs );
         break;

      case SImode :
         fprintf( stderr, "SImode: %d\n", offs );
         break;

      case DImode :
         fprintf( stderr, "DImode: %d\n", offs );
         break;
         
      case TQFmode   :
         fprintf( stderr, "TQFmode: %d\n", offs );
         break;

      case SFmode    :
         fprintf( stderr, "SFmode: %d\n", offs );
         break;

      case DFmode    :
         fprintf( stderr, "DFmode: %d\n", offs );
         break;

      default     :
         fprintf( stderr, "XXmode: %d\n", offs );
   }
#endif

   if( TYPE_MODE( type ) == QImode )
   {
      return gen_rtx_REG( TYPE_MODE( type ), REG_1 );
   }

   return gen_rtx_REG( TYPE_MODE( type ), REG_0 );
}
