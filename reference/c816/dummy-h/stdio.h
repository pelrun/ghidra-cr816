/* Dummy stdio.h used when compiling libgcc2.  */

#ifndef _STDIO_H_
#ifdef __cplusplus
extern "C" {
#endif
#define	_STDIO_H_

typedef struct __sFILE FILE;

#ifndef NULL
#define	NULL	0L
#endif

#define EOF	(-1)

extern int printf(const char *, ...);
extern int fprintf(FILE *, const char *, ...);
extern FILE *fopen(const char *_name, const char *_type);
extern int fclose(FILE *);
extern int fflush(FILE *);

extern FILE *stdin, *stdout, *stderr;

#ifdef __cplusplus
}
#endif
#endif /* _STDIO_H_ */
