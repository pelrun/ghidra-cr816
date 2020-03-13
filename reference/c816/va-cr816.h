/* stdarg/vararg support for the CSEM CoolRISC 816 family */


/* Define va_list.  */
#ifndef _VA_LIST_
#define _VA_LIST_
typedef void *va_list;
#endif


/* Define the standard macros for the user,
   if this invocation was from the user program.  */
#if defined (_STDARG_H) || defined (_VARARGS_H)

/* Amount of space required in an argument list for an arg of type TYPE.
   TYPE may alternatively be an expression whose type is used.  */

#define __va_rounded_size(TYPE)  \
  (((sizeof (TYPE) + sizeof (char) - 1) / sizeof (char)) * sizeof (char))

#define va_start(AP, LASTARG) 						\
 (AP = ((va_list) __builtin_next_arg (LASTARG)))

#undef va_end
void va_end (va_list);		/* Defined in libgcc.a */
#define va_end(AP)	((void)0)

/* We cast to void * and then to TYPE * because this avoids
   a warning about increasing the alignment requirement.  */

/* This is for big-endian machines; small args are padded downward.  */
#define va_arg(AP, TYPE)						\
 (AP = (va_list) ((char *) (AP) + __va_rounded_size (TYPE)),	\
  *((TYPE *) (void *) ((char *) (AP)					\
		       - ((sizeof (TYPE) < __va_rounded_size (char)	\
			   ? sizeof (TYPE) : __va_rounded_size (TYPE))))))

#endif /* defined (_STDARG_H) || defined (_VARARGS_H) */
