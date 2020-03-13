# 1 "c816.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "c816.c"
# 42 "c816.c"
# 1 "/home/mzorgati/gcc_build/gcc/config.h" 1





# 1 "/home/mzorgati/gcc_build/gcc/auto-host.h" 1
# 7 "/home/mzorgati/gcc_build/gcc/config.h" 2
# 43 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 1
# 27 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stdarg.h" 1
# 40 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stdarg.h"
typedef __builtin_va_list __gnuc_va_list;
# 102 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stdarg.h"
typedef __gnuc_va_list va_list;
# 28 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 38 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1
# 149 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h"
typedef int ptrdiff_t;
# 211 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h"
typedef unsigned int size_t;
# 323 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h"
typedef short unsigned int wchar_t;
# 39 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2


# 1 "/usr/include/stdio.h" 1 3 4
# 29 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/_ansi.h" 1 3 4
# 15 "/usr/include/_ansi.h" 3 4
# 1 "/usr/include/newlib.h" 1 3 4
# 16 "/usr/include/_ansi.h" 2 3 4
# 1 "/usr/include/sys/config.h" 1 3 4



# 1 "/usr/include/machine/ieeefp.h" 1 3 4
# 5 "/usr/include/sys/config.h" 2 3 4
# 167 "/usr/include/sys/config.h" 3 4
# 1 "/usr/include/cygwin/config.h" 1 3 4
# 168 "/usr/include/sys/config.h" 2 3 4
# 17 "/usr/include/_ansi.h" 2 3 4
# 30 "/usr/include/stdio.h" 2 3 4




# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 35 "/usr/include/stdio.h" 2 3 4
# 45 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/sys/reent.h" 1 3 4
# 13 "/usr/include/sys/reent.h" 3 4
# 1 "/usr/include/_ansi.h" 1 3 4
# 14 "/usr/include/sys/reent.h" 2 3 4
# 1 "/usr/include/sys/_types.h" 1 3 4
# 12 "/usr/include/sys/_types.h" 3 4
# 1 "/usr/include/sys/lock.h" 1 3 4
# 14 "/usr/include/sys/lock.h" 3 4
typedef void *_LOCK_T;
# 44 "/usr/include/sys/lock.h" 3 4
void __cygwin_lock_init(_LOCK_T *);
void __cygwin_lock_init_recursive(_LOCK_T *);
void __cygwin_lock_fini(_LOCK_T *);
void __cygwin_lock_lock(_LOCK_T *);
int __cygwin_lock_trylock(_LOCK_T *);
void __cygwin_lock_unlock(_LOCK_T *);
# 13 "/usr/include/sys/_types.h" 2 3 4

typedef long _off_t;
__extension__ typedef long long _off64_t;


typedef int _ssize_t;





# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 352 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 3 4
typedef unsigned int wint_t;
# 25 "/usr/include/sys/_types.h" 2 3 4


typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;

typedef _LOCK_T _flock_t;


typedef void *_iconv_t;
# 15 "/usr/include/sys/reent.h" 2 3 4




typedef unsigned long __ULong;
# 35 "/usr/include/sys/reent.h" 3 4
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 87 "/usr/include/sys/reent.h" 3 4
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 103 "/usr/include/sys/reent.h" 3 4
struct __sbuf {
 unsigned char *_base;
 int _size;
};






typedef long _fpos_t;



typedef _off64_t _fpos64_t;
# 168 "/usr/include/sys/reent.h" 3 4
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  _ssize_t __attribute__((__cdecl__)) (*_read) (struct _reent *, void *, char *, int);

  _ssize_t __attribute__((__cdecl__)) (*_write) (struct _reent *, void *, const char *, int);

  _fpos_t __attribute__((__cdecl__)) (*_seek) (struct _reent *, void *, _fpos_t, int);
  int __attribute__((__cdecl__)) (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

};


struct __sFILE64 {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;

  struct _reent *_data;


  void * _cookie;

  _ssize_t __attribute__((__cdecl__)) (*_read) (struct _reent *, void *, char *, int);

  _ssize_t __attribute__((__cdecl__)) (*_write) (struct _reent *, void *, const char *, int);

  _fpos_t __attribute__((__cdecl__)) (*_seek) (struct _reent *, void *, _fpos_t, int);
  int __attribute__((__cdecl__)) (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _flags2;

  _off64_t _offset;
  _fpos64_t __attribute__((__cdecl__)) (*_seek64) (struct _reent *, void *, _fpos64_t, int);


  _flock_t _lock;

};
typedef struct __sFILE64 __FILE;




struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 294 "/usr/include/sys/reent.h" 3 4
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 569 "/usr/include/sys/reent.h" 3 4
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void __attribute__((__cdecl__)) (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 803 "/usr/include/sys/reent.h" 3 4
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);







  struct _reent * __attribute__((__cdecl__)) __getreent (void);
# 46 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/sys/types.h" 1 3 4
# 25 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/machine/_types.h" 1 3 4
# 26 "/usr/include/machine/_types.h" 3 4
typedef signed char __int8_t ;
typedef unsigned char __uint8_t ;
# 36 "/usr/include/machine/_types.h" 3 4
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
# 46 "/usr/include/machine/_types.h" 3 4
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
# 58 "/usr/include/machine/_types.h" 3 4
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
# 76 "/usr/include/machine/_types.h" 3 4
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
# 99 "/usr/include/machine/_types.h" 3 4
typedef signed long long __int64_t;
typedef unsigned long long __uint64_t;
# 26 "/usr/include/sys/types.h" 2 3 4
# 69 "/usr/include/sys/types.h" 3 4
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 70 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/machine/types.h" 1 3 4
# 19 "/usr/include/machine/types.h" 3 4
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 71 "/usr/include/sys/types.h" 2 3 4
# 92 "/usr/include/sys/types.h" 3 4
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;



typedef unsigned short ushort;
typedef unsigned int uint;



typedef unsigned long clock_t;




typedef long time_t;




struct timespec {
  time_t tv_sec;
  long tv_nsec;
};

struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;
typedef char * caddr_t;
# 180 "/usr/include/sys/types.h" 3 4
typedef int pid_t;



typedef _ssize_t ssize_t;
# 203 "/usr/include/sys/types.h" 3 4
typedef unsigned short nlink_t;
# 225 "/usr/include/sys/types.h" 3 4
typedef long fd_mask;







typedef struct _types_fd_set {
 fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 256 "/usr/include/sys/types.h" 3 4
typedef unsigned long clockid_t;




typedef unsigned long timer_t;



typedef unsigned long useconds_t;
typedef long suseconds_t;

# 1 "/usr/include/sys/features.h" 1 3 4
# 269 "/usr/include/sys/types.h" 2 3 4
# 373 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/cygwin/types.h" 1 3 4
# 20 "/usr/include/cygwin/types.h" 3 4
# 1 "/usr/include/sys/sysmacros.h" 1 3 4
# 21 "/usr/include/cygwin/types.h" 2 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 18 "/usr/include/stdint.h" 3 4
typedef signed char int8_t;
typedef short int16_t;
typedef long int32_t;
typedef long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned short uint16_t;


typedef unsigned long uint32_t;

typedef unsigned long long uint64_t;



typedef signed char int_least8_t;
typedef short int_least16_t;
typedef long int_least32_t;
typedef long long int_least64_t;

typedef unsigned char uint_least8_t;
typedef unsigned short uint_least16_t;
typedef unsigned long uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed char int_fast8_t;
typedef long int_fast16_t;
typedef long int_fast32_t;
typedef long long int_fast64_t;

typedef unsigned char uint_fast8_t;
typedef unsigned long uint_fast16_t;
typedef unsigned long uint_fast32_t;
typedef unsigned long long uint_fast64_t;





typedef long intptr_t;

typedef unsigned long uintptr_t;



typedef long long intmax_t;
typedef unsigned long long uintmax_t;
# 22 "/usr/include/cygwin/types.h" 2 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 23 "/usr/include/cygwin/types.h" 2 3 4



typedef struct timespec timespec_t;




typedef struct timespec timestruc_t;





typedef _off64_t off_t;





typedef __loff_t loff_t;



typedef short __dev16_t;
typedef unsigned long __dev32_t;

typedef __dev32_t dev_t;







typedef long blksize_t;




typedef long __blkcnt32_t;
typedef long long __blkcnt64_t;

typedef __blkcnt64_t blkcnt_t;







typedef unsigned long fsblkcnt_t;




typedef unsigned long fsfilcnt_t;




typedef unsigned short __uid16_t;
typedef unsigned long __uid32_t;

typedef __uid32_t uid_t;







typedef unsigned short __gid16_t;
typedef unsigned long __gid32_t;

typedef __gid32_t gid_t;







typedef unsigned long __ino32_t;
typedef unsigned long long __ino64_t;

typedef __ino64_t ino_t;
# 118 "/usr/include/cygwin/types.h" 3 4
typedef unsigned long id_t;
# 140 "/usr/include/cygwin/types.h" 3 4
struct flock {
 short l_type;
 short l_whence;
 off_t l_start;
 off_t l_len;

 pid_t l_pid;




};



typedef long long key_t;







typedef unsigned long vm_offset_t;




typedef unsigned long vm_size_t;




typedef void *vm_object_t;




typedef unsigned char u_int8_t;



typedef __uint16_t u_int16_t;



typedef __uint32_t u_int32_t;



typedef __uint64_t u_int64_t;




typedef __int32_t register_t;




typedef char *addr_t;




typedef unsigned mode_t;





typedef struct __pthread_t {char __dummy;} *pthread_t;
typedef struct __pthread_mutex_t {char __dummy;} *pthread_mutex_t;

typedef struct __pthread_key_t {char __dummy;} *pthread_key_t;
typedef struct __pthread_attr_t {char __dummy;} *pthread_attr_t;
typedef struct __pthread_mutexattr_t {char __dummy;} *pthread_mutexattr_t;
typedef struct __pthread_condattr_t {char __dummy;} *pthread_condattr_t;
typedef struct __pthread_cond_t {char __dummy;} *pthread_cond_t;


typedef struct
{
  pthread_mutex_t mutex;
  int state;
}
pthread_once_t;
typedef struct __pthread_rwlock_t {char __dummy;} *pthread_rwlock_t;
typedef struct __pthread_rwlockattr_t {char __dummy;} *pthread_rwlockattr_t;
# 374 "/usr/include/sys/types.h" 2 3 4
# 47 "/usr/include/stdio.h" 2 3 4



typedef __FILE FILE;



typedef _fpos64_t fpos_t;
# 65 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/sys/stdio.h" 1 3 4
# 14 "/usr/include/sys/stdio.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 15 "/usr/include/sys/stdio.h" 2 3 4
# 35 "/usr/include/sys/stdio.h" 3 4



ssize_t __attribute__((__cdecl__)) getline (char **, size_t *, FILE *);
ssize_t __attribute__((__cdecl__)) getdelim (char **, size_t *, int, FILE *);



# 66 "/usr/include/stdio.h" 2 3 4
# 170 "/usr/include/stdio.h" 3 4
FILE * __attribute__((__cdecl__)) tmpfile (void);
char * __attribute__((__cdecl__)) tmpnam (char *);
int __attribute__((__cdecl__)) fclose (FILE *);
int __attribute__((__cdecl__)) fflush (FILE *);
FILE * __attribute__((__cdecl__)) freopen (const char *, const char *, FILE *);
void __attribute__((__cdecl__)) setbuf (FILE *, char *);
int __attribute__((__cdecl__)) setvbuf (FILE *, char *, int, size_t);
int __attribute__((__cdecl__)) fprintf (FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

int __attribute__((__cdecl__)) fscanf (FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)));

int __attribute__((__cdecl__)) printf (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2)));

int __attribute__((__cdecl__)) scanf (const char *, ...) __attribute__ ((__format__ (__scanf__, 1, 2)));

int __attribute__((__cdecl__)) sscanf (const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)));

int __attribute__((__cdecl__)) vfprintf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) vprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)));

int __attribute__((__cdecl__)) vsprintf (char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) fgetc (FILE *);
char * __attribute__((__cdecl__)) fgets (char *, int, FILE *);
int __attribute__((__cdecl__)) fputc (int, FILE *);
int __attribute__((__cdecl__)) fputs (const char *, FILE *);
int __attribute__((__cdecl__)) getc (FILE *);
int __attribute__((__cdecl__)) getchar (void);
char * __attribute__((__cdecl__)) gets (char *);
int __attribute__((__cdecl__)) putc (int, FILE *);
int __attribute__((__cdecl__)) putchar (int);
int __attribute__((__cdecl__)) puts (const char *);
int __attribute__((__cdecl__)) ungetc (int, FILE *);
size_t __attribute__((__cdecl__)) fread (void *, size_t _size, size_t _n, FILE *);
size_t __attribute__((__cdecl__)) fwrite (const void * , size_t _size, size_t _n, FILE *);



int __attribute__((__cdecl__)) fgetpos (FILE *, fpos_t *);

int __attribute__((__cdecl__)) fseek (FILE *, long, int);



int __attribute__((__cdecl__)) fsetpos (FILE *, const fpos_t *);

long __attribute__((__cdecl__)) ftell ( FILE *);
void __attribute__((__cdecl__)) rewind (FILE *);
void __attribute__((__cdecl__)) clearerr (FILE *);
int __attribute__((__cdecl__)) feof (FILE *);
int __attribute__((__cdecl__)) ferror (FILE *);
void __attribute__((__cdecl__)) perror (const char *);

FILE * __attribute__((__cdecl__)) fopen (const char *_name, const char *_type);
int __attribute__((__cdecl__)) sprintf (char *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

int __attribute__((__cdecl__)) remove (const char *);
int __attribute__((__cdecl__)) rename (const char *, const char *);






int __attribute__((__cdecl__)) fseeko (FILE *, off_t, int);
off_t __attribute__((__cdecl__)) ftello ( FILE *);


int __attribute__((__cdecl__)) asiprintf (char **, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

int __attribute__((__cdecl__)) asprintf (char **, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));


int __attribute__((__cdecl__)) diprintf (int, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

int __attribute__((__cdecl__)) dprintf (int, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));


int __attribute__((__cdecl__)) fcloseall (void);
int __attribute__((__cdecl__)) fiprintf (FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

int __attribute__((__cdecl__)) fiscanf (FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)));

int __attribute__((__cdecl__)) iprintf (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2)));

int __attribute__((__cdecl__)) iscanf (const char *, ...) __attribute__ ((__format__ (__scanf__, 1, 2)));

int __attribute__((__cdecl__)) siprintf (char *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

int __attribute__((__cdecl__)) siscanf (const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)));

int __attribute__((__cdecl__)) snprintf (char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) sniprintf (char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

char * __attribute__((__cdecl__)) tempnam (const char *, const char *);
int __attribute__((__cdecl__)) vasiprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) vasprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) vdiprintf (int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) vdprintf (int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) vsniprintf (char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) vsnprintf (char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) vfiprintf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) vfiscanf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)));

int __attribute__((__cdecl__)) vfscanf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)));

int __attribute__((__cdecl__)) viprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)));

int __attribute__((__cdecl__)) vsiprintf (char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) viscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)));

int __attribute__((__cdecl__)) vscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)));

int __attribute__((__cdecl__)) vsiscanf (const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)));

int __attribute__((__cdecl__)) vsscanf (const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 306 "/usr/include/stdio.h" 3 4
FILE * __attribute__((__cdecl__)) fdopen (int, const char *);

int __attribute__((__cdecl__)) fileno (FILE *);
int __attribute__((__cdecl__)) getw (FILE *);
int __attribute__((__cdecl__)) pclose (FILE *);
FILE * __attribute__((__cdecl__)) popen (const char *, const char *);
int __attribute__((__cdecl__)) putw (int, FILE *);
void __attribute__((__cdecl__)) setbuffer (FILE *, char *, int);
int __attribute__((__cdecl__)) setlinebuf (FILE *);
int __attribute__((__cdecl__)) getc_unlocked (FILE *);
int __attribute__((__cdecl__)) getchar_unlocked (void);
void __attribute__((__cdecl__)) flockfile (FILE *);
int __attribute__((__cdecl__)) ftrylockfile (FILE *);
void __attribute__((__cdecl__)) funlockfile (FILE *);
int __attribute__((__cdecl__)) putc_unlocked (int, FILE *);
int __attribute__((__cdecl__)) putchar_unlocked (int);






int __attribute__((__cdecl__)) _asiprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) _asprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) _diprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) _dprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) _fclose_r (struct _reent *, FILE *);
int __attribute__((__cdecl__)) _fcloseall_r (struct _reent *);
FILE * __attribute__((__cdecl__)) _fdopen_r (struct _reent *, int, const char *);
int __attribute__((__cdecl__)) _fflush_r (struct _reent *, FILE *);
char * __attribute__((__cdecl__)) _fgets_r (struct _reent *, char *, int, FILE *);
int __attribute__((__cdecl__)) _fiprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) _fiscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)));

FILE * __attribute__((__cdecl__)) _fopen_r (struct _reent *, const char *, const char *);
int __attribute__((__cdecl__)) _fprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) _fputc_r (struct _reent *, int, FILE *);
int __attribute__((__cdecl__)) _fputs_r (struct _reent *, const char *, FILE *);
size_t __attribute__((__cdecl__)) _fread_r (struct _reent *, void *, size_t _size, size_t _n, FILE *);
int __attribute__((__cdecl__)) _fscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)));

int __attribute__((__cdecl__)) _fseek_r (struct _reent *, FILE *, long, int);
long __attribute__((__cdecl__)) _ftell_r (struct _reent *, FILE *);
size_t __attribute__((__cdecl__)) _fwrite_r (struct _reent *, const void * , size_t _size, size_t _n, FILE *);
int __attribute__((__cdecl__)) _getc_r (struct _reent *, FILE *);
int __attribute__((__cdecl__)) _getc_unlocked_r (struct _reent *, FILE *);
int __attribute__((__cdecl__)) _getchar_r (struct _reent *);
int __attribute__((__cdecl__)) _getchar_unlocked_r (struct _reent *);
char * __attribute__((__cdecl__)) _gets_r (struct _reent *, char *);
int __attribute__((__cdecl__)) _iprintf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

int __attribute__((__cdecl__)) _iscanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)));

int __attribute__((__cdecl__)) _mkstemp_r (struct _reent *, char *);
char * __attribute__((__cdecl__)) _mktemp_r (struct _reent *, char *);
void __attribute__((__cdecl__)) _perror_r (struct _reent *, const char *);
int __attribute__((__cdecl__)) _printf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)));

int __attribute__((__cdecl__)) _putc_r (struct _reent *, int, FILE *);
int __attribute__((__cdecl__)) _putc_unlocked_r (struct _reent *, int, FILE *);
int __attribute__((__cdecl__)) _putchar_unlocked_r (struct _reent *, int);
int __attribute__((__cdecl__)) _putchar_r (struct _reent *, int);
int __attribute__((__cdecl__)) _puts_r (struct _reent *, const char *);
int __attribute__((__cdecl__)) _remove_r (struct _reent *, const char *);
int __attribute__((__cdecl__)) _rename_r (struct _reent *, const char *_old, const char *_new);

int __attribute__((__cdecl__)) _scanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)));

int __attribute__((__cdecl__)) _siprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) _siscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)));

int __attribute__((__cdecl__)) _sniprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)));

int __attribute__((__cdecl__)) _snprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)));

int __attribute__((__cdecl__)) _sprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)));

int __attribute__((__cdecl__)) _sscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)));

char * __attribute__((__cdecl__)) _tempnam_r (struct _reent *, const char *, const char *);
FILE * __attribute__((__cdecl__)) _tmpfile_r (struct _reent *);
char * __attribute__((__cdecl__)) _tmpnam_r (struct _reent *, char *);
int __attribute__((__cdecl__)) _ungetc_r (struct _reent *, int, FILE *);
int __attribute__((__cdecl__)) _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) _vdprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) _vfprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) _viprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) _vprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)));

int __attribute__((__cdecl__)) _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) _vsprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)));

int __attribute__((__cdecl__)) _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)));

int __attribute__((__cdecl__)) _vsnprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)));

int __attribute__((__cdecl__)) _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)));

int __attribute__((__cdecl__)) _vfscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)));

int __attribute__((__cdecl__)) _viscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)));

int __attribute__((__cdecl__)) _vscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)));

int __attribute__((__cdecl__)) _vsscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)));

int __attribute__((__cdecl__)) _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)));


ssize_t __attribute__((__cdecl__)) __getdelim (char **, size_t *, int, FILE *);
ssize_t __attribute__((__cdecl__)) __getline (char **, size_t *, FILE *);
# 460 "/usr/include/stdio.h" 3 4
int __attribute__((__cdecl__)) __srget_r (struct _reent *, FILE *);
int __attribute__((__cdecl__)) __swbuf_r (struct _reent *, int, FILE *);






FILE *__attribute__((__cdecl__)) funopen (const void * _cookie, int (*readfn)(void * _cookie, char *_buf, int _n), int (*writefn)(void * _cookie, const char *_buf, int _n), fpos_t (*seekfn)(void * _cookie, fpos_t _off, int _whence), int (*closefn)(void * _cookie));
# 516 "/usr/include/stdio.h" 3 4
extern __inline__ __attribute__ ((__always_inline__)) int __sgetc_r(struct _reent *__ptr, FILE *__p)
  {
    int __c = (--(__p)->_r < 0 ? __srget_r(__ptr, __p) : (int)(*(__p)->_p++));
    if ((__p->_flags & 0x4000) && (__c == '\r'))
      {
      int __c2 = (--(__p)->_r < 0 ? __srget_r(__ptr, __p) : (int)(*(__p)->_p++));
      if (__c2 == '\n')
        __c = __c2;
      else
        ungetc(__c2, __p);
      }
    return __c;
  }
# 598 "/usr/include/stdio.h" 3 4

# 42 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 179 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/home/mzorgati/gcc-4.4.0/include/safe-ctype.h" 1
# 57 "/home/mzorgati/gcc-4.4.0/include/safe-ctype.h"
enum {

  _sch_isblank = 0x0001,
  _sch_iscntrl = 0x0002,
  _sch_isdigit = 0x0004,
  _sch_islower = 0x0008,
  _sch_isprint = 0x0010,
  _sch_ispunct = 0x0020,
  _sch_isspace = 0x0040,
  _sch_isupper = 0x0080,
  _sch_isxdigit = 0x0100,


  _sch_isidst = 0x0200,
  _sch_isvsp = 0x0400,
  _sch_isnvsp = 0x0800,


  _sch_isalpha = _sch_isupper|_sch_islower,
  _sch_isalnum = _sch_isalpha|_sch_isdigit,
  _sch_isidnum = _sch_isidst|_sch_isdigit,
  _sch_isgraph = _sch_isalnum|_sch_ispunct,
  _sch_iscppsp = _sch_isvsp|_sch_isnvsp,
  _sch_isbasic = _sch_isprint|_sch_iscppsp

};


extern const unsigned short _sch_istable[256];
# 110 "/home/mzorgati/gcc-4.4.0/include/safe-ctype.h"
extern const unsigned char _sch_toupper[256];
extern const unsigned char _sch_tolower[256];
# 122 "/home/mzorgati/gcc-4.4.0/include/safe-ctype.h"
# 1 "/usr/include/ctype.h" 1 3 4
# 10 "/usr/include/ctype.h" 3 4
int __attribute__((__cdecl__)) isalnum(int);
int __attribute__((__cdecl__)) isalpha(int);
int __attribute__((__cdecl__)) iscntrl(int);
int __attribute__((__cdecl__)) isdigit(int);
int __attribute__((__cdecl__)) isgraph(int);
int __attribute__((__cdecl__)) islower(int);
int __attribute__((__cdecl__)) isprint(int);
int __attribute__((__cdecl__)) ispunct(int);
int __attribute__((__cdecl__)) isspace(int);
int __attribute__((__cdecl__)) isupper(int);
int __attribute__((__cdecl__)) isxdigit(int);
int __attribute__((__cdecl__)) tolower(int);
int __attribute__((__cdecl__)) toupper(int);


int __attribute__((__cdecl__)) isblank(int);
int __attribute__((__cdecl__)) isascii(int);
int __attribute__((__cdecl__)) toascii(int);
int __attribute__((__cdecl__)) _tolower(int);
int __attribute__((__cdecl__)) _toupper(int);
# 44 "/usr/include/ctype.h" 3 4
extern const __attribute__((dllimport)) char _ctype_[];
# 123 "/home/mzorgati/gcc-4.4.0/include/safe-ctype.h" 2
# 180 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2



# 1 "/usr/include/errno.h" 1 3 4




typedef int error_t;



# 1 "/usr/include/sys/errno.h" 1 3 4
# 15 "/usr/include/sys/errno.h" 3 4
extern int *__errno (void);




extern __attribute__((dllimport)) const char * const _sys_errlist[];
extern __attribute__((dllimport)) int _sys_nerr;

extern __attribute__((dllimport)) const char * const sys_errlist[];
extern __attribute__((dllimport)) int sys_nerr;
# 10 "/usr/include/errno.h" 2 3 4
# 184 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 194 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/usr/include/string.h" 1 3 4
# 14 "/usr/include/string.h" 3 4
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 15 "/usr/include/string.h" 2 3 4







void * __attribute__((__cdecl__)) memchr (const void *, int, size_t);
int __attribute__((__cdecl__)) memcmp (const void *, const void *, size_t);
void * __attribute__((__cdecl__)) memcpy (void *, const void *, size_t);
void * __attribute__((__cdecl__)) memmove (void *, const void *, size_t);
void * __attribute__((__cdecl__)) memset (void *, int, size_t);
char *__attribute__((__cdecl__)) strcat (char *, const char *);
char *__attribute__((__cdecl__)) strchr (const char *, int);
int __attribute__((__cdecl__)) strcmp (const char *, const char *);
int __attribute__((__cdecl__)) strcoll (const char *, const char *);
char *__attribute__((__cdecl__)) strcpy (char *, const char *);
size_t __attribute__((__cdecl__)) strcspn (const char *, const char *);
char *__attribute__((__cdecl__)) strerror (int);
size_t __attribute__((__cdecl__)) strlen (const char *);
char *__attribute__((__cdecl__)) strncat (char *, const char *, size_t);
int __attribute__((__cdecl__)) strncmp (const char *, const char *, size_t);
char *__attribute__((__cdecl__)) strncpy (char *, const char *, size_t);
char *__attribute__((__cdecl__)) strpbrk (const char *, const char *);
char *__attribute__((__cdecl__)) strrchr (const char *, int);
size_t __attribute__((__cdecl__)) strspn (const char *, const char *);
char *__attribute__((__cdecl__)) strstr (const char *, const char *);


char *__attribute__((__cdecl__)) strtok (char *, const char *);


size_t __attribute__((__cdecl__)) strxfrm (char *, const char *, size_t);


char *__attribute__((__cdecl__)) strtok_r (char *, const char *, char **);

int __attribute__((__cdecl__)) bcmp (const void *, const void *, size_t);
void __attribute__((__cdecl__)) bcopy (const void *, void *, size_t);
void __attribute__((__cdecl__)) bzero (void *, size_t);
int __attribute__((__cdecl__)) ffs (int);
char *__attribute__((__cdecl__)) index (const char *, int);
void * __attribute__((__cdecl__)) memccpy (void *, const void *, int, size_t);
void * __attribute__((__cdecl__)) mempcpy (void *, const void *, size_t);

extern void *memmem (__const void *, size_t, __const void *, size_t);

char *__attribute__((__cdecl__)) rindex (const char *, int);
int __attribute__((__cdecl__)) strcasecmp (const char *, const char *);
char *__attribute__((__cdecl__)) strdup (const char *);
char *__attribute__((__cdecl__)) _strdup_r (struct _reent *, const char *);
char *__attribute__((__cdecl__)) strndup (const char *, size_t);
char *__attribute__((__cdecl__)) _strndup_r (struct _reent *, const char *, size_t);
char *__attribute__((__cdecl__)) strerror_r (int, char *, size_t);
size_t __attribute__((__cdecl__)) strlcat (char *, const char *, size_t);
size_t __attribute__((__cdecl__)) strlcpy (char *, const char *, size_t);
int __attribute__((__cdecl__)) strncasecmp (const char *, const char *, size_t);
size_t __attribute__((__cdecl__)) strnlen (const char *, size_t);
char *__attribute__((__cdecl__)) strsep (char **, const char *);
char *__attribute__((__cdecl__)) strlwr (char *);
char *__attribute__((__cdecl__)) strupr (char *);


const char *__attribute__((__cdecl__)) strsignal (int __signo);

int __attribute__((__cdecl__)) strtosigno (const char *__name);
# 99 "/usr/include/string.h" 3 4
# 1 "/usr/include/sys/string.h" 1 3 4
# 100 "/usr/include/string.h" 2 3 4


# 195 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 1 "/usr/include/strings.h" 1 3 4
# 196 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 207 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/usr/include/stdlib.h" 1 3 4
# 14 "/usr/include/stdlib.h" 3 4
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 15 "/usr/include/stdlib.h" 2 3 4


# 1 "/usr/include/machine/stdlib.h" 1 3 4
# 17 "/usr/include/machine/stdlib.h" 3 4
char *mkdtemp (char *);
# 18 "/usr/include/stdlib.h" 2 3 4

# 1 "/usr/include/alloca.h" 1 3 4
# 20 "/usr/include/stdlib.h" 2 3 4



# 1 "/usr/include/cygwin/stdlib.h" 1 3 4
# 14 "/usr/include/cygwin/stdlib.h" 3 4
# 1 "/usr/include/cygwin/wait.h" 1 3 4
# 15 "/usr/include/cygwin/stdlib.h" 2 3 4






const char *getprogname (void);
void setprogname (const char *);


char *realpath (const char *, char *);
int unsetenv (const char *);
int random (void);
long srandom (unsigned);
char *ptsname (int);
int grantpt (int);
int unlockpt (int);
# 24 "/usr/include/stdlib.h" 2 3 4




typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;
# 57 "/usr/include/stdlib.h" 3 4
extern __attribute__((dllimport)) int __mb_cur_max;



void __attribute__((__cdecl__)) abort (void) __attribute__ ((noreturn));
int __attribute__((__cdecl__)) abs (int);
int __attribute__((__cdecl__)) atexit (void (*__func)(void));
double __attribute__((__cdecl__)) atof (const char *__nptr);

float __attribute__((__cdecl__)) atoff (const char *__nptr);

int __attribute__((__cdecl__)) atoi (const char *__nptr);
int __attribute__((__cdecl__)) _atoi_r (struct _reent *, const char *__nptr);
long __attribute__((__cdecl__)) atol (const char *__nptr);
long __attribute__((__cdecl__)) _atol_r (struct _reent *, const char *__nptr);
void * __attribute__((__cdecl__)) bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* __attribute__((__cdecl__)) _compar) (const void *, const void *));




void * __attribute__((__cdecl__)) calloc (size_t __nmemb, size_t __size);
div_t __attribute__((__cdecl__)) div (int __numer, int __denom);
void __attribute__((__cdecl__)) exit (int __status) __attribute__ ((noreturn));
void __attribute__((__cdecl__)) free (void *);
char * __attribute__((__cdecl__)) getenv (const char *__string);
char * __attribute__((__cdecl__)) _getenv_r (struct _reent *, const char *__string);
char * __attribute__((__cdecl__)) _findenv (const char *, int *);
char * __attribute__((__cdecl__)) _findenv_r (struct _reent *, const char *, int *);
long __attribute__((__cdecl__)) labs (long);
ldiv_t __attribute__((__cdecl__)) ldiv (long __numer, long __denom);
void * __attribute__((__cdecl__)) malloc (size_t __size);
int __attribute__((__cdecl__)) mblen (const char *, size_t);
int __attribute__((__cdecl__)) _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int __attribute__((__cdecl__)) mbtowc (wchar_t *, const char *, size_t);
int __attribute__((__cdecl__)) _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int __attribute__((__cdecl__)) wctomb (char *, wchar_t);
int __attribute__((__cdecl__)) _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t __attribute__((__cdecl__)) mbstowcs (wchar_t *, const char *, size_t);
size_t __attribute__((__cdecl__)) _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t __attribute__((__cdecl__)) wcstombs (char *, const wchar_t *, size_t);
size_t __attribute__((__cdecl__)) _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);


int __attribute__((__cdecl__)) mkstemp (char *);
char * __attribute__((__cdecl__)) mktemp (char *);


void __attribute__((__cdecl__)) qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int __attribute__((__cdecl__)) rand (void);
void * __attribute__((__cdecl__)) realloc (void * __r, size_t __size);
void __attribute__((__cdecl__)) srand (unsigned __seed);
double __attribute__((__cdecl__)) strtod (const char *__n, char **__end_PTR);
double __attribute__((__cdecl__)) _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float __attribute__((__cdecl__)) strtof (const char *__n, char **__end_PTR);






long __attribute__((__cdecl__)) strtol (const char *__n, char **__end_PTR, int __base);
long __attribute__((__cdecl__)) _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long __attribute__((__cdecl__)) strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long __attribute__((__cdecl__)) _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int __attribute__((__cdecl__)) system (const char *__string);


long __attribute__((__cdecl__)) a64l (const char *__input);
char * __attribute__((__cdecl__)) l64a (long __input);
char * __attribute__((__cdecl__)) _l64a_r (struct _reent *,long __input);
int __attribute__((__cdecl__)) on_exit (void (*__func)(int, void *),void * __arg);
void __attribute__((__cdecl__)) _Exit (int __status) __attribute__ ((noreturn));
int __attribute__((__cdecl__)) putenv (char *__string);
int __attribute__((__cdecl__)) _putenv_r (struct _reent *, char *__string);
int __attribute__((__cdecl__)) setenv (const char *__string, const char *__value, int __overwrite);
int __attribute__((__cdecl__)) _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);

char * __attribute__((__cdecl__)) gcvt (double,int,char *);
char * __attribute__((__cdecl__)) gcvtf (float,int,char *);
char * __attribute__((__cdecl__)) fcvt (double,int,int *,int *);
char * __attribute__((__cdecl__)) fcvtf (float,int,int *,int *);
char * __attribute__((__cdecl__)) ecvt (double,int,int *,int *);
char * __attribute__((__cdecl__)) ecvtbuf (double, int, int*, int*, char *);
char * __attribute__((__cdecl__)) fcvtbuf (double, int, int*, int*, char *);
char * __attribute__((__cdecl__)) ecvtf (float,int,int *,int *);
char * __attribute__((__cdecl__)) dtoa (double, int, int, int *, int*, char**);
int __attribute__((__cdecl__)) rand_r (unsigned *__seed);

double __attribute__((__cdecl__)) drand48 (void);
double __attribute__((__cdecl__)) _drand48_r (struct _reent *);
double __attribute__((__cdecl__)) erand48 (unsigned short [3]);
double __attribute__((__cdecl__)) _erand48_r (struct _reent *, unsigned short [3]);
long __attribute__((__cdecl__)) jrand48 (unsigned short [3]);
long __attribute__((__cdecl__)) _jrand48_r (struct _reent *, unsigned short [3]);
void __attribute__((__cdecl__)) lcong48 (unsigned short [7]);
void __attribute__((__cdecl__)) _lcong48_r (struct _reent *, unsigned short [7]);
long __attribute__((__cdecl__)) lrand48 (void);
long __attribute__((__cdecl__)) _lrand48_r (struct _reent *);
long __attribute__((__cdecl__)) mrand48 (void);
long __attribute__((__cdecl__)) _mrand48_r (struct _reent *);
long __attribute__((__cdecl__)) nrand48 (unsigned short [3]);
long __attribute__((__cdecl__)) _nrand48_r (struct _reent *, unsigned short [3]);
unsigned short *
       __attribute__((__cdecl__)) seed48 (unsigned short [3]);
unsigned short *
       __attribute__((__cdecl__)) _seed48_r (struct _reent *, unsigned short [3]);
void __attribute__((__cdecl__)) srand48 (long);
void __attribute__((__cdecl__)) _srand48_r (struct _reent *, long);
long long __attribute__((__cdecl__)) atoll (const char *__nptr);
long long __attribute__((__cdecl__)) _atoll_r (struct _reent *, const char *__nptr);
long long __attribute__((__cdecl__)) llabs (long long);
lldiv_t __attribute__((__cdecl__)) lldiv (long long __numer, long long __denom);
long long __attribute__((__cdecl__)) strtoll (const char *__n, char **__end_PTR, int __base);
long long __attribute__((__cdecl__)) _strtoll_r (struct _reent *, const char *__n, char **__end_PTR, int __base);
unsigned long long __attribute__((__cdecl__)) strtoull (const char *__n, char **__end_PTR, int __base);
unsigned long long __attribute__((__cdecl__)) _strtoull_r (struct _reent *, const char *__n, char **__end_PTR, int __base);
# 183 "/usr/include/stdlib.h" 3 4
char * __attribute__((__cdecl__)) _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);







int __attribute__((__cdecl__)) _system_r (struct _reent *, const char *);

void __attribute__((__cdecl__)) __eprintf (const char *, const char *, unsigned int, const char *);


# 208 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 232 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/usr/include/unistd.h" 1 3 4



# 1 "/usr/include/sys/unistd.h" 1 3 4
# 13 "/usr/include/sys/unistd.h" 3 4
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 14 "/usr/include/sys/unistd.h" 2 3 4

extern char **environ;

void __attribute__((__cdecl__)) _exit (int __status ) __attribute__ ((noreturn));

int __attribute__((__cdecl__)) access (const char *__path, int __amode );
unsigned __attribute__((__cdecl__)) alarm (unsigned __secs );
int __attribute__((__cdecl__)) chdir (const char *__path );
int __attribute__((__cdecl__)) chmod (const char *__path, mode_t __mode );

int __attribute__((__cdecl__)) chown (const char *__path, uid_t __owner, gid_t __group );


int __attribute__((__cdecl__)) chroot (const char *__path );

int __attribute__((__cdecl__)) close (int __fildes );
char __attribute__((__cdecl__)) *ctermid (char *__s );
char __attribute__((__cdecl__)) *cuserid (char *__s );

int __attribute__((__cdecl__)) daemon (int nochdir, int noclose);

int __attribute__((__cdecl__)) dup (int __fildes );
int __attribute__((__cdecl__)) dup2 (int __fildes, int __fildes2 );

void __attribute__((__cdecl__)) endusershell (void);

int __attribute__((__cdecl__)) execl (const char *__path, const char *, ... );
int __attribute__((__cdecl__)) execle (const char *__path, const char *, ... );
int __attribute__((__cdecl__)) execlp (const char *__file, const char *, ... );
int __attribute__((__cdecl__)) execv (const char *__path, char * const __argv[] );
int __attribute__((__cdecl__)) execve (const char *__path, char * const __argv[], char * const __envp[] );
int __attribute__((__cdecl__)) execvp (const char *__file, char * const __argv[] );

int __attribute__((__cdecl__)) fchdir (int __fildes);

int __attribute__((__cdecl__)) fchmod (int __fildes, mode_t __mode );

int __attribute__((__cdecl__)) fchown (int __fildes, uid_t __owner, gid_t __group );

pid_t __attribute__((__cdecl__)) fork (void );
long __attribute__((__cdecl__)) fpathconf (int __fd, int __name );
int __attribute__((__cdecl__)) fsync (int __fd);
int __attribute__((__cdecl__)) fdatasync (int __fd);
char __attribute__((__cdecl__)) *getcwd (char *__buf, size_t __size );

int __attribute__((__cdecl__)) getdomainname (char *__name, size_t __len);


gid_t __attribute__((__cdecl__)) getegid (void );
uid_t __attribute__((__cdecl__)) geteuid (void );
gid_t __attribute__((__cdecl__)) getgid (void );

int __attribute__((__cdecl__)) getgroups (int __gidsetsize, gid_t __grouplist[] );

long __attribute__((__cdecl__)) gethostid (void);

char __attribute__((__cdecl__)) *getlogin (void );

int __attribute__((__cdecl__)) getlogin_r (char *name, size_t namesize);

char __attribute__((__cdecl__)) *getpass (const char *__prompt);
size_t __attribute__((__cdecl__)) getpagesize (void);

int __attribute__((__cdecl__)) getpeereid (int, uid_t *, gid_t *);

pid_t __attribute__((__cdecl__)) getpgid (pid_t);
pid_t __attribute__((__cdecl__)) getpgrp (void );
pid_t __attribute__((__cdecl__)) getpid (void );
pid_t __attribute__((__cdecl__)) getppid (void );

pid_t __attribute__((__cdecl__)) getsid (pid_t);


uid_t __attribute__((__cdecl__)) getuid (void );


char * __attribute__((__cdecl__)) getusershell (void);
char __attribute__((__cdecl__)) *getwd (char *__buf );
int __attribute__((__cdecl__)) iruserok (unsigned long raddr, int superuser, const char *ruser, const char *luser);

int __attribute__((__cdecl__)) isatty (int __fildes );

int __attribute__((__cdecl__)) lchown (const char *__path, uid_t __owner, gid_t __group );

int __attribute__((__cdecl__)) link (const char *__path1, const char *__path2 );
int __attribute__((__cdecl__)) nice (int __nice_value );

off_t __attribute__((__cdecl__)) lseek (int __fildes, off_t __offset, int __whence );

long __attribute__((__cdecl__)) pathconf (const char *__path, int __name );
int __attribute__((__cdecl__)) pause (void );

int __attribute__((__cdecl__)) pthread_atfork (void (*)(void), void (*)(void), void (*)(void));

int __attribute__((__cdecl__)) pipe (int __fildes[2] );
ssize_t __attribute__((__cdecl__)) pread (int __fd, void *__buf, size_t __nbytes, off_t __offset);
ssize_t __attribute__((__cdecl__)) pwrite (int __fd, const void *__buf, size_t __nbytes, off_t __offset);
_ssize_t __attribute__((__cdecl__)) read (int __fd, void *__buf, size_t __nbyte );

int __attribute__((__cdecl__)) rresvport (int *__alport);
int __attribute__((__cdecl__)) revoke (char *__path);

int __attribute__((__cdecl__)) rmdir (const char *__path );

int __attribute__((__cdecl__)) ruserok (const char *rhost, int superuser, const char *ruser, const char *luser);

void * __attribute__((__cdecl__)) sbrk (ptrdiff_t __incr);


int __attribute__((__cdecl__)) setegid (gid_t __gid );
int __attribute__((__cdecl__)) seteuid (uid_t __uid );

int __attribute__((__cdecl__)) setgid (gid_t __gid );


int __attribute__((__cdecl__)) setgroups (int ngroups, const gid_t *grouplist );

int __attribute__((__cdecl__)) setpgid (pid_t __pid, pid_t __pgid );
int __attribute__((__cdecl__)) setpgrp (void );

int __attribute__((__cdecl__)) setregid (gid_t __rgid, gid_t __egid);
int __attribute__((__cdecl__)) setreuid (uid_t __ruid, uid_t __euid);

pid_t __attribute__((__cdecl__)) setsid (void );

int __attribute__((__cdecl__)) setuid (uid_t __uid );


void __attribute__((__cdecl__)) setusershell (void);

unsigned __attribute__((__cdecl__)) sleep (unsigned int __seconds );
void __attribute__((__cdecl__)) swab (const void *, void *, ssize_t);
long __attribute__((__cdecl__)) sysconf (int __name );
pid_t __attribute__((__cdecl__)) tcgetpgrp (int __fildes );
int __attribute__((__cdecl__)) tcsetpgrp (int __fildes, pid_t __pgrp_id );
char __attribute__((__cdecl__)) *ttyname (int __fildes );

int __attribute__((__cdecl__)) ttyname_r (int, char *, size_t);

int __attribute__((__cdecl__)) unlink (const char *__path );
int __attribute__((__cdecl__)) vhangup (void );
_ssize_t __attribute__((__cdecl__)) write (int __fd, const void *__buf, size_t __nbyte );



# 1 "/home/mzorgati/gcc-4.4.0/include/getopt.h" 1 3 4
# 36 "/home/mzorgati/gcc-4.4.0/include/getopt.h" 3 4
extern char *optarg;
# 50 "/home/mzorgati/gcc-4.4.0/include/getopt.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 82 "/home/mzorgati/gcc-4.4.0/include/getopt.h" 3 4
struct option
{

  const char *name;





  int has_arg;
  int *flag;
  int val;
};
# 113 "/home/mzorgati/gcc-4.4.0/include/getopt.h" 3 4
extern int getopt (int argc, char *const *argv, const char *shortopts);







extern int getopt_long (int argc, char *const *argv, const char *shortopts,
          const struct option *longopts, int *longind);
extern int getopt_long_only (int argc, char *const *argv,
        const char *shortopts,
               const struct option *longopts, int *longind);


extern int _getopt_internal (int argc, char *const *argv,
        const char *shortopts,
               const struct option *longopts, int *longind,
        int long_only);
# 160 "/usr/include/sys/unistd.h" 2 3 4
# 169 "/usr/include/sys/unistd.h" 3 4
pid_t __attribute__((__cdecl__)) vfork (void );

extern char *suboptarg;
int getsubopt(char **, char * const *, char **);
# 195 "/usr/include/sys/unistd.h" 3 4
int __attribute__((__cdecl__)) ftruncate (int __fd, off_t __length);
int __attribute__((__cdecl__)) truncate (const char *, off_t __length);



int __attribute__((__cdecl__)) getdtablesize (void);
int __attribute__((__cdecl__)) setdtablesize (int);
useconds_t __attribute__((__cdecl__)) ualarm (useconds_t __useconds, useconds_t __interval);
int __attribute__((__cdecl__)) usleep (useconds_t __useconds);


 int __attribute__((__cdecl__)) gethostname (char *__name, size_t __len);

char * __attribute__((__cdecl__)) mktemp (char *);

void __attribute__((__cdecl__)) sync (void);




int __attribute__((__cdecl__)) readlink (const char *__path, char *__buf, int __buflen);
int __attribute__((__cdecl__)) symlink (const char *__name1, const char *__name2);
# 5 "/usr/include/unistd.h" 2 3 4
# 233 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2



# 1 "/usr/include/sys/param.h" 1 3 4
# 14 "/usr/include/sys/param.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/limits.h" 1 3 4
# 11 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/limits.h" 3 4
# 1 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/limits.h" 1 3 4
# 122 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 13 "/usr/include/limits.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 14 "/usr/include/limits.h" 2 3 4
# 123 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/limits.h" 2 3 4
# 8 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/syslimits.h" 2 3 4
# 12 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/limits.h" 2 3 4
# 15 "/usr/include/sys/param.h" 2 3 4
# 237 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2





# 1 "/usr/lib/gcc/i686-pc-cygwin/4.3.2/include-fixed/limits.h" 1 3 4
# 243 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2



# 1 "/home/mzorgati/gcc-4.4.0/gcc/hwint.h" 1
# 247 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 276 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/usr/include/sys/time.h" 1 3 4
# 16 "/usr/include/sys/time.h" 3 4
struct timeval {
  time_t tv_sec;
  suseconds_t tv_usec;
};

struct timezone {
  int tz_minuteswest;
  int tz_dsttime;
};


# 1 "/usr/include/cygwin/sys_time.h" 1 3 4
# 13 "/usr/include/cygwin/sys_time.h" 3 4
# 1 "/usr/include/sys/select.h" 1 3 4
# 23 "/usr/include/sys/select.h" 3 4
# 1 "/usr/include/sys/time.h" 1 3 4
# 24 "/usr/include/sys/select.h" 2 3 4
# 1 "/usr/include/time.h" 1 3 4
# 18 "/usr/include/time.h" 3 4
# 1 "/usr/include/machine/time.h" 1 3 4
# 19 "/usr/include/time.h" 2 3 4
# 27 "/usr/include/time.h" 3 4
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 28 "/usr/include/time.h" 2 3 4





struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;
};

clock_t __attribute__((__cdecl__)) clock (void);
double __attribute__((__cdecl__)) difftime (time_t _time2, time_t _time1);
time_t __attribute__((__cdecl__)) mktime (struct tm *_timeptr);
time_t __attribute__((__cdecl__)) time (time_t *_timer);

char *__attribute__((__cdecl__)) asctime (const struct tm *_tblock);
char *__attribute__((__cdecl__)) ctime (const time_t *_time);
struct tm *__attribute__((__cdecl__)) gmtime (const time_t *_timer);
struct tm *__attribute__((__cdecl__)) localtime (const time_t *_timer);

size_t __attribute__((__cdecl__)) strftime (char *_s, size_t _maxsize, const char *_fmt, const struct tm *_t);

char *__attribute__((__cdecl__)) asctime_r (const struct tm *, char *);
char *__attribute__((__cdecl__)) ctime_r (const time_t *, char *);
struct tm *__attribute__((__cdecl__)) gmtime_r (const time_t *, struct tm *);
struct tm *__attribute__((__cdecl__)) localtime_r (const time_t *, struct tm *);








char *__attribute__((__cdecl__)) strptime (const char *, const char *, struct tm *);
void __attribute__((__cdecl__)) tzset (void);
void __attribute__((__cdecl__)) _tzset_r (struct _reent *);

typedef struct __tzrule_struct
{
  char ch;
  int m;
  int n;
  int d;
  int s;
  time_t change;
  long offset;
} __tzrule_type;

typedef struct __tzinfo_struct
{
  int __tznorth;
  int __tzyear;
  __tzrule_type __tzrule[2];
} __tzinfo_type;

__tzinfo_type *__attribute__((__cdecl__)) __gettzinfo (void);
# 118 "/usr/include/time.h" 3 4
extern __attribute__((dllimport)) long _timezone;
extern __attribute__((dllimport)) int _daylight;
extern __attribute__((dllimport)) char *_tzname[2];
# 135 "/usr/include/time.h" 3 4
# 1 "/usr/include/cygwin/time.h" 1 3 4
# 18 "/usr/include/cygwin/time.h" 3 4
int nanosleep (const struct timespec *, struct timespec *);
int clock_setres (clockid_t, struct timespec *);
int clock_getres (clockid_t, struct timespec *);


time_t timelocal (struct tm *);
time_t timegm (struct tm *);





extern int daylight __asm__ ("__daylight");


extern long timezone __asm__ ("__timezone");
# 136 "/usr/include/time.h" 2 3 4




# 1 "/usr/include/signal.h" 1 3 4




# 1 "/usr/include/sys/signal.h" 1 3 4
# 18 "/usr/include/sys/signal.h" 3 4
typedef unsigned long sigset_t;
# 107 "/usr/include/sys/signal.h" 3 4
# 1 "/usr/include/cygwin/signal.h" 1 3 4
# 17 "/usr/include/cygwin/signal.h" 3 4
struct _fpstate
{
  unsigned long cw;
  unsigned long sw;
  unsigned long tag;
  unsigned long ipoff;
  unsigned long cssel;
  unsigned long dataoff;
  unsigned long datasel;
  unsigned char _st[80];
  unsigned long nxst;
};

struct ucontext
{
  unsigned long cr2;
  unsigned long dr0;
  unsigned long dr1;
  unsigned long dr2;
  unsigned long dr3;
  unsigned long dr6;
  unsigned long dr7;
  struct _fpstate fpstate;
  unsigned long gs;
  unsigned long fs;
  unsigned long es;
  unsigned long ds;
  unsigned long edi;
  unsigned long esi;
  unsigned long ebx;
  unsigned long edx;
  unsigned long ecx;
  unsigned long eax;
  unsigned long ebp;
  unsigned long eip;
  unsigned long cs;
  unsigned long eflags;
  unsigned long esp;
  unsigned long ss;
  unsigned char _internal;
  unsigned long oldmask;
};



typedef union sigval
{
  int sival_int;
  void *sival_ptr;
} sigval_t;

typedef struct sigevent
{
  sigval_t sigev_value;
  int sigev_signo;
  int sigev_notify;
  void (*sigev_notify_function) (sigval_t);
  pthread_attr_t *sigev_notify_attributes;
} sigevent_t;

#pragma pack(push,4)
struct _sigcommune
{
  __uint32_t _si_code;
  void *_si_read_handle;
  void *_si_write_handle;
  void *_si_process_handle;
  __extension__ union
  {
    int _si_fd;
    void *_si_pipe_fhandler;
    char *_si_str;
  };
};

typedef struct
{
  int si_signo;
  int si_code;
  pid_t si_pid;
  uid_t si_uid;
  int si_errno;

  __extension__ union
  {
    __uint32_t __pad[32];
    struct _sigcommune _si_commune;
    union
    {

      struct
      {
 union
 {
   struct
   {
     timer_t si_tid;
     unsigned int si_overrun;
   };
   sigval_t si_sigval;
   sigval_t si_value;
 };
      };
    };


    __extension__ struct
    {
      int si_status;
      clock_t si_utime;
      clock_t si_stime;
    };


    void *si_addr;
  };
} siginfo_t;
#pragma pack(pop)

enum
{
  SI_USER = 0,
  SI_ASYNCIO = 2,

  SI_MESGQ,

  SI_TIMER,
  SI_QUEUE,

  SI_KERNEL,

  ILL_ILLOPC,
  ILL_ILLOPN,
  ILL_ILLADR,
  ILL_ILLTRP,
  ILL_PRVOPC,
  ILL_PRVREG,
  ILL_COPROC,
  ILL_BADSTK,

  FPE_INTDIV,
  FPE_INTOVF,
  FPE_FLTDIV,
  FPE_FLTOVF,
  FPE_FLTUND,
  FPE_FLTRES,
  FPE_FLTINV,
  FPE_FLTSUB,

  SEGV_MAPERR,
  SEGV_ACCERR,

  BUS_ADRALN,
  BUS_ADRERR,
  BUS_OBJERR,

  CLD_EXITED,
  CLD_KILLED,
  CLD_DUMPED,
  CLD_TRAPPED,
  CLD_STOPPED,
  CLD_CONTINUED
};

enum
{
  SIGEV_SIGNAL = 0,


  SIGEV_NONE,


  SIGEV_THREAD

};

typedef void (*_sig_func_ptr)(int);

struct sigaction
{
  __extension__ union
  {
    _sig_func_ptr sa_handler;
    void (*sa_sigaction) ( int, siginfo_t *, void * );
  };
  sigset_t sa_mask;
  int sa_flags;
};
# 263 "/usr/include/cygwin/signal.h" 3 4
int sigwait (const sigset_t *, int *);
int sigwaitinfo (const sigset_t *, siginfo_t *);
int sighold (int);
int sigignore (int);
int sigrelse (int);
_sig_func_ptr sigset (int, _sig_func_ptr);

int sigqueue(pid_t, int, const union sigval);
int siginterrupt (int, int);
# 108 "/usr/include/sys/signal.h" 2 3 4
# 134 "/usr/include/sys/signal.h" 3 4
int __attribute__((__cdecl__)) sigprocmask (int how, const sigset_t *set, sigset_t *oset);


int __attribute__((__cdecl__)) pthread_sigmask (int how, const sigset_t *set, sigset_t *oset);
# 151 "/usr/include/sys/signal.h" 3 4
int __attribute__((__cdecl__)) kill (int, int);
int __attribute__((__cdecl__)) killpg (pid_t, int);
int __attribute__((__cdecl__)) sigaction (int, const struct sigaction *, struct sigaction *);
int __attribute__((__cdecl__)) sigaddset (sigset_t *, const int);
int __attribute__((__cdecl__)) sigdelset (sigset_t *, const int);
int __attribute__((__cdecl__)) sigismember (const sigset_t *, int);
int __attribute__((__cdecl__)) sigfillset (sigset_t *);
int __attribute__((__cdecl__)) sigemptyset (sigset_t *);
int __attribute__((__cdecl__)) sigpending (sigset_t *);
int __attribute__((__cdecl__)) sigsuspend (const sigset_t *);
int __attribute__((__cdecl__)) sigpause (int);







int __attribute__((__cdecl__)) pthread_kill (pthread_t thread, int sig);
# 6 "/usr/include/signal.h" 2 3 4



typedef int sig_atomic_t;





struct _reent;

_sig_func_ptr __attribute__((__cdecl__)) _signal_r (struct _reent *, int, _sig_func_ptr);
int __attribute__((__cdecl__)) _raise_r (struct _reent *, int);


_sig_func_ptr __attribute__((__cdecl__)) signal (int, _sig_func_ptr);
int __attribute__((__cdecl__)) raise (int);



# 141 "/usr/include/time.h" 2 3 4







int __attribute__((__cdecl__)) clock_settime (clockid_t clock_id, const struct timespec *tp);
int __attribute__((__cdecl__)) clock_gettime (clockid_t clock_id, struct timespec *tp);
int __attribute__((__cdecl__)) clock_getres (clockid_t clock_id, struct timespec *res);



int __attribute__((__cdecl__)) timer_create (clockid_t clock_id, struct sigevent *evp, timer_t *timerid);




int __attribute__((__cdecl__)) timer_delete (timer_t timerid);



int __attribute__((__cdecl__)) timer_settime (timer_t timerid, int flags, const struct itimerspec *value, struct itimerspec *ovalue);


int __attribute__((__cdecl__)) timer_gettime (timer_t timerid, struct itimerspec *value);
int __attribute__((__cdecl__)) timer_getoverrun (timer_t timerid);



int __attribute__((__cdecl__)) nanosleep (const struct timespec *rqtp, struct timespec *rmtp);
# 25 "/usr/include/sys/select.h" 2 3 4






int select (int __n, _types_fd_set *__readfds, _types_fd_set *__writefds, _types_fd_set *__exceptfds, struct timeval *__timeout);

int pselect (int __n, _types_fd_set *__readfds, _types_fd_set *__writefds, _types_fd_set *__exceptfds, const struct timespec *__timeout, const sigset_t *__set);




# 14 "/usr/include/cygwin/sys_time.h" 2 3 4






int futimes (int, const struct timeval *);
int lutimes (const char *, const struct timeval *);
# 28 "/usr/include/sys/time.h" 2 3 4
# 36 "/usr/include/sys/time.h" 3 4
struct itimerval {
  struct timeval it_interval;
  struct timeval it_value;
};
# 73 "/usr/include/sys/time.h" 3 4
int __attribute__((__cdecl__)) gettimeofday (struct timeval *__p, void *__z);
int __attribute__((__cdecl__)) settimeofday (const struct timeval *, const struct timezone *);
int __attribute__((__cdecl__)) utimes (const char *__path, const struct timeval *__tvp);
int __attribute__((__cdecl__)) getitimer (int __which, struct itimerval *__value);
int __attribute__((__cdecl__)) setitimer (int __which, const struct itimerval *__value, struct itimerval *__ovalue);
# 277 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 289 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/usr/include/fcntl.h" 1 3 4
# 14 "/usr/include/fcntl.h" 3 4
# 1 "/usr/include/sys/fcntl.h" 1 3 4
# 150 "/usr/include/sys/fcntl.h" 3 4
struct eflock {
 short l_type;
 short l_whence;
 long l_start;
 long l_len;
 short l_pid;
 short l_xxx;
 long l_rpid;
 long l_rsys;
};




# 1 "/usr/include/sys/stat.h" 1 3 4
# 20 "/usr/include/sys/stat.h" 3 4
# 1 "/usr/include/cygwin/stat.h" 1 3 4
# 62 "/usr/include/cygwin/stat.h" 3 4
struct stat
{
  dev_t st_dev;
  ino_t st_ino;
  mode_t st_mode;
  nlink_t st_nlink;
  uid_t st_uid;
  gid_t st_gid;
  dev_t st_rdev;
  off_t st_size;
  timestruc_t st_atim;
  timestruc_t st_mtim;
  timestruc_t st_ctim;
  blksize_t st_blksize;
  blkcnt_t st_blocks;
  long st_spare4[2];
};
# 21 "/usr/include/sys/stat.h" 2 3 4
# 119 "/usr/include/sys/stat.h" 3 4
int __attribute__((__cdecl__)) chmod ( const char *__path, mode_t __mode );
int __attribute__((__cdecl__)) fchmod (int __fd, mode_t __mode);
int __attribute__((__cdecl__)) fstat ( int __fd, struct stat *__sbuf );
int __attribute__((__cdecl__)) mkdir ( const char *_path, mode_t __mode );
int __attribute__((__cdecl__)) mkfifo ( const char *__path, mode_t __mode );
int __attribute__((__cdecl__)) stat ( const char *__path, struct stat *__sbuf );
mode_t __attribute__((__cdecl__)) umask ( mode_t __mask );


int __attribute__((__cdecl__)) lstat ( const char *__path, struct stat *__buf );
int __attribute__((__cdecl__)) mknod ( const char *__path, mode_t __mode, dev_t __dev );
# 165 "/usr/include/sys/fcntl.h" 2 3 4

extern int open (const char *, int, ...);
extern int creat (const char *, mode_t);
extern int fcntl (int, int, ...);
# 15 "/usr/include/fcntl.h" 2 3 4
# 290 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 327 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/usr/include/sys/wait.h" 1 3 4
# 15 "/usr/include/sys/wait.h" 3 4
# 1 "/usr/include/sys/resource.h" 1 3 4
# 41 "/usr/include/sys/resource.h" 3 4
typedef unsigned long rlim_t;

struct rlimit {
 rlim_t rlim_cur;
 rlim_t rlim_max;
};




struct rusage {
 struct timeval ru_utime;
 struct timeval ru_stime;
 long ru_maxrss;
 long ru_ixrss;
 long ru_idrss;
 long ru_isrss;
 long ru_minflt;
 long ru_majflt;
 long ru_nswap;
 long ru_inblock;
 long ru_oublock;
 long ru_msgsnd;
 long ru_msgrcv;
 long ru_nsignals;
 long ru_nvcsw;
 long ru_nivcsw;

};

int getrlimit (int __resource, struct rlimit *__rlp);
int setrlimit (int __resource, const struct rlimit *__rlp);

int getrusage (int __who, struct rusage *__rusage);

int getpriority (int which, id_t who);
int setpriority (int which, id_t who, int value);
# 16 "/usr/include/sys/wait.h" 2 3 4






pid_t wait (int *);
pid_t waitpid (pid_t, int *, int);
pid_t wait3 (int *__status, int __options, struct rusage *__rusage);
pid_t wait4 (pid_t __pid, int *__status, int __options, struct rusage *__rusage);

union wait
  {
    int w_status;
    struct
      {
 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;
      } __wait_terminated;
    struct
      {
 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;
      } __wait_stopped;
  };
# 328 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 378 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
extern int getopt (int, char * const *, const char *);
# 398 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/usr/include/malloc.h" 1 3 4
# 10 "/usr/include/malloc.h" 3 4
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 11 "/usr/include/malloc.h" 2 3 4


# 1 "/usr/include/machine/malloc.h" 1 3 4
# 14 "/usr/include/malloc.h" 2 3 4
# 22 "/usr/include/malloc.h" 3 4
struct mallinfo {
  int arena;
  int ordblks;
  int smblks;
  int hblks;
  int hblkhd;
  int usmblks;
  int fsmblks;
  int uordblks;
  int fordblks;
  int keepcost;
};



extern void * malloc (size_t);







extern void free (void *);







extern void * realloc (void *, size_t);







extern void * calloc (size_t, size_t);







extern void * memalign (size_t, size_t);







extern struct mallinfo mallinfo (void);







extern void malloc_stats (void);







extern int mallopt (int, int);







extern size_t malloc_usable_size (void *);
# 112 "/usr/include/malloc.h" 3 4
extern void * valloc (size_t);







extern void * pvalloc (size_t);







extern int malloc_trim (size_t);
# 138 "/usr/include/malloc.h" 3 4
extern void mstats (char *);
# 399 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 522 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/home/mzorgati/gcc-4.4.0/include/filenames.h" 1
# 53 "/home/mzorgati/gcc-4.4.0/include/filenames.h"
extern int filename_cmp (const char *s1, const char *s2);
# 523 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 533 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
# 1 "/home/mzorgati/gcc-4.4.0/include/libiberty.h" 1
# 42 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
# 1 "/home/mzorgati/gcc-4.4.0/include/ansidecl.h" 1
# 43 "/home/mzorgati/gcc-4.4.0/include/libiberty.h" 2


# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1
# 46 "/home/mzorgati/gcc-4.4.0/include/libiberty.h" 2
# 55 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern void unlock_stream (FILE *);





extern void unlock_std_streams (void);





extern FILE *fopen_unlocked (const char *, const char *);
extern FILE *fdopen_unlocked (int, const char *);
extern FILE *freopen_unlocked (const char *, const char *, FILE *);




extern char **buildargv (const char *) __attribute__ ((__malloc__));



extern void freeargv (char **);




extern char **dupargv (char **) __attribute__ ((__malloc__));



extern void expandargv (int *, char ***);



extern int writeargv (char **, FILE *);
# 105 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern char *basename (const char *);
# 116 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern const char *lbasename (const char *);



extern char *lrealpath (const char *);





extern char *concat (const char *, ...) __attribute__ ((__malloc__)) __attribute__ ((__sentinel__));
# 135 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern char *reconcat (char *, const char *, ...) __attribute__ ((__malloc__)) __attribute__ ((__sentinel__));





extern unsigned long concat_length (const char *, ...) __attribute__ ((__sentinel__));






extern char *concat_copy (char *, const char *, ...) __attribute__ ((__sentinel__));






extern char *concat_copy2 (const char *, ...) __attribute__ ((__sentinel__));



extern char *libiberty_concat_ptr;
# 171 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern int fdmatch (int fd1, int fd2);
# 183 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern char * getpwd (void);
# 196 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern long get_run_time (void);




extern char *make_relative_prefix (const char *, const char *,
                                   const char *) __attribute__ ((__malloc__));





extern char *make_relative_prefix_ignore_links (const char *, const char *,
      const char *) __attribute__ ((__malloc__));



extern char *choose_temp_base (void) __attribute__ ((__malloc__));



extern char *make_temp_file (const char *) __attribute__ ((__malloc__));



extern int unlink_if_ordinary (const char *);



extern const char *spaces (int count);




extern int errno_max (void);




extern const char *strerrno (int);



extern int strtoerrno (const char *);



extern char *xstrerror (int);




extern int signo_max (void);
# 260 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern const char *strsigno (int);



extern int strtosigno (const char *);



extern int xatexit (void (*fn) (void));



extern void xexit (int status) __attribute__ ((__noreturn__));



extern void xmalloc_set_program_name (const char *);


extern void xmalloc_failed (size_t) __attribute__ ((__noreturn__));





extern void *xmalloc (size_t) __attribute__ ((__malloc__));





extern void *xrealloc (void *, size_t);




extern void *xcalloc (size_t, size_t) __attribute__ ((__malloc__));



extern char *xstrdup (const char *) __attribute__ ((__malloc__));



extern char *xstrndup (const char *, size_t) __attribute__ ((__malloc__));



extern void *xmemdup (const void *, size_t, size_t) __attribute__ ((__malloc__));


extern double physmem_total (void);
extern double physmem_available (void);
# 357 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern const unsigned char _hex_value[256];
extern void hex_init (void);
# 383 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern struct pex_obj *pex_init (int flags, const char *pname,
     const char *tempbase);
# 478 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern const char *pex_run (struct pex_obj *obj, int flags,
       const char *executable, char * const *argv,
       const char *outname, const char *errname,
       int *err);
# 493 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern const char *pex_run_in_environment (struct pex_obj *obj, int flags,
                      const char *executable,
                                           char * const *argv,
                                           char * const *env,
                              const char *outname,
        const char *errname, int *err);





extern FILE *pex_input_file (struct pex_obj *obj, int flags,
                             const char *in_name);






extern FILE *pex_input_pipe (struct pex_obj *obj, int binary);







extern FILE *pex_read_output (struct pex_obj *, int binary);







extern FILE *pex_read_err (struct pex_obj *, int binary);





extern int pex_get_status (struct pex_obj *, int count, int *vector);






struct pex_time
{
  unsigned long user_seconds;
  unsigned long user_microseconds;
  unsigned long system_seconds;
  unsigned long system_microseconds;
};

extern int pex_get_times (struct pex_obj *, int count,
     struct pex_time *vector);




extern void pex_free (struct pex_obj *);
# 568 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern const char *pex_one (int flags, const char *executable,
       char * const *argv, const char *pname,
       const char *outname, const char *errname,
       int *status, int *err);
# 587 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern int pexecute (const char *, char * const *, const char *,
                     const char *, char **, char **, int);



extern int pwait (int, int *, int);
# 620 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern int strverscmp (const char *, const char *);
# 631 "/home/mzorgati/gcc-4.4.0/include/libiberty.h"
extern void *C_alloca (size_t) __attribute__ ((__malloc__));
# 534 "/home/mzorgati/gcc-4.4.0/gcc/system.h" 2
# 571 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
extern void fancy_abort (const char *, int, const char *) __attribute__ ((__noreturn__));
# 769 "/home/mzorgati/gcc-4.4.0/gcc/system.h"
        
# 44 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/coretypes.h" 1
# 44 "/home/mzorgati/gcc-4.4.0/gcc/coretypes.h"
struct bitmap_head_def;
typedef struct bitmap_head_def *bitmap;
typedef const struct bitmap_head_def *const_bitmap;
struct rtx_def;
typedef struct rtx_def *rtx;
typedef const struct rtx_def *const_rtx;
struct rtvec_def;
typedef struct rtvec_def *rtvec;
typedef const struct rtvec_def *const_rtvec;
union tree_node;
typedef union tree_node *tree;
union gimple_statement_d;
typedef union gimple_statement_d *gimple;
typedef const union tree_node *const_tree;
typedef const union gimple_statement_d *const_gimple;
union section;
typedef union section section;
struct cl_target_option;
struct cl_optimization;
struct gimple_seq_d;
typedef struct gimple_seq_d *gimple_seq;
typedef const struct gimple_seq_d *const_gimple_seq;
struct gimple_seq_node_d;
typedef struct gimple_seq_node_d *gimple_seq_node;
typedef const struct gimple_seq_node_d *const_gimple_seq_node;


enum ir_type {
  IR_GIMPLE,
  IR_RTL_CFGRTL,
  IR_RTL_CFGLAYOUT
};






struct cpp_reader;
struct cpp_token;




enum tls_model {
  TLS_MODEL_NONE,
  TLS_MODEL_EMULATED,
  TLS_MODEL_REAL,
  TLS_MODEL_GLOBAL_DYNAMIC = TLS_MODEL_REAL,
  TLS_MODEL_LOCAL_DYNAMIC,
  TLS_MODEL_INITIAL_EXEC,
  TLS_MODEL_LOCAL_EXEC
};
# 45 "c816.c" 2
# 1 "/home/mzorgati/gcc_build/gcc/tm.h" 1
# 46 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/statistics.h" 1
# 41 "/home/mzorgati/gcc-4.4.0/gcc/statistics.h"
struct function;


extern void statistics_early_init (void);
extern void statistics_init (void);
extern void statistics_fini (void);
extern void statistics_fini_pass (void);
extern void statistics_counter_event (struct function *, const char *, int);
extern void statistics_histogram_event (struct function *, const char *, int);
# 26 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/machmode.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/machmode.h"
# 1 "/home/mzorgati/gcc_build/gcc/insn-modes.h" 1






enum machine_mode
{
  VOIDmode,
  BLKmode,
  CCmode,
  BImode,
  QImode,
  HImode,
  SImode,
  DImode,
  TImode,
  QQmode,
  HQmode,
  SQmode,
  DQmode,
  TQmode,
  UQQmode,
  UHQmode,
  USQmode,
  UDQmode,
  UTQmode,
  HAmode,
  SAmode,
  DAmode,
  TAmode,
  UHAmode,
  USAmode,
  UDAmode,
  UTAmode,
  SFmode,
  DFmode,
  SDmode,
  DDmode,
  TDmode,
  CQImode,
  CHImode,
  CSImode,
  CDImode,
  CTImode,
  SCmode,
  DCmode,
  MAX_MACHINE_MODE,

  MIN_MODE_RANDOM = VOIDmode,
  MAX_MODE_RANDOM = BLKmode,

  MIN_MODE_CC = CCmode,
  MAX_MODE_CC = CCmode,

  MIN_MODE_INT = QImode,
  MAX_MODE_INT = TImode,

  MIN_MODE_PARTIAL_INT = VOIDmode,
  MAX_MODE_PARTIAL_INT = VOIDmode,

  MIN_MODE_FRACT = QQmode,
  MAX_MODE_FRACT = TQmode,

  MIN_MODE_UFRACT = UQQmode,
  MAX_MODE_UFRACT = UTQmode,

  MIN_MODE_ACCUM = HAmode,
  MAX_MODE_ACCUM = TAmode,

  MIN_MODE_UACCUM = UHAmode,
  MAX_MODE_UACCUM = UTAmode,

  MIN_MODE_FLOAT = SFmode,
  MAX_MODE_FLOAT = DFmode,

  MIN_MODE_DECIMAL_FLOAT = SDmode,
  MAX_MODE_DECIMAL_FLOAT = TDmode,

  MIN_MODE_COMPLEX_INT = CQImode,
  MAX_MODE_COMPLEX_INT = CTImode,

  MIN_MODE_COMPLEX_FLOAT = SCmode,
  MAX_MODE_COMPLEX_FLOAT = DCmode,

  MIN_MODE_VECTOR_INT = VOIDmode,
  MAX_MODE_VECTOR_INT = VOIDmode,

  MIN_MODE_VECTOR_FRACT = VOIDmode,
  MAX_MODE_VECTOR_FRACT = VOIDmode,

  MIN_MODE_VECTOR_UFRACT = VOIDmode,
  MAX_MODE_VECTOR_UFRACT = VOIDmode,

  MIN_MODE_VECTOR_ACCUM = VOIDmode,
  MAX_MODE_VECTOR_ACCUM = VOIDmode,

  MIN_MODE_VECTOR_UACCUM = VOIDmode,
  MAX_MODE_VECTOR_UACCUM = VOIDmode,

  MIN_MODE_VECTOR_FLOAT = VOIDmode,
  MAX_MODE_VECTOR_FLOAT = VOIDmode,

  NUM_MACHINE_MODES = MAX_MACHINE_MODE
};
# 26 "/home/mzorgati/gcc-4.4.0/gcc/machmode.h" 2



extern const char * const mode_name[NUM_MACHINE_MODES];




# 1 "/home/mzorgati/gcc-4.4.0/gcc/mode-classes.def" 1
# 35 "/home/mzorgati/gcc-4.4.0/gcc/machmode.h" 2

enum mode_class { MODE_RANDOM, MODE_CC, MODE_INT, MODE_PARTIAL_INT, MODE_FRACT, MODE_UFRACT, MODE_ACCUM, MODE_UACCUM, MODE_FLOAT, MODE_DECIMAL_FLOAT, MODE_COMPLEX_INT, MODE_COMPLEX_FLOAT, MODE_VECTOR_INT, MODE_VECTOR_FRACT, MODE_VECTOR_UFRACT, MODE_VECTOR_ACCUM, MODE_VECTOR_UACCUM, MODE_VECTOR_FLOAT, MAX_MODE_CLASS };






extern const unsigned char mode_class[NUM_MACHINE_MODES];
# 179 "/home/mzorgati/gcc-4.4.0/gcc/machmode.h"
extern const unsigned char mode_size[NUM_MACHINE_MODES];




extern const unsigned short mode_precision[NUM_MACHINE_MODES];



extern const unsigned char mode_ibit[NUM_MACHINE_MODES];



extern const unsigned char mode_fbit[NUM_MACHINE_MODES];





extern const unsigned long mode_mask_array[NUM_MACHINE_MODES];





extern const unsigned char mode_inner[NUM_MACHINE_MODES];
# 216 "/home/mzorgati/gcc-4.4.0/gcc/machmode.h"
extern const unsigned char mode_nunits[NUM_MACHINE_MODES];




extern const unsigned char mode_wider[NUM_MACHINE_MODES];


extern const unsigned char mode_2xwider[NUM_MACHINE_MODES];






extern enum machine_mode mode_for_size (unsigned int, enum mode_class, int);



extern enum machine_mode smallest_mode_for_size (unsigned int,
       enum mode_class);





extern enum machine_mode int_mode_for_mode (enum machine_mode);



extern enum machine_mode get_best_mode (int, int, unsigned int,
     enum machine_mode, int);



extern const unsigned char mode_base_align[NUM_MACHINE_MODES];

extern unsigned get_mode_alignment (enum machine_mode);





extern const unsigned char class_narrowest_mode[MAX_MODE_CLASS];





extern enum machine_mode byte_mode;
extern enum machine_mode word_mode;
extern enum machine_mode ptr_mode;


extern void init_adjust_machine_modes (void);
# 27 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/input.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/input.h"
# 1 "/home/mzorgati/gcc-4.4.0/libcpp/include/line-map.h" 1
# 35 "/home/mzorgati/gcc-4.4.0/libcpp/include/line-map.h"
enum lc_reason {LC_ENTER = 0, LC_LEAVE, LC_RENAME};


typedef unsigned int linenum_type;




typedef unsigned int source_location;


typedef void *(*line_map_realloc) (void *, size_t);
# 60 "/home/mzorgati/gcc-4.4.0/libcpp/include/line-map.h"
struct line_map
{
  const char *to_file;
  linenum_type to_line;
  source_location start_location;
  int included_from;
  __extension__ enum lc_reason reason : 8;

  unsigned char sysp;

  unsigned int column_bits : 8;
};


struct line_maps
{
  struct line_map * maps;
  unsigned int allocated;
  unsigned int used;

  unsigned int cache;




  int last_listed;


  unsigned int depth;


  unsigned char trace_includes;


  source_location highest_location;


  source_location highest_line;



  unsigned int max_column_hint;



  line_map_realloc reallocator;
};


extern void linemap_init (struct line_maps *);


extern void linemap_free (struct line_maps *);



extern void linemap_check_files_exited (struct line_maps *);







extern source_location linemap_line_start
(struct line_maps *set, linenum_type to_line, unsigned int max_column_hint);
# 138 "/home/mzorgati/gcc-4.4.0/libcpp/include/line-map.h"
extern const struct line_map *linemap_add
  (struct line_maps *, enum lc_reason, unsigned int sysp,
   const char *to_file, linenum_type to_line);



extern const struct line_map *linemap_lookup
  (struct line_maps *, source_location);




extern void linemap_print_containing_files (struct line_maps *,
         const struct line_map *);
# 192 "/home/mzorgati/gcc-4.4.0/libcpp/include/line-map.h"
extern source_location
linemap_position_for_column (struct line_maps *set, unsigned int to_column);
# 26 "/home/mzorgati/gcc-4.4.0/gcc/input.h" 2

extern struct line_maps *line_table;







typedef struct
{

  const char *file;


  int line;

  int column;


  unsigned char sysp;
} expanded_location;

extern expanded_location expand_location (source_location);



typedef source_location location_t;


extern const char *main_input_filename;

extern location_t input_location;
# 28 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/real.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/real.h"
# 1 "/usr/include/gmp.h" 1 3 4
# 53 "/usr/include/gmp.h" 3 4
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ginclude/stddef.h" 1 3 4
# 54 "/usr/include/gmp.h" 2 3 4
# 194 "/usr/include/gmp.h" 3 4
typedef unsigned long int mp_limb_t;
typedef long int mp_limb_signed_t;






typedef struct
{
  int _mp_alloc;

  int _mp_size;


  mp_limb_t *_mp_d;
} __mpz_struct;




typedef __mpz_struct MP_INT;
typedef __mpz_struct mpz_t[1];

typedef mp_limb_t * mp_ptr;
typedef const mp_limb_t * mp_srcptr;







typedef long int mp_size_t;
typedef long int mp_exp_t;


typedef struct
{
  __mpz_struct _mp_num;
  __mpz_struct _mp_den;
} __mpq_struct;

typedef __mpq_struct MP_RAT;
typedef __mpq_struct mpq_t[1];

typedef struct
{
  int _mp_prec;



  int _mp_size;


  mp_exp_t _mp_exp;
  mp_limb_t *_mp_d;
} __mpf_struct;


typedef __mpf_struct mpf_t[1];


typedef enum
{
  GMP_RAND_ALG_DEFAULT = 0,
  GMP_RAND_ALG_LC = GMP_RAND_ALG_DEFAULT
} gmp_randalg_t;


typedef struct
{
  mpz_t _mp_seed;
  gmp_randalg_t _mp_alg;
  union {
    void *_mp_lc;
  } _mp_algdata;
} __gmp_randstate_struct;
typedef __gmp_randstate_struct gmp_randstate_t[1];



typedef const __mpz_struct *mpz_srcptr;
typedef __mpz_struct *mpz_ptr;
typedef const __mpf_struct *mpf_srcptr;
typedef __mpf_struct *mpf_ptr;
typedef const __mpq_struct *mpq_srcptr;
typedef __mpq_struct *mpq_ptr;
# 524 "/usr/include/gmp.h" 3 4
__attribute__((__dllimport__)) void __gmp_set_memory_functions (void *(*) (size_t), void *(*) (void *, size_t, size_t), void (*) (void *, size_t)) ;




__attribute__((__dllimport__)) void __gmp_get_memory_functions (void *(**) (size_t), void *(**) (void *, size_t, size_t), void (**) (void *, size_t)) ;




__attribute__((__dllimport__)) extern const int __gmp_bits_per_limb;


__attribute__((__dllimport__)) extern int __gmp_errno;


__attribute__((__dllimport__)) extern const char * const __gmp_version;






__attribute__((__dllimport__)) void __gmp_randinit (gmp_randstate_t, gmp_randalg_t, ...);


__attribute__((__dllimport__)) void __gmp_randinit_default (gmp_randstate_t);


__attribute__((__dllimport__)) void __gmp_randinit_lc_2exp (gmp_randstate_t, mpz_srcptr, unsigned long int, unsigned long int);




__attribute__((__dllimport__)) int __gmp_randinit_lc_2exp_size (gmp_randstate_t, unsigned long);


__attribute__((__dllimport__)) void __gmp_randinit_mt (gmp_randstate_t);


void __gmp_randinit_set (gmp_randstate_t, const __gmp_randstate_struct *);


__attribute__((__dllimport__)) void __gmp_randseed (gmp_randstate_t, mpz_srcptr);


__attribute__((__dllimport__)) void __gmp_randseed_ui (gmp_randstate_t, unsigned long int);


__attribute__((__dllimport__)) void __gmp_randclear (gmp_randstate_t);


unsigned long __gmp_urandomb_ui (gmp_randstate_t, unsigned long);


unsigned long __gmp_urandomm_ui (gmp_randstate_t, unsigned long);





__attribute__((__dllimport__)) int __gmp_asprintf (char **, const char *, ...);



__attribute__((__dllimport__)) int __gmp_fprintf (FILE *, const char *, ...);
# 603 "/usr/include/gmp.h" 3 4
__attribute__((__dllimport__)) int __gmp_printf (const char *, ...);


__attribute__((__dllimport__)) int __gmp_snprintf (char *, size_t, const char *, ...);


__attribute__((__dllimport__)) int __gmp_sprintf (char *, const char *, ...);



__attribute__((__dllimport__)) int __gmp_vasprintf (char **, const char *, va_list);




__attribute__((__dllimport__)) int __gmp_vfprintf (FILE *, const char *, va_list);




__attribute__((__dllimport__)) int __gmp_vprintf (const char *, va_list);




__attribute__((__dllimport__)) int __gmp_vsnprintf (char *, size_t, const char *, va_list);




__attribute__((__dllimport__)) int __gmp_vsprintf (char *, const char *, va_list);







__attribute__((__dllimport__)) int __gmp_fscanf (FILE *, const char *, ...);



__attribute__((__dllimport__)) int __gmp_scanf (const char *, ...);


__attribute__((__dllimport__)) int __gmp_sscanf (const char *, const char *, ...);



__attribute__((__dllimport__)) int __gmp_vfscanf (FILE *, const char *, va_list);




__attribute__((__dllimport__)) int __gmp_vscanf (const char *, va_list);




__attribute__((__dllimport__)) int __gmp_vsscanf (const char *, const char *, va_list);







__attribute__((__dllimport__)) void *__gmpz_realloc (mpz_ptr, mp_size_t);



__attribute__((__dllimport__)) void __gmpz_abs (mpz_ptr, mpz_srcptr);



__attribute__((__dllimport__)) void __gmpz_add (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_add_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_addmul (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_addmul_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_and (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_array_init (mpz_ptr, mp_size_t, mp_size_t);


__attribute__((__dllimport__)) void __gmpz_bin_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_bin_uiui (mpz_ptr, unsigned long int, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_cdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_cdiv_q_2exp (mpz_ptr, mpz_srcptr, unsigned long);


__attribute__((__dllimport__)) unsigned long int __gmpz_cdiv_q_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_cdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) unsigned long int __gmpz_cdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_cdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_cdiv_r_2exp (mpz_ptr, mpz_srcptr, unsigned long);


__attribute__((__dllimport__)) unsigned long int __gmpz_cdiv_r_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) unsigned long int __gmpz_cdiv_ui (mpz_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_clear (mpz_ptr);


__attribute__((__dllimport__)) void __gmpz_clrbit (mpz_ptr, unsigned long int);


__attribute__((__dllimport__)) int __gmpz_cmp (mpz_srcptr, mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_cmp_d (mpz_srcptr, double) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_cmp_si (mpz_srcptr, signed long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_cmp_ui (mpz_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_cmpabs (mpz_srcptr, mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_cmpabs_d (mpz_srcptr, double) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_cmpabs_ui (mpz_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_com (mpz_ptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_combit (mpz_ptr, unsigned long int);


__attribute__((__dllimport__)) int __gmpz_congruent_p (mpz_srcptr, mpz_srcptr, mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_congruent_2exp_p (mpz_srcptr, mpz_srcptr, unsigned long) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_congruent_ui_p (mpz_srcptr, unsigned long, unsigned long) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_divexact (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_divexact_ui (mpz_ptr, mpz_srcptr, unsigned long);


__attribute__((__dllimport__)) int __gmpz_divisible_p (mpz_srcptr, mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_divisible_ui_p (mpz_srcptr, unsigned long) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_divisible_2exp_p (mpz_srcptr, unsigned long) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_dump (mpz_srcptr);


__attribute__((__dllimport__)) void *__gmpz_export (void *, size_t *, int, size_t, int, size_t, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_fac_ui (mpz_ptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_fdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_fdiv_q_2exp (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) unsigned long int __gmpz_fdiv_q_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_fdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) unsigned long int __gmpz_fdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_fdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_fdiv_r_2exp (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) unsigned long int __gmpz_fdiv_r_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) unsigned long int __gmpz_fdiv_ui (mpz_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_fib_ui (mpz_ptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_fib2_ui (mpz_ptr, mpz_ptr, unsigned long int);


__attribute__((__dllimport__)) int __gmpz_fits_sint_p (mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_fits_slong_p (mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_fits_sshort_p (mpz_srcptr) __attribute__ ((__pure__));



__attribute__((__dllimport__)) int __gmpz_fits_uint_p (mpz_srcptr) __attribute__ ((__pure__));




__attribute__((__dllimport__)) int __gmpz_fits_ulong_p (mpz_srcptr) __attribute__ ((__pure__));




__attribute__((__dllimport__)) int __gmpz_fits_ushort_p (mpz_srcptr) __attribute__ ((__pure__));



__attribute__((__dllimport__)) void __gmpz_gcd (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) unsigned long int __gmpz_gcd_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_gcdext (mpz_ptr, mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) double __gmpz_get_d (mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) double __gmpz_get_d_2exp (signed long int *, mpz_srcptr);


__attribute__((__dllimport__)) long int __gmpz_get_si (mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) char *__gmpz_get_str (char *, int, mpz_srcptr);



__attribute__((__dllimport__)) unsigned long int __gmpz_get_ui (mpz_srcptr) __attribute__ ((__pure__));




__attribute__((__dllimport__)) mp_limb_t __gmpz_getlimbn (mpz_srcptr, mp_size_t) __attribute__ ((__pure__));



__attribute__((__dllimport__)) unsigned long int __gmpz_hamdist (mpz_srcptr, mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_import (mpz_ptr, size_t, int, size_t, int, size_t, const void *);


__attribute__((__dllimport__)) void __gmpz_init (mpz_ptr);


__attribute__((__dllimport__)) void __gmpz_init2 (mpz_ptr, unsigned long);


__attribute__((__dllimport__)) void __gmpz_init_set (mpz_ptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_init_set_d (mpz_ptr, double);


__attribute__((__dllimport__)) void __gmpz_init_set_si (mpz_ptr, signed long int);


__attribute__((__dllimport__)) int __gmpz_init_set_str (mpz_ptr, const char *, int);


__attribute__((__dllimport__)) void __gmpz_init_set_ui (mpz_ptr, unsigned long int);



__attribute__((__dllimport__)) size_t __gmpz_inp_raw (mpz_ptr, FILE *);




__attribute__((__dllimport__)) size_t __gmpz_inp_str (mpz_ptr, FILE *, int);



__attribute__((__dllimport__)) int __gmpz_invert (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_ior (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) int __gmpz_jacobi (mpz_srcptr, mpz_srcptr) __attribute__ ((__pure__));




__attribute__((__dllimport__)) int __gmpz_kronecker_si (mpz_srcptr, long) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_kronecker_ui (mpz_srcptr, unsigned long) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_si_kronecker (long, mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpz_ui_kronecker (unsigned long, mpz_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_lcm (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_lcm_ui (mpz_ptr, mpz_srcptr, unsigned long);




__attribute__((__dllimport__)) void __gmpz_lucnum_ui (mpz_ptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_lucnum2_ui (mpz_ptr, mpz_ptr, unsigned long int);


__attribute__((__dllimport__)) int __gmpz_millerrabin (mpz_srcptr, int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_mod (mpz_ptr, mpz_srcptr, mpz_srcptr);




__attribute__((__dllimport__)) void __gmpz_mul (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_mul_2exp (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_mul_si (mpz_ptr, mpz_srcptr, long int);


__attribute__((__dllimport__)) void __gmpz_mul_ui (mpz_ptr, mpz_srcptr, unsigned long int);



__attribute__((__dllimport__)) void __gmpz_neg (mpz_ptr, mpz_srcptr);



__attribute__((__dllimport__)) void __gmpz_nextprime (mpz_ptr, mpz_srcptr);



__attribute__((__dllimport__)) size_t __gmpz_out_raw (FILE *, mpz_srcptr);




__attribute__((__dllimport__)) size_t __gmpz_out_str (FILE *, int, mpz_srcptr);



__attribute__((__dllimport__)) int __gmpz_perfect_power_p (mpz_srcptr) __attribute__ ((__pure__));



__attribute__((__dllimport__)) int __gmpz_perfect_square_p (mpz_srcptr) __attribute__ ((__pure__));




__attribute__((__dllimport__)) unsigned long int __gmpz_popcount (mpz_srcptr) __attribute__ ((__pure__));



__attribute__((__dllimport__)) void __gmpz_pow_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_powm (mpz_ptr, mpz_srcptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_powm_ui (mpz_ptr, mpz_srcptr, unsigned long int, mpz_srcptr);


__attribute__((__dllimport__)) int __gmpz_probab_prime_p (mpz_srcptr, int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_random (mpz_ptr, mp_size_t);


__attribute__((__dllimport__)) void __gmpz_random2 (mpz_ptr, mp_size_t);


__attribute__((__dllimport__)) void __gmpz_realloc2 (mpz_ptr, unsigned long);


__attribute__((__dllimport__)) unsigned long int __gmpz_remove (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) int __gmpz_root (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_rootrem (mpz_ptr,mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_rrandomb (mpz_ptr, gmp_randstate_t, unsigned long int);


__attribute__((__dllimport__)) unsigned long int __gmpz_scan0 (mpz_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) unsigned long int __gmpz_scan1 (mpz_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_set (mpz_ptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_set_d (mpz_ptr, double);


__attribute__((__dllimport__)) void __gmpz_set_f (mpz_ptr, mpf_srcptr);



__attribute__((__dllimport__)) void __gmpz_set_q (mpz_ptr, mpq_srcptr);



__attribute__((__dllimport__)) void __gmpz_set_si (mpz_ptr, signed long int);


__attribute__((__dllimport__)) int __gmpz_set_str (mpz_ptr, const char *, int);


__attribute__((__dllimport__)) void __gmpz_set_ui (mpz_ptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_setbit (mpz_ptr, unsigned long int);



__attribute__((__dllimport__)) size_t __gmpz_size (mpz_srcptr) __attribute__ ((__pure__));



__attribute__((__dllimport__)) size_t __gmpz_sizeinbase (mpz_srcptr, int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_sqrt (mpz_ptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_sqrtrem (mpz_ptr, mpz_ptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_sub (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_sub_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_ui_sub (mpz_ptr, unsigned long int, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_submul (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_submul_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_swap (mpz_ptr, mpz_ptr) ;


__attribute__((__dllimport__)) unsigned long int __gmpz_tdiv_ui (mpz_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_tdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_tdiv_q_2exp (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) unsigned long int __gmpz_tdiv_q_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_tdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) unsigned long int __gmpz_tdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_tdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpz_tdiv_r_2exp (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) unsigned long int __gmpz_tdiv_r_ui (mpz_ptr, mpz_srcptr, unsigned long int);


__attribute__((__dllimport__)) int __gmpz_tstbit (mpz_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpz_ui_pow_ui (mpz_ptr, unsigned long int, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_urandomb (mpz_ptr, gmp_randstate_t, unsigned long int);


__attribute__((__dllimport__)) void __gmpz_urandomm (mpz_ptr, gmp_randstate_t, mpz_srcptr);



__attribute__((__dllimport__)) void __gmpz_xor (mpz_ptr, mpz_srcptr, mpz_srcptr);






__attribute__((__dllimport__)) void __gmpq_abs (mpq_ptr, mpq_srcptr);



__attribute__((__dllimport__)) void __gmpq_add (mpq_ptr, mpq_srcptr, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpq_canonicalize (mpq_ptr);


__attribute__((__dllimport__)) void __gmpq_clear (mpq_ptr);


__attribute__((__dllimport__)) int __gmpq_cmp (mpq_srcptr, mpq_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpq_cmp_si (mpq_srcptr, long, unsigned long) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpq_cmp_ui (mpq_srcptr, unsigned long int, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpq_div (mpq_ptr, mpq_srcptr, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpq_div_2exp (mpq_ptr, mpq_srcptr, unsigned long);


__attribute__((__dllimport__)) int __gmpq_equal (mpq_srcptr, mpq_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpq_get_num (mpz_ptr, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpq_get_den (mpz_ptr, mpq_srcptr);


__attribute__((__dllimport__)) double __gmpq_get_d (mpq_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) char *__gmpq_get_str (char *, int, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpq_init (mpq_ptr);



__attribute__((__dllimport__)) size_t __gmpq_inp_str (mpq_ptr, FILE *, int);



__attribute__((__dllimport__)) void __gmpq_inv (mpq_ptr, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpq_mul (mpq_ptr, mpq_srcptr, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpq_mul_2exp (mpq_ptr, mpq_srcptr, unsigned long);



__attribute__((__dllimport__)) void __gmpq_neg (mpq_ptr, mpq_srcptr);




__attribute__((__dllimport__)) size_t __gmpq_out_str (FILE *, int, mpq_srcptr);



__attribute__((__dllimport__)) void __gmpq_set (mpq_ptr, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpq_set_d (mpq_ptr, double);


__attribute__((__dllimport__)) void __gmpq_set_den (mpq_ptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpq_set_f (mpq_ptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpq_set_num (mpq_ptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpq_set_si (mpq_ptr, signed long int, unsigned long int);


__attribute__((__dllimport__)) int __gmpq_set_str (mpq_ptr, const char *, int);


__attribute__((__dllimport__)) void __gmpq_set_ui (mpq_ptr, unsigned long int, unsigned long int);


__attribute__((__dllimport__)) void __gmpq_set_z (mpq_ptr, mpz_srcptr);


__attribute__((__dllimport__)) void __gmpq_sub (mpq_ptr, mpq_srcptr, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpq_swap (mpq_ptr, mpq_ptr) ;





__attribute__((__dllimport__)) void __gmpf_abs (mpf_ptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_add (mpf_ptr, mpf_srcptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_add_ui (mpf_ptr, mpf_srcptr, unsigned long int);

__attribute__((__dllimport__)) void __gmpf_ceil (mpf_ptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_clear (mpf_ptr);


__attribute__((__dllimport__)) int __gmpf_cmp (mpf_srcptr, mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_cmp_d (mpf_srcptr, double) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_cmp_si (mpf_srcptr, signed long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_cmp_ui (mpf_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpf_div (mpf_ptr, mpf_srcptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_div_2exp (mpf_ptr, mpf_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_div_ui (mpf_ptr, mpf_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_dump (mpf_srcptr);


__attribute__((__dllimport__)) int __gmpf_eq (mpf_srcptr, mpf_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_fits_sint_p (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_fits_slong_p (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_fits_sshort_p (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_fits_uint_p (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_fits_ulong_p (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) int __gmpf_fits_ushort_p (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpf_floor (mpf_ptr, mpf_srcptr);


__attribute__((__dllimport__)) double __gmpf_get_d (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) double __gmpf_get_d_2exp (signed long int *, mpf_srcptr);


__attribute__((__dllimport__)) unsigned long int __gmpf_get_default_prec (void) __attribute__ ((__pure__));


__attribute__((__dllimport__)) unsigned long int __gmpf_get_prec (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) long __gmpf_get_si (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) char *__gmpf_get_str (char *, mp_exp_t *, int, size_t, mpf_srcptr);


__attribute__((__dllimport__)) unsigned long __gmpf_get_ui (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpf_init (mpf_ptr);


__attribute__((__dllimport__)) void __gmpf_init2 (mpf_ptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_init_set (mpf_ptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_init_set_d (mpf_ptr, double);


__attribute__((__dllimport__)) void __gmpf_init_set_si (mpf_ptr, signed long int);


__attribute__((__dllimport__)) int __gmpf_init_set_str (mpf_ptr, const char *, int);


__attribute__((__dllimport__)) void __gmpf_init_set_ui (mpf_ptr, unsigned long int);



__attribute__((__dllimport__)) size_t __gmpf_inp_str (mpf_ptr, FILE *, int);



__attribute__((__dllimport__)) int __gmpf_integer_p (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpf_mul (mpf_ptr, mpf_srcptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_mul_2exp (mpf_ptr, mpf_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_mul_ui (mpf_ptr, mpf_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_neg (mpf_ptr, mpf_srcptr);



__attribute__((__dllimport__)) size_t __gmpf_out_str (FILE *, int, size_t, mpf_srcptr);



__attribute__((__dllimport__)) void __gmpf_pow_ui (mpf_ptr, mpf_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_random2 (mpf_ptr, mp_size_t, mp_exp_t);


__attribute__((__dllimport__)) void __gmpf_reldiff (mpf_ptr, mpf_srcptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_set (mpf_ptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_set_d (mpf_ptr, double);


__attribute__((__dllimport__)) void __gmpf_set_default_prec (unsigned long int) ;


__attribute__((__dllimport__)) void __gmpf_set_prec (mpf_ptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_set_prec_raw (mpf_ptr, unsigned long int) ;


__attribute__((__dllimport__)) void __gmpf_set_q (mpf_ptr, mpq_srcptr);


__attribute__((__dllimport__)) void __gmpf_set_si (mpf_ptr, signed long int);


__attribute__((__dllimport__)) int __gmpf_set_str (mpf_ptr, const char *, int);


__attribute__((__dllimport__)) void __gmpf_set_ui (mpf_ptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_set_z (mpf_ptr, mpz_srcptr);


__attribute__((__dllimport__)) size_t __gmpf_size (mpf_srcptr) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpf_sqrt (mpf_ptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_sqrt_ui (mpf_ptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_sub (mpf_ptr, mpf_srcptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_sub_ui (mpf_ptr, mpf_srcptr, unsigned long int);


__attribute__((__dllimport__)) void __gmpf_swap (mpf_ptr, mpf_ptr) ;


__attribute__((__dllimport__)) void __gmpf_trunc (mpf_ptr, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_ui_div (mpf_ptr, unsigned long int, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_ui_sub (mpf_ptr, unsigned long int, mpf_srcptr);


__attribute__((__dllimport__)) void __gmpf_urandomb (mpf_t, gmp_randstate_t, unsigned long int);
# 1462 "/usr/include/gmp.h" 3 4
__attribute__((__dllimport__)) mp_limb_t __gmpn_add (mp_ptr, mp_srcptr, mp_size_t, mp_srcptr,mp_size_t);




__attribute__((__dllimport__)) mp_limb_t __gmpn_add_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t) ;



__attribute__((__dllimport__)) mp_limb_t __gmpn_add_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);


__attribute__((__dllimport__)) mp_limb_t __gmpn_addmul_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);


__attribute__((__dllimport__)) mp_limb_t __gmpn_bdivmod (mp_ptr, mp_ptr, mp_size_t, mp_srcptr, mp_size_t, unsigned long int);



__attribute__((__dllimport__)) int __gmpn_cmp (mp_srcptr, mp_srcptr, mp_size_t) __attribute__ ((__pure__));






__attribute__((__dllimport__)) mp_limb_t __gmpn_divexact_by3c (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);





__attribute__((__dllimport__)) mp_limb_t __gmpn_divrem (mp_ptr, mp_size_t, mp_ptr, mp_size_t, mp_srcptr, mp_size_t);


__attribute__((__dllimport__)) mp_limb_t __gmpn_divrem_1 (mp_ptr, mp_size_t, mp_srcptr, mp_size_t, mp_limb_t);


__attribute__((__dllimport__)) mp_limb_t __gmpn_divrem_2 (mp_ptr, mp_size_t, mp_ptr, mp_size_t, mp_srcptr);


__attribute__((__dllimport__)) mp_size_t __gmpn_gcd (mp_ptr, mp_ptr, mp_size_t, mp_ptr, mp_size_t);


__attribute__((__dllimport__)) mp_limb_t __gmpn_gcd_1 (mp_srcptr, mp_size_t, mp_limb_t) __attribute__ ((__pure__));


__attribute__((__dllimport__)) mp_size_t __gmpn_gcdext (mp_ptr, mp_ptr, mp_size_t *, mp_ptr, mp_size_t, mp_ptr, mp_size_t);


__attribute__((__dllimport__)) size_t __gmpn_get_str (unsigned char *, int, mp_ptr, mp_size_t);


__attribute__((__dllimport__)) unsigned long int __gmpn_hamdist (mp_srcptr, mp_srcptr, mp_size_t) __attribute__ ((__pure__));


__attribute__((__dllimport__)) mp_limb_t __gmpn_lshift (mp_ptr, mp_srcptr, mp_size_t, unsigned int);


__attribute__((__dllimport__)) mp_limb_t __gmpn_mod_1 (mp_srcptr, mp_size_t, mp_limb_t) __attribute__ ((__pure__));


__attribute__((__dllimport__)) mp_limb_t __gmpn_mul (mp_ptr, mp_srcptr, mp_size_t, mp_srcptr, mp_size_t);


__attribute__((__dllimport__)) mp_limb_t __gmpn_mul_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);


__attribute__((__dllimport__)) void __gmpn_mul_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);


__attribute__((__dllimport__)) int __gmpn_perfect_square_p (mp_srcptr, mp_size_t) __attribute__ ((__pure__));


__attribute__((__dllimport__)) unsigned long int __gmpn_popcount (mp_srcptr, mp_size_t) __attribute__ ((__pure__));


__attribute__((__dllimport__)) mp_size_t __gmpn_pow_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t, mp_ptr);



__attribute__((__dllimport__)) mp_limb_t __gmpn_preinv_mod_1 (mp_srcptr, mp_size_t, mp_limb_t, mp_limb_t) __attribute__ ((__pure__));


__attribute__((__dllimport__)) void __gmpn_random (mp_ptr, mp_size_t);


__attribute__((__dllimport__)) void __gmpn_random2 (mp_ptr, mp_size_t);


__attribute__((__dllimport__)) mp_limb_t __gmpn_rshift (mp_ptr, mp_srcptr, mp_size_t, unsigned int);


__attribute__((__dllimport__)) unsigned long int __gmpn_scan0 (mp_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) unsigned long int __gmpn_scan1 (mp_srcptr, unsigned long int) __attribute__ ((__pure__));


__attribute__((__dllimport__)) mp_size_t __gmpn_set_str (mp_ptr, const unsigned char *, size_t, int);


__attribute__((__dllimport__)) mp_size_t __gmpn_sqrtrem (mp_ptr, mp_ptr, mp_srcptr, mp_size_t);



__attribute__((__dllimport__)) mp_limb_t __gmpn_sub (mp_ptr, mp_srcptr, mp_size_t, mp_srcptr,mp_size_t);




__attribute__((__dllimport__)) mp_limb_t __gmpn_sub_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t) ;



__attribute__((__dllimport__)) mp_limb_t __gmpn_sub_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);


__attribute__((__dllimport__)) mp_limb_t __gmpn_submul_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);


__attribute__((__dllimport__)) void __gmpn_tdiv_qr (mp_ptr, mp_ptr, mp_size_t, mp_srcptr, mp_size_t, mp_srcptr, mp_size_t);
# 1603 "/usr/include/gmp.h" 3 4
extern __inline__ void
__gmpz_abs (mpz_ptr __gmp_w, mpz_srcptr __gmp_u)
{
  if (__gmp_w != __gmp_u)
    __gmpz_set (__gmp_w, __gmp_u);
  __gmp_w->_mp_size = ((__gmp_w->_mp_size) >= 0 ? (__gmp_w->_mp_size) : -(__gmp_w->_mp_size));
}
# 1627 "/usr/include/gmp.h" 3 4
extern __inline__

int
__gmpz_fits_uint_p (mpz_srcptr __gmp_z)
{
  mp_size_t __gmp_n = __gmp_z->_mp_size; mp_ptr __gmp_p = __gmp_z->_mp_d; return (__gmp_n == 0 || (__gmp_n == 1 && __gmp_p[0] <= (~ (unsigned) 0)));;
}




extern __inline__

int
__gmpz_fits_ulong_p (mpz_srcptr __gmp_z)
{
  mp_size_t __gmp_n = __gmp_z->_mp_size; mp_ptr __gmp_p = __gmp_z->_mp_d; return (__gmp_n == 0 || (__gmp_n == 1 && __gmp_p[0] <= (~ (unsigned long) 0)));;
}




extern __inline__

int
__gmpz_fits_ushort_p (mpz_srcptr __gmp_z)
{
  mp_size_t __gmp_n = __gmp_z->_mp_size; mp_ptr __gmp_p = __gmp_z->_mp_d; return (__gmp_n == 0 || (__gmp_n == 1 && __gmp_p[0] <= ((unsigned short) ~0)));;
}




extern __inline__

unsigned long
__gmpz_get_ui (mpz_srcptr __gmp_z)
{
  mp_ptr __gmp_p = __gmp_z->_mp_d;
  mp_size_t __gmp_n = __gmp_z->_mp_size;
  mp_limb_t __gmp_l = __gmp_p[0];






  return (__gmp_n != 0 ? __gmp_l : 0);
# 1683 "/usr/include/gmp.h" 3 4
}




extern __inline__

mp_limb_t
__gmpz_getlimbn (mpz_srcptr __gmp_z, mp_size_t __gmp_n)
{
  mp_limb_t __gmp_result = 0;
  if (__builtin_expect ((__gmp_n >= 0 && __gmp_n < ((__gmp_z->_mp_size) >= 0 ? (__gmp_z->_mp_size) : -(__gmp_z->_mp_size))) != 0, 1))
    __gmp_result = __gmp_z->_mp_d[__gmp_n];
  return __gmp_result;
}



extern __inline__ void
__gmpz_neg (mpz_ptr __gmp_w, mpz_srcptr __gmp_u)
{
  if (__gmp_w != __gmp_u)
    __gmpz_set (__gmp_w, __gmp_u);
  __gmp_w->_mp_size = - __gmp_w->_mp_size;
}




extern __inline__

int
__gmpz_perfect_square_p (mpz_srcptr __gmp_a)
{
  mp_size_t __gmp_asize;
  int __gmp_result;

  __gmp_asize = __gmp_a->_mp_size;
  __gmp_result = (__gmp_asize >= 0);
  if (__builtin_expect ((__gmp_asize > 0) != 0, 1))
    __gmp_result = __gmpn_perfect_square_p (__gmp_a->_mp_d, __gmp_asize);
  return __gmp_result;
}




extern __inline__

unsigned long
__gmpz_popcount (mpz_srcptr __gmp_u)
{
  mp_size_t __gmp_usize;
  unsigned long __gmp_result;

  __gmp_usize = __gmp_u->_mp_size;
  __gmp_result = (__gmp_usize < 0 ? (~ (unsigned long) 0) : 0);
  if (__builtin_expect ((__gmp_usize > 0) != 0, 1))
    __gmp_result = __gmpn_popcount (__gmp_u->_mp_d, __gmp_usize);
  return __gmp_result;
}




extern __inline__

void
__gmpz_set_q (mpz_ptr __gmp_w, mpq_srcptr __gmp_u)
{
  __gmpz_tdiv_q (__gmp_w, (&((__gmp_u)->_mp_num)), (&((__gmp_u)->_mp_den)));
}




extern __inline__

size_t
__gmpz_size (mpz_srcptr __gmp_z)
{
  return ((__gmp_z->_mp_size) >= 0 ? (__gmp_z->_mp_size) : -(__gmp_z->_mp_size));
}






extern __inline__ void
__gmpq_abs (mpq_ptr __gmp_w, mpq_srcptr __gmp_u)
{
  if (__gmp_w != __gmp_u)
    __gmpq_set (__gmp_w, __gmp_u);
  __gmp_w->_mp_num._mp_size = ((__gmp_w->_mp_num._mp_size) >= 0 ? (__gmp_w->_mp_num._mp_size) : -(__gmp_w->_mp_num._mp_size));
}



extern __inline__ void
__gmpq_neg (mpq_ptr __gmp_w, mpq_srcptr __gmp_u)
{
  if (__gmp_w != __gmp_u)
    __gmpq_set (__gmp_w, __gmp_u);
  __gmp_w->_mp_num._mp_size = - __gmp_w->_mp_num._mp_size;
}
# 2025 "/usr/include/gmp.h" 3 4
extern __inline__

mp_limb_t
__gmpn_add (mp_ptr __gmp_wp, mp_srcptr __gmp_xp, mp_size_t __gmp_xsize, mp_srcptr __gmp_yp, mp_size_t __gmp_ysize)
{
  mp_limb_t __gmp_c;
  do { mp_size_t __gmp_i; mp_limb_t __gmp_x; __gmp_i = (__gmp_ysize); if (__gmp_i != 0) { if (__gmpn_add_n (__gmp_wp, __gmp_xp, __gmp_yp, __gmp_i)) { do { if (__gmp_i >= (__gmp_xsize)) { (__gmp_c) = 1; goto __gmp_done; } __gmp_x = (__gmp_xp)[__gmp_i]; } while ((((__gmp_wp)[__gmp_i++] = (__gmp_x + 1) & ((~ ((mp_limb_t) (0))) >> 0)) == 0)); } } if ((__gmp_wp) != (__gmp_xp)) do { mp_size_t __gmp_j; ; for (__gmp_j = (__gmp_i); __gmp_j < (__gmp_xsize); __gmp_j++) (__gmp_wp)[__gmp_j] = (__gmp_xp)[__gmp_j]; } while (0); (__gmp_c) = 0; __gmp_done: ; } while (0);
  return __gmp_c;
}




extern __inline__

mp_limb_t
__gmpn_add_1 (mp_ptr __gmp_dst, mp_srcptr __gmp_src, mp_size_t __gmp_size, mp_limb_t __gmp_n)
{
  mp_limb_t __gmp_c;
  do { mp_size_t __gmp_i; mp_limb_t __gmp_x, __gmp_r; __gmp_x = (__gmp_src)[0]; __gmp_r = __gmp_x + (__gmp_n); (__gmp_dst)[0] = __gmp_r; if (((__gmp_r) < ((__gmp_n)))) { (__gmp_c) = 1; for (__gmp_i = 1; __gmp_i < (__gmp_size);) { __gmp_x = (__gmp_src)[__gmp_i]; __gmp_r = __gmp_x + 1; (__gmp_dst)[__gmp_i] = __gmp_r; ++__gmp_i; if (!((__gmp_r) < (1))) { if ((__gmp_src) != (__gmp_dst)) do { mp_size_t __gmp_j; ; for (__gmp_j = (__gmp_i); __gmp_j < (__gmp_size); __gmp_j++) (__gmp_dst)[__gmp_j] = (__gmp_src)[__gmp_j]; } while (0); (__gmp_c) = 0; break; } } } else { if ((__gmp_src) != (__gmp_dst)) do { mp_size_t __gmp_j; ; for (__gmp_j = (1); __gmp_j < (__gmp_size); __gmp_j++) (__gmp_dst)[__gmp_j] = (__gmp_src)[__gmp_j]; } while (0); (__gmp_c) = 0; } } while (0);
  return __gmp_c;
}




extern __inline__

int
__gmpn_cmp (mp_srcptr __gmp_xp, mp_srcptr __gmp_yp, mp_size_t __gmp_size)
{
  int __gmp_result;
  do { mp_size_t __gmp_i; mp_limb_t __gmp_x, __gmp_y; (__gmp_result) = 0; __gmp_i = (__gmp_size); while (--__gmp_i >= 0) { __gmp_x = (__gmp_xp)[__gmp_i]; __gmp_y = (__gmp_yp)[__gmp_i]; if (__gmp_x != __gmp_y) { (__gmp_result) = (__gmp_x > __gmp_y ? 1 : -1); break; } } } while (0);
  return __gmp_result;
}




extern __inline__

mp_limb_t
__gmpn_sub (mp_ptr __gmp_wp, mp_srcptr __gmp_xp, mp_size_t __gmp_xsize, mp_srcptr __gmp_yp, mp_size_t __gmp_ysize)
{
  mp_limb_t __gmp_c;
  do { mp_size_t __gmp_i; mp_limb_t __gmp_x; __gmp_i = (__gmp_ysize); if (__gmp_i != 0) { if (__gmpn_sub_n (__gmp_wp, __gmp_xp, __gmp_yp, __gmp_i)) { do { if (__gmp_i >= (__gmp_xsize)) { (__gmp_c) = 1; goto __gmp_done; } __gmp_x = (__gmp_xp)[__gmp_i]; } while ((((__gmp_wp)[__gmp_i++] = (__gmp_x - 1) & ((~ ((mp_limb_t) (0))) >> 0)), __gmp_x == 0)); } } if ((__gmp_wp) != (__gmp_xp)) do { mp_size_t __gmp_j; ; for (__gmp_j = (__gmp_i); __gmp_j < (__gmp_xsize); __gmp_j++) (__gmp_wp)[__gmp_j] = (__gmp_xp)[__gmp_j]; } while (0); (__gmp_c) = 0; __gmp_done: ; } while (0);
  return __gmp_c;
}




extern __inline__

mp_limb_t
__gmpn_sub_1 (mp_ptr __gmp_dst, mp_srcptr __gmp_src, mp_size_t __gmp_size, mp_limb_t __gmp_n)
{
  mp_limb_t __gmp_c;
  do { mp_size_t __gmp_i; mp_limb_t __gmp_x, __gmp_r; __gmp_x = (__gmp_src)[0]; __gmp_r = __gmp_x - (__gmp_n); (__gmp_dst)[0] = __gmp_r; if (((__gmp_x) < ((__gmp_n)))) { (__gmp_c) = 1; for (__gmp_i = 1; __gmp_i < (__gmp_size);) { __gmp_x = (__gmp_src)[__gmp_i]; __gmp_r = __gmp_x - 1; (__gmp_dst)[__gmp_i] = __gmp_r; ++__gmp_i; if (!((__gmp_x) < (1))) { if ((__gmp_src) != (__gmp_dst)) do { mp_size_t __gmp_j; ; for (__gmp_j = (__gmp_i); __gmp_j < (__gmp_size); __gmp_j++) (__gmp_dst)[__gmp_j] = (__gmp_src)[__gmp_j]; } while (0); (__gmp_c) = 0; break; } } } else { if ((__gmp_src) != (__gmp_dst)) do { mp_size_t __gmp_j; ; for (__gmp_j = (1); __gmp_j < (__gmp_size); __gmp_j++) (__gmp_dst)[__gmp_j] = (__gmp_src)[__gmp_j]; } while (0); (__gmp_c) = 0; } } while (0);
  return __gmp_c;
}
# 2164 "/usr/include/gmp.h" 3 4
enum
{
  GMP_ERROR_NONE = 0,
  GMP_ERROR_UNSUPPORTED_ARGUMENT = 1,
  GMP_ERROR_DIVISION_BY_ZERO = 2,
  GMP_ERROR_SQRT_OF_NEGATIVE = 4,
  GMP_ERROR_INVALID_ARGUMENT = 8
};
# 26 "/home/mzorgati/gcc-4.4.0/gcc/real.h" 2
# 1 "/usr/include/mpfr.h" 1 3 4
# 61 "/usr/include/mpfr.h" 3 4
typedef enum {
  GMP_RNDN=0, GMP_RNDZ, GMP_RNDU, GMP_RNDD, GMP_RND_MAX,
  GMP_RNDNA=-1
} mpfr_rnd_t;
# 80 "/usr/include/mpfr.h" 3 4
typedef unsigned long mpfr_prec_t;
# 90 "/usr/include/mpfr.h" 3 4
typedef int mpfr_sign_t;






typedef struct {
  mpfr_prec_t _mpfr_prec;
  mpfr_sign_t _mpfr_sign;
  mp_exp_t _mpfr_exp;
  mp_limb_t *_mpfr_d;
} __mpfr_struct;
# 123 "/usr/include/mpfr.h" 3 4
typedef __mpfr_struct mpfr_t[1];
typedef __mpfr_struct *mpfr_ptr;
typedef const __mpfr_struct *mpfr_srcptr;
# 136 "/usr/include/mpfr.h" 3 4
typedef enum {
  MPFR_NAN_KIND = 0,
  MPFR_INF_KIND = 1, MPFR_ZERO_KIND = 2, MPFR_REGULAR_KIND = 3
} mpfr_kind_t;
# 185 "/usr/include/mpfr.h" 3 4
__attribute__((__dllimport__)) const char * mpfr_get_version (void);
__attribute__((__dllimport__)) const char * mpfr_get_patches (void);

__attribute__((__dllimport__)) mp_exp_t mpfr_get_emin (void);
__attribute__((__dllimport__)) int mpfr_set_emin (mp_exp_t);
__attribute__((__dllimport__)) mp_exp_t mpfr_get_emin_min (void);
__attribute__((__dllimport__)) mp_exp_t mpfr_get_emin_max (void);
__attribute__((__dllimport__)) mp_exp_t mpfr_get_emax (void);
__attribute__((__dllimport__)) int mpfr_set_emax (mp_exp_t);
__attribute__((__dllimport__)) mp_exp_t mpfr_get_emax_min (void);
__attribute__((__dllimport__)) mp_exp_t mpfr_get_emax_max (void);

__attribute__((__dllimport__)) void mpfr_set_default_rounding_mode (mpfr_rnd_t);
__attribute__((__dllimport__)) mpfr_rnd_t mpfr_get_default_rounding_mode (void);
__attribute__((__dllimport__)) const char *
   mpfr_print_rnd_mode (mpfr_rnd_t);

__attribute__((__dllimport__)) void mpfr_clear_flags (void);
__attribute__((__dllimport__)) void mpfr_clear_underflow (void);
__attribute__((__dllimport__)) void mpfr_clear_overflow (void);
__attribute__((__dllimport__)) void mpfr_clear_nanflag (void);
__attribute__((__dllimport__)) void mpfr_clear_inexflag (void);
__attribute__((__dllimport__)) void mpfr_clear_erangeflag (void);

__attribute__((__dllimport__)) void mpfr_set_underflow (void);
__attribute__((__dllimport__)) void mpfr_set_overflow (void);
__attribute__((__dllimport__)) void mpfr_set_nanflag (void);
__attribute__((__dllimport__)) void mpfr_set_inexflag (void);
__attribute__((__dllimport__)) void mpfr_set_erangeflag (void);

__attribute__((__dllimport__)) int mpfr_underflow_p (void);
__attribute__((__dllimport__)) int mpfr_overflow_p (void);
__attribute__((__dllimport__)) int mpfr_nanflag_p (void);
__attribute__((__dllimport__)) int mpfr_inexflag_p (void);
__attribute__((__dllimport__)) int mpfr_erangeflag_p (void);

__attribute__((__dllimport__)) int
  mpfr_check_range (mpfr_ptr, int, mpfr_rnd_t);

__attribute__((__dllimport__)) void mpfr_init2 (mpfr_ptr, mpfr_prec_t);
__attribute__((__dllimport__)) void mpfr_init (mpfr_ptr);
__attribute__((__dllimport__)) void mpfr_clear (mpfr_ptr);

__attribute__((__dllimport__)) void
  mpfr_inits2 (mpfr_prec_t, mpfr_ptr, ...) __attribute__ ((sentinel));
__attribute__((__dllimport__)) void
  mpfr_inits (mpfr_ptr, ...) __attribute__ ((sentinel));
__attribute__((__dllimport__)) void
  mpfr_clears (mpfr_ptr, ...) __attribute__ ((sentinel));

__attribute__((__dllimport__)) int
  mpfr_prec_round (mpfr_ptr, mpfr_prec_t, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_can_round (mpfr_srcptr, mp_exp_t, mpfr_rnd_t, mpfr_rnd_t, mpfr_prec_t);


__attribute__((__dllimport__)) mp_exp_t mpfr_get_exp (mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_set_exp (mpfr_ptr, mp_exp_t);
__attribute__((__dllimport__)) mpfr_prec_t mpfr_get_prec (mpfr_srcptr);
__attribute__((__dllimport__)) void mpfr_set_prec (mpfr_ptr, mpfr_prec_t);
__attribute__((__dllimport__)) void mpfr_set_prec_raw (mpfr_ptr, mpfr_prec_t);
__attribute__((__dllimport__)) void mpfr_set_default_prec (mpfr_prec_t);
__attribute__((__dllimport__)) mpfr_prec_t mpfr_get_default_prec (void);

__attribute__((__dllimport__)) int mpfr_set_d (mpfr_ptr, double, mpfr_rnd_t);




__attribute__((__dllimport__)) int
  mpfr_set_ld (mpfr_ptr, long double, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_set_z (mpfr_ptr, mpz_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) void mpfr_set_nan (mpfr_ptr);
__attribute__((__dllimport__)) void mpfr_set_inf (mpfr_ptr, int);
__attribute__((__dllimport__)) int
  mpfr_set_f (mpfr_ptr, mpf_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_get_f (mpf_ptr, mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_set_si (mpfr_ptr, long, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_set_ui (mpfr_ptr, unsigned long, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_set_si_2exp (mpfr_ptr, long, mp_exp_t, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_set_ui_2exp (mpfr_ptr,unsigned long,mp_exp_t,mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_set_q (mpfr_ptr, mpq_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_set_str (mpfr_ptr, const char *, int, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_init_set_str (mpfr_ptr, const char *, int, mpfr_rnd_t);

__attribute__((__dllimport__)) int
  mpfr_set4 (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t, int);
__attribute__((__dllimport__)) int
  mpfr_abs (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_set (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_neg (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_signbit (mpfr_srcptr);
__attribute__((__dllimport__)) int
  mpfr_setsign (mpfr_ptr, mpfr_srcptr, int, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  mpfr_copysign (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);
# 298 "/usr/include/mpfr.h" 3 4
__attribute__((__dllimport__)) int __gmpfr_set_sj (mpfr_t, intmax_t, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  __gmpfr_set_sj_2exp (mpfr_t, intmax_t, intmax_t, mpfr_rnd_t);
__attribute__((__dllimport__)) int __gmpfr_set_uj (mpfr_t, uintmax_t, mpfr_rnd_t);
__attribute__((__dllimport__)) int
  __gmpfr_set_uj_2exp (mpfr_t, uintmax_t, intmax_t, mpfr_rnd_t);
__attribute__((__dllimport__)) intmax_t __gmpfr_mpfr_get_sj (mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) uintmax_t __gmpfr_mpfr_get_uj (mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) mp_exp_t mpfr_get_z_exp (mpz_ptr, mpfr_srcptr);
__attribute__((__dllimport__)) double mpfr_get_d (mpfr_srcptr, mpfr_rnd_t);




__attribute__((__dllimport__)) long double mpfr_get_ld (mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) double mpfr_get_d1 (mpfr_srcptr);
__attribute__((__dllimport__)) double mpfr_get_d_2exp (long*, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) long double mpfr_get_ld_2exp (long*, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) long mpfr_get_si (mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) unsigned long mpfr_get_ui (mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) char*mpfr_get_str (char*, mp_exp_t*, int, size_t, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) void mpfr_get_z (mpz_ptr z, mpfr_srcptr f, mpfr_rnd_t);


__attribute__((__dllimport__)) void mpfr_free_str (char *);


__attribute__((__dllimport__)) void mpfr_random (mpfr_ptr);
__attribute__((__dllimport__)) void mpfr_random2 (mpfr_ptr,mp_size_t,mp_exp_t);
__attribute__((__dllimport__)) int mpfr_urandomb (mpfr_ptr, gmp_randstate_t);

__attribute__((__dllimport__)) void mpfr_nextabove (mpfr_ptr);
__attribute__((__dllimport__)) void mpfr_nextbelow (mpfr_ptr);
__attribute__((__dllimport__)) void mpfr_nexttoward (mpfr_ptr, mpfr_srcptr);




__attribute__((__dllimport__)) size_t __gmpfr_inp_str (mpfr_ptr, FILE*, int, mpfr_rnd_t);

__attribute__((__dllimport__)) size_t __gmpfr_out_str (FILE*, int, size_t, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int __gmpfr_fprintf (FILE*, const char*, ...);


__attribute__((__dllimport__)) int mpfr_printf (const char*, ...);
__attribute__((__dllimport__)) int mpfr_asprintf (char**, const char*, ...);

__attribute__((__dllimport__)) int mpfr_sprintf (char*, const char*, ...);

__attribute__((__dllimport__)) int mpfr_snprintf (char*, size_t, const char*, ...);





__attribute__((__dllimport__)) int __gmpfr_vfprintf (FILE*, const char*, va_list);






__attribute__((__dllimport__)) int __gmpfr_vprintf (const char*, va_list);
__attribute__((__dllimport__)) int __gmpfr_vasprintf (char**, const char*, va_list);

__attribute__((__dllimport__)) int __gmpfr_vsprintf (char*, const char*, va_list);

__attribute__((__dllimport__)) int __gmpfr_vsnprintf (char*, size_t, const char*, va_list);



__attribute__((__dllimport__)) int mpfr_pow (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_pow_si (mpfr_ptr, mpfr_srcptr, long int, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_pow_ui (mpfr_ptr, mpfr_srcptr, unsigned long int, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_ui_pow_ui (mpfr_ptr, unsigned long int, unsigned long int, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_ui_pow (mpfr_ptr, unsigned long int, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_pow_z (mpfr_ptr, mpfr_srcptr, mpz_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_sqrt (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sqrt_ui (mpfr_ptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_rec_sqrt (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_add (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sub (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_mul (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_add_ui (mpfr_ptr, mpfr_srcptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sub_ui (mpfr_ptr, mpfr_srcptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_ui_sub (mpfr_ptr, unsigned long, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_mul_ui (mpfr_ptr, mpfr_srcptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div_ui (mpfr_ptr, mpfr_srcptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_ui_div (mpfr_ptr, unsigned long, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_add_si (mpfr_ptr, mpfr_srcptr, long int, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sub_si (mpfr_ptr, mpfr_srcptr, long int, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_si_sub (mpfr_ptr, long int, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_mul_si (mpfr_ptr, mpfr_srcptr, long int, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div_si (mpfr_ptr, mpfr_srcptr, long int, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_si_div (mpfr_ptr, long int, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_add_d (mpfr_ptr, mpfr_srcptr, double, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sub_d (mpfr_ptr, mpfr_srcptr, double, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_d_sub (mpfr_ptr, double, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_mul_d (mpfr_ptr, mpfr_srcptr, double, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div_d (mpfr_ptr, mpfr_srcptr, double, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_d_div (mpfr_ptr, double, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_sqr (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_const_pi (mpfr_ptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_const_log2 (mpfr_ptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_const_euler (mpfr_ptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_const_catalan (mpfr_ptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_agm (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_log (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_log2 (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_log10 (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_log1p (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_exp (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_exp2 (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_exp10 (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_expm1 (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_eint (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_li2 (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_cmp (mpfr_srcptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_cmp3 (mpfr_srcptr, mpfr_srcptr, int);
__attribute__((__dllimport__)) int mpfr_cmp_d (mpfr_srcptr, double);
__attribute__((__dllimport__)) int mpfr_cmp_ld (mpfr_srcptr, long double);
__attribute__((__dllimport__)) int mpfr_cmpabs (mpfr_srcptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_cmp_ui (mpfr_srcptr, unsigned long);
__attribute__((__dllimport__)) int mpfr_cmp_si (mpfr_srcptr, long);
__attribute__((__dllimport__)) int mpfr_cmp_ui_2exp (mpfr_srcptr, unsigned long, mp_exp_t);

__attribute__((__dllimport__)) int mpfr_cmp_si_2exp (mpfr_srcptr, long, mp_exp_t);

__attribute__((__dllimport__)) void mpfr_reldiff (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_eq (mpfr_srcptr, mpfr_srcptr, unsigned long);

__attribute__((__dllimport__)) int mpfr_sgn (mpfr_srcptr);

__attribute__((__dllimport__)) int mpfr_mul_2exp (mpfr_ptr, mpfr_srcptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div_2exp (mpfr_ptr, mpfr_srcptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_mul_2ui (mpfr_ptr, mpfr_srcptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div_2ui (mpfr_ptr, mpfr_srcptr, unsigned long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_mul_2si (mpfr_ptr, mpfr_srcptr, long, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div_2si (mpfr_ptr, mpfr_srcptr, long, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_rint (mpfr_ptr,mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_round (mpfr_ptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_trunc (mpfr_ptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_ceil (mpfr_ptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_floor (mpfr_ptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_rint_round (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_rint_trunc (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_rint_ceil (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_rint_floor (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_frac (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_modf (mpfr_ptr, mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_remquo (mpfr_ptr, long*, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_remainder (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_fmod (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_fits_ulong_p (mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_fits_slong_p (mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_fits_uint_p (mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_fits_sint_p (mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_fits_ushort_p (mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_fits_sshort_p (mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_fits_uintmax_p (mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_fits_intmax_p (mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) void mpfr_extract (mpz_ptr, mpfr_srcptr, unsigned int);

__attribute__((__dllimport__)) void mpfr_swap (mpfr_ptr, mpfr_ptr);
__attribute__((__dllimport__)) void mpfr_dump (mpfr_srcptr);

__attribute__((__dllimport__)) int mpfr_nan_p (mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_inf_p (mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_number_p (mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_integer_p (mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_zero_p (mpfr_srcptr);

__attribute__((__dllimport__)) int mpfr_greater_p (mpfr_srcptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_greaterequal_p (mpfr_srcptr, mpfr_srcptr);

__attribute__((__dllimport__)) int mpfr_less_p (mpfr_srcptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_lessequal_p (mpfr_srcptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_lessgreater_p (mpfr_srcptr,mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_equal_p (mpfr_srcptr, mpfr_srcptr);
__attribute__((__dllimport__)) int mpfr_unordered_p (mpfr_srcptr, mpfr_srcptr);

__attribute__((__dllimport__)) int mpfr_atanh (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_acosh (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_asinh (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_cosh (mpfr_ptr,mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_sinh (mpfr_ptr,mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_tanh (mpfr_ptr,mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_sinh_cosh (mpfr_ptr, mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_sech (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_csch (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_coth (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_acos (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_asin (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_atan (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_sin (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_sin_cos (mpfr_ptr, mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_cos (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_tan (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_atan2 (mpfr_ptr,mpfr_srcptr,mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sec (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_csc (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_cot (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_hypot (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_erf (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_erfc (mpfr_ptr, mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_cbrt (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_root (mpfr_ptr,mpfr_srcptr,unsigned long,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_gamma (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_lngamma (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_lgamma (mpfr_ptr,int*,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_zeta (mpfr_ptr,mpfr_srcptr,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_zeta_ui (mpfr_ptr,unsigned long,mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_fac_ui (mpfr_ptr, unsigned long int, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_j0 (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_j1 (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_jn (mpfr_ptr, long, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_y0 (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_y1 (mpfr_ptr, mpfr_srcptr, mpfr_rnd_t);
__attribute__((__dllimport__)) int mpfr_yn (mpfr_ptr, long, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_min (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_max (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_dim (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_mul_z (mpfr_ptr, mpfr_srcptr, mpz_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div_z (mpfr_ptr, mpfr_srcptr, mpz_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_add_z (mpfr_ptr, mpfr_srcptr, mpz_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sub_z (mpfr_ptr, mpfr_srcptr, mpz_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_cmp_z (mpfr_srcptr, mpz_srcptr);

__attribute__((__dllimport__)) int mpfr_mul_q (mpfr_ptr, mpfr_srcptr, mpq_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_div_q (mpfr_ptr, mpfr_srcptr, mpq_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_add_q (mpfr_ptr, mpfr_srcptr, mpq_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sub_q (mpfr_ptr, mpfr_srcptr, mpq_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_cmp_q (mpfr_srcptr, mpq_srcptr);

__attribute__((__dllimport__)) int mpfr_cmp_f (mpfr_srcptr, mpf_srcptr);

__attribute__((__dllimport__)) int mpfr_fma (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_fms (mpfr_ptr, mpfr_srcptr, mpfr_srcptr, mpfr_srcptr, mpfr_rnd_t);

__attribute__((__dllimport__)) int mpfr_sum (mpfr_ptr, mpfr_ptr *const, unsigned long, mpfr_rnd_t);


__attribute__((__dllimport__)) void mpfr_free_cache (void);

__attribute__((__dllimport__)) int mpfr_subnormalize (mpfr_ptr, int, mpfr_rnd_t);


__attribute__((__dllimport__)) int mpfr_strtofr (mpfr_ptr, const char *, char **, int, mpfr_rnd_t);


__attribute__((__dllimport__)) size_t mpfr_custom_get_size (mpfr_prec_t);
__attribute__((__dllimport__)) void mpfr_custom_init (void *, mpfr_prec_t);
__attribute__((__dllimport__)) void * mpfr_custom_get_mantissa (mpfr_srcptr);
__attribute__((__dllimport__)) mp_exp_t mpfr_custom_get_exp (mpfr_srcptr);
__attribute__((__dllimport__)) void mpfr_custom_move (mpfr_ptr, void *);
__attribute__((__dllimport__)) void mpfr_custom_init_set (mpfr_ptr, int, mp_exp_t, mpfr_prec_t, void *);

__attribute__((__dllimport__)) int mpfr_custom_get_kind (mpfr_srcptr);
# 27 "/home/mzorgati/gcc-4.4.0/gcc/real.h" 2


# 1 "/home/mzorgati/gcc-4.4.0/gcc/coretypes.h" 1
# 30 "/home/mzorgati/gcc-4.4.0/gcc/real.h" 2



enum real_value_class {
  rvc_zero,
  rvc_normal,
  rvc_inf,
  rvc_nan
};







struct real_value
{



  unsigned int cl : 2;
  unsigned int decimal : 1;
  unsigned int sign : 1;
  unsigned int signalling : 1;
  unsigned int canonical : 1;
  unsigned int uexp : (32 - 6);
  unsigned long sig[((128 + (8 * 4)) / (8 * 4))];
};
# 81 "/home/mzorgati/gcc-4.4.0/gcc/real.h"
extern char test_real_width
  [sizeof(struct real_value) <= (((128 + (8 * 4)) + 32)/(8 * 4) + (((128 + (8 * 4)) + 32)%(8 * 4) ? 1 : 0))*sizeof(long) ? 1 : -1];
# 119 "/home/mzorgati/gcc-4.4.0/gcc/real.h"
struct real_format
{

  void (*encode) (const struct real_format *, long *,
    const struct real_value *);
  void (*decode) (const struct real_format *, struct real_value *,
    const long *);


  int b;


  int p;


  int pnan;


  int emin;


  int emax;



  int signbit_ro;



  int signbit_rw;


  unsigned char round_towards_zero;
  unsigned char has_sign_dependent_rounding;


  unsigned char has_nans;
  unsigned char has_inf;
  unsigned char has_denorm;
  unsigned char has_signed_zero;
  unsigned char qnan_msb_set;
  unsigned char canonical_nan_lsbs_set;
};







extern const struct real_format *
  real_format_for_mode[MAX_MODE_FLOAT - MIN_MODE_FLOAT + 1
         + MAX_MODE_DECIMAL_FLOAT - MIN_MODE_DECIMAL_FLOAT + 1];
# 205 "/home/mzorgati/gcc-4.4.0/gcc/real.h"
extern unsigned char real_arithmetic (struct real_value *, int, const struct real_value *,
        const struct real_value *);


extern unsigned char real_compare (int, const struct real_value *, const struct real_value *);


extern unsigned char real_isinf (const struct real_value *);


extern unsigned char real_isnan (const struct real_value *);


extern unsigned char real_isfinite (const struct real_value *);


extern unsigned char real_isneg (const struct real_value *);


extern unsigned char real_isnegzero (const struct real_value *);


extern unsigned char real_identical (const struct real_value *, const struct real_value *);


extern void real_convert (struct real_value *, enum machine_mode,
     const struct real_value *);


extern unsigned char exact_real_truncate (enum machine_mode, const struct real_value *);


extern void real_to_decimal (char *, const struct real_value *, size_t,
        size_t, int);



extern void real_to_decimal_for_mode (char *, const struct real_value *, size_t,
          size_t, int, enum machine_mode);


extern void real_to_hexadecimal (char *, const struct real_value *,
     size_t, size_t, int);


extern long real_to_integer (const struct real_value *);
extern void real_to_integer2 (long *, long *,
         const struct real_value *);



extern int real_from_string (struct real_value *, const char *);

extern void real_from_string3 (struct real_value *, const char *, enum machine_mode);


extern void real_from_integer (struct real_value *, enum machine_mode,
          unsigned long, long, int);

extern long real_to_target_fmt (long *, const struct real_value *,
    const struct real_format *);
extern long real_to_target (long *, const struct real_value *, enum machine_mode);

extern void real_from_target_fmt (struct real_value *, const long *,
      const struct real_format *);
extern void real_from_target (struct real_value *, const long *,
         enum machine_mode);

extern void real_inf (struct real_value *);

extern unsigned char real_nan (struct real_value *, const char *, int, enum machine_mode);

extern void real_maxval (struct real_value *, int, enum machine_mode);

extern void real_2expN (struct real_value *, int, enum machine_mode);

extern unsigned int real_hash (const struct real_value *);



extern const struct real_format ieee_single_format;
extern const struct real_format mips_single_format;
extern const struct real_format motorola_single_format;
extern const struct real_format spu_single_format;
extern const struct real_format ieee_double_format;
extern const struct real_format mips_double_format;
extern const struct real_format motorola_double_format;
extern const struct real_format ieee_extended_motorola_format;
extern const struct real_format ieee_extended_intel_96_format;
extern const struct real_format ieee_extended_intel_96_round_53_format;
extern const struct real_format ieee_extended_intel_128_format;
extern const struct real_format ibm_extended_format;
extern const struct real_format mips_extended_format;
extern const struct real_format ieee_quad_format;
extern const struct real_format mips_quad_format;
extern const struct real_format vax_f_format;
extern const struct real_format vax_d_format;
extern const struct real_format vax_g_format;
extern const struct real_format real_internal_format;
extern const struct real_format decimal_single_format;
extern const struct real_format decimal_double_format;
extern const struct real_format decimal_quad_format;
# 362 "/home/mzorgati/gcc-4.4.0/gcc/real.h"
extern struct real_value real_value_truncate (enum machine_mode,
         struct real_value);




extern struct real_value real_arithmetic2 (int, const struct real_value *,
      const struct real_value *);







extern int significand_size (enum machine_mode);

extern struct real_value real_from_string2 (const char *, enum machine_mode);
# 397 "/home/mzorgati/gcc-4.4.0/gcc/real.h"
extern int real_exponent (const struct real_value *);


extern void real_ldexp (struct real_value *, const struct real_value *, int);





extern struct real_value dconst0;
extern struct real_value dconst1;
extern struct real_value dconst2;
extern struct real_value dconstm1;
extern struct real_value dconsthalf;






extern const struct real_value * dconst_e_ptr (void);


extern const struct real_value * dconst_third_ptr (void);


extern const struct real_value * dconst_sqrt2_ptr (void);



struct real_value real_value_from_int_cst (const_tree, const_tree);
# 436 "/home/mzorgati/gcc-4.4.0/gcc/real.h"
extern rtx const_double_from_real_value (struct real_value, enum machine_mode);


extern unsigned char exact_real_inverse (enum machine_mode, struct real_value *);




unsigned char real_can_shorten_arithmetic (enum machine_mode, enum machine_mode);


extern tree build_real (tree, struct real_value);


extern unsigned char real_sqrt (struct real_value *, enum machine_mode,
         const struct real_value *);


extern unsigned char real_powi (struct real_value *, enum machine_mode,
         const struct real_value *, long);


extern void real_trunc (struct real_value *, enum machine_mode,
   const struct real_value *);
extern void real_floor (struct real_value *, enum machine_mode,
   const struct real_value *);
extern void real_ceil (struct real_value *, enum machine_mode,
         const struct real_value *);
extern void real_round (struct real_value *, enum machine_mode,
   const struct real_value *);


extern void real_copysign (struct real_value *, const struct real_value *);





extern void real_from_mpfr (struct real_value *, mpfr_srcptr, tree, mpfr_rnd_t);
extern void mpfr_from_real (mpfr_ptr, const struct real_value *, mpfr_rnd_t);



extern unsigned char real_isinteger (const struct real_value *c, enum machine_mode mode);




extern void get_max_float (const struct real_format *, char *, size_t);
# 29 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/vec.h" 1
# 420 "/home/mzorgati/gcc-4.4.0/gcc/vec.h"
extern void *vec_gc_p_reserve (void *, int );
extern void *vec_gc_p_reserve_exact (void *, int );
extern void *vec_gc_o_reserve (void *, int, size_t, size_t );
extern void *vec_gc_o_reserve_exact (void *, int, size_t, size_t
         );
extern void ggc_free (void *);

extern void *vec_heap_p_reserve (void *, int );
extern void *vec_heap_p_reserve_exact (void *, int );
extern void *vec_heap_o_reserve (void *, int, size_t, size_t );
extern void *vec_heap_o_reserve_exact (void *, int, size_t, size_t
           );
extern void dump_vec_loc_statistics (void);
# 30 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/fixed-value.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/fixed-value.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/double-int.h" 1
# 54 "/home/mzorgati/gcc-4.4.0/gcc/double-int.h"
typedef struct
{
  unsigned long low;
  long high;
} double_int;

union tree_node;



union tree_node *double_int_to_tree (union tree_node *, double_int);
unsigned char double_int_fits_to_tree_p (const union tree_node *, double_int);
double_int tree_to_double_int (const union tree_node *);




static __inline__ double_int
shwi_to_double_int (long cst)
{
  double_int r;

  r.low = (unsigned long) cst;
  r.high = cst < 0 ? -1 : 0;

  return r;
}
# 93 "/home/mzorgati/gcc-4.4.0/gcc/double-int.h"
static __inline__ double_int
uhwi_to_double_int (unsigned long cst)
{
  double_int r;

  r.low = cst;
  r.high = 0;

  return r;
}






double_int double_int_mul (double_int, double_int);
double_int double_int_add (double_int, double_int);
double_int double_int_neg (double_int);




unsigned char double_int_fits_in_hwi_p (double_int, unsigned char);
unsigned char double_int_fits_in_shwi_p (double_int);
unsigned char double_int_fits_in_uhwi_p (double_int);
long double_int_to_shwi (double_int);
unsigned long double_int_to_uhwi (double_int);
double_int double_int_div (double_int, double_int, unsigned char, unsigned);
double_int double_int_sdiv (double_int, double_int, unsigned);
double_int double_int_udiv (double_int, double_int, unsigned);
double_int double_int_mod (double_int, double_int, unsigned char, unsigned);
double_int double_int_smod (double_int, double_int, unsigned);
double_int double_int_umod (double_int, double_int, unsigned);
double_int double_int_divmod (double_int, double_int, unsigned char, unsigned, double_int *);
double_int double_int_sdivmod (double_int, double_int, unsigned, double_int *);
double_int double_int_udivmod (double_int, double_int, unsigned, double_int *);
unsigned char double_int_negative_p (double_int);
int double_int_cmp (double_int, double_int, unsigned char);
int double_int_scmp (double_int, double_int);
int double_int_ucmp (double_int, double_int);
void dump_double_int (FILE *, double_int, unsigned char);



double_int double_int_ext (double_int, unsigned, unsigned char);
double_int double_int_sext (double_int, unsigned);
double_int double_int_zext (double_int, unsigned);
double_int double_int_mask (unsigned);
# 151 "/home/mzorgati/gcc-4.4.0/gcc/double-int.h"
static __inline__ unsigned char
double_int_zero_p (double_int cst)
{
  return cst.low == 0 && cst.high == 0;
}



static __inline__ unsigned char
double_int_one_p (double_int cst)
{
  return cst.low == 1 && cst.high == 0;
}



static __inline__ unsigned char
double_int_minus_one_p (double_int cst)
{
  return (cst.low == (~((unsigned long) 0)) && cst.high == -1);
}



static __inline__ unsigned char
double_int_equal_p (double_int cst1, double_int cst2)
{
  return cst1.low == cst2.low && cst1.high == cst2.high;
}




void mpz_set_double_int (mpz_t, double_int, unsigned char);
double_int mpz_get_double_int (const_tree, mpz_t, unsigned char);
# 26 "/home/mzorgati/gcc-4.4.0/gcc/fixed-value.h" 2

struct fixed_value
{
  double_int data;
  unsigned int mode;
};
# 40 "/home/mzorgati/gcc-4.4.0/gcc/fixed-value.h"
extern struct fixed_value fconst0[18];
extern struct fixed_value fconst1[8];
# 50 "/home/mzorgati/gcc-4.4.0/gcc/fixed-value.h"
extern rtx const_fixed_from_fixed_value (struct fixed_value, enum machine_mode);


extern void fixed_from_string (struct fixed_value *, const char *,
          enum machine_mode);


extern tree build_fixed (tree, struct fixed_value);


extern unsigned char fixed_convert (struct fixed_value *, enum machine_mode,
      const struct fixed_value *, unsigned char);


extern unsigned char fixed_convert_from_int (struct fixed_value *, enum machine_mode,
        double_int, unsigned char, unsigned char);


extern unsigned char fixed_convert_from_real (struct fixed_value *, enum machine_mode,
         const struct real_value *, unsigned char);


extern void real_convert_from_fixed (struct real_value *, enum machine_mode,
         const struct fixed_value *);


extern unsigned char fixed_identical (const struct fixed_value *, const struct fixed_value *);


extern unsigned int fixed_hash (const struct fixed_value *);







extern void fixed_to_decimal (char *str, const struct fixed_value *, size_t);


extern unsigned char fixed_arithmetic (struct fixed_value *, int, const struct fixed_value *,
         const struct fixed_value *, unsigned char);


extern unsigned char fixed_compare (int, const struct fixed_value *,
      const struct fixed_value *);


extern unsigned char fixed_isneg (const struct fixed_value *);
# 31 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/alias.h" 1
# 31 "/home/mzorgati/gcc-4.4.0/gcc/alias.h"
typedef int alias_set_type;

extern alias_set_type new_alias_set (void);
extern alias_set_type get_alias_set (tree);
extern alias_set_type get_varargs_alias_set (void);
extern alias_set_type get_frame_alias_set (void);
extern unsigned char component_uses_parent_alias_set (const_tree);
extern unsigned char alias_set_subset_of (alias_set_type, alias_set_type);
extern void record_alias_subset (alias_set_type, alias_set_type);
extern void record_component_aliases (tree);
extern int alias_sets_conflict_p (alias_set_type, alias_set_type);
extern int alias_sets_must_conflict_p (alias_set_type, alias_set_type);
extern int objects_must_conflict_p (tree, tree);
extern int nonoverlapping_memrefs_p (const_rtx, const_rtx);
extern unsigned char insn_alias_sets_conflict_p (rtx, rtx);
# 32 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2
# 45 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
enum rtx_code {


# 1 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def" 1
# 82 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
UNKNOWN ,






EXPR_LIST ,



INSN_LIST ,





SEQUENCE ,


ADDRESS ,
# 115 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
INSN ,



JUMP_INSN ,






CALL_INSN ,


BARRIER ,







CODE_LABEL ,






NOTE ,
# 157 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
COND_EXEC ,


PARALLEL ,







ASM_INPUT ,
# 181 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
ASM_OPERANDS ,
# 199 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
UNSPEC ,


UNSPEC_VOLATILE ,



ADDR_VEC ,
# 231 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
ADDR_DIFF_VEC ,
# 242 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
PREFETCH ,
# 254 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
SET ,
# 263 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
USE ,
# 272 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
CLOBBER ,





CALL ,



RETURN ,





TRAP_IF ,




RESX ,






CONST_INT ,


CONST_FIXED ,




CONST_DOUBLE ,


CONST_VECTOR ,




CONST_STRING ,





const ,



PC ,




VALUE ,
# 341 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
REG ,






SCRATCH ,



SUBREG ,
# 365 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
STRICT_LOW_PART ,





CONCAT ,





CONCATN ,




MEM ,



LABEL_REF ,






SYMBOL_REF ,






CC0 ,
# 412 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
IF_THEN_ELSE ,


COMPARE ,


PLUS ,


MINUS ,


NEG ,

MULT ,


SS_MULT ,

US_MULT ,


DIV ,

SS_DIV ,

US_DIV ,


MOD ,


UDIV ,
UMOD ,


, ,
IOR ,
XOR ,
NOT ,




ASHIFT ,
ROTATE ,
ASHIFTRT ,
LSHIFTRT ,
ROTATERT ,
# 469 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
SMIN ,
SMAX ,
UMIN ,
UMAX ,
# 481 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
PRE_DEC ,
PRE_INC ,
POST_DEC ,
POST_INC ,
# 498 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
PRE_MODIFY ,
POST_MODIFY ,



NE ,
EQ ,
GE ,
GT ,
LE ,
LT ,
GEU ,
GTU ,
LEU ,
LTU ,


UNORDERED ,
ORDERED ,


UNEQ ,
UNGE ,
UNGT ,
UNLE ,
UNLT ,


LTGT ,




SIGN_EXTEND ,


ZERO_EXTEND ,


TRUNCATE ,


FLOAT_EXTEND ,
FLOAT_TRUNCATE ,


FLOAT ,







FIX ,


UNSIGNED_FLOAT ,




UNSIGNED_FIX ,
# 570 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
FRACT_CONVERT ,






UNSIGNED_FRACT_CONVERT ,







SAT_FRACT ,





UNSIGNED_SAT_FRACT ,


ABS ,


SQRT ,


BSWAP ,




FFS ,


CLZ ,


CTZ ,


POPCOUNT ,


PARITY ,
# 629 "/home/mzorgati/gcc-4.4.0/gcc/rtl.def"
SIGN_EXTRACT ,



ZERO_EXTRACT ,




HIGH ,



LO_SUM ,






VEC_MERGE ,





VEC_SELECT ,




VEC_CONCAT ,





VEC_DUPLICATE ,


SS_PLUS ,


US_PLUS ,


SS_MINUS ,


SS_NEG ,

US_NEG ,


SS_ABS ,


SS_ASHIFT ,


US_ASHIFT ,


US_MINUS ,


SS_TRUNCATE ,


US_TRUNCATE ,




VAR_LOCATION ,
# 49 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2


  LAST_AND_UNUSED_RTX_CODE};
# 60 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
enum rtx_class {




  RTX_COMPARE,
  RTX_COMM_COMPARE,
  RTX_BIN_ARITH,
  RTX_COMM_ARITH,


  RTX_UNARY,

  RTX_EXTRA,
  RTX_MATCH,
  RTX_INSN,


  RTX_OBJ,
  RTX_CONST_OBJ,

  RTX_TERNARY,
  RTX_BITFIELD_OPS,
  RTX_AUTOINC
};
# 98 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
extern const unsigned char rtx_length[((int) LAST_AND_UNUSED_RTX_CODE)];


extern const char * const rtx_name[((int) LAST_AND_UNUSED_RTX_CODE)];


extern const char * const rtx_format[((int) LAST_AND_UNUSED_RTX_CODE)];


extern const enum rtx_class rtx_class[((int) LAST_AND_UNUSED_RTX_CODE)];


extern const unsigned char rtx_code_size[((int) LAST_AND_UNUSED_RTX_CODE)];
extern const unsigned char rtx_next[((int) LAST_AND_UNUSED_RTX_CODE)];



typedef struct
{

  unsigned min_align: 8;

  unsigned base_after_vec: 1;
  unsigned min_after_vec: 1;

  unsigned max_after_vec: 1;

  unsigned min_after_base: 1;

  unsigned max_after_base: 1;


  unsigned offset_unsigned: 1;
  unsigned : 2;
  unsigned scale : 8;
} addr_diff_vec_flags;
# 142 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
typedef struct mem_attrs
{
  tree expr;
  rtx offset;
  rtx size;
  alias_set_type alias;
  unsigned int align;
} mem_attrs;
# 158 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
typedef struct reg_attrs
{
  tree decl;
  long offset;
} reg_attrs;



union rtunion_def
{
  int rt_int;
  unsigned int rt_uint;
  const char *rt_str;
  rtx rt_rtx;
  rtvec rt_rtvec;
  enum machine_mode rt_type;
  addr_diff_vec_flags rt_addr_diff_vec_flags;
  struct cselib_val_struct *rt_cselib;
  struct bitmap_head_def *rt_bit;
  tree rt_tree;
  struct basic_block_def *rt_bb;
  mem_attrs *rt_mem;
  reg_attrs *rt_reg;
  struct constant_descriptor_rtx *rt_constant;
};
typedef union rtunion_def rtunion;




struct block_symbol {

  rtunion fld[3];


  struct object_block *block;



  long offset;
};

static __inline__ void VEC_rtx_must_be_pointer_type (void) { (void)((rtx)1 == (void *)1); } typedef struct VEC_rtx_base { unsigned num; unsigned alloc; rtx vec[1]; } VEC_rtx_base; typedef struct VEC_rtx_none { VEC_rtx_base base; } VEC_rtx_none; static __inline__ unsigned VEC_rtx_base_length (const VEC_rtx_base *vec_) { return vec_ ? vec_->num : 0; } static __inline__ rtx VEC_rtx_base_last (const VEC_rtx_base *vec_ ) { (void)(vec_ && vec_->num); return vec_->vec[vec_->num - 1]; } static __inline__ rtx VEC_rtx_base_index (const VEC_rtx_base *vec_, unsigned ix_ ) { (void)(vec_ && ix_ < vec_->num); return vec_->vec[ix_]; } static __inline__ int VEC_rtx_base_iterate (const VEC_rtx_base *vec_, unsigned ix_, rtx *ptr) { if (vec_ && ix_ < vec_->num) { *ptr = vec_->vec[ix_]; return 1; } else { *ptr = 0; return 0; } } static __inline__ size_t VEC_rtx_base_embedded_size (int alloc_) { return __builtin_offsetof (VEC_rtx_base, vec) + alloc_ * sizeof(rtx); } static __inline__ void VEC_rtx_base_embedded_init (VEC_rtx_base *vec_, int alloc_) { vec_->num = 0; vec_->alloc = alloc_; } static __inline__ int VEC_rtx_base_space (VEC_rtx_base *vec_, int alloc_ ) { (void)(alloc_ >= 0); return vec_ ? vec_->alloc - vec_->num >= (unsigned)alloc_ : !alloc_; } static __inline__ rtx *VEC_rtx_base_quick_push (VEC_rtx_base *vec_, rtx obj_ ) { rtx *slot_; (void)(vec_->num < vec_->alloc); slot_ = &vec_->vec[vec_->num++]; *slot_ = obj_; return slot_; } static __inline__ rtx VEC_rtx_base_pop (VEC_rtx_base *vec_ ) { rtx obj_; (void)(vec_->num); obj_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_rtx_base_truncate (VEC_rtx_base *vec_, unsigned size_ ) { (void)(vec_ ? vec_->num >= size_ : !size_); if (vec_) vec_->num = size_; } static __inline__ rtx VEC_rtx_base_replace (VEC_rtx_base *vec_, unsigned ix_, rtx obj_ ) { rtx old_obj_; (void)(ix_ < vec_->num); old_obj_ = vec_->vec[ix_]; vec_->vec[ix_] = obj_; return old_obj_; } static __inline__ rtx *VEC_rtx_base_quick_insert (VEC_rtx_base *vec_, unsigned ix_, rtx obj_ ) { rtx *slot_; (void)(vec_->num < vec_->alloc); (void)(ix_ <= vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_ + 1, slot_, (vec_->num++ - ix_) * sizeof (rtx)); *slot_ = obj_; return slot_; } static __inline__ rtx VEC_rtx_base_ordered_remove (VEC_rtx_base *vec_, unsigned ix_ ) { rtx *slot_; rtx obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; memmove (slot_, slot_ + 1, (--vec_->num - ix_) * sizeof (rtx)); return obj_; } static __inline__ rtx VEC_rtx_base_unordered_remove (VEC_rtx_base *vec_, unsigned ix_ ) { rtx *slot_; rtx obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; *slot_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_rtx_base_block_remove (VEC_rtx_base *vec_, unsigned ix_, unsigned len_ ) { rtx *slot_; (void)(ix_ + len_ <= vec_->num); slot_ = &vec_->vec[ix_]; vec_->num -= len_; memmove (slot_, slot_ + len_, (vec_->num - ix_) * sizeof (rtx)); } static __inline__ rtx *VEC_rtx_base_address (VEC_rtx_base *vec_) { return vec_ ? vec_->vec : 0; } static __inline__ unsigned VEC_rtx_base_lower_bound (VEC_rtx_base *vec_, const rtx obj_, unsigned char (*lessthan_)(const rtx, const rtx) ) { unsigned int len_ = VEC_rtx_base_length (vec_); unsigned int half_, middle_; unsigned int first_ = 0; while (len_ > 0) { rtx middle_elem_; half_ = len_ >> 1; middle_ = first_; middle_ += half_; middle_elem_ = VEC_rtx_base_index (vec_, middle_ ); if (lessthan_ (middle_elem_, obj_)) { first_ = middle_; ++first_; len_ = len_ - half_ - 1; } else len_ = half_; } return first_; } struct vec_swallow_trailing_semi;
typedef struct VEC_rtx_heap { VEC_rtx_base base; } VEC_rtx_heap; static __inline__ VEC_rtx_heap *VEC_rtx_heap_alloc (int alloc_ ) { return (VEC_rtx_heap *) vec_heap_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_rtx_heap_free (VEC_rtx_heap **vec_) { if (*vec_) free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_rtx_heap *VEC_rtx_heap_copy (VEC_rtx_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_rtx_heap *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_rtx_heap *)(vec_heap_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (rtx) * len_); } return new_vec_; } static __inline__ int VEC_rtx_heap_reserve (VEC_rtx_heap **vec_, int alloc_ ) { int extend = !VEC_rtx_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_rtx_heap *) vec_heap_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_rtx_heap_reserve_exact (VEC_rtx_heap **vec_, int alloc_ ) { int extend = !VEC_rtx_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_rtx_heap *) vec_heap_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_rtx_heap_safe_grow (VEC_rtx_heap **vec_, int size_ ) { (void)(size_ >= 0 && VEC_rtx_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_rtx_heap_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_rtx_heap_safe_grow_cleared (VEC_rtx_heap **vec_, int size_ ) { int oldsize = VEC_rtx_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_rtx_heap_safe_grow (vec_, size_ ); memset (&(VEC_rtx_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (rtx) * (size_ - oldsize)); } static __inline__ rtx *VEC_rtx_heap_safe_push (VEC_rtx_heap **vec_, rtx obj_ ) { VEC_rtx_heap_reserve (vec_, 1 ); return VEC_rtx_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ rtx *VEC_rtx_heap_safe_insert (VEC_rtx_heap **vec_, unsigned ix_, rtx obj_ ) { VEC_rtx_heap_reserve (vec_, 1 ); return VEC_rtx_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;
typedef struct VEC_rtx_gc { VEC_rtx_base base; } VEC_rtx_gc; static __inline__ VEC_rtx_gc *VEC_rtx_gc_alloc (int alloc_ ) { return (VEC_rtx_gc *) vec_gc_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_rtx_gc_free (VEC_rtx_gc **vec_) { if (*vec_) ggc_free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_rtx_gc *VEC_rtx_gc_copy (VEC_rtx_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_rtx_gc *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_rtx_gc *)(vec_gc_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (rtx) * len_); } return new_vec_; } static __inline__ int VEC_rtx_gc_reserve (VEC_rtx_gc **vec_, int alloc_ ) { int extend = !VEC_rtx_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_rtx_gc *) vec_gc_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_rtx_gc_reserve_exact (VEC_rtx_gc **vec_, int alloc_ ) { int extend = !VEC_rtx_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_rtx_gc *) vec_gc_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_rtx_gc_safe_grow (VEC_rtx_gc **vec_, int size_ ) { (void)(size_ >= 0 && VEC_rtx_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_rtx_gc_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_rtx_gc_safe_grow_cleared (VEC_rtx_gc **vec_, int size_ ) { int oldsize = VEC_rtx_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_rtx_gc_safe_grow (vec_, size_ ); memset (&(VEC_rtx_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (rtx) * (size_ - oldsize)); } static __inline__ rtx *VEC_rtx_gc_safe_push (VEC_rtx_gc **vec_, rtx obj_ ) { VEC_rtx_gc_reserve (vec_, 1 ); return VEC_rtx_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ rtx *VEC_rtx_gc_safe_insert (VEC_rtx_gc **vec_, unsigned ix_, rtx obj_ ) { VEC_rtx_gc_reserve (vec_, 1 ); return VEC_rtx_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;



struct object_block
{

  section *sect;


  unsigned int alignment;


  long size;
# 225 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
  VEC_rtx_gc *objects;
# 235 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
  VEC_rtx_gc *anchors;
};



struct rtx_def

{

  __extension__ enum rtx_code code: 16;


  __extension__ enum machine_mode mode : 8;






  unsigned int jump : 1;




  unsigned int call : 1;
# 268 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
  unsigned int unchanging : 1;
# 278 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
  unsigned int volatil : 1;
# 292 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
  unsigned int in_struct : 1;






  unsigned int used : 1;






  unsigned frame_related : 1;




  unsigned return_val : 1;




  union u {
    rtunion fld[1];
    long hwint[1];
    struct block_symbol block_sym;
    struct real_value rv;
    struct fixed_value fv;
  } u;
};
# 360 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
struct rtvec_def {
  int num_elem;
  rtx elem[1];
};
# 821 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
enum reg_note
{

# 1 "/home/mzorgati/gcc-4.4.0/gcc/reg-notes.def" 1
# 32 "/home/mzorgati/gcc-4.4.0/gcc/reg-notes.def"
REG_DEP_TRUE,




REG_DEAD,


REG_INC,
# 51 "/home/mzorgati/gcc-4.4.0/gcc/reg-notes.def"
REG_EQUIV,




REG_EQUAL,






REG_NONNEG,


REG_UNUSED,
# 75 "/home/mzorgati/gcc-4.4.0/gcc/reg-notes.def"
REG_CC_SETTER,
REG_CC_USER,




REG_LABEL_TARGET,





REG_LABEL_OPERAND,




REG_DEP_OUTPUT,
REG_DEP_ANTI,





REG_BR_PROB,




REG_VALUE_PROFILE,



REG_NOALIAS,





REG_BR_PRED,




REG_FRAME_RELATED_EXPR,




REG_EH_CONTEXT,





REG_EH_REGION,


REG_SAVE_NOTE,


REG_NORETURN,



REG_NON_LOCAL_GOTO,




REG_CROSSING_JUMP,



REG_SETJMP,
# 825 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2

  REG_NOTE_MAX
};
# 836 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
extern const char * const reg_note_name[];
# 892 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
enum var_init_status
{
  VAR_INIT_STATUS_UNKNOWN,
  VAR_INIT_STATUS_UNINITIALIZED,
  VAR_INIT_STATUS_INITIALIZED
};
# 908 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
enum insn_note
{

# 1 "/home/mzorgati/gcc-4.4.0/gcc/insn-notes.def" 1
# 35 "/home/mzorgati/gcc-4.4.0/gcc/insn-notes.def"
NOTE_INSN_DELETED,


NOTE_INSN_DELETED_LABEL,



NOTE_INSN_BLOCK_BEG,
NOTE_INSN_BLOCK_END,




NOTE_INSN_FUNCTION_BEG,


NOTE_INSN_PROLOGUE_END,


NOTE_INSN_EPILOGUE_BEG,



NOTE_INSN_EH_REGION_BEG,
NOTE_INSN_EH_REGION_END,


NOTE_INSN_VAR_LOCATION,




NOTE_INSN_BASIC_BLOCK,



NOTE_INSN_SWITCH_TEXT_SECTIONS,
# 912 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2


  NOTE_INSN_MAX
};



extern const char * const note_insn_name[NOTE_INSN_MAX];
# 934 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
enum label_kind
{
  LABEL_NORMAL = 0,
  LABEL_STATIC_ENTRY,
  LABEL_GLOBAL_ENTRY,
  LABEL_WEAK_ENTRY
};
# 1002 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
static __inline__ unsigned int
rhs_regno (const_rtx x)
{
  return (((x)->u.fld[0]).rt_uint);
}
# 1076 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
extern void init_rtlanal (void);
extern int rtx_cost (rtx, enum rtx_code, unsigned char);
extern int address_cost (rtx, enum machine_mode, unsigned char);
extern unsigned int subreg_lsb (const_rtx);
extern unsigned int subreg_lsb_1 (enum machine_mode, enum machine_mode,
      unsigned int);
extern unsigned int subreg_regno_offset (unsigned int, enum machine_mode,
      unsigned int, enum machine_mode);
extern unsigned char subreg_offset_representable_p (unsigned int, enum machine_mode,
        unsigned int, enum machine_mode);
extern unsigned int subreg_regno (const_rtx);
extern int simplify_subreg_regno (unsigned int, enum machine_mode,
      unsigned int, enum machine_mode);
extern unsigned int subreg_nregs (const_rtx);
extern unsigned int subreg_nregs_with_regno (unsigned int, const_rtx);
extern unsigned long nonzero_bits (const_rtx, enum machine_mode);
extern unsigned int num_sign_bit_copies (const_rtx, enum machine_mode);
extern unsigned char constant_pool_constant_p (rtx);
extern unsigned char truncated_to_mode (enum machine_mode, const_rtx);
# 1473 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
extern int generating_concat_p;


extern int currently_expanding_to_rtl;




extern int ceil_log2 (unsigned long);


extern void set_stack_check_libfunc (rtx);
extern long trunc_int_for_mode (long, enum machine_mode);
extern rtx plus_constant (rtx, long);


extern rtx gen_blockage (void);
extern rtvec gen_rtvec (int, ...);
extern rtx copy_insn_1 (rtx);
extern rtx copy_insn (rtx);
extern rtx gen_int_mode (long, enum machine_mode);
extern rtx emit_copy_of_insn_after (rtx, rtx);
extern void set_reg_attrs_from_value (rtx, rtx);
extern void set_mem_attrs_from_reg (rtx, rtx);
extern void set_reg_attrs_for_parm (rtx, rtx);
extern void adjust_reg_mode (rtx, enum machine_mode);
extern int mem_expr_equal_p (const_tree, const_tree);


extern rtx rtx_alloc_stat (enum rtx_code );


extern rtvec rtvec_alloc (int);
extern unsigned char shared_const_p (const_rtx);
extern rtx copy_rtx (rtx);
extern void dump_rtx_statistics (void);


extern rtx copy_rtx_if_shared (rtx);


extern unsigned int rtx_size (const_rtx);
extern rtx shallow_copy_rtx_stat (const_rtx );

extern int rtx_equal_p (const_rtx, const_rtx);


extern rtvec gen_rtvec_v (int, rtx *);
extern rtx gen_reg_rtx (enum machine_mode);
extern rtx gen_rtx_REG_offset (rtx, enum machine_mode, unsigned int, int);
extern rtx gen_reg_rtx_offset (rtx, enum machine_mode, int);
extern rtx gen_reg_rtx_and_attrs (rtx);
extern rtx gen_label_rtx (void);
extern rtx gen_lowpart_common (enum machine_mode, rtx);


extern rtx gen_lowpart_if_possible (enum machine_mode, rtx);


extern rtx gen_highpart (enum machine_mode, rtx);
extern rtx gen_highpart_mode (enum machine_mode, enum machine_mode, rtx);
extern rtx operand_subword (rtx, unsigned int, int, enum machine_mode);


extern rtx operand_subword_force (rtx, unsigned int, enum machine_mode);
extern int subreg_lowpart_p (const_rtx);
extern unsigned int subreg_lowpart_offset (enum machine_mode,
        enum machine_mode);
extern unsigned int subreg_highpart_offset (enum machine_mode,
         enum machine_mode);
extern int byte_lowpart_offset (enum machine_mode, enum machine_mode);
extern rtx make_safe_from (rtx, rtx);
extern rtx convert_memory_address (enum machine_mode, rtx);
extern rtx get_insns (void);
extern const char *get_insn_name (int);
extern rtx get_last_insn (void);
extern rtx get_last_insn_anywhere (void);
extern rtx get_first_nonnote_insn (void);
extern rtx get_last_nonnote_insn (void);
extern void start_sequence (void);
extern void push_to_sequence (rtx);
extern void push_to_sequence2 (rtx, rtx);
extern void end_sequence (void);
extern rtx immed_double_const (long, long,
          enum machine_mode);



extern rtx lowpart_subreg (enum machine_mode, rtx, enum machine_mode);


extern rtx force_const_mem (enum machine_mode, rtx);



struct function;
extern rtx get_pool_constant (rtx);
extern rtx get_pool_constant_mark (rtx, unsigned char *);
extern enum machine_mode get_pool_mode (const_rtx);
extern rtx simplify_subtraction (rtx);


extern rtx assign_stack_local (enum machine_mode, long, int);
extern rtx assign_stack_local_1 (enum machine_mode, long, int, unsigned char);
extern rtx assign_stack_temp (enum machine_mode, long, int);
extern rtx assign_stack_temp_for_type (enum machine_mode,
           long, int, tree);
extern rtx assign_temp (tree, int, int, int);


extern rtx emit_insn_before (rtx, rtx);
extern rtx emit_insn_before_noloc (rtx, rtx, struct basic_block_def *);
extern rtx emit_insn_before_setloc (rtx, rtx, int);
extern rtx emit_jump_insn_before (rtx, rtx);
extern rtx emit_jump_insn_before_noloc (rtx, rtx);
extern rtx emit_jump_insn_before_setloc (rtx, rtx, int);
extern rtx emit_call_insn_before (rtx, rtx);
extern rtx emit_call_insn_before_noloc (rtx, rtx);
extern rtx emit_call_insn_before_setloc (rtx, rtx, int);
extern rtx emit_barrier_before (rtx);
extern rtx emit_label_before (rtx, rtx);
extern rtx emit_note_before (enum insn_note, rtx);
extern rtx emit_insn_after (rtx, rtx);
extern rtx emit_insn_after_noloc (rtx, rtx, struct basic_block_def *);
extern rtx emit_insn_after_setloc (rtx, rtx, int);
extern rtx emit_jump_insn_after (rtx, rtx);
extern rtx emit_jump_insn_after_noloc (rtx, rtx);
extern rtx emit_jump_insn_after_setloc (rtx, rtx, int);
extern rtx emit_call_insn_after (rtx, rtx);
extern rtx emit_call_insn_after_noloc (rtx, rtx);
extern rtx emit_call_insn_after_setloc (rtx, rtx, int);
extern rtx emit_barrier_after (rtx);
extern rtx emit_label_after (rtx, rtx);
extern rtx emit_note_after (enum insn_note, rtx);
extern rtx emit_insn (rtx);
extern rtx emit_jump_insn (rtx);
extern rtx emit_call_insn (rtx);
extern rtx emit_label (rtx);
extern rtx emit_barrier (void);
extern rtx emit_note (enum insn_note);
extern rtx emit_note_copy (rtx);
extern rtx gen_clobber (rtx);
extern rtx emit_clobber (rtx);
extern rtx gen_use (rtx);
extern rtx emit_use (rtx);
extern rtx make_insn_raw (rtx);
extern rtx make_jump_insn_raw (rtx);
extern void add_function_usage_to (rtx, rtx);
extern rtx last_call_insn (void);
extern rtx previous_insn (rtx);
extern rtx next_insn (rtx);
extern rtx prev_nonnote_insn (rtx);
extern rtx next_nonnote_insn (rtx);
extern rtx prev_real_insn (rtx);
extern rtx next_real_insn (rtx);
extern rtx prev_active_insn (rtx);
extern rtx next_active_insn (rtx);
extern int active_insn_p (const_rtx);
extern rtx prev_label (rtx);
extern rtx next_label (rtx);
extern rtx skip_consecutive_labels (rtx);
extern rtx next_cc0_user (rtx);
extern rtx prev_cc0_setter (rtx);


extern int insn_line (const_rtx);
extern const char * insn_file (const_rtx);
extern location_t locator_location (int);
extern int locator_line (int);
extern const char * locator_file (int);
extern unsigned char locator_eq (int, int);
extern int prologue_locator, epilogue_locator;


extern enum rtx_code reverse_condition (enum rtx_code);
extern enum rtx_code reverse_condition_maybe_unordered (enum rtx_code);
extern enum rtx_code swap_condition (enum rtx_code);
extern enum rtx_code unsigned_condition (enum rtx_code);
extern enum rtx_code signed_condition (enum rtx_code);
extern void mark_jump_label (rtx, rtx, int);
extern unsigned int cleanup_barriers (void);


extern rtx delete_related_insns (rtx);


extern rtx *find_constant_term_loc (rtx *);


extern rtx try_split (rtx, rtx, int);
extern int split_branch_probability;


extern rtx split_insns (rtx, rtx);


extern rtx simplify_const_unary_operation (enum rtx_code, enum machine_mode,
        rtx, enum machine_mode);
extern rtx simplify_unary_operation (enum rtx_code, enum machine_mode, rtx,
         enum machine_mode);
extern rtx simplify_const_binary_operation (enum rtx_code, enum machine_mode,
         rtx, rtx);
extern rtx simplify_binary_operation (enum rtx_code, enum machine_mode, rtx,
          rtx);
extern rtx simplify_ternary_operation (enum rtx_code, enum machine_mode,
           enum machine_mode, rtx, rtx, rtx);
extern rtx simplify_const_relational_operation (enum rtx_code,
      enum machine_mode, rtx, rtx);
extern rtx simplify_relational_operation (enum rtx_code, enum machine_mode,
       enum machine_mode, rtx, rtx);
extern rtx simplify_gen_binary (enum rtx_code, enum machine_mode, rtx, rtx);
extern rtx simplify_gen_unary (enum rtx_code, enum machine_mode, rtx,
          enum machine_mode);
extern rtx simplify_gen_ternary (enum rtx_code, enum machine_mode,
     enum machine_mode, rtx, rtx, rtx);
extern rtx simplify_gen_relational (enum rtx_code, enum machine_mode,
        enum machine_mode, rtx, rtx);
extern rtx simplify_subreg (enum machine_mode, rtx, enum machine_mode,
       unsigned int);
extern rtx simplify_gen_subreg (enum machine_mode, rtx, enum machine_mode,
    unsigned int);
extern rtx simplify_replace_rtx (rtx, const_rtx, rtx);
extern rtx simplify_rtx (const_rtx);
extern rtx avoid_constant_pool_reference (rtx);
extern unsigned char mode_signbit_p (enum machine_mode, const_rtx);


extern enum machine_mode choose_hard_reg_mode (unsigned int, unsigned int,
            unsigned char);


extern rtx set_unique_reg_note (rtx, enum reg_note, rtx);
extern void set_insn_deleted (rtx);
# 1717 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
typedef struct replace_label_data
{
  rtx r1;
  rtx r2;
  unsigned char update_label_nuses;
} replace_label_data;

extern int rtx_addr_can_trap_p (const_rtx);
extern unsigned char nonzero_address_p (const_rtx);
extern int rtx_unstable_p (const_rtx);
extern unsigned char rtx_varies_p (const_rtx, unsigned char);
extern unsigned char rtx_addr_varies_p (const_rtx, unsigned char);
extern long get_integer_term (const_rtx);
extern rtx get_related_value (const_rtx);
extern unsigned char offset_within_block_p (const_rtx, long);

extern int reg_mentioned_p (const_rtx, const_rtx);
extern int count_occurrences (const_rtx, const_rtx, int);
extern int reg_referenced_p (const_rtx, const_rtx);
extern int reg_used_between_p (const_rtx, const_rtx, const_rtx);
extern int reg_set_between_p (const_rtx, const_rtx, const_rtx);
extern int commutative_operand_precedence (rtx);
extern unsigned char swap_commutative_operands_p (rtx, rtx);
extern int modified_between_p (const_rtx, const_rtx, const_rtx);
extern int no_labels_between_p (const_rtx, const_rtx);
extern int modified_in_p (const_rtx, const_rtx);
extern int reg_set_p (const_rtx, const_rtx);
extern rtx single_set_2 (const_rtx, const_rtx);
extern int multiple_sets (const_rtx);
extern int set_noop_p (const_rtx);
extern int noop_move_p (const_rtx);
extern rtx find_last_value (rtx, rtx *, rtx, int);
extern int refers_to_regno_p (unsigned int, unsigned int, const_rtx, rtx *);
extern int reg_overlap_mentioned_p (const_rtx, const_rtx);
extern const_rtx set_of (const_rtx, const_rtx);
extern void note_stores (const_rtx, void (*) (rtx, const_rtx, void *), void *);
extern void note_uses (rtx *, void (*) (rtx *, void *), void *);
extern int dead_or_set_p (const_rtx, const_rtx);
extern int dead_or_set_regno_p (const_rtx, unsigned int);
extern rtx find_reg_note (const_rtx, enum reg_note, const_rtx);
extern rtx find_regno_note (const_rtx, enum reg_note, unsigned int);
extern rtx find_reg_equal_equiv_note (const_rtx);
extern rtx find_constant_src (const_rtx);
extern int find_reg_fusage (const_rtx, enum rtx_code, const_rtx);
extern int find_regno_fusage (const_rtx, enum rtx_code, unsigned int);
extern void add_reg_note (rtx, enum reg_note, rtx);
extern void remove_note (rtx, const_rtx);
extern void remove_reg_equal_equiv_notes (rtx);
extern int side_effects_p (const_rtx);
extern int volatile_refs_p (const_rtx);
extern int volatile_insn_p (const_rtx);
extern int may_trap_p_1 (const_rtx, unsigned);
extern int may_trap_p (const_rtx);
extern int may_trap_or_fault_p (const_rtx);
extern int inequality_comparisons_p (const_rtx);
extern rtx replace_rtx (rtx, rtx, rtx);
extern int replace_label (rtx *, void *);
extern int rtx_referenced_p (rtx, rtx);
extern unsigned char tablejump_p (const_rtx, rtx *, rtx *);
extern int computed_jump_p (const_rtx);

typedef int (*rtx_function) (rtx *, void *);
extern int for_each_rtx (rtx *, rtx_function, void *);

typedef int (*rtx_equal_p_callback_function) (const_rtx *, const_rtx *,
                                              rtx *, rtx *);
extern int rtx_equal_p_cb (const_rtx, const_rtx,
                           rtx_equal_p_callback_function);

typedef int (*hash_rtx_callback_function) (const_rtx, enum machine_mode, rtx *,
                                           enum machine_mode *);
extern unsigned hash_rtx_cb (const_rtx, enum machine_mode, int *, int *,
                             unsigned char, hash_rtx_callback_function);

extern rtx regno_use_in (unsigned int, rtx);
extern int auto_inc_p (const_rtx);
extern int in_expr_list_p (const_rtx, const_rtx);
extern void remove_node_from_expr_list (const_rtx, rtx *);
extern int loc_mentioned_in_p (rtx *, const_rtx);
extern rtx find_first_parameter_load (rtx, rtx);
extern unsigned char keep_with_call_p (const_rtx);
extern unsigned char label_is_jump_target_p (const_rtx, const_rtx);
extern int insn_rtx_cost (rtx, unsigned char);



extern rtx canonicalize_condition (rtx, rtx, int, rtx *, rtx, int, int);



extern rtx get_condition (rtx, rtx *, int, int);



extern void free_EXPR_LIST_list (rtx *);
extern void free_INSN_LIST_list (rtx *);
extern void free_EXPR_LIST_node (rtx);
extern void free_INSN_LIST_node (rtx);
extern rtx alloc_INSN_LIST (rtx, rtx);
extern rtx alloc_EXPR_LIST (int, rtx, rtx);
extern void remove_free_INSN_LIST_elem (rtx, rtx *);
extern rtx remove_list_elem (rtx, rtx *);
extern rtx remove_free_INSN_LIST_node (rtx *);
extern rtx remove_free_EXPR_LIST_node (rtx *);





extern void init_move_cost (enum machine_mode);

extern void allocate_reg_info (void);

extern void resize_reg_info (void);

extern void free_reg_info (void);


extern int asm_noperands (const_rtx);
extern const char *decode_asm_operands (rtx, rtx *, rtx **, const char **,
     enum machine_mode *, location_t *);

extern enum reg_class reg_preferred_class (int);
extern enum reg_class reg_alternate_class (int);
extern void setup_reg_classes (int, enum reg_class, enum reg_class);

extern void split_all_insns (void);
extern unsigned int split_all_insns_noflow (void);


extern rtx const_int_rtx[64 * 2 + 1];





extern rtx const_true_rtx;

extern rtx const_tiny_rtx[3][(int) MAX_MACHINE_MODE];
# 1878 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
enum global_rtl_index
{
  GR_PC,
  GR_CC0,
  GR_STACK_POINTER,
  GR_FRAME_POINTER,




  GR_ARG_POINTER = GR_FRAME_POINTER,


  GR_HARD_FRAME_POINTER = GR_FRAME_POINTER,
# 1902 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
  GR_VIRTUAL_INCOMING_ARGS,
  GR_VIRTUAL_STACK_ARGS,
  GR_VIRTUAL_STACK_DYNAMIC,
  GR_VIRTUAL_OUTGOING_ARGS,
  GR_VIRTUAL_CFA,

  GR_MAX
};


extern rtx global_rtl[GR_MAX];
# 1926 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
extern rtx pic_offset_table_rtx;
extern rtx static_chain_rtx;
extern rtx static_chain_incoming_rtx;
extern rtx return_address_pointer_rtx;




# 1 "/home/mzorgati/gcc_build/gcc/genrtl.h" 1





# 1 "/home/mzorgati/gcc-4.4.0/gcc/statistics.h" 1
# 7 "/home/mzorgati/gcc_build/gcc/genrtl.h" 2

extern rtx gen_rtx_fmt_ee_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0, rtx arg1 );



extern rtx gen_rtx_fmt_ue_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0, rtx arg1 );



extern rtx gen_rtx_fmt_E_stat (enum rtx_code, enum machine_mode mode,
           rtvec arg0 );



extern rtx gen_rtx_fmt_e_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0 );



extern rtx gen_rtx_fmt_iuuBieie_stat (enum rtx_code, enum machine_mode mode,
           int arg0, rtx arg1, rtx arg2,
           struct basic_block_def *arg3,
           int arg4, rtx arg5, int arg6,
           rtx arg7 );



extern rtx gen_rtx_fmt_iuuBieie0_stat (enum rtx_code, enum machine_mode mode,
           int arg0, rtx arg1, rtx arg2,
           struct basic_block_def *arg3,
           int arg4, rtx arg5, int arg6,
           rtx arg7 );



extern rtx gen_rtx_fmt_iuuBieiee_stat (enum rtx_code, enum machine_mode mode,
           int arg0, rtx arg1, rtx arg2,
           struct basic_block_def *arg3,
           int arg4, rtx arg5, int arg6,
           rtx arg7, rtx arg8 );



extern rtx gen_rtx_fmt_iuu00000_stat (enum rtx_code, enum machine_mode mode,
           int arg0, rtx arg1, rtx arg2 );



extern rtx gen_rtx_fmt_iuuB00is_stat (enum rtx_code, enum machine_mode mode,
           int arg0, rtx arg1, rtx arg2,
           struct basic_block_def *arg3,
           int arg4, const char *arg5 );



extern rtx gen_rtx_fmt_si_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, int arg1 );



extern rtx gen_rtx_fmt_ssiEEi_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, const char *arg1,
           int arg2, rtvec arg3, rtvec arg4,
           int arg5 );



extern rtx gen_rtx_fmt_Ei_stat (enum rtx_code, enum machine_mode mode,
           rtvec arg0, int arg1 );



extern rtx gen_rtx_fmt_eEee0_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0, rtvec arg1, rtx arg2,
           rtx arg3 );



extern rtx gen_rtx_fmt_eee_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0, rtx arg1, rtx arg2 );



extern rtx gen_rtx_fmt__stat (enum rtx_code, enum machine_mode mode );



extern rtx gen_rtx_fmt_i_stat (enum rtx_code, enum machine_mode mode,
           int arg0 );



extern rtx gen_rtx_fmt_w_stat (enum rtx_code, enum machine_mode mode,
           long arg0 );



extern rtx gen_rtx_fmt_www_stat (enum rtx_code, enum machine_mode mode,
           long arg0,
           long arg1,
           long arg2 );



extern rtx gen_rtx_fmt_s_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0 );



extern rtx gen_rtx_fmt_0_stat (enum rtx_code, enum machine_mode mode );



extern rtx gen_rtx_fmt_i00_stat (enum rtx_code, enum machine_mode mode,
           int arg0 );



extern rtx gen_rtx_fmt_ei_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0, int arg1 );



extern rtx gen_rtx_fmt_e0_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0 );



extern rtx gen_rtx_fmt_u_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0 );



extern rtx gen_rtx_fmt_s00_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0 );



extern rtx gen_rtx_fmt_tei_stat (enum rtx_code, enum machine_mode mode,
           union tree_node *arg0, rtx arg1,
           int arg2 );



extern rtx gen_rtx_fmt_iss_stat (enum rtx_code, enum machine_mode mode,
           int arg0, const char *arg1,
           const char *arg2 );



extern rtx gen_rtx_fmt_is_stat (enum rtx_code, enum machine_mode mode,
           int arg0, const char *arg1 );



extern rtx gen_rtx_fmt_isE_stat (enum rtx_code, enum machine_mode mode,
           int arg0, const char *arg1,
           rtvec arg2 );



extern rtx gen_rtx_fmt_iE_stat (enum rtx_code, enum machine_mode mode,
           int arg0, rtvec arg1 );



extern rtx gen_rtx_fmt_ss_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, const char *arg1 );



extern rtx gen_rtx_fmt_sEss_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, rtvec arg1,
           const char *arg2, const char *arg3 );



extern rtx gen_rtx_fmt_eE_stat (enum rtx_code, enum machine_mode mode,
           rtx arg0, rtvec arg1 );



extern rtx gen_rtx_fmt_Ess_stat (enum rtx_code, enum machine_mode mode,
           rtvec arg0, const char *arg1,
           const char *arg2 );



extern rtx gen_rtx_fmt_ses_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, rtx arg1,
           const char *arg2 );



extern rtx gen_rtx_fmt_sss_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, const char *arg1,
           const char *arg2 );



extern rtx gen_rtx_fmt_sse_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, const char *arg1,
           rtx arg2 );



extern rtx gen_rtx_fmt_sies_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, int arg1,
           rtx arg2, const char *arg3 );



extern rtx gen_rtx_fmt_sE_stat (enum rtx_code, enum machine_mode mode,
           const char *arg0, rtvec arg1 );



extern rtx gen_rtx_fmt_ii_stat (enum rtx_code, enum machine_mode mode,
           int arg0, int arg1 );



extern rtx gen_rtx_fmt_Ee_stat (enum rtx_code, enum machine_mode mode,
           rtvec arg0, rtx arg1 );
# 1935 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 2
# 1946 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
extern rtx gen_rtx_CONST_INT (enum machine_mode, long);
extern rtx gen_rtx_CONST_VECTOR (enum machine_mode, rtvec);
extern rtx gen_raw_REG (enum machine_mode, int);
extern rtx gen_rtx_REG (enum machine_mode, unsigned);
extern rtx gen_rtx_SUBREG (enum machine_mode, rtx, int);
extern rtx gen_rtx_MEM (enum machine_mode, rtx);
# 2019 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
extern rtx output_constant_def (tree, int);
extern rtx lookup_constant_def (tree);




extern int reload_completed;


extern int epilogue_completed;




extern int reload_in_progress;
# 2052 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h"
extern int cse_not_expected;





extern int rtx_to_tree_code (enum rtx_code);


extern int delete_trivially_dead_insns (rtx, int);
extern int cse_main (rtx, int);
extern int exp_equiv_p (const_rtx, const_rtx, int, unsigned char);
extern unsigned hash_rtx (const_rtx x, enum machine_mode, int *, int *, unsigned char);


extern int comparison_dominates_p (enum rtx_code, enum rtx_code);
extern int condjump_p (const_rtx);
extern int any_condjump_p (const_rtx);
extern int any_uncondjump_p (const_rtx);
extern rtx pc_set (const_rtx);
extern rtx condjump_label (const_rtx);
extern int simplejump_p (const_rtx);
extern int returnjump_p (rtx);
extern int onlyjump_p (const_rtx);
extern int only_sets_cc0_p (const_rtx);
extern int sets_cc0_p (const_rtx);
extern int invert_jump_1 (rtx, rtx);
extern int invert_jump (rtx, rtx, int);
extern int rtx_renumbered_equal_p (const_rtx, const_rtx);
extern int true_regnum (const_rtx);
extern unsigned int reg_or_subregno (const_rtx);
extern int redirect_jump_1 (rtx, rtx);
extern void redirect_jump_2 (rtx, rtx, rtx, int, int);
extern int redirect_jump (rtx, rtx, int);
extern void rebuild_jump_labels (rtx);
extern rtx reversed_comparison (const_rtx, enum machine_mode);
extern enum rtx_code reversed_comparison_code (const_rtx, const_rtx);
extern enum rtx_code reversed_comparison_code_parts (enum rtx_code, const_rtx,
           const_rtx, const_rtx);
extern void delete_for_peephole (rtx, rtx);
extern int condjump_in_parallel_p (const_rtx);


extern int max_reg_num (void);
extern int max_label_num (void);
extern int get_first_label_num (void);
extern void maybe_set_first_label_num (rtx);
extern void delete_insns_since (rtx);
extern void mark_reg_pointer (rtx, int);
extern void mark_user_reg (rtx);
extern void reset_used_flags (rtx);
extern void set_used_flags (rtx);
extern void reorder_insns (rtx, rtx, rtx);
extern void reorder_insns_nobb (rtx, rtx, rtx);
extern int get_max_uid (void);
extern int in_sequence_p (void);
extern void force_next_line_note (void);
extern void init_emit (void);
extern void init_emit_regs (void);
extern void init_emit_once (int);
extern void push_topmost_sequence (void);
extern void pop_topmost_sequence (void);
extern void set_new_first_and_last_insn (rtx, rtx);
extern unsigned int unshare_all_rtl (void);
extern void unshare_all_rtl_again (rtx);
extern void unshare_all_rtl_in_chain (rtx);
extern void verify_rtl_sharing (void);
extern void set_first_insn (rtx);
extern void set_last_insn (rtx);
extern void link_cc0_insns (rtx);
extern void add_insn (rtx);
extern void add_insn_before (rtx, rtx, struct basic_block_def *);
extern void add_insn_after (rtx, rtx, struct basic_block_def *);
extern void remove_insn (rtx);
extern rtx emit (rtx);
extern rtx delete_insn (rtx);
extern rtx entry_of_function (void);
extern void emit_insn_at_entry (rtx);
extern void delete_insn_chain (rtx, rtx, unsigned char);
extern rtx unlink_insn_chain (rtx, rtx);
extern rtx delete_insn_and_edges (rtx);
extern void delete_insn_chain_and_edges (rtx, rtx);
extern rtx gen_lowpart_SUBREG (enum machine_mode, rtx);
extern rtx gen_const_mem (enum machine_mode, rtx);
extern rtx gen_frame_mem (enum machine_mode, rtx);
extern rtx gen_tmp_stack_mem (enum machine_mode, rtx);
extern unsigned char validate_subreg (enum machine_mode, enum machine_mode,
        const_rtx, unsigned int);


extern unsigned int extended_count (const_rtx, enum machine_mode, int);
extern rtx remove_death (unsigned int, rtx);
extern void dump_combine_stats (FILE *);
extern void dump_combine_total_stats (FILE *);


extern void delete_dead_jumptables (void);


extern void debug_bb_n_slim (int);
extern void debug_bb_slim (struct basic_block_def *);
extern void print_rtl_slim (FILE *, rtx, rtx, int, int);
extern void print_rtl_slim_with_bb (FILE *, rtx, int);
extern void dump_insn_slim (FILE *f, rtx x);
extern void debug_insn_slim (rtx x);


extern void schedule_insns (void);


extern void schedule_ebbs (void);


extern void fix_sched_param (const char *, const char *);


extern void sel_sched_fix_param (const char *param, const char *val);


extern const char *print_rtx_head;
extern void debug_rtx (const_rtx);
extern void debug_rtx_list (const_rtx, int);
extern void debug_rtx_range (const_rtx, const_rtx);
extern const_rtx debug_rtx_find (const_rtx, int);
extern void print_mem_expr (FILE *, const_tree);
extern void print_rtl (FILE *, const_rtx);
extern void print_simple_rtl (FILE *, const_rtx);
extern int print_rtl_single (FILE *, const_rtx);
extern void print_inline_rtx (FILE *, const_rtx, int);


extern void reposition_prologue_and_epilogue_notes (void);
extern int prologue_epilogue_contains (const_rtx);
extern int sibcall_epilogue_contains (const_rtx);
extern void mark_temp_addr_taken (rtx);
extern void update_temp_slot_address (rtx, rtx);


extern void expand_null_return (void);
extern void expand_naked_return (void);
extern void emit_jump (rtx);


extern rtx move_by_pieces (rtx, rtx, unsigned long,
      unsigned int, int);


extern void print_rtl_with_bb (FILE *, const_rtx);


extern void dump_reg_info (FILE *);
extern void dump_flow_info (FILE *, int);


extern void init_expmed (void);
extern void expand_inc (rtx, rtx);
extern void expand_dec (rtx, rtx);


extern unsigned char can_copy_p (enum machine_mode);
extern rtx fis_get_condition (rtx);





extern void mark_elimination (int, int);


extern int reg_classes_intersect_p (enum reg_class, enum reg_class);
extern int reg_class_subset_p (enum reg_class, enum reg_class);
extern void globalize_reg (int);
extern void init_reg_modes_target (void);
extern void init_regs (void);
extern void reinit_regs (void);
extern void init_fake_stack_mems (void);
extern void save_register_info (void);
extern void init_reg_sets (void);
extern void regclass (rtx, int);
extern void reg_scan (rtx, unsigned int);
extern void fix_register (const char *, int, int);




extern unsigned char invalid_mode_change_p (unsigned int, enum reg_class,
       enum machine_mode);


extern void dbr_schedule (rtx);


extern int function_invariant_p (const_rtx);


enum libcall_type
{
  LCT_NORMAL = 0,
  LCT_CONST = 1,
  LCT_PURE = 2,
  LCT_NORETURN = 3,
  LCT_THROW = 4,
  LCT_RETURNS_TWICE = 5
};

extern void emit_library_call (rtx, enum libcall_type, enum machine_mode, int,
          ...);
extern rtx emit_library_call_value (rtx, rtx, enum libcall_type,
        enum machine_mode, int, ...);


extern void init_varasm_once (void);
extern enum tls_model decl_default_tls_model (const_tree);


extern void traverse_md_constants (int (*) (void **, void *), void *);
struct md_constant { char *name, *value; };


extern int read_skip_spaces (FILE *);
extern unsigned char read_rtx (FILE *, rtx *, int *);
extern void copy_rtx_ptr_loc (const void *, const void *);
extern void print_rtx_ptr_loc (const void *);
extern const char *join_c_conditions (const char *, const char *);
extern void print_c_condition (const char *);
extern const char *read_rtx_filename;
extern int read_rtx_lineno;


extern rtx canon_rtx (rtx);
extern int true_dependence (const_rtx, enum machine_mode, const_rtx, unsigned char (*)(const_rtx, unsigned char));
extern rtx get_addr (rtx);
extern int canon_true_dependence (const_rtx, enum machine_mode, rtx, const_rtx,
      unsigned char (*)(const_rtx, unsigned char));
extern int read_dependence (const_rtx, const_rtx);
extern int anti_dependence (const_rtx, const_rtx);
extern int output_dependence (const_rtx, const_rtx);
extern void init_alias_target (void);
extern void init_alias_analysis (void);
extern void end_alias_analysis (void);
extern unsigned char memory_modified_in_insn_p (const_rtx, const_rtx);
extern rtx find_base_term (rtx);
extern rtx gen_hard_reg_clobber (enum machine_mode, unsigned int);
extern rtx get_reg_known_value (unsigned int);
extern unsigned char get_reg_known_equiv_p (unsigned int);






extern rtx stack_limit_rtx;


extern void invert_br_probabilities (rtx);
extern unsigned char expensive_function_p (int);

extern void add_reg_br_prob_note (rtx last, int probability);


extern unsigned int variable_tracking_main (void);


extern void get_mode_bounds (enum machine_mode, int, enum machine_mode,
        rtx *, rtx *);


extern rtx reversed_condition (rtx);
extern rtx compare_and_jump_seq (rtx, rtx, enum rtx_code, rtx, int, rtx);


extern rtx canon_condition (rtx);
extern void simplify_using_condition (rtx, rtx *, struct bitmap_head_def *);


extern unsigned int compute_alignments (void);

struct rtl_hooks
{
  rtx (*gen_lowpart) (enum machine_mode, rtx);
  rtx (*gen_lowpart_no_emit) (enum machine_mode, rtx);
  rtx (*reg_nonzero_bits) (const_rtx, enum machine_mode, const_rtx, enum machine_mode,
      unsigned long, unsigned long *);
  rtx (*reg_num_sign_bit_copies) (const_rtx, enum machine_mode, const_rtx, enum machine_mode,
      unsigned int, unsigned int *);
  unsigned char (*reg_truncated_to_mode) (enum machine_mode, const_rtx);


};


extern struct rtl_hooks rtl_hooks;


extern const struct rtl_hooks general_rtl_hooks;




extern void insn_locators_alloc (void);
extern void insn_locators_free (void);
extern void insn_locators_finalize (void);
extern void set_curr_insn_source_location (location_t);
extern void set_curr_insn_block (tree);
extern int curr_insn_locator (void);
extern unsigned char optimize_insn_for_size_p (void);
extern unsigned char optimize_insn_for_speed_p (void);
# 47 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
# 1 "/home/mzorgati/gcc-4.4.0/include/hashtab.h" 1
# 46 "/home/mzorgati/gcc-4.4.0/include/hashtab.h"
typedef unsigned int hashval_t;




typedef hashval_t (*htab_hash) (const void *);






typedef int (*htab_eq) (const void *, const void *);



typedef void (*htab_del) (void *);





typedef int (*htab_trav) (void **, void *);





typedef void *(*htab_alloc) (size_t, size_t);


typedef void (*htab_free) (void *);



typedef void *(*htab_alloc_with_arg) (void *, size_t, size_t);
typedef void (*htab_free_with_arg) (void *, void *);
# 99 "/home/mzorgati/gcc-4.4.0/include/hashtab.h"
struct htab
{

  htab_hash hash_f;


  htab_eq eq_f;


  htab_del del_f;


  void ** entries;


  size_t size;


  size_t n_elements;


  size_t n_deleted;



  unsigned int searches;



  unsigned int collisions;


  htab_alloc alloc_f;
  htab_free free_f;


  void * alloc_arg;
  htab_alloc_with_arg alloc_with_arg_f;
  htab_free_with_arg free_with_arg_f;



  unsigned int size_prime_index;
};

typedef struct htab *htab_t;


enum insert_option {NO_INSERT, INSERT};



extern htab_t htab_create_alloc (size_t, htab_hash,
                                    htab_eq, htab_del,
                                    htab_alloc, htab_free);

extern htab_t htab_create_alloc_ex (size_t, htab_hash,
                                      htab_eq, htab_del,
                                      void *, htab_alloc_with_arg,
                                      htab_free_with_arg);


extern htab_t htab_create (size_t, htab_hash, htab_eq, htab_del);
extern htab_t htab_try_create (size_t, htab_hash, htab_eq, htab_del);

extern void htab_set_functions_ex (htab_t, htab_hash,
                                       htab_eq, htab_del,
                                       void *, htab_alloc_with_arg,
                                       htab_free_with_arg);

extern void htab_delete (htab_t);
extern void htab_empty (htab_t);

extern void * htab_find (htab_t, const void *);
extern void ** htab_find_slot (htab_t, const void *, enum insert_option);
extern void * htab_find_with_hash (htab_t, const void *, hashval_t);
extern void ** htab_find_slot_with_hash (htab_t, const void *,
       hashval_t, enum insert_option);
extern void htab_clear_slot (htab_t, void **);
extern void htab_remove_elt (htab_t, void *);
extern void htab_remove_elt_with_hash (htab_t, void *, hashval_t);

extern void htab_traverse (htab_t, htab_trav, void *);
extern void htab_traverse_noresize (htab_t, htab_trav, void *);

extern size_t htab_size (htab_t);
extern size_t htab_elements (htab_t);
extern double htab_collisions (htab_t);


extern htab_hash htab_hash_pointer;


extern htab_eq htab_eq_pointer;


extern hashval_t htab_hash_string (const void *);


extern hashval_t iterative_hash (const void *, size_t, hashval_t);
# 26 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 2






# 1 "/home/mzorgati/gcc_build/gcc/options.h" 1





extern int target_flags;
extern int target_flags_explicit;

extern int warn_abi;
extern int warn_address;
extern int warn_aggregate_return;
extern int warn_array_bounds;
extern int warn_assign_intercept;
extern int warn_attributes;
extern int warn_bad_function_cast;
extern int warn_cxx_compat;
extern int warn_cxx0x_compat;
extern int warn_cast_align;
extern int warn_cast_qual;
extern int warn_char_subscripts;
extern int warn_clobbered;
extern int warn_conversion;
extern int warn_coverage_mismatch;
extern int warn_ctor_dtor_privacy;
extern int warn_declaration_after_statement;
extern int warn_deprecated;
extern int warn_deprecated_decl;
extern int warn_disabled_optimization;
extern int warn_div_by_zero;
extern int warn_ecpp;
extern int warn_empty_body;
extern int warn_enum_compare;
extern int warnings_are_errors;
extern int flag_extraneous_semicolon;
extern int flag_fatal_errors;
extern int warn_float_equal;
extern int warn_format_contains_nul;
extern int warn_format_extra_args;
extern int warn_format_nonliteral;
extern int warn_format_security;
extern int warn_format_y2k;
extern int warn_format_zero_length;
extern int warn_ignored_qualifiers;
extern int warn_implicit_function_declaration;
extern int warn_implicit_int;
extern int warn_init_self;
extern int warn_inline;
extern int warn_int_to_pointer_cast;
extern int warn_invalid_offsetof;
extern int warn_logical_op;
extern int warn_long_long;
extern int warn_main;
extern int warn_missing_braces;
extern int warn_missing_declarations;
extern int warn_missing_field_initializers;
extern int warn_missing_format_attribute;
extern int warn_missing_noreturn;
extern int warn_missing_parameter_type;
extern int warn_missing_prototypes;
extern int warn_mudflap;
extern int warn_nested_externs;
extern int warn_nontemplate_friend;
extern int warn_nonvdtor;
extern int warn_nonnull;
extern int warn_old_style_cast;
extern int warn_old_style_declaration;
extern int warn_old_style_definition;
extern int flag_newer;
extern int warn_overflow;
extern int warn_overlength_strings;
extern int warn_overloaded_virtual;
extern int warn_override_init;
extern int warn_packed;
extern int warn_packed_bitfield_compat;
extern int warn_padded;
extern int warn_parentheses;
extern int warn_pmf2ptr;
extern int warn_pointer_arith;
extern int warn_pointer_sign;
extern int warn_pointer_to_int_cast;
extern int warn_pragmas;
extern int warn_protocol;
extern int warn_psabi;
extern int warn_redundant_decls;
extern int flag_redundant;
extern int warn_reorder;
extern int warn_return_type;
extern int warn_selector;
extern int warn_sequence_point;
extern int warn_shadow;
extern int warn_sign_compare;
extern int warn_sign_conversion;
extern int warn_sign_promo;
extern int warn_stack_protect;
extern int warn_strict_aliasing;
extern int warn_strict_overflow;
extern int warn_strict_prototypes;
extern int warn_strict_selector_match;
extern int warn_switch;
extern int warn_switch_default;
extern int warn_switch_enum;
extern int warn_sync_nand;
extern int warn_synth;
extern int warn_system_headers;
extern int warn_traditional;
extern int warn_traditional_conversion;
extern int warn_type_limits;
extern int warn_undeclared_selector;
extern int warn_uninitialized;
extern int warn_notreached;
extern int warn_unsafe_loop_optimizations;
extern int warn_unused;
extern int warn_unused_function;
extern int warn_unused_label;
extern int warn_unused_parameter;
extern int warn_unused_value;
extern int warn_unused_variable;
extern int warn_vla;
extern int warn_volatile_register_var;
extern int warn_write_strings;
extern int flag_pic;
extern int flag_pie;
extern int flag_abi_version;
extern int align_functions;
extern int align_jumps;
extern int align_labels;
extern int align_loops;
extern int flag_argument_noalias;
extern int flag_assert;
extern int flag_associative_math;
extern int flag_asynchronous_unwind_tables;
extern int flag_auto_inc_dec;
extern int flag_bootstrap_classes;
extern int flag_bounds_check;
extern int flag_branch_on_count_reg;
extern int flag_branch_probabilities;
extern int flag_branch_target_load_optimize;
extern int flag_branch_target_load_optimize2;
extern int flag_btr_bb_exclusive;
extern int flag_caller_saves;
extern int flag_check_data_deps;
extern int flag_check_references;
extern int flag_no_common;
extern int flag_conserve_stack;
extern int flag_cprop_registers;
extern int flag_crossjumping;
extern int flag_cse_follow_jumps;
extern int flag_cse_skip_blocks;
extern int flag_cx_fortran_rules;
extern int flag_cx_limited_range;
extern int flag_data_sections;
extern int flag_dce;
extern int flag_defer_pop;
extern int flag_delayed_branch;
extern int flag_delete_null_pointer_checks;
extern int flag_dse;
extern int flag_dump_noaddr;
extern int flag_dump_unnumbered;
extern int flag_dwarf2_cfi_asm;
extern int flag_early_inlining;
extern int flag_eliminate_dwarf2_dups;
extern int flag_debug_only_used_symbols;
extern int flag_eliminate_unused_debug_types;
extern int flag_emit_class_debug_always;
extern int flag_emit_class_files;
extern int flag_exceptions;
extern int flag_expensive_optimizations;
extern int flag_filelist_file;
extern int flag_finite_math_only;
extern int flag_float_store;
extern int flag_force_classes_archive_check;
extern int flag_forward_propagate;
extern int flag_friend_injection;
extern int flag_no_function_cse;
extern int flag_function_sections;
extern int flag_gcse;
extern int flag_gcse_after_reload;
extern int flag_gcse_las;
extern int flag_gcse_lm;
extern int flag_gcse_sm;
extern int flag_gnu89_inline;
extern int flag_graphite;
extern int flag_graphite_identity;
extern int flag_guess_branch_prob;
extern int flag_hash_synchronization;
extern int flag_no_ident;
extern int flag_if_conversion;
extern int flag_if_conversion2;
extern int flag_indirect_classes;
extern int flag_indirect_dispatch;
extern int flag_indirect_inlining;
extern int flag_inhibit_size_directive;
extern int flag_no_inline;
extern int flag_inline_functions;
extern int flag_inline_functions_called_once;
extern int flag_inline_small_functions;
extern int flag_instrument_function_entry_exit;
extern int flag_ipa_cp;
extern int flag_ipa_cp_clone;
extern int flag_ipa_matrix_reorg;
extern int flag_ipa_pta;
extern int flag_ipa_pure_const;
extern int flag_ipa_reference;
extern int flag_ipa_struct_reorg;
extern int flag_ipa_type_escape;
extern int flag_ira_coalesce;
extern int flag_ira_share_save_slots;
extern int flag_ira_share_spill_slots;
extern int flag_ivopts;
extern int flag_jni;
extern int flag_jump_tables;
extern int flag_keep_inline_functions;
extern int flag_keep_static_consts;
extern int flag_leading_underscore;
extern int flag_loop_block;
extern int flag_loop_interchange;
extern int flag_loop_strip_mine;
extern int flag_errno_math;
extern int mem_report;
extern int flag_merge_constants;
extern int flag_merge_debug_strings;
extern int flag_modulo_sched;
extern int flag_modulo_sched_allow_regmoves;
extern int flag_move_loop_invariants;
extern int flag_mudflap;
extern int flag_mudflap_ignore_reads;
extern int flag_non_call_exceptions;
extern int flag_objc_call_cxx_cdtors;
extern int flag_objc_direct_dispatch;
extern int flag_objc_exceptions;
extern int flag_objc_gc;
extern int flag_objc_sjlj_exceptions;
extern int flag_omit_frame_pointer;
extern int flag_openmp;
extern int flag_regmove;
extern int flag_optimize_sibling_calls;
extern int flag_optimize_sci;
extern int flag_pack_struct;
extern int flag_pcc_struct_return;
extern int flag_peel_loops;
extern int flag_no_peephole;
extern int flag_peephole2;
extern int post_ipa_mem_report;
extern int pre_ipa_mem_report;
extern int flag_predictive_commoning;
extern int flag_prefetch_loop_arrays;
extern int profile_flag;
extern int profile_arc_flag;
extern int flag_profile_correction;
extern int flag_profile_use;
extern int flag_profile_values;
extern int flag_reciprocal_math;
extern int flag_record_gcc_switches;
extern int flag_reduced_reflection;
extern int flag_rename_registers;
extern int flag_reorder_blocks;
extern int flag_reorder_blocks_and_partition;
extern int flag_reorder_functions;
extern int flag_rerun_cse_after_loop;
extern int flag_resched_modulo_sched;
extern int flag_rounding_math;
extern int flag_rtl_seqabstr;
extern int flag_schedule_interblock;
extern int flag_schedule_speculative;
extern int flag_schedule_speculative_load;
extern int flag_schedule_speculative_load_dangerous;
extern int flag_sched_stalled_insns;
extern int flag_sched_stalled_insns_dep;
extern int flag_sched2_use_superblocks;
extern int flag_sched2_use_traces;
extern int flag_schedule_insns;
extern int flag_schedule_insns_after_reload;
extern int flag_section_anchors;
extern int flag_see;
extern int flag_sel_sched_pipelining;
extern int flag_sel_sched_pipelining_outer_loops;
extern int flag_sel_sched_reschedule_pipelined;
extern int flag_selective_scheduling;
extern int flag_selective_scheduling2;
extern int flag_show_column;
extern int flag_signaling_nans;
extern int flag_signed_zeros;
extern int flag_single_precision_constant;
extern int flag_split_ivs_in_unroller;
extern int flag_split_wide_types;
extern int flag_stack_protect;
extern int flag_store_check;
extern int flag_strict_aliasing;
extern int flag_strict_overflow;
extern int flag_syntax_only;
extern int flag_test_coverage;
extern int flag_thread_jumps;
extern int time_report;
extern int flag_toplevel_reorder;
extern int flag_tracer;
extern int flag_trapping_math;
extern int flag_trapv;
extern int flag_tree_builtin_call_dce;
extern int flag_tree_ccp;
extern int flag_tree_ch;
extern int flag_tree_copy_prop;
extern int flag_tree_copyrename;
extern int flag_tree_cselim;
extern int flag_tree_dce;
extern int flag_tree_dom;
extern int flag_tree_dse;
extern int flag_tree_fre;
extern int flag_tree_loop_distribution;
extern int flag_tree_loop_im;
extern int flag_tree_loop_ivcanon;
extern int flag_tree_loop_linear;
extern int flag_tree_loop_optimize;
extern int flag_tree_live_range_split;
extern int flag_tree_parallelize_loops;
extern int flag_tree_pre;
extern int flag_tree_reassoc;
extern int flag_tree_scev_cprop;
extern int flag_tree_sink;
extern int flag_tree_sra;
extern int flag_tree_switch_conversion;
extern int flag_tree_ter;
extern int flag_tree_vect_loop_version;
extern int flag_tree_vectorize;
extern int flag_tree_vrp;
extern int flag_unit_at_a_time;
extern int flag_unroll_all_loops;
extern int flag_unroll_loops;
extern int flag_unsafe_loop_optimizations;
extern int flag_unsafe_math_optimizations;
extern int flag_unswitch_loops;
extern int flag_unwind_tables;
extern int flag_use_boehm_gc;
extern int flag_use_divide_subroutine;
extern int flag_var_tracking;
extern int flag_var_tracking_uninit;
extern int flag_variable_expansion_in_unroller;
extern int flag_vect_cost_model;
extern int flag_verbose_asm;
extern int flag_visibility_ms_compat;
extern int flag_value_profile_transformations;
extern int flag_web;
extern int flag_whole_program;
extern int flag_wrapv;
extern int flag_zero_initialized_in_bss;
extern int pedantic;
extern int quiet_flag;
extern int version_flag;
extern int inhibit_warnings;




struct cl_optimization
{
  int align_functions;
  int align_jumps;
  int align_labels;
  int align_loops;
  int flag_sched_stalled_insns;
  int flag_sched_stalled_insns_dep;
  unsigned char optimize;
  unsigned char optimize_size;
  unsigned char flag_argument_noalias;
  unsigned char flag_asynchronous_unwind_tables;
  unsigned char flag_branch_on_count_reg;
  unsigned char flag_branch_probabilities;
  unsigned char flag_branch_target_load_optimize;
  unsigned char flag_branch_target_load_optimize2;
  unsigned char flag_btr_bb_exclusive;
  unsigned char flag_caller_saves;
  unsigned char flag_no_common;
  unsigned char flag_conserve_stack;
  unsigned char flag_cprop_registers;
  unsigned char flag_crossjumping;
  unsigned char flag_cse_follow_jumps;
  unsigned char flag_cse_skip_blocks;
  unsigned char flag_cx_fortran_rules;
  unsigned char flag_cx_limited_range;
  unsigned char flag_data_sections;
  unsigned char flag_dce;
  unsigned char flag_defer_pop;
  unsigned char flag_delayed_branch;
  unsigned char flag_delete_null_pointer_checks;
  unsigned char flag_dse;
  unsigned char flag_early_inlining;
  unsigned char flag_exceptions;
  unsigned char flag_expensive_optimizations;
  unsigned char flag_finite_math_only;
  unsigned char flag_float_store;
  unsigned char flag_forward_propagate;
  unsigned char flag_gcse;
  unsigned char flag_gcse_after_reload;
  unsigned char flag_gcse_las;
  unsigned char flag_gcse_lm;
  unsigned char flag_gcse_sm;
  unsigned char flag_graphite_identity;
  unsigned char flag_guess_branch_prob;
  unsigned char flag_if_conversion;
  unsigned char flag_if_conversion2;
  unsigned char flag_inline_functions;
  unsigned char flag_inline_functions_called_once;
  unsigned char flag_inline_small_functions;
  unsigned char flag_ipa_cp;
  unsigned char flag_ipa_cp_clone;
  unsigned char flag_ipa_matrix_reorg;
  unsigned char flag_ipa_pta;
  unsigned char flag_ipa_pure_const;
  unsigned char flag_ipa_reference;
  unsigned char flag_ipa_type_escape;
  unsigned char flag_ivopts;
  unsigned char flag_jump_tables;
  unsigned char flag_loop_block;
  unsigned char flag_loop_interchange;
  unsigned char flag_loop_strip_mine;
  unsigned char flag_errno_math;
  unsigned char flag_merge_constants;
  unsigned char flag_modulo_sched;
  unsigned char flag_move_loop_invariants;
  unsigned char flag_non_call_exceptions;
  unsigned char flag_omit_frame_pointer;
  unsigned char flag_regmove;
  unsigned char flag_optimize_sibling_calls;
  unsigned char flag_pack_struct;
  unsigned char flag_peel_loops;
  unsigned char flag_no_peephole;
  unsigned char flag_peephole2;
  unsigned char flag_predictive_commoning;
  unsigned char flag_prefetch_loop_arrays;
  unsigned char flag_pcc_struct_return;
  unsigned char flag_rename_registers;
  unsigned char flag_reorder_blocks;
  unsigned char flag_reorder_blocks_and_partition;
  unsigned char flag_reorder_functions;
  unsigned char flag_rerun_cse_after_loop;
  unsigned char flag_resched_modulo_sched;
  unsigned char flag_rounding_math;
  unsigned char flag_rtl_seqabstr;
  unsigned char flag_schedule_interblock;
  unsigned char flag_schedule_speculative;
  unsigned char flag_schedule_speculative_load;
  unsigned char flag_schedule_speculative_load_dangerous;
  unsigned char flag_sched2_use_superblocks;
  unsigned char flag_sched2_use_traces;
  unsigned char flag_schedule_insns;
  unsigned char flag_schedule_insns_after_reload;
  unsigned char flag_section_anchors;
  unsigned char flag_sel_sched_pipelining;
  unsigned char flag_sel_sched_pipelining_outer_loops;
  unsigned char flag_sel_sched_reschedule_pipelined;
  unsigned char flag_selective_scheduling;
  unsigned char flag_selective_scheduling2;
  unsigned char flag_signaling_nans;
  unsigned char flag_signed_zeros;
  unsigned char flag_single_precision_constant;
  unsigned char flag_split_ivs_in_unroller;
  unsigned char flag_split_wide_types;
  unsigned char flag_strict_aliasing;
  unsigned char flag_thread_jumps;
  unsigned char flag_toplevel_reorder;
  unsigned char flag_trapping_math;
  unsigned char flag_trapv;
  unsigned char flag_tree_builtin_call_dce;
  unsigned char flag_tree_ccp;
  unsigned char flag_tree_ch;
  unsigned char flag_tree_copy_prop;
  unsigned char flag_tree_copyrename;
  unsigned char flag_tree_cselim;
  unsigned char flag_tree_dce;
  unsigned char flag_tree_dom;
  unsigned char flag_tree_dse;
  unsigned char flag_tree_fre;
  unsigned char flag_tree_loop_distribution;
  unsigned char flag_tree_loop_im;
  unsigned char flag_tree_loop_ivcanon;
  unsigned char flag_tree_loop_linear;
  unsigned char flag_tree_loop_optimize;
  unsigned char flag_tree_live_range_split;
  unsigned char flag_tree_pre;
  unsigned char flag_tree_reassoc;
  unsigned char flag_tree_scev_cprop;
  unsigned char flag_tree_sink;
  unsigned char flag_tree_sra;
  unsigned char flag_tree_switch_conversion;
  unsigned char flag_tree_ter;
  unsigned char flag_tree_vect_loop_version;
  unsigned char flag_tree_vectorize;
  unsigned char flag_tree_vrp;
  unsigned char flag_unit_at_a_time;
  unsigned char flag_unroll_all_loops;
  unsigned char flag_unroll_loops;
  unsigned char flag_unsafe_loop_optimizations;
  unsigned char flag_unsafe_math_optimizations;
  unsigned char flag_unswitch_loops;
  unsigned char flag_unwind_tables;
  unsigned char flag_var_tracking;
  unsigned char flag_var_tracking_uninit;
  unsigned char flag_variable_expansion_in_unroller;
  unsigned char flag_vect_cost_model;
  unsigned char flag_value_profile_transformations;
  unsigned char flag_web;
  unsigned char flag_whole_program;
  unsigned char flag_wrapv;
};


struct cl_target_option
{
  int target_flags;
};



extern void cl_optimization_save (struct cl_optimization *);


extern void cl_optimization_restore (struct cl_optimization *);


extern void cl_optimization_print (FILE *, int, struct cl_optimization *);


extern void cl_target_option_save (struct cl_target_option *);


extern void cl_target_option_restore (struct cl_target_option *);


extern void cl_target_option_print (FILE *, int, struct cl_target_option *);
# 543 "/home/mzorgati/gcc_build/gcc/options.h"
enum opt_code
{
  OPT__help,
  OPT__help_,
  OPT__output_pch_,
  OPT__param,
  OPT__target_help,
  OPT__version,
  OPT_A,
  OPT_C,
  OPT_CC,
  OPT_D,
  OPT_E,
  OPT_F,
  OPT_G,
  OPT_H,
  OPT_I,
  OPT_J,
  OPT_M,
  OPT_MD,
  OPT_MD_,
  OPT_MF,
  OPT_MG,
  OPT_MM,
  OPT_MMD,
  OPT_MMD_,
  OPT_MP,
  OPT_MQ,
  OPT_MT,
  OPT_O,
  OPT_Os,
  OPT_P,
  OPT_U,
  OPT_W,
  OPT_Wabi,
  OPT_Waddress,
  OPT_Waggregate_return,
  OPT_Waliasing,
  OPT_Walign_commons,
  OPT_Wall,
  OPT_Wall_deprecation,
  OPT_Wall_javadoc,
  OPT_Wampersand,
  OPT_Warray_bounds,
  OPT_Warray_temporaries,
  OPT_Wassert_identifier,
  OPT_Wassign_intercept,
  OPT_Wattributes,
  OPT_Wbad_function_cast,
  OPT_Wboxing,
  OPT_Wbuiltin_macro_redefined,
  OPT_Wc___compat,
  OPT_Wc__0x_compat,
  OPT_Wcast_align,
  OPT_Wcast_qual,
  OPT_Wchar_concat,
  OPT_Wchar_subscripts,
  OPT_Wcharacter_truncation,
  OPT_Wclobbered,
  OPT_Wcomment,
  OPT_Wcomments,
  OPT_Wcondition_assign,
  OPT_Wconstructor_name,
  OPT_Wconversion,
  OPT_Wcoverage_mismatch,
  OPT_Wctor_dtor_privacy,
  OPT_Wdeclaration_after_statement,
  OPT_Wdep_ann,
  OPT_Wdeprecated,
  OPT_Wdeprecated_declarations,
  OPT_Wdisabled_optimization,
  OPT_Wdiscouraged,
  OPT_Wdiv_by_zero,
  OPT_Weffc__,
  OPT_Wempty_block,
  OPT_Wempty_body,
  OPT_Wendif_labels,
  OPT_Wenum_compare,
  OPT_Wenum_identifier,
  OPT_Wenum_switch,
  OPT_Werror,
  OPT_Werror_implicit_function_declaration,
  OPT_Werror_,
  OPT_Wextra,
  OPT_Wextraneous_semicolon,
  OPT_Wfallthrough,
  OPT_Wfatal_errors,
  OPT_Wfield_hiding,
  OPT_Wfinal_bound,
  OPT_Wfinally,
  OPT_Wfloat_equal,
  OPT_Wforbidden,
  OPT_Wformat,
  OPT_Wformat_contains_nul,
  OPT_Wformat_extra_args,
  OPT_Wformat_nonliteral,
  OPT_Wformat_security,
  OPT_Wformat_y2k,
  OPT_Wformat_zero_length,
  OPT_Wformat_,
  OPT_Wframe_larger_than_,
  OPT_Whiding,
  OPT_Wignored_qualifiers,
  OPT_Wimplicit,
  OPT_Wimplicit_function_declaration,
  OPT_Wimplicit_int,
  OPT_Wimplicit_interface,
  OPT_Wimport,
  OPT_Windirect_static,
  OPT_Winit_self,
  OPT_Winline,
  OPT_Wint_to_pointer_cast,
  OPT_Wintf_annotation,
  OPT_Wintf_non_inherited,
  OPT_Wintrinsic_shadow,
  OPT_Wintrinsics_std,
  OPT_Winvalid_offsetof,
  OPT_Winvalid_pch,
  OPT_Wjavadoc,
  OPT_Wlarger_than_,
  OPT_Wlarger_than_eq,
  OPT_Wline_truncation,
  OPT_Wlocal_hiding,
  OPT_Wlogical_op,
  OPT_Wlong_long,
  OPT_Wmain,
  OPT_Wmasked_catch_block,
  OPT_Wmissing_braces,
  OPT_Wmissing_declarations,
  OPT_Wmissing_field_initializers,
  OPT_Wmissing_format_attribute,
  OPT_Wmissing_include_dirs,
  OPT_Wmissing_noreturn,
  OPT_Wmissing_parameter_type,
  OPT_Wmissing_prototypes,
  OPT_Wmudflap,
  OPT_Wmultichar,
  OPT_Wnested_externs,
  OPT_Wnls,
  OPT_Wno_effect_assign,
  OPT_Wnon_template_friend,
  OPT_Wnon_virtual_dtor,
  OPT_Wnonnull,
  OPT_Wnormalized_,
  OPT_Wnull,
  OPT_Wold_style_cast,
  OPT_Wold_style_declaration,
  OPT_Wold_style_definition,
  OPT_Wout_of_date,
  OPT_Wover_ann,
  OPT_Woverflow,
  OPT_Woverlength_strings,
  OPT_Woverloaded_virtual,
  OPT_Woverride_init,
  OPT_Wpacked,
  OPT_Wpacked_bitfield_compat,
  OPT_Wpadded,
  OPT_Wparam_assign,
  OPT_Wparentheses,
  OPT_Wpkg_default_method,
  OPT_Wpmf_conversions,
  OPT_Wpointer_arith,
  OPT_Wpointer_sign,
  OPT_Wpointer_to_int_cast,
  OPT_Wpragmas,
  OPT_Wprotocol,
  OPT_Wpsabi,
  OPT_Wraw,
  OPT_Wredundant_decls,
  OPT_Wredundant_modifiers,
  OPT_Wreorder,
  OPT_Wreturn_type,
  OPT_Wselector,
  OPT_Wsequence_point,
  OPT_Wserial,
  OPT_Wshadow,
  OPT_Wsign_compare,
  OPT_Wsign_conversion,
  OPT_Wsign_promo,
  OPT_Wspecial_param_hiding,
  OPT_Wstack_protector,
  OPT_Wstatic_access,
  OPT_Wstatic_receiver,
  OPT_Wstrict_aliasing,
  OPT_Wstrict_aliasing_,
  OPT_Wstrict_null_sentinel,
  OPT_Wstrict_overflow,
  OPT_Wstrict_overflow_,
  OPT_Wstrict_prototypes,
  OPT_Wstrict_selector_match,
  OPT_Wsuppress,
  OPT_Wsurprising,
  OPT_Wswitch,
  OPT_Wswitch_default,
  OPT_Wswitch_enum,
  OPT_Wsync_nand,
  OPT_Wsynth,
  OPT_Wsynthetic_access,
  OPT_Wsystem_headers,
  OPT_Wtabs,
  OPT_Wtasks,
  OPT_Wtraditional,
  OPT_Wtraditional_conversion,
  OPT_Wtrigraphs,
  OPT_Wtype_hiding,
  OPT_Wtype_limits,
  OPT_Wuncheck,
  OPT_Wundeclared_selector,
  OPT_Wundef,
  OPT_Wunderflow,
  OPT_Wuninitialized,
  OPT_Wunknown_pragmas,
  OPT_Wunnecessary_else,
  OPT_Wunqualified_field,
  OPT_Wunreachable_code,
  OPT_Wunsafe_loop_optimizations,
  OPT_Wunused,
  OPT_Wunused_argument,
  OPT_Wunused_function,
  OPT_Wunused_import,
  OPT_Wunused_label,
  OPT_Wunused_local,
  OPT_Wunused_macros,
  OPT_Wunused_parameter,
  OPT_Wunused_private,
  OPT_Wunused_thrown,
  OPT_Wunused_value,
  OPT_Wunused_variable,
  OPT_Wuseless_type_check,
  OPT_Wvarargs_cast,
  OPT_Wvariadic_macros,
  OPT_Wvla,
  OPT_Wvolatile_register_var,
  OPT_Wwarning_token,
  OPT_Wwrite_strings,
  OPT_ansi,
  OPT_aux_info,
  OPT_aux_info_,
  OPT_auxbase,
  OPT_auxbase_strip,
  OPT_cpp,
  OPT_d,
  OPT_dumpbase,
  OPT_fCLASSPATH_,
  OPT_fPIC,
  OPT_fPIE,
  OPT_fRTS_,
  OPT_fabi_version_,
  OPT_faccess_control,
  OPT_falign_commons,
  OPT_falign_functions,
  OPT_falign_functions_,
  OPT_falign_jumps,
  OPT_falign_jumps_,
  OPT_falign_labels,
  OPT_falign_labels_,
  OPT_falign_loops,
  OPT_falign_loops_,
  OPT_fall_intrinsics,
  OPT_fall_virtual,
  OPT_fallow_leading_underscore,
  OPT_falt_external_templates,
  OPT_fargument_alias,
  OPT_fargument_noalias,
  OPT_fargument_noalias_anything,
  OPT_fargument_noalias_global,
  OPT_fasm,
  OPT_fassert,
  OPT_fassociative_math,
  OPT_fassume_compiled,
  OPT_fassume_compiled_,
  OPT_fasynchronous_unwind_tables,
  OPT_fauto_inc_dec,
  OPT_fautomatic,
  OPT_faux_classpath,
  OPT_fbackslash,
  OPT_fbacktrace,
  OPT_fblas_matmul_limit_,
  OPT_fbootclasspath_,
  OPT_fbootstrap_classes,
  OPT_fbounds_check,
  OPT_fbranch_count_reg,
  OPT_fbranch_probabilities,
  OPT_fbranch_target_load_optimize,
  OPT_fbranch_target_load_optimize2,
  OPT_fbtr_bb_exclusive,
  OPT_fbuiltin,
  OPT_fbuiltin_,
  OPT_fcall_saved_,
  OPT_fcall_used_,
  OPT_fcaller_saves,
  OPT_fcheck_array_temporaries,
  OPT_fcheck_data_deps,
  OPT_fcheck_new,
  OPT_fcheck_references,
  OPT_fclasspath_,
  OPT_fcommon,
  OPT_fcompile_resource_,
  OPT_fcond_mismatch,
  OPT_fconserve_space,
  OPT_fconserve_stack,
  OPT_fconstant_string_class_,
  OPT_fconvert_big_endian,
  OPT_fconvert_little_endian,
  OPT_fconvert_native,
  OPT_fconvert_swap,
  OPT_fcprop_registers,
  OPT_fcray_pointer,
  OPT_fcrossjumping,
  OPT_fcse_follow_jumps,
  OPT_fcse_skip_blocks,
  OPT_fcx_fortran_rules,
  OPT_fcx_limited_range,
  OPT_fd_lines_as_code,
  OPT_fd_lines_as_comments,
  OPT_fdata_sections,
  OPT_fdbg_cnt_list,
  OPT_fdbg_cnt_,
  OPT_fdce,
  OPT_fdebug_prefix_map_,
  OPT_fdefault_double_8,
  OPT_fdefault_inline,
  OPT_fdefault_integer_8,
  OPT_fdefault_real_8,
  OPT_fdefer_pop,
  OPT_fdelayed_branch,
  OPT_fdelete_null_pointer_checks,
  OPT_fdiagnostics_show_location_,
  OPT_fdiagnostics_show_option,
  OPT_fdirectives_only,
  OPT_fdisable_assertions,
  OPT_fdisable_assertions_,
  OPT_fdollar_ok,
  OPT_fdollars_in_identifiers,
  OPT_fdse,
  OPT_fdump_,
  OPT_fdump_core,
  OPT_fdump_noaddr,
  OPT_fdump_parse_tree,
  OPT_fdump_unnumbered,
  OPT_fdwarf2_cfi_asm,
  OPT_fearly_inlining,
  OPT_felide_constructors,
  OPT_feliminate_dwarf2_dups,
  OPT_feliminate_unused_debug_symbols,
  OPT_feliminate_unused_debug_types,
  OPT_femit_class_debug_always,
  OPT_femit_class_file,
  OPT_femit_class_files,
  OPT_femit_struct_debug_baseonly,
  OPT_femit_struct_debug_detailed_,
  OPT_femit_struct_debug_reduced,
  OPT_fenable_assertions,
  OPT_fenable_assertions_,
  OPT_fencoding_,
  OPT_fenforce_eh_specs,
  OPT_fenum_int_equiv,
  OPT_fexceptions,
  OPT_fexec_charset_,
  OPT_fexpensive_optimizations,
  OPT_fextdirs_,
  OPT_fextended_identifiers,
  OPT_fexternal_blas,
  OPT_fexternal_templates,
  OPT_ff2c,
  OPT_ffast_math,
  OPT_ffilelist_file,
  OPT_ffinite_math_only,
  OPT_ffixed_,
  OPT_ffixed_form,
  OPT_ffixed_line_length_,
  OPT_ffixed_line_length_none,
  OPT_ffloat_store,
  OPT_ffor_scope,
  OPT_fforce_addr,
  OPT_fforce_classes_archive_check,
  OPT_fforward_propagate,
  OPT_ffpe_trap_,
  OPT_ffree_form,
  OPT_ffree_line_length_,
  OPT_ffree_line_length_none,
  OPT_ffreestanding,
  OPT_ffriend_injection,
  OPT_ffunction_cse,
  OPT_ffunction_sections,
  OPT_fgcse,
  OPT_fgcse_after_reload,
  OPT_fgcse_las,
  OPT_fgcse_lm,
  OPT_fgcse_sm,
  OPT_fgnu_keywords,
  OPT_fgnu_runtime,
  OPT_fgnu89_inline,
  OPT_fgraphite,
  OPT_fgraphite_identity,
  OPT_fguess_branch_probability,
  OPT_fguiding_decls,
  OPT_fhandle_exceptions,
  OPT_fhash_synchronization,
  OPT_fhelp,
  OPT_fhelp_,
  OPT_fhonor_std,
  OPT_fhosted,
  OPT_fhuge_objects,
  OPT_fident,
  OPT_fif_conversion,
  OPT_fif_conversion2,
  OPT_fimplement_inlines,
  OPT_fimplicit_inline_templates,
  OPT_fimplicit_none,
  OPT_fimplicit_templates,
  OPT_findirect_classes,
  OPT_findirect_dispatch,
  OPT_findirect_inlining,
  OPT_finhibit_size_directive,
  OPT_finit_character_,
  OPT_finit_integer_,
  OPT_finit_local_zero,
  OPT_finit_logical_,
  OPT_finit_real_,
  OPT_finline,
  OPT_finline_functions,
  OPT_finline_functions_called_once,
  OPT_finline_limit_,
  OPT_finline_limit_eq,
  OPT_finline_small_functions,
  OPT_finput_charset_,
  OPT_finstrument_functions,
  OPT_finstrument_functions_exclude_file_list_,
  OPT_finstrument_functions_exclude_function_list_,
  OPT_fintrinsic_modules_path,
  OPT_fipa_cp,
  OPT_fipa_cp_clone,
  OPT_fipa_matrix_reorg,
  OPT_fipa_pta,
  OPT_fipa_pure_const,
  OPT_fipa_reference,
  OPT_fipa_struct_reorg,
  OPT_fipa_type_escape,
  OPT_fira_algorithm_,
  OPT_fira_coalesce,
  OPT_fira_region_,
  OPT_fira_share_save_slots,
  OPT_fira_share_spill_slots,
  OPT_fira_verbose_,
  OPT_fivopts,
  OPT_fjni,
  OPT_fjump_tables,
  OPT_fkeep_inline_functions,
  OPT_fkeep_static_consts,
  OPT_flabels_ok,
  OPT_flax_vector_conversions,
  OPT_fleading_underscore,
  OPT_floop_block,
  OPT_floop_interchange,
  OPT_floop_optimize,
  OPT_floop_strip_mine,
  OPT_fmath_errno,
  OPT_fmax_array_constructor_,
  OPT_fmax_errors_,
  OPT_fmax_identifier_length_,
  OPT_fmax_stack_var_size_,
  OPT_fmax_subrecord_length_,
  OPT_fmem_report,
  OPT_fmerge_all_constants,
  OPT_fmerge_constants,
  OPT_fmerge_debug_strings,
  OPT_fmessage_length_,
  OPT_fmodule_private,
  OPT_fmodulo_sched,
  OPT_fmodulo_sched_allow_regmoves,
  OPT_fmove_loop_invariants,
  OPT_fms_extensions,
  OPT_fmudflap,
  OPT_fmudflapir,
  OPT_fmudflapth,
  OPT_fname_mangling_version_,
  OPT_fnew_abi,
  OPT_fnext_runtime,
  OPT_fnil_receivers,
  OPT_fnon_call_exceptions,
  OPT_fnonansi_builtins,
  OPT_fnonnull_objects,
  OPT_fobjc_call_cxx_cdtors,
  OPT_fobjc_direct_dispatch,
  OPT_fobjc_exceptions,
  OPT_fobjc_gc,
  OPT_fobjc_sjlj_exceptions,
  OPT_fomit_frame_pointer,
  OPT_fopenmp,
  OPT_foperator_names,
  OPT_foptimize_register_move,
  OPT_foptimize_sibling_calls,
  OPT_foptimize_static_class_initialization,
  OPT_foptional_diags,
  OPT_foutput_class_dir_,
  OPT_fpack_derived,
  OPT_fpack_struct,
  OPT_fpack_struct_,
  OPT_fpcc_struct_return,
  OPT_fpch_deps,
  OPT_fpch_preprocess,
  OPT_fpeel_loops,
  OPT_fpeephole,
  OPT_fpeephole2,
  OPT_fpermissive,
  OPT_fpic,
  OPT_fpie,
  OPT_fpost_ipa_mem_report,
  OPT_fpre_ipa_mem_report,
  OPT_fpredictive_commoning,
  OPT_fprefetch_loop_arrays,
  OPT_fpreprocessed,
  OPT_fprofile,
  OPT_fprofile_arcs,
  OPT_fprofile_correction,
  OPT_fprofile_dir_,
  OPT_fprofile_generate,
  OPT_fprofile_generate_,
  OPT_fprofile_use,
  OPT_fprofile_use_,
  OPT_fprofile_values,
  OPT_frandom_seed,
  OPT_frandom_seed_,
  OPT_frange_check,
  OPT_freciprocal_math,
  OPT_frecord_gcc_switches,
  OPT_frecord_marker_4,
  OPT_frecord_marker_8,
  OPT_frecursive,
  OPT_freduced_reflection,
  OPT_freg_struct_return,
  OPT_fregmove,
  OPT_frename_registers,
  OPT_freorder_blocks,
  OPT_freorder_blocks_and_partition,
  OPT_freorder_functions,
  OPT_frepack_arrays,
  OPT_freplace_objc_classes,
  OPT_frepo,
  OPT_frerun_cse_after_loop,
  OPT_frerun_loop_opt,
  OPT_freschedule_modulo_scheduled_loops,
  OPT_frounding_math,
  OPT_frtl_abstract_sequences,
  OPT_frtti,
  OPT_fsaw_java_file,
  OPT_fsched_interblock,
  OPT_fsched_spec,
  OPT_fsched_spec_load,
  OPT_fsched_spec_load_dangerous,
  OPT_fsched_stalled_insns,
  OPT_fsched_stalled_insns_dep,
  OPT_fsched_stalled_insns_dep_,
  OPT_fsched_stalled_insns_,
  OPT_fsched_verbose_,
  OPT_fsched2_use_superblocks,
  OPT_fsched2_use_traces,
  OPT_fschedule_insns,
  OPT_fschedule_insns2,
  OPT_fsecond_underscore,
  OPT_fsection_anchors,
  OPT_fsee,
  OPT_fsel_sched_pipelining,
  OPT_fsel_sched_pipelining_outer_loops,
  OPT_fsel_sched_reschedule_pipelined,
  OPT_fselective_scheduling,
  OPT_fselective_scheduling2,
  OPT_fshort_double,
  OPT_fshort_enums,
  OPT_fshort_wchar,
  OPT_fshow_column,
  OPT_fsign_zero,
  OPT_fsignaling_nans,
  OPT_fsigned_bitfields,
  OPT_fsigned_char,
  OPT_fsigned_zeros,
  OPT_fsingle_precision_constant,
  OPT_fsource_filename_,
  OPT_fsource_,
  OPT_fsplit_ivs_in_unroller,
  OPT_fsplit_wide_types,
  OPT_fsquangle,
  OPT_fstack_check,
  OPT_fstack_check_,
  OPT_fstack_limit,
  OPT_fstack_limit_register_,
  OPT_fstack_limit_symbol_,
  OPT_fstack_protector,
  OPT_fstack_protector_all,
  OPT_fstats,
  OPT_fstore_check,
  OPT_fstrength_reduce,
  OPT_fstrict_aliasing,
  OPT_fstrict_overflow,
  OPT_fstrict_prototype,
  OPT_fsyntax_only,
  OPT_ftabstop_,
  OPT_ftarget_help,
  OPT_ftarget_,
  OPT_ftemplate_depth_,
  OPT_ftest_coverage,
  OPT_fthis_is_variable,
  OPT_fthread_jumps,
  OPT_fthreadsafe_statics,
  OPT_ftime_report,
  OPT_ftls_model_,
  OPT_ftoplevel_reorder,
  OPT_ftracer,
  OPT_ftrapping_math,
  OPT_ftrapv,
  OPT_ftree_builtin_call_dce,
  OPT_ftree_ccp,
  OPT_ftree_ch,
  OPT_ftree_copy_prop,
  OPT_ftree_copyrename,
  OPT_ftree_cselim,
  OPT_ftree_dce,
  OPT_ftree_dominator_opts,
  OPT_ftree_dse,
  OPT_ftree_fre,
  OPT_ftree_loop_distribution,
  OPT_ftree_loop_im,
  OPT_ftree_loop_ivcanon,
  OPT_ftree_loop_linear,
  OPT_ftree_loop_optimize,
  OPT_ftree_lrs,
  OPT_ftree_parallelize_loops_,
  OPT_ftree_pre,
  OPT_ftree_reassoc,
  OPT_ftree_salias,
  OPT_ftree_scev_cprop,
  OPT_ftree_sink,
  OPT_ftree_sra,
  OPT_ftree_store_ccp,
  OPT_ftree_store_copy_prop,
  OPT_ftree_switch_conversion,
  OPT_ftree_ter,
  OPT_ftree_vect_loop_version,
  OPT_ftree_vectorize,
  OPT_ftree_vectorizer_verbose_,
  OPT_ftree_vrp,
  OPT_funderscoring,
  OPT_funit_at_a_time,
  OPT_funroll_all_loops,
  OPT_funroll_loops,
  OPT_funsafe_loop_optimizations,
  OPT_funsafe_math_optimizations,
  OPT_funsigned_bitfields,
  OPT_funsigned_char,
  OPT_funswitch_loops,
  OPT_funwind_tables,
  OPT_fuse_boehm_gc,
  OPT_fuse_cxa_atexit,
  OPT_fuse_cxa_get_exception_ptr,
  OPT_fuse_divide_subroutine,
  OPT_fvar_tracking,
  OPT_fvar_tracking_uninit,
  OPT_fvariable_expansion_in_unroller,
  OPT_fvect_cost_model,
  OPT_fverbose_asm,
  OPT_fvisibility_inlines_hidden,
  OPT_fvisibility_ms_compat,
  OPT_fvisibility_,
  OPT_fvpt,
  OPT_fvtable_gc,
  OPT_fvtable_thunks,
  OPT_fweak,
  OPT_fweb,
  OPT_fwhole_program,
  OPT_fwide_exec_charset_,
  OPT_fworking_directory,
  OPT_fwrapv,
  OPT_fxref,
  OPT_fzero_initialized_in_bss,
  OPT_fzero_link,
  OPT_g,
  OPT_gant,
  OPT_gcoff,
  OPT_gdwarf_,
  OPT_gdwarf_2,
  OPT_gen_decls,
  OPT_ggdb,
  OPT_gnat,
  OPT_gnatO,
  OPT_gstabs,
  OPT_gstabs_,
  OPT_gvms,
  OPT_gxcoff,
  OPT_gxcoff_,
  OPT_idirafter,
  OPT_imacros,
  OPT_imultilib,
  OPT_include,
  OPT_iprefix,
  OPT_iquote,
  OPT_isysroot,
  OPT_isystem,
  OPT_iwithprefix,
  OPT_iwithprefixbefore,
  OPT_lang_asm,
  OPT_lang_objc,
  OPT_nocpp,
  OPT_nostdinc,
  OPT_nostdinc__,
  OPT_nostdlib,
  OPT_o,
  OPT_p,
  OPT_pedantic,
  OPT_pedantic_errors,
  OPT_pie,
  OPT_print_objc_runtime_info,
  OPT_print_pch_checksum,
  OPT_quiet,
  OPT_remap,
  OPT_shared,
  OPT_static_libgfortran,
  OPT_std_c__0x,
  OPT_std_c__98,
  OPT_std_c89,
  OPT_std_c99,
  OPT_std_c9x,
  OPT_std_f2003,
  OPT_std_f2008,
  OPT_std_f95,
  OPT_std_gnu,
  OPT_std_gnu__0x,
  OPT_std_gnu__98,
  OPT_std_gnu89,
  OPT_std_gnu99,
  OPT_std_gnu9x,
  OPT_std_iso9899_1990,
  OPT_std_iso9899_199409,
  OPT_std_iso9899_1999,
  OPT_std_iso9899_199x,
  OPT_std_legacy,
  OPT_traditional_cpp,
  OPT_trigraphs,
  OPT_undef,
  OPT_v,
  OPT_version,
  OPT_w,
  N_OPTS
};
# 33 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 2






enum tree_code {
# 1 "/home/mzorgati/gcc_build/gcc/all-tree.def" 1
# 1 "/home/mzorgati/gcc-4.4.0/gcc/tree.def" 1
# 42 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
ERROR_MARK,





IDENTIFIER_NODE,






TREE_LIST,


TREE_VEC,
# 79 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
BLOCK,
# 133 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
OFFSET_TYPE,
# 146 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
ENUMERAL_TYPE,



BOOLEAN_TYPE,
# 160 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
INTEGER_TYPE,



REAL_TYPE,
# 173 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
POINTER_TYPE,




FIXED_POINT_TYPE,



REFERENCE_TYPE,
# 191 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
COMPLEX_TYPE,




VECTOR_TYPE,
# 212 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
ARRAY_TYPE,
# 222 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
RECORD_TYPE,





UNION_TYPE,





QUAL_UNION_TYPE,






VOID_TYPE,







FUNCTION_TYPE,






METHOD_TYPE,





LANG_TYPE,
# 276 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
INTEGER_CST,


REAL_CST,


FIXED_CST,



COMPLEX_CST,


VECTOR_CST,


STRING_CST,
# 352 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
FUNCTION_DECL,
LABEL_DECL,




FIELD_DECL,
VAR_DECL,
CONST_DECL,
PARM_DECL,
TYPE_DECL,
RESULT_DECL,



NAME_MEMORY_TAG,
SYMBOL_MEMORY_TAG,
MEMORY_PARTITION_TAG,



NAMESPACE_DECL,
# 384 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
IMPORTED_DECL,



TRANSLATION_UNIT_DECL,
# 398 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
COMPONENT_REF,
# 408 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
BIT_FIELD_REF,






INDIRECT_REF,



ALIGN_INDIRECT_REF,






MISALIGNED_INDIRECT_REF,






ARRAY_REF,




ARRAY_RANGE_REF,
# 450 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
OBJ_TYPE_REF,


EXC_PTR_EXPR,


FILTER_EXPR,
# 472 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
CONSTRUCTOR,
# 482 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
COMPOUND_EXPR,


MODIFY_EXPR,




INIT_EXPR,







TARGET_EXPR,
# 512 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
COND_EXPR,
# 524 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
VEC_COND_EXPR,
# 547 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
BIND_EXPR,







CALL_EXPR,






WITH_CLEANUP_EXPR,
# 579 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
CLEANUP_POINT_EXPR,
# 631 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
PLACEHOLDER_EXPR,


PLUS_EXPR,
MINUS_EXPR,
MULT_EXPR,



POINTER_PLUS_EXPR,


TRUNC_DIV_EXPR,


CEIL_DIV_EXPR,


FLOOR_DIV_EXPR,


ROUND_DIV_EXPR,


TRUNC_MOD_EXPR,
CEIL_MOD_EXPR,
FLOOR_MOD_EXPR,
ROUND_MOD_EXPR,


RDIV_EXPR,



EXACT_DIV_EXPR,


FIX_TRUNC_EXPR,


FLOAT_EXPR,


NEGATE_EXPR,




MIN_EXPR,
MAX_EXPR,





ABS_EXPR,
# 701 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
LSHIFT_EXPR,
RSHIFT_EXPR,
LROTATE_EXPR,
RROTATE_EXPR,


BIT_IOR_EXPR,
BIT_XOR_EXPR,
BIT_AND_EXPR,
BIT_NOT_EXPR,
# 721 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
TRUTH_ANDIF_EXPR,
TRUTH_ORIF_EXPR,
TRUTH_AND_EXPR,
TRUTH_OR_EXPR,
TRUTH_XOR_EXPR,
TRUTH_NOT_EXPR,







LT_EXPR,
LE_EXPR,
GT_EXPR,
GE_EXPR,
EQ_EXPR,
NE_EXPR,


UNORDERED_EXPR,
ORDERED_EXPR,


UNLT_EXPR,
UNLE_EXPR,
UNGT_EXPR,
UNGE_EXPR,
UNEQ_EXPR,


LTGT_EXPR,

RANGE_EXPR,



PAREN_EXPR,




CONVERT_EXPR,




FIXED_CONVERT_EXPR,


NOP_EXPR,


NON_LVALUE_EXPR,
# 787 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
VIEW_CONVERT_EXPR,




SAVE_EXPR,



ADDR_EXPR,



FDESC_EXPR,



COMPLEX_EXPR,


CONJ_EXPR,



REALPART_EXPR,
IMAGPART_EXPR,




PREDECREMENT_EXPR,
PREINCREMENT_EXPR,
POSTDECREMENT_EXPR,
POSTINCREMENT_EXPR,


VA_ARG_EXPR,






TRY_CATCH_EXPR,




TRY_FINALLY_EXPR,





DECL_EXPR,




LABEL_EXPR,



GOTO_EXPR,






RETURN_EXPR,



EXIT_EXPR,




LOOP_EXPR,
# 880 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
SWITCH_EXPR,





CASE_LABEL_EXPR,



RESX_EXPR,





ASM_EXPR,




SSA_NAME,



CATCH_EXPR,





EH_FILTER_EXPR,







CHANGE_DYNAMIC_TYPE_EXPR,




SCEV_KNOWN,



SCEV_NOT_KNOWN,



POLYNOMIAL_CHREC,



STATEMENT_LIST,
# 955 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
ASSERT_EXPR,



TREE_BINFO,






WITH_SIZE_EXPR,
# 977 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
REALIGN_LOAD_EXPR,
# 992 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
TARGET_MEM_REF,







OMP_PARALLEL,





OMP_TASK,
# 1027 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
OMP_FOR,




OMP_SECTIONS,




OMP_SINGLE,



OMP_SECTION,



OMP_MASTER,



OMP_ORDERED,




OMP_CRITICAL,







OMP_ATOMIC,


OMP_CLAUSE,







REDUC_MAX_EXPR,
REDUC_MIN_EXPR,
REDUC_PLUS_EXPR,
# 1086 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
DOT_PROD_EXPR,
# 1095 "/home/mzorgati/gcc-4.4.0/gcc/tree.def"
WIDEN_SUM_EXPR,






WIDEN_MULT_EXPR,




VEC_LSHIFT_EXPR,
VEC_RSHIFT_EXPR,






VEC_WIDEN_MULT_HI_EXPR,
VEC_WIDEN_MULT_LO_EXPR,





VEC_UNPACK_HI_EXPR,
VEC_UNPACK_LO_EXPR,





VEC_UNPACK_FLOAT_HI_EXPR,
VEC_UNPACK_FLOAT_LO_EXPR,





VEC_PACK_TRUNC_EXPR,
VEC_PACK_SAT_EXPR,





VEC_PACK_FIX_TRUNC_EXPR,


VEC_EXTRACT_EVEN_EXPR,
VEC_EXTRACT_ODD_EXPR,


VEC_INTERLEAVE_HIGH_EXPR,
VEC_INTERLEAVE_LOW_EXPR,






PREDICT_EXPR,


OPTIMIZATION_NODE,


TARGET_OPTION_NODE,
# 2 "/home/mzorgati/gcc_build/gcc/all-tree.def" 2
LAST_AND_UNUSED_TREE_CODE,
# 1 "/home/mzorgati/gcc-4.4.0/gcc/c-common.def" 1
# 32 "/home/mzorgati/gcc-4.4.0/gcc/c-common.def"
COMPOUND_LITERAL_EXPR,
# 4 "/home/mzorgati/gcc_build/gcc/all-tree.def" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ada/gcc-interface/ada-tree.def" 1
# 30 "/home/mzorgati/gcc-4.4.0/gcc/ada/gcc-interface/ada-tree.def"
UNCONSTRAINED_ARRAY_TYPE,






UNCONSTRAINED_ARRAY_REF,




NULL_EXPR,



PLUS_NOMOD_EXPR,



MINUS_NOMOD_EXPR,




ATTR_ADDR_EXPR,
# 64 "/home/mzorgati/gcc-4.4.0/gcc/ada/gcc-interface/ada-tree.def"
STMT_STMT,






LOOP_STMT,





EXIT_STMT,





REGION_STMT,





HANDLER_STMT,
# 5 "/home/mzorgati/gcc_build/gcc/all-tree.def" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def" 1
# 43 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
OFFSET_REF,




PTRMEM_CST,





NEW_EXPR,
VEC_NEW_EXPR,




DELETE_EXPR,
VEC_DELETE_EXPR,




SCOPE_REF,




MEMBER_REF,



TYPE_EXPR,






AGGR_INIT_EXPR,



THROW_EXPR,



EMPTY_CLASS_EXPR,
# 104 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
BASELINK,
# 121 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
TEMPLATE_DECL,
# 156 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
TEMPLATE_PARM_INDEX,
# 165 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
TEMPLATE_TEMPLATE_PARM,
# 174 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
TEMPLATE_TYPE_PARM,





TYPENAME_TYPE,



TYPEOF_TYPE,





BOUND_TEMPLATE_TEMPLATE_PARM,





UNBOUND_CLASS_TEMPLATE,





USING_DECL,


USING_STMT,




DEFAULT_ARG,






TEMPLATE_ID_EXPR,



OVERLOAD,
# 233 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
PSEUDO_DTOR_EXPR,



MODOP_EXPR,
CAST_EXPR,
REINTERPRET_CAST_EXPR,
CONST_CAST_EXPR,
STATIC_CAST_EXPR,
DYNAMIC_CAST_EXPR,
DOTSTAR_EXPR,
TYPEID_EXPR,
# 255 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
NON_DEPENDENT_EXPR,



CTOR_INITIALIZER,

TRY_BLOCK,

EH_SPEC_BLOCK,





HANDLER,



MUST_NOT_THROW_EXPR,




CLEANUP_STMT,





IF_STMT,



FOR_STMT,



WHILE_STMT,



DO_STMT,


BREAK_STMT,


CONTINUE_STMT,



SWITCH_STMT,



EXPR_STMT,

TAG_DEFN,


OFFSETOF_EXPR,


SIZEOF_EXPR,


ARROW_EXPR,



ALIGNOF_EXPR,




STMT_EXPR,



UNARY_PLUS_EXPR,







STATIC_ASSERT,
# 361 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
TYPE_ARGUMENT_PACK,
# 370 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
NONTYPE_ARGUMENT_PACK,
# 393 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
TYPE_PACK_EXPANSION,






EXPR_PACK_EXPANSION,
# 412 "/home/mzorgati/gcc-4.4.0/gcc/cp/cp-tree.def"
ARGUMENT_PACK_SELECT,




TRAIT_EXPR,






DECLTYPE_TYPE,
# 6 "/home/mzorgati/gcc_build/gcc/all-tree.def" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/java/java-tree.def" 1
# 23 "/home/mzorgati/gcc-4.4.0/gcc/java/java-tree.def"
URSHIFT_EXPR,



COMPARE_EXPR,


COMPARE_L_EXPR,

COMPARE_G_EXPR,
# 7 "/home/mzorgati/gcc_build/gcc/all-tree.def" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/objc/objc-tree.def" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/objc/objc-tree.def"
CLASS_INTERFACE_TYPE,
CLASS_IMPLEMENTATION_TYPE,

CATEGORY_INTERFACE_TYPE,
CATEGORY_IMPLEMENTATION_TYPE,

PROTOCOL_INTERFACE_TYPE,


KEYWORD_DECL,
INSTANCE_METHOD_DECL,
CLASS_METHOD_DECL,


MESSAGE_SEND_EXPR,
CLASS_REFERENCE_EXPR,
# 7 "/home/mzorgati/gcc_build/gcc/all-tree.def" 2
# 41 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 2
MAX_TREE_CODES
};




extern unsigned char tree_contains_struct[MAX_TREE_CODES][64];
# 58 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
enum tree_code_class {
  tcc_exceptional,
  tcc_constant,

  tcc_type,
  tcc_declaration,
  tcc_reference,
  tcc_comparison,
  tcc_unary,
  tcc_binary,
  tcc_statement,

  tcc_vl_exp,

  tcc_expression
};




extern const char *const tree_code_class_strings[];






extern const enum tree_code_class tree_code_type[];
# 182 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern const unsigned char tree_code_length[];




extern const char *const tree_code_name[];


static __inline__ void VEC_tree_must_be_pointer_type (void) { (void)((tree)1 == (void *)1); } typedef struct VEC_tree_base { unsigned num; unsigned alloc; tree vec[1]; } VEC_tree_base; typedef struct VEC_tree_none { VEC_tree_base base; } VEC_tree_none; static __inline__ unsigned VEC_tree_base_length (const VEC_tree_base *vec_) { return vec_ ? vec_->num : 0; } static __inline__ tree VEC_tree_base_last (const VEC_tree_base *vec_ ) { (void)(vec_ && vec_->num); return vec_->vec[vec_->num - 1]; } static __inline__ tree VEC_tree_base_index (const VEC_tree_base *vec_, unsigned ix_ ) { (void)(vec_ && ix_ < vec_->num); return vec_->vec[ix_]; } static __inline__ int VEC_tree_base_iterate (const VEC_tree_base *vec_, unsigned ix_, tree *ptr) { if (vec_ && ix_ < vec_->num) { *ptr = vec_->vec[ix_]; return 1; } else { *ptr = 0; return 0; } } static __inline__ size_t VEC_tree_base_embedded_size (int alloc_) { return __builtin_offsetof (VEC_tree_base, vec) + alloc_ * sizeof(tree); } static __inline__ void VEC_tree_base_embedded_init (VEC_tree_base *vec_, int alloc_) { vec_->num = 0; vec_->alloc = alloc_; } static __inline__ int VEC_tree_base_space (VEC_tree_base *vec_, int alloc_ ) { (void)(alloc_ >= 0); return vec_ ? vec_->alloc - vec_->num >= (unsigned)alloc_ : !alloc_; } static __inline__ tree *VEC_tree_base_quick_push (VEC_tree_base *vec_, tree obj_ ) { tree *slot_; (void)(vec_->num < vec_->alloc); slot_ = &vec_->vec[vec_->num++]; *slot_ = obj_; return slot_; } static __inline__ tree VEC_tree_base_pop (VEC_tree_base *vec_ ) { tree obj_; (void)(vec_->num); obj_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_tree_base_truncate (VEC_tree_base *vec_, unsigned size_ ) { (void)(vec_ ? vec_->num >= size_ : !size_); if (vec_) vec_->num = size_; } static __inline__ tree VEC_tree_base_replace (VEC_tree_base *vec_, unsigned ix_, tree obj_ ) { tree old_obj_; (void)(ix_ < vec_->num); old_obj_ = vec_->vec[ix_]; vec_->vec[ix_] = obj_; return old_obj_; } static __inline__ tree *VEC_tree_base_quick_insert (VEC_tree_base *vec_, unsigned ix_, tree obj_ ) { tree *slot_; (void)(vec_->num < vec_->alloc); (void)(ix_ <= vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_ + 1, slot_, (vec_->num++ - ix_) * sizeof (tree)); *slot_ = obj_; return slot_; } static __inline__ tree VEC_tree_base_ordered_remove (VEC_tree_base *vec_, unsigned ix_ ) { tree *slot_; tree obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; memmove (slot_, slot_ + 1, (--vec_->num - ix_) * sizeof (tree)); return obj_; } static __inline__ tree VEC_tree_base_unordered_remove (VEC_tree_base *vec_, unsigned ix_ ) { tree *slot_; tree obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; *slot_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_tree_base_block_remove (VEC_tree_base *vec_, unsigned ix_, unsigned len_ ) { tree *slot_; (void)(ix_ + len_ <= vec_->num); slot_ = &vec_->vec[ix_]; vec_->num -= len_; memmove (slot_, slot_ + len_, (vec_->num - ix_) * sizeof (tree)); } static __inline__ tree *VEC_tree_base_address (VEC_tree_base *vec_) { return vec_ ? vec_->vec : 0; } static __inline__ unsigned VEC_tree_base_lower_bound (VEC_tree_base *vec_, const tree obj_, unsigned char (*lessthan_)(const tree, const tree) ) { unsigned int len_ = VEC_tree_base_length (vec_); unsigned int half_, middle_; unsigned int first_ = 0; while (len_ > 0) { tree middle_elem_; half_ = len_ >> 1; middle_ = first_; middle_ += half_; middle_elem_ = VEC_tree_base_index (vec_, middle_ ); if (lessthan_ (middle_elem_, obj_)) { first_ = middle_; ++first_; len_ = len_ - half_ - 1; } else len_ = half_; } return first_; } struct vec_swallow_trailing_semi;
typedef struct VEC_tree_gc { VEC_tree_base base; } VEC_tree_gc; static __inline__ VEC_tree_gc *VEC_tree_gc_alloc (int alloc_ ) { return (VEC_tree_gc *) vec_gc_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_tree_gc_free (VEC_tree_gc **vec_) { if (*vec_) ggc_free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_tree_gc *VEC_tree_gc_copy (VEC_tree_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_tree_gc *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_tree_gc *)(vec_gc_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (tree) * len_); } return new_vec_; } static __inline__ int VEC_tree_gc_reserve (VEC_tree_gc **vec_, int alloc_ ) { int extend = !VEC_tree_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_tree_gc *) vec_gc_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_tree_gc_reserve_exact (VEC_tree_gc **vec_, int alloc_ ) { int extend = !VEC_tree_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_tree_gc *) vec_gc_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_tree_gc_safe_grow (VEC_tree_gc **vec_, int size_ ) { (void)(size_ >= 0 && VEC_tree_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_tree_gc_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_tree_gc_safe_grow_cleared (VEC_tree_gc **vec_, int size_ ) { int oldsize = VEC_tree_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_tree_gc_safe_grow (vec_, size_ ); memset (&(VEC_tree_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (tree) * (size_ - oldsize)); } static __inline__ tree *VEC_tree_gc_safe_push (VEC_tree_gc **vec_, tree obj_ ) { VEC_tree_gc_reserve (vec_, 1 ); return VEC_tree_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ tree *VEC_tree_gc_safe_insert (VEC_tree_gc **vec_, unsigned ix_, tree obj_ ) { VEC_tree_gc_reserve (vec_, 1 ); return VEC_tree_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;
typedef struct VEC_tree_heap { VEC_tree_base base; } VEC_tree_heap; static __inline__ VEC_tree_heap *VEC_tree_heap_alloc (int alloc_ ) { return (VEC_tree_heap *) vec_heap_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_tree_heap_free (VEC_tree_heap **vec_) { if (*vec_) free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_tree_heap *VEC_tree_heap_copy (VEC_tree_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_tree_heap *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_tree_heap *)(vec_heap_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (tree) * len_); } return new_vec_; } static __inline__ int VEC_tree_heap_reserve (VEC_tree_heap **vec_, int alloc_ ) { int extend = !VEC_tree_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_tree_heap *) vec_heap_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_tree_heap_reserve_exact (VEC_tree_heap **vec_, int alloc_ ) { int extend = !VEC_tree_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_tree_heap *) vec_heap_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_tree_heap_safe_grow (VEC_tree_heap **vec_, int size_ ) { (void)(size_ >= 0 && VEC_tree_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_tree_heap_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_tree_heap_safe_grow_cleared (VEC_tree_heap **vec_, int size_ ) { int oldsize = VEC_tree_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_tree_heap_safe_grow (vec_, size_ ); memset (&(VEC_tree_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (tree) * (size_ - oldsize)); } static __inline__ tree *VEC_tree_heap_safe_push (VEC_tree_heap **vec_, tree obj_ ) { VEC_tree_heap_reserve (vec_, 1 ); return VEC_tree_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ tree *VEC_tree_heap_safe_insert (VEC_tree_heap **vec_, unsigned ix_, tree obj_ ) { VEC_tree_heap_reserve (vec_, 1 ); return VEC_tree_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;




enum built_in_class
{
  NOT_BUILT_IN = 0,
  BUILT_IN_FRONTEND,
  BUILT_IN_MD,
  BUILT_IN_NORMAL
};


extern const char *const built_in_class_names[4];





enum built_in_function
{
# 1 "/home/mzorgati/gcc-4.4.0/gcc/builtins.def" 1
# 177 "/home/mzorgati/gcc-4.4.0/gcc/builtins.def"
BUILT_IN_ACOS,
BUILT_IN_ACOSF,
BUILT_IN_ACOSH,
BUILT_IN_ACOSHF,
BUILT_IN_ACOSHL,
BUILT_IN_ACOSL,
BUILT_IN_ASIN,
BUILT_IN_ASINF,
BUILT_IN_ASINH,
BUILT_IN_ASINHF,
BUILT_IN_ASINHL,
BUILT_IN_ASINL,
BUILT_IN_ATAN,
BUILT_IN_ATAN2,
BUILT_IN_ATAN2F,
BUILT_IN_ATAN2L,
BUILT_IN_ATANF,
BUILT_IN_ATANH,
BUILT_IN_ATANHF,
BUILT_IN_ATANHL,
BUILT_IN_ATANL,
BUILT_IN_CBRT,
BUILT_IN_CBRTF,
BUILT_IN_CBRTL,
BUILT_IN_CEIL,
BUILT_IN_CEILF,
BUILT_IN_CEILL,
BUILT_IN_COPYSIGN,
BUILT_IN_COPYSIGNF,
BUILT_IN_COPYSIGNL,
BUILT_IN_COS,
BUILT_IN_COSF,
BUILT_IN_COSH,
BUILT_IN_COSHF,
BUILT_IN_COSHL,
BUILT_IN_COSL,
BUILT_IN_DREM,
BUILT_IN_DREMF,
BUILT_IN_DREML,
BUILT_IN_ERF,
BUILT_IN_ERFC,
BUILT_IN_ERFCF,
BUILT_IN_ERFCL,
BUILT_IN_ERFF,
BUILT_IN_ERFL,
BUILT_IN_EXP,
BUILT_IN_EXP10,
BUILT_IN_EXP10F,
BUILT_IN_EXP10L,
BUILT_IN_EXP2,
BUILT_IN_EXP2F,
BUILT_IN_EXP2L,
BUILT_IN_EXPF,
BUILT_IN_EXPL,
BUILT_IN_EXPM1,
BUILT_IN_EXPM1F,
BUILT_IN_EXPM1L,
BUILT_IN_FABS,
BUILT_IN_FABSF,
BUILT_IN_FABSL,
BUILT_IN_FDIM,
BUILT_IN_FDIMF,
BUILT_IN_FDIML,
BUILT_IN_FLOOR,
BUILT_IN_FLOORF,
BUILT_IN_FLOORL,
BUILT_IN_FMA,
BUILT_IN_FMAF,
BUILT_IN_FMAL,
BUILT_IN_FMAX,
BUILT_IN_FMAXF,
BUILT_IN_FMAXL,
BUILT_IN_FMIN,
BUILT_IN_FMINF,
BUILT_IN_FMINL,
BUILT_IN_FMOD,
BUILT_IN_FMODF,
BUILT_IN_FMODL,
BUILT_IN_FREXP,
BUILT_IN_FREXPF,
BUILT_IN_FREXPL,
BUILT_IN_GAMMA,
BUILT_IN_GAMMAF,
BUILT_IN_GAMMAL,
BUILT_IN_GAMMA_R,
BUILT_IN_GAMMAF_R,
BUILT_IN_GAMMAL_R,
BUILT_IN_HUGE_VAL,
BUILT_IN_HUGE_VALF,
BUILT_IN_HUGE_VALL,
BUILT_IN_HYPOT,
BUILT_IN_HYPOTF,
BUILT_IN_HYPOTL,
BUILT_IN_ILOGB,
BUILT_IN_ILOGBF,
BUILT_IN_ILOGBL,
BUILT_IN_INF,
BUILT_IN_INFF,
BUILT_IN_INFL,
BUILT_IN_INFD32,
BUILT_IN_INFD64,
BUILT_IN_INFD128,
BUILT_IN_J0,
BUILT_IN_J0F,
BUILT_IN_J0L,
BUILT_IN_J1,
BUILT_IN_J1F,
BUILT_IN_J1L,
BUILT_IN_JN,
BUILT_IN_JNF,
BUILT_IN_JNL,
BUILT_IN_LCEIL,
BUILT_IN_LCEILF,
BUILT_IN_LCEILL,
BUILT_IN_LDEXP,
BUILT_IN_LDEXPF,
BUILT_IN_LDEXPL,
BUILT_IN_LFLOOR,
BUILT_IN_LFLOORF,
BUILT_IN_LFLOORL,
BUILT_IN_LGAMMA,
BUILT_IN_LGAMMAF,
BUILT_IN_LGAMMAL,
BUILT_IN_LGAMMA_R,
BUILT_IN_LGAMMAF_R,
BUILT_IN_LGAMMAL_R,
BUILT_IN_LLCEIL,
BUILT_IN_LLCEILF,
BUILT_IN_LLCEILL,
BUILT_IN_LLFLOOR,
BUILT_IN_LLFLOORF,
BUILT_IN_LLFLOORL,
BUILT_IN_LLRINT,
BUILT_IN_LLRINTF,
BUILT_IN_LLRINTL,
BUILT_IN_LLROUND,
BUILT_IN_LLROUNDF,
BUILT_IN_LLROUNDL,
BUILT_IN_LOG,
BUILT_IN_LOG10,
BUILT_IN_LOG10F,
BUILT_IN_LOG10L,
BUILT_IN_LOG1P,
BUILT_IN_LOG1PF,
BUILT_IN_LOG1PL,
BUILT_IN_LOG2,
BUILT_IN_LOG2F,
BUILT_IN_LOG2L,
BUILT_IN_LOGB,
BUILT_IN_LOGBF,
BUILT_IN_LOGBL,
BUILT_IN_LOGF,
BUILT_IN_LOGL,
BUILT_IN_LRINT,
BUILT_IN_LRINTF,
BUILT_IN_LRINTL,
BUILT_IN_LROUND,
BUILT_IN_LROUNDF,
BUILT_IN_LROUNDL,
BUILT_IN_MODF,
BUILT_IN_MODFF,
BUILT_IN_MODFL,
BUILT_IN_NAN,
BUILT_IN_NANF,
BUILT_IN_NANL,
BUILT_IN_NAND32,
BUILT_IN_NAND64,
BUILT_IN_NAND128,
BUILT_IN_NANS,
BUILT_IN_NANSF,
BUILT_IN_NANSL,
BUILT_IN_NEARBYINT,
BUILT_IN_NEARBYINTF,
BUILT_IN_NEARBYINTL,
BUILT_IN_NEXTAFTER,
BUILT_IN_NEXTAFTERF,
BUILT_IN_NEXTAFTERL,
BUILT_IN_NEXTTOWARD,
BUILT_IN_NEXTTOWARDF,
BUILT_IN_NEXTTOWARDL,
BUILT_IN_POW,
BUILT_IN_POW10,
BUILT_IN_POW10F,
BUILT_IN_POW10L,
BUILT_IN_POWF,
BUILT_IN_POWI,
BUILT_IN_POWIF,
BUILT_IN_POWIL,
BUILT_IN_POWL,
BUILT_IN_REMAINDER,
BUILT_IN_REMAINDERF,
BUILT_IN_REMAINDERL,
BUILT_IN_REMQUO,
BUILT_IN_REMQUOF,
BUILT_IN_REMQUOL,
BUILT_IN_RINT,
BUILT_IN_RINTF,
BUILT_IN_RINTL,
BUILT_IN_ROUND,
BUILT_IN_ROUNDF,
BUILT_IN_ROUNDL,
BUILT_IN_SCALB,
BUILT_IN_SCALBF,
BUILT_IN_SCALBL,
BUILT_IN_SCALBLN,
BUILT_IN_SCALBLNF,
BUILT_IN_SCALBLNL,
BUILT_IN_SCALBN,
BUILT_IN_SCALBNF,
BUILT_IN_SCALBNL,
BUILT_IN_SIGNBIT,
BUILT_IN_SIGNBITF,
BUILT_IN_SIGNBITL,
BUILT_IN_SIGNBITD32,
BUILT_IN_SIGNBITD64,
BUILT_IN_SIGNBITD128,
BUILT_IN_SIGNIFICAND,
BUILT_IN_SIGNIFICANDF,
BUILT_IN_SIGNIFICANDL,
BUILT_IN_SIN,
BUILT_IN_SINCOS,
BUILT_IN_SINCOSF,
BUILT_IN_SINCOSL,
BUILT_IN_SINF,
BUILT_IN_SINH,
BUILT_IN_SINHF,
BUILT_IN_SINHL,
BUILT_IN_SINL,
BUILT_IN_SQRT,
BUILT_IN_SQRTF,
BUILT_IN_SQRTL,
BUILT_IN_TAN,
BUILT_IN_TANF,
BUILT_IN_TANH,
BUILT_IN_TANHF,
BUILT_IN_TANHL,
BUILT_IN_TANL,
BUILT_IN_TGAMMA,
BUILT_IN_TGAMMAF,
BUILT_IN_TGAMMAL,
BUILT_IN_TRUNC,
BUILT_IN_TRUNCF,
BUILT_IN_TRUNCL,
BUILT_IN_Y0,
BUILT_IN_Y0F,
BUILT_IN_Y0L,
BUILT_IN_Y1,
BUILT_IN_Y1F,
BUILT_IN_Y1L,
BUILT_IN_YN,
BUILT_IN_YNF,
BUILT_IN_YNL,


BUILT_IN_CABS,
BUILT_IN_CABSF,
BUILT_IN_CABSL,
BUILT_IN_CACOS,
BUILT_IN_CACOSF,
BUILT_IN_CACOSH,
BUILT_IN_CACOSHF,
BUILT_IN_CACOSHL,
BUILT_IN_CACOSL,
BUILT_IN_CARG,
BUILT_IN_CARGF,
BUILT_IN_CARGL,
BUILT_IN_CASIN,
BUILT_IN_CASINF,
BUILT_IN_CASINH,
BUILT_IN_CASINHF,
BUILT_IN_CASINHL,
BUILT_IN_CASINL,
BUILT_IN_CATAN,
BUILT_IN_CATANF,
BUILT_IN_CATANH,
BUILT_IN_CATANHF,
BUILT_IN_CATANHL,
BUILT_IN_CATANL,
BUILT_IN_CCOS,
BUILT_IN_CCOSF,
BUILT_IN_CCOSH,
BUILT_IN_CCOSHF,
BUILT_IN_CCOSHL,
BUILT_IN_CCOSL,
BUILT_IN_CEXP,
BUILT_IN_CEXPF,
BUILT_IN_CEXPL,
BUILT_IN_CEXPI,
BUILT_IN_CEXPIF,
BUILT_IN_CEXPIL,
BUILT_IN_CIMAG,
BUILT_IN_CIMAGF,
BUILT_IN_CIMAGL,
BUILT_IN_CLOG,
BUILT_IN_CLOGF,
BUILT_IN_CLOGL,
BUILT_IN_CLOG10,
BUILT_IN_CLOG10F,
BUILT_IN_CLOG10L,
BUILT_IN_CONJ,
BUILT_IN_CONJF,
BUILT_IN_CONJL,
BUILT_IN_CPOW,
BUILT_IN_CPOWF,
BUILT_IN_CPOWL,
BUILT_IN_CPROJ,
BUILT_IN_CPROJF,
BUILT_IN_CPROJL,
BUILT_IN_CREAL,
BUILT_IN_CREALF,
BUILT_IN_CREALL,
BUILT_IN_CSIN,
BUILT_IN_CSINF,
BUILT_IN_CSINH,
BUILT_IN_CSINHF,
BUILT_IN_CSINHL,
BUILT_IN_CSINL,
BUILT_IN_CSQRT,
BUILT_IN_CSQRTF,
BUILT_IN_CSQRTL,
BUILT_IN_CTAN,
BUILT_IN_CTANF,
BUILT_IN_CTANH,
BUILT_IN_CTANHF,
BUILT_IN_CTANHL,
BUILT_IN_CTANL,




BUILT_IN_BCMP,
BUILT_IN_BCOPY,
BUILT_IN_BZERO,
BUILT_IN_INDEX,
BUILT_IN_MEMCHR,
BUILT_IN_MEMCMP,
BUILT_IN_MEMCPY,
BUILT_IN_MEMMOVE,
BUILT_IN_MEMPCPY,
BUILT_IN_MEMSET,
BUILT_IN_RINDEX,
BUILT_IN_STPCPY,
BUILT_IN_STPNCPY,
BUILT_IN_STRCASECMP,
BUILT_IN_STRCAT,
BUILT_IN_STRCHR,
BUILT_IN_STRCMP,
BUILT_IN_STRCPY,
BUILT_IN_STRCSPN,
BUILT_IN_STRDUP,
BUILT_IN_STRNDUP,
BUILT_IN_STRLEN,
BUILT_IN_STRNCASECMP,
BUILT_IN_STRNCAT,
BUILT_IN_STRNCMP,
BUILT_IN_STRNCPY,
BUILT_IN_STRPBRK,
BUILT_IN_STRRCHR,
BUILT_IN_STRSPN,
BUILT_IN_STRSTR,


BUILT_IN_FPRINTF,
BUILT_IN_FPRINTF_UNLOCKED,
BUILT_IN_PUTC,
BUILT_IN_PUTC_UNLOCKED,
BUILT_IN_FPUTC,
BUILT_IN_FPUTC_UNLOCKED,
BUILT_IN_FPUTS,
BUILT_IN_FPUTS_UNLOCKED,
BUILT_IN_FSCANF,
BUILT_IN_FWRITE,
BUILT_IN_FWRITE_UNLOCKED,
BUILT_IN_PRINTF,
BUILT_IN_PRINTF_UNLOCKED,
BUILT_IN_PUTCHAR,
BUILT_IN_PUTCHAR_UNLOCKED,
BUILT_IN_PUTS,
BUILT_IN_PUTS_UNLOCKED,
BUILT_IN_SCANF,
BUILT_IN_SNPRINTF,
BUILT_IN_SPRINTF,
BUILT_IN_SSCANF,
BUILT_IN_VFPRINTF,
BUILT_IN_VFSCANF,
BUILT_IN_VPRINTF,
BUILT_IN_VSCANF,
BUILT_IN_VSNPRINTF,
BUILT_IN_VSPRINTF,
BUILT_IN_VSSCANF,


BUILT_IN_ISALNUM,
BUILT_IN_ISALPHA,
BUILT_IN_ISASCII,
BUILT_IN_ISBLANK,
BUILT_IN_ISCNTRL,
BUILT_IN_ISDIGIT,
BUILT_IN_ISGRAPH,
BUILT_IN_ISLOWER,
BUILT_IN_ISPRINT,
BUILT_IN_ISPUNCT,
BUILT_IN_ISSPACE,
BUILT_IN_ISUPPER,
BUILT_IN_ISXDIGIT,
BUILT_IN_TOASCII,
BUILT_IN_TOLOWER,
BUILT_IN_TOUPPER,


BUILT_IN_ISWALNUM,
BUILT_IN_ISWALPHA,
BUILT_IN_ISWBLANK,
BUILT_IN_ISWCNTRL,
BUILT_IN_ISWDIGIT,
BUILT_IN_ISWGRAPH,
BUILT_IN_ISWLOWER,
BUILT_IN_ISWPRINT,
BUILT_IN_ISWPUNCT,
BUILT_IN_ISWSPACE,
BUILT_IN_ISWUPPER,
BUILT_IN_ISWXDIGIT,
BUILT_IN_TOWLOWER,
BUILT_IN_TOWUPPER,


BUILT_IN_ABORT,
BUILT_IN_ABS,
BUILT_IN_AGGREGATE_INCOMING_ADDRESS,
BUILT_IN_ALLOCA,
BUILT_IN_APPLY,
BUILT_IN_APPLY_ARGS,
BUILT_IN_ARGS_INFO,
BUILT_IN_BSWAP32,
BUILT_IN_BSWAP64,
BUILT_IN_CLEAR_CACHE,
BUILT_IN_CALLOC,
BUILT_IN_CLASSIFY_TYPE,
BUILT_IN_CLZ,
BUILT_IN_CLZIMAX,
BUILT_IN_CLZL,
BUILT_IN_CLZLL,
BUILT_IN_CONSTANT_P,
BUILT_IN_CTZ,
BUILT_IN_CTZIMAX,
BUILT_IN_CTZL,
BUILT_IN_CTZLL,
BUILT_IN_DCGETTEXT,
BUILT_IN_DGETTEXT,
BUILT_IN_DWARF_CFA,
BUILT_IN_DWARF_SP_COLUMN,
BUILT_IN_EH_RETURN,
BUILT_IN_EH_RETURN_DATA_REGNO,
BUILT_IN_EXECL,
BUILT_IN_EXECLP,
BUILT_IN_EXECLE,
BUILT_IN_EXECV,
BUILT_IN_EXECVP,
BUILT_IN_EXECVE,
BUILT_IN_EXIT,
BUILT_IN_EXPECT,
BUILT_IN_EXTEND_POINTER,
BUILT_IN_EXTRACT_RETURN_ADDR,
BUILT_IN_FFS,
BUILT_IN_FFSIMAX,
BUILT_IN_FFSL,
BUILT_IN_FFSLL,
BUILT_IN_FORK,
BUILT_IN_FRAME_ADDRESS,
BUILT_IN_FREE,
BUILT_IN_FROB_RETURN_ADDR,
BUILT_IN_GETTEXT,
BUILT_IN_IMAXABS,
BUILT_IN_INIT_DWARF_REG_SIZES,
BUILT_IN_FINITE,
BUILT_IN_FINITEF,
BUILT_IN_FINITEL,
BUILT_IN_FINITED32,
BUILT_IN_FINITED64,
BUILT_IN_FINITED128,
BUILT_IN_FPCLASSIFY,
BUILT_IN_ISFINITE,
BUILT_IN_ISINF_SIGN,
BUILT_IN_ISINF,
BUILT_IN_ISINFF,
BUILT_IN_ISINFL,
BUILT_IN_ISINFD32,
BUILT_IN_ISINFD64,
BUILT_IN_ISINFD128,
BUILT_IN_ISNAN,
BUILT_IN_ISNANF,
BUILT_IN_ISNANL,
BUILT_IN_ISNAND32,
BUILT_IN_ISNAND64,
BUILT_IN_ISNAND128,
BUILT_IN_ISNORMAL,
BUILT_IN_ISGREATER,
BUILT_IN_ISGREATEREQUAL,
BUILT_IN_ISLESS,
BUILT_IN_ISLESSEQUAL,
BUILT_IN_ISLESSGREATER,
BUILT_IN_ISUNORDERED,
BUILT_IN_LABS,
BUILT_IN_LLABS,
BUILT_IN_LONGJMP,
BUILT_IN_MALLOC,
BUILT_IN_NEXT_ARG,
BUILT_IN_PARITY,
BUILT_IN_PARITYIMAX,
BUILT_IN_PARITYL,
BUILT_IN_PARITYLL,
BUILT_IN_POPCOUNT,
BUILT_IN_POPCOUNTIMAX,
BUILT_IN_POPCOUNTL,
BUILT_IN_POPCOUNTLL,
BUILT_IN_PREFETCH,
BUILT_IN_REALLOC,
BUILT_IN_RETURN,
BUILT_IN_RETURN_ADDRESS,
BUILT_IN_SAVEREGS,
BUILT_IN_SETJMP,
BUILT_IN_STRFMON,
BUILT_IN_STRFTIME,
BUILT_IN_TRAP,
BUILT_IN_UNWIND_INIT,
BUILT_IN_UPDATE_SETJMP_BUF,
BUILT_IN_VA_COPY,
BUILT_IN_VA_END,
BUILT_IN_VA_START,
BUILT_IN_VA_ARG_PACK,
BUILT_IN_VA_ARG_PACK_LEN,
BUILT_IN__EXIT,
BUILT_IN__EXIT2,


BUILT_IN_INIT_TRAMPOLINE,
BUILT_IN_ADJUST_TRAMPOLINE,
BUILT_IN_NONLOCAL_GOTO,


BUILT_IN_SETJMP_SETUP,
BUILT_IN_SETJMP_DISPATCHER,
BUILT_IN_SETJMP_RECEIVER,


BUILT_IN_STACK_SAVE,
BUILT_IN_STACK_RESTORE,


BUILT_IN_OBJECT_SIZE,
BUILT_IN_MEMCPY_CHK,
BUILT_IN_MEMMOVE_CHK,
BUILT_IN_MEMPCPY_CHK,
BUILT_IN_MEMSET_CHK,
BUILT_IN_STPCPY_CHK,
BUILT_IN_STRCAT_CHK,
BUILT_IN_STRCPY_CHK,
BUILT_IN_STRNCAT_CHK,
BUILT_IN_STRNCPY_CHK,
BUILT_IN_SNPRINTF_CHK,
BUILT_IN_SPRINTF_CHK,
BUILT_IN_VSNPRINTF_CHK,
BUILT_IN_VSPRINTF_CHK,
BUILT_IN_FPRINTF_CHK,
BUILT_IN_PRINTF_CHK,
BUILT_IN_VFPRINTF_CHK,
BUILT_IN_VPRINTF_CHK,


BUILT_IN_PROFILE_FUNC_ENTER,
BUILT_IN_PROFILE_FUNC_EXIT,


BUILT_IN_EMUTLS_GET_ADDRESS,




BUILT_IN_EMUTLS_REGISTER_COMMON,






# 1 "/home/mzorgati/gcc-4.4.0/gcc/sync-builtins.def" 1
# 31 "/home/mzorgati/gcc-4.4.0/gcc/sync-builtins.def"
BUILT_IN_FETCH_AND_ADD_N,

BUILT_IN_FETCH_AND_ADD_1,

BUILT_IN_FETCH_AND_ADD_2,

BUILT_IN_FETCH_AND_ADD_4,

BUILT_IN_FETCH_AND_ADD_8,

BUILT_IN_FETCH_AND_ADD_16,


BUILT_IN_FETCH_AND_SUB_N,

BUILT_IN_FETCH_AND_SUB_1,

BUILT_IN_FETCH_AND_SUB_2,

BUILT_IN_FETCH_AND_SUB_4,

BUILT_IN_FETCH_AND_SUB_8,

BUILT_IN_FETCH_AND_SUB_16,


BUILT_IN_FETCH_AND_OR_N,

BUILT_IN_FETCH_AND_OR_1,

BUILT_IN_FETCH_AND_OR_2,

BUILT_IN_FETCH_AND_OR_4,

BUILT_IN_FETCH_AND_OR_8,

BUILT_IN_FETCH_AND_OR_16,


BUILT_IN_FETCH_AND_AND_N,

BUILT_IN_FETCH_AND_AND_1,

BUILT_IN_FETCH_AND_AND_2,

BUILT_IN_FETCH_AND_AND_4,

BUILT_IN_FETCH_AND_AND_8,

BUILT_IN_FETCH_AND_AND_16,


BUILT_IN_FETCH_AND_XOR_N,

BUILT_IN_FETCH_AND_XOR_1,

BUILT_IN_FETCH_AND_XOR_2,

BUILT_IN_FETCH_AND_XOR_4,

BUILT_IN_FETCH_AND_XOR_8,

BUILT_IN_FETCH_AND_XOR_16,


BUILT_IN_FETCH_AND_NAND_N,

BUILT_IN_FETCH_AND_NAND_1,

BUILT_IN_FETCH_AND_NAND_2,

BUILT_IN_FETCH_AND_NAND_4,

BUILT_IN_FETCH_AND_NAND_8,

BUILT_IN_FETCH_AND_NAND_16,


BUILT_IN_ADD_AND_FETCH_N,

BUILT_IN_ADD_AND_FETCH_1,

BUILT_IN_ADD_AND_FETCH_2,

BUILT_IN_ADD_AND_FETCH_4,

BUILT_IN_ADD_AND_FETCH_8,

BUILT_IN_ADD_AND_FETCH_16,


BUILT_IN_SUB_AND_FETCH_N,

BUILT_IN_SUB_AND_FETCH_1,

BUILT_IN_SUB_AND_FETCH_2,

BUILT_IN_SUB_AND_FETCH_4,

BUILT_IN_SUB_AND_FETCH_8,

BUILT_IN_SUB_AND_FETCH_16,


BUILT_IN_OR_AND_FETCH_N,

BUILT_IN_OR_AND_FETCH_1,

BUILT_IN_OR_AND_FETCH_2,

BUILT_IN_OR_AND_FETCH_4,

BUILT_IN_OR_AND_FETCH_8,

BUILT_IN_OR_AND_FETCH_16,


BUILT_IN_AND_AND_FETCH_N,

BUILT_IN_AND_AND_FETCH_1,

BUILT_IN_AND_AND_FETCH_2,

BUILT_IN_AND_AND_FETCH_4,

BUILT_IN_AND_AND_FETCH_8,

BUILT_IN_AND_AND_FETCH_16,


BUILT_IN_XOR_AND_FETCH_N,

BUILT_IN_XOR_AND_FETCH_1,

BUILT_IN_XOR_AND_FETCH_2,

BUILT_IN_XOR_AND_FETCH_4,

BUILT_IN_XOR_AND_FETCH_8,

BUILT_IN_XOR_AND_FETCH_16,


BUILT_IN_NAND_AND_FETCH_N,

BUILT_IN_NAND_AND_FETCH_1,

BUILT_IN_NAND_AND_FETCH_2,

BUILT_IN_NAND_AND_FETCH_4,

BUILT_IN_NAND_AND_FETCH_8,

BUILT_IN_NAND_AND_FETCH_16,


BUILT_IN_BOOL_COMPARE_AND_SWAP_N,


BUILT_IN_BOOL_COMPARE_AND_SWAP_1,


BUILT_IN_BOOL_COMPARE_AND_SWAP_2,


BUILT_IN_BOOL_COMPARE_AND_SWAP_4,


BUILT_IN_BOOL_COMPARE_AND_SWAP_8,


BUILT_IN_BOOL_COMPARE_AND_SWAP_16,



BUILT_IN_VAL_COMPARE_AND_SWAP_N,


BUILT_IN_VAL_COMPARE_AND_SWAP_1,


BUILT_IN_VAL_COMPARE_AND_SWAP_2,


BUILT_IN_VAL_COMPARE_AND_SWAP_4,


BUILT_IN_VAL_COMPARE_AND_SWAP_8,


BUILT_IN_VAL_COMPARE_AND_SWAP_16,



BUILT_IN_LOCK_TEST_AND_SET_N,

BUILT_IN_LOCK_TEST_AND_SET_1,

BUILT_IN_LOCK_TEST_AND_SET_2,

BUILT_IN_LOCK_TEST_AND_SET_4,

BUILT_IN_LOCK_TEST_AND_SET_8,

BUILT_IN_LOCK_TEST_AND_SET_16,


BUILT_IN_LOCK_RELEASE_N,

BUILT_IN_LOCK_RELEASE_1,

BUILT_IN_LOCK_RELEASE_2,

BUILT_IN_LOCK_RELEASE_4,

BUILT_IN_LOCK_RELEASE_8,

BUILT_IN_LOCK_RELEASE_16,


BUILT_IN_SYNCHRONIZE,
# 763 "/home/mzorgati/gcc-4.4.0/gcc/builtins.def" 2


# 1 "/home/mzorgati/gcc-4.4.0/gcc/omp-builtins.def" 1
# 27 "/home/mzorgati/gcc-4.4.0/gcc/omp-builtins.def"
BUILT_IN_OMP_GET_THREAD_NUM,

BUILT_IN_OMP_GET_NUM_THREADS,


BUILT_IN_GOMP_ATOMIC_START,

BUILT_IN_GOMP_ATOMIC_END,

BUILT_IN_GOMP_BARRIER,

BUILT_IN_GOMP_TASKWAIT,

BUILT_IN_GOMP_CRITICAL_START,

BUILT_IN_GOMP_CRITICAL_END,

BUILT_IN_GOMP_CRITICAL_NAME_START,


BUILT_IN_GOMP_CRITICAL_NAME_END,





BUILT_IN_GOMP_LOOP_STATIC_START,



BUILT_IN_GOMP_LOOP_DYNAMIC_START,



BUILT_IN_GOMP_LOOP_GUIDED_START,



BUILT_IN_GOMP_LOOP_RUNTIME_START,



BUILT_IN_GOMP_LOOP_ORDERED_STATIC_START,



BUILT_IN_GOMP_LOOP_ORDERED_DYNAMIC_START,



BUILT_IN_GOMP_LOOP_ORDERED_GUIDED_START,



BUILT_IN_GOMP_LOOP_ORDERED_RUNTIME_START,



BUILT_IN_GOMP_LOOP_STATIC_NEXT,

BUILT_IN_GOMP_LOOP_DYNAMIC_NEXT,

BUILT_IN_GOMP_LOOP_GUIDED_NEXT,

BUILT_IN_GOMP_LOOP_RUNTIME_NEXT,

BUILT_IN_GOMP_LOOP_ORDERED_STATIC_NEXT,


BUILT_IN_GOMP_LOOP_ORDERED_DYNAMIC_NEXT,


BUILT_IN_GOMP_LOOP_ORDERED_GUIDED_NEXT,


BUILT_IN_GOMP_LOOP_ORDERED_RUNTIME_NEXT,


BUILT_IN_GOMP_LOOP_ULL_STATIC_START,



BUILT_IN_GOMP_LOOP_ULL_DYNAMIC_START,



BUILT_IN_GOMP_LOOP_ULL_GUIDED_START,



BUILT_IN_GOMP_LOOP_ULL_RUNTIME_START,



BUILT_IN_GOMP_LOOP_ULL_ORDERED_STATIC_START,



BUILT_IN_GOMP_LOOP_ULL_ORDERED_DYNAMIC_START,



BUILT_IN_GOMP_LOOP_ULL_ORDERED_GUIDED_START,



BUILT_IN_GOMP_LOOP_ULL_ORDERED_RUNTIME_START,



BUILT_IN_GOMP_LOOP_ULL_STATIC_NEXT,

BUILT_IN_GOMP_LOOP_ULL_DYNAMIC_NEXT,

BUILT_IN_GOMP_LOOP_ULL_GUIDED_NEXT,

BUILT_IN_GOMP_LOOP_ULL_RUNTIME_NEXT,

BUILT_IN_GOMP_LOOP_ULL_ORDERED_STATIC_NEXT,


BUILT_IN_GOMP_LOOP_ULL_ORDERED_DYNAMIC_NEXT,


BUILT_IN_GOMP_LOOP_ULL_ORDERED_GUIDED_NEXT,


BUILT_IN_GOMP_LOOP_ULL_ORDERED_RUNTIME_NEXT,





BUILT_IN_GOMP_PARALLEL_LOOP_STATIC_START,



BUILT_IN_GOMP_PARALLEL_LOOP_DYNAMIC_START,



BUILT_IN_GOMP_PARALLEL_LOOP_GUIDED_START,



BUILT_IN_GOMP_PARALLEL_LOOP_RUNTIME_START,



BUILT_IN_GOMP_LOOP_END,

BUILT_IN_GOMP_LOOP_END_NOWAIT,

BUILT_IN_GOMP_ORDERED_START,

BUILT_IN_GOMP_ORDERED_END,

BUILT_IN_GOMP_PARALLEL_START,

BUILT_IN_GOMP_PARALLEL_END,

BUILT_IN_GOMP_TASK,


BUILT_IN_GOMP_SECTIONS_START,

BUILT_IN_GOMP_SECTIONS_NEXT,

BUILT_IN_GOMP_PARALLEL_SECTIONS_START,


BUILT_IN_GOMP_SECTIONS_END,

BUILT_IN_GOMP_SECTIONS_END_NOWAIT,


BUILT_IN_GOMP_SINGLE_START,

BUILT_IN_GOMP_SINGLE_COPY_START,

BUILT_IN_GOMP_SINGLE_COPY_END,
# 765 "/home/mzorgati/gcc-4.4.0/gcc/builtins.def" 2
# 215 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 2



  BUILT_IN_COMPLEX_MUL_MIN,
  BUILT_IN_COMPLEX_MUL_MAX
    = BUILT_IN_COMPLEX_MUL_MIN
      + MAX_MODE_COMPLEX_FLOAT
      - MIN_MODE_COMPLEX_FLOAT,

  BUILT_IN_COMPLEX_DIV_MIN,
  BUILT_IN_COMPLEX_DIV_MAX
    = BUILT_IN_COMPLEX_DIV_MIN
      + MAX_MODE_COMPLEX_FLOAT
      - MIN_MODE_COMPLEX_FLOAT,


  END_BUILTINS
};



extern const char * built_in_names[(int) END_BUILTINS];
# 261 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree built_in_decls[(int) END_BUILTINS];
extern tree implicit_built_in_decls[(int) END_BUILTINS];




extern unsigned const char omp_clause_num_ops[];
extern const char * const omp_clause_code_name[];



enum omp_clause_code
{


  OMP_CLAUSE_ERROR = 0,


  OMP_CLAUSE_PRIVATE,


  OMP_CLAUSE_SHARED,


  OMP_CLAUSE_FIRSTPRIVATE,


  OMP_CLAUSE_LASTPRIVATE,
# 297 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
  OMP_CLAUSE_REDUCTION,


  OMP_CLAUSE_COPYIN,


  OMP_CLAUSE_COPYPRIVATE,


  OMP_CLAUSE_IF,


  OMP_CLAUSE_NUM_THREADS,


  OMP_CLAUSE_SCHEDULE,


  OMP_CLAUSE_NOWAIT,


  OMP_CLAUSE_ORDERED,


  OMP_CLAUSE_DEFAULT,


  OMP_CLAUSE_COLLAPSE,


  OMP_CLAUSE_UNTIED
};
# 351 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
union tree_ann_d;

struct tree_base
{
  __extension__ enum tree_code code : 16;

  unsigned side_effects_flag : 1;
  unsigned constant_flag : 1;
  unsigned addressable_flag : 1;
  unsigned volatile_flag : 1;
  unsigned readonly_flag : 1;
  unsigned unsigned_flag : 1;
  unsigned asm_written_flag: 1;
  unsigned nowarning_flag : 1;

  unsigned used_flag : 1;
  unsigned nothrow_flag : 1;
  unsigned static_flag : 1;
  unsigned public_flag : 1;
  unsigned private_flag : 1;
  unsigned protected_flag : 1;
  unsigned deprecated_flag : 1;
  unsigned saturating_flag : 1;
  unsigned default_def_flag : 1;

  unsigned lang_flag_0 : 1;
  unsigned lang_flag_1 : 1;
  unsigned lang_flag_2 : 1;
  unsigned lang_flag_3 : 1;
  unsigned lang_flag_4 : 1;
  unsigned lang_flag_5 : 1;
  unsigned lang_flag_6 : 1;
  unsigned visited : 1;

  unsigned spare : 23;

  union tree_ann_d *ann;
};

struct tree_common
{
  struct tree_base base;
  tree chain;
  tree type;
};
# 621 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
enum tree_node_structure_enum {
# 1 "/home/mzorgati/gcc-4.4.0/gcc/treestruct.def" 1
# 30 "/home/mzorgati/gcc-4.4.0/gcc/treestruct.def"
TS_BASE,
TS_COMMON,
TS_INT_CST,
TS_REAL_CST,
TS_FIXED_CST,
TS_VECTOR,
TS_STRING,
TS_COMPLEX,
TS_IDENTIFIER,
TS_DECL_MINIMAL,
TS_DECL_COMMON,
TS_DECL_WRTL,
TS_DECL_NON_COMMON,
TS_DECL_WITH_VIS,
TS_FIELD_DECL,
TS_VAR_DECL,
TS_PARM_DECL,
TS_LABEL_DECL,
TS_RESULT_DECL,
TS_CONST_DECL,
TS_TYPE_DECL,
TS_FUNCTION_DECL,
TS_TYPE,
TS_LIST,
TS_VEC,
TS_EXP,
TS_SSA_NAME,
TS_PHI_NODE,
TS_BLOCK,
TS_BINFO,
TS_STATEMENT_LIST,
TS_GIMPLE_STATEMENT,
TS_CONSTRUCTOR,
TS_MEMORY_TAG,
TS_OMP_CLAUSE,
TS_MEMORY_PARTITION_TAG,
TS_OPTIMIZATION,
TS_TARGET_OPTION,
# 623 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 2
  LAST_TS_ENUM
};
# 932 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
# 1 "/home/mzorgati/gcc_build/gcc/tree-check.h" 1
# 933 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 2
# 1374 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_int_cst
{
  struct tree_common common;
  double_int int_cst;
};




struct real_value;




struct tree_real_cst
{
  struct tree_common common;
  struct real_value * real_cst_ptr;
};


struct fixed_value;




struct tree_fixed_cst
{
  struct tree_common common;
  struct fixed_value * fixed_cst_ptr;
};






struct tree_string
{
  struct tree_common common;
  int length;
  char str[1];
};





struct tree_complex
{
  struct tree_common common;
  tree real;
  tree imag;
};




struct tree_vector
{
  struct tree_common common;
  tree elements;
};

# 1 "/home/mzorgati/gcc-4.4.0/libcpp/include/symtab.h" 1
# 22 "/home/mzorgati/gcc-4.4.0/libcpp/include/symtab.h"
# 1 "/home/mzorgati/gcc-4.4.0/include/obstack.h" 1
# 157 "/home/mzorgati/gcc-4.4.0/include/obstack.h"
struct _obstack_chunk
{
  char *limit;
  struct _obstack_chunk *prev;
  char contents[4];
};

struct obstack
{
  long chunk_size;
  struct _obstack_chunk *chunk;
  char *object_base;
  char *next_free;
  char *chunk_limit;
  int temp;
  int alignment_mask;



  struct _obstack_chunk *(*chunkfun) (void *, long);
  void (*freefun) (void *, struct _obstack_chunk *);
  void *extra_arg;
  unsigned use_extra_arg:1;
  unsigned maybe_empty_object:1;



  unsigned alloc_failed:1;


};



extern void _obstack_newchunk (struct obstack *, int);
extern void _obstack_free (struct obstack *, void *);
extern int _obstack_begin (struct obstack *, int, int,
       void *(*) (long), void (*) (void *));
extern int _obstack_begin_1 (struct obstack *, int, int,
        void *(*) (void *, long),
        void (*) (void *, void *), void *);
extern int _obstack_memory_used (struct obstack *);




void obstack_init (struct obstack *obstack);

void * obstack_alloc (struct obstack *obstack, int size);

void * obstack_copy (struct obstack *obstack, void *address, int size);
void * obstack_copy0 (struct obstack *obstack, void *address, int size);

void obstack_free (struct obstack *obstack, void *block);

void obstack_blank (struct obstack *obstack, int size);

void obstack_grow (struct obstack *obstack, void *data, int size);
void obstack_grow0 (struct obstack *obstack, void *data, int size);

void obstack_1grow (struct obstack *obstack, int data_char);
void obstack_ptr_grow (struct obstack *obstack, void *data);
void obstack_int_grow (struct obstack *obstack, int data);

void * obstack_finish (struct obstack *obstack);

int obstack_object_size (struct obstack *obstack);

int obstack_room (struct obstack *obstack);
void obstack_make_room (struct obstack *obstack, int size);
void obstack_1grow_fast (struct obstack *obstack, int data_char);
void obstack_ptr_grow_fast (struct obstack *obstack, void *data);
void obstack_int_grow_fast (struct obstack *obstack, int data);
void obstack_blank_fast (struct obstack *obstack, int size);

void * obstack_base (struct obstack *obstack);
void * obstack_next_free (struct obstack *obstack);
int obstack_alignment_mask (struct obstack *obstack);
int obstack_chunk_size (struct obstack *obstack);
int obstack_memory_used (struct obstack *obstack);




extern void (*obstack_alloc_failed_handler) (void);


extern int obstack_exit_failure;
# 23 "/home/mzorgati/gcc-4.4.0/libcpp/include/symtab.h" 2






typedef struct ht_identifier ht_identifier;
struct ht_identifier
{
  const unsigned char *str;
  unsigned int len;
  unsigned int hash_value;
};




typedef struct ht hash_table;
typedef struct ht_identifier *hashnode;

enum ht_lookup_option {HT_NO_INSERT = 0, HT_ALLOC};


struct ht
{

  struct obstack stack;

  hashnode *entries;

  hashnode (*alloc_node) (hash_table *);


  void * (*alloc_subobject) (size_t);

  unsigned int nslots;
  unsigned int nelements;


  struct cpp_reader *pfile;


  unsigned int searches;
  unsigned int collisions;


  unsigned char entries_owned;
};


extern hash_table *ht_create (unsigned int order);


extern void ht_destroy (hash_table *);

extern hashnode ht_lookup (hash_table *, const unsigned char *,
      size_t, enum ht_lookup_option);
extern hashnode ht_lookup_with_hash (hash_table *, const unsigned char *,
                                     size_t, unsigned int,
                                     enum ht_lookup_option);






typedef int (*ht_cb) (struct cpp_reader *, hashnode, const void *);
extern void ht_forall (hash_table *, ht_cb, const void *);



extern void ht_purge (hash_table *, ht_cb, const void *);


extern void ht_load (hash_table *ht, hashnode *entries,
       unsigned int nslots, unsigned int nelements, unsigned char own);


extern void ht_dump_statistics (hash_table *);
# 1439 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 2
# 1456 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_identifier
{
  struct tree_common common;
  struct ht_identifier id;
};





struct tree_list
{
  struct tree_common common;
  tree purpose;
  tree value;
};
# 1480 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_vec
{
  struct tree_common common;
  int length;
  tree a[1];
};
# 1526 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
typedef struct constructor_elt_d
{
  tree index;
  tree value;
} constructor_elt;

typedef struct VEC_constructor_elt_base { unsigned num; unsigned alloc; constructor_elt vec[1]; } VEC_constructor_elt_base; typedef struct VEC_constructor_elt_none { VEC_constructor_elt_base base; } VEC_constructor_elt_none; static __inline__ unsigned VEC_constructor_elt_base_length (const VEC_constructor_elt_base *vec_) { return vec_ ? vec_->num : 0; } static __inline__ constructor_elt *VEC_constructor_elt_base_last (VEC_constructor_elt_base *vec_ ) { (void)(vec_ && vec_->num); return &vec_->vec[vec_->num - 1]; } static __inline__ constructor_elt *VEC_constructor_elt_base_index (VEC_constructor_elt_base *vec_, unsigned ix_ ) { (void)(vec_ && ix_ < vec_->num); return &vec_->vec[ix_]; } static __inline__ int VEC_constructor_elt_base_iterate (VEC_constructor_elt_base *vec_, unsigned ix_, constructor_elt **ptr) { if (vec_ && ix_ < vec_->num) { *ptr = &vec_->vec[ix_]; return 1; } else { *ptr = 0; return 0; } } static __inline__ size_t VEC_constructor_elt_base_embedded_size (int alloc_) { return __builtin_offsetof (VEC_constructor_elt_base, vec) + alloc_ * sizeof(constructor_elt); } static __inline__ void VEC_constructor_elt_base_embedded_init (VEC_constructor_elt_base *vec_, int alloc_) { vec_->num = 0; vec_->alloc = alloc_; } static __inline__ int VEC_constructor_elt_base_space (VEC_constructor_elt_base *vec_, int alloc_ ) { (void)(alloc_ >= 0); return vec_ ? vec_->alloc - vec_->num >= (unsigned)alloc_ : !alloc_; } static __inline__ constructor_elt *VEC_constructor_elt_base_quick_push (VEC_constructor_elt_base *vec_, const constructor_elt *obj_ ) { constructor_elt *slot_; (void)(vec_->num < vec_->alloc); slot_ = &vec_->vec[vec_->num++]; if (obj_) *slot_ = *obj_; return slot_; } static __inline__ void VEC_constructor_elt_base_pop (VEC_constructor_elt_base *vec_ ) { (void)(vec_->num); --vec_->num; } static __inline__ void VEC_constructor_elt_base_truncate (VEC_constructor_elt_base *vec_, unsigned size_ ) { (void)(vec_ ? vec_->num >= size_ : !size_); if (vec_) vec_->num = size_; } static __inline__ constructor_elt *VEC_constructor_elt_base_replace (VEC_constructor_elt_base *vec_, unsigned ix_, const constructor_elt *obj_ ) { constructor_elt *slot_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; if (obj_) *slot_ = *obj_; return slot_; } static __inline__ constructor_elt *VEC_constructor_elt_base_quick_insert (VEC_constructor_elt_base *vec_, unsigned ix_, const constructor_elt *obj_ ) { constructor_elt *slot_; (void)(vec_->num < vec_->alloc); (void)(ix_ <= vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_ + 1, slot_, (vec_->num++ - ix_) * sizeof (constructor_elt)); if (obj_) *slot_ = *obj_; return slot_; } static __inline__ void VEC_constructor_elt_base_ordered_remove (VEC_constructor_elt_base *vec_, unsigned ix_ ) { constructor_elt *slot_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_, slot_ + 1, (--vec_->num - ix_) * sizeof (constructor_elt)); } static __inline__ void VEC_constructor_elt_base_unordered_remove (VEC_constructor_elt_base *vec_, unsigned ix_ ) { (void)(ix_ < vec_->num); vec_->vec[ix_] = vec_->vec[--vec_->num]; } static __inline__ void VEC_constructor_elt_base_block_remove (VEC_constructor_elt_base *vec_, unsigned ix_, unsigned len_ ) { constructor_elt *slot_; (void)(ix_ + len_ <= vec_->num); slot_ = &vec_->vec[ix_]; vec_->num -= len_; memmove (slot_, slot_ + len_, (vec_->num - ix_) * sizeof (constructor_elt)); } static __inline__ constructor_elt *VEC_constructor_elt_base_address (VEC_constructor_elt_base *vec_) { return vec_ ? vec_->vec : 0; } static __inline__ unsigned VEC_constructor_elt_base_lower_bound (VEC_constructor_elt_base *vec_, const constructor_elt *obj_, unsigned char (*lessthan_)(const constructor_elt *, const constructor_elt *) ) { unsigned int len_ = VEC_constructor_elt_base_length (vec_); unsigned int half_, middle_; unsigned int first_ = 0; while (len_ > 0) { constructor_elt *middle_elem_; half_ = len_ >> 1; middle_ = first_; middle_ += half_; middle_elem_ = VEC_constructor_elt_base_index (vec_, middle_ ); if (lessthan_ (middle_elem_, obj_)) { first_ = middle_; ++first_; len_ = len_ - half_ - 1; } else len_ = half_; } return first_; } struct vec_swallow_trailing_semi;
typedef struct VEC_constructor_elt_gc { VEC_constructor_elt_base base; } VEC_constructor_elt_gc; static __inline__ VEC_constructor_elt_gc *VEC_constructor_elt_gc_alloc (int alloc_ ) { return (VEC_constructor_elt_gc *) vec_gc_o_reserve_exact (((void *)0), alloc_, __builtin_offsetof (VEC_constructor_elt_gc, base.vec), sizeof (constructor_elt) ); } static __inline__ VEC_constructor_elt_gc *VEC_constructor_elt_gc_copy (VEC_constructor_elt_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_constructor_elt_gc *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_constructor_elt_gc *)(vec_gc_o_reserve_exact (((void *)0), len_, __builtin_offsetof (VEC_constructor_elt_gc, base.vec), sizeof (constructor_elt) )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (constructor_elt) * len_); } return new_vec_; } static __inline__ void VEC_constructor_elt_gc_free (VEC_constructor_elt_gc **vec_) { if (*vec_) ggc_free (*vec_); *vec_ = ((void *)0); } static __inline__ int VEC_constructor_elt_gc_reserve (VEC_constructor_elt_gc **vec_, int alloc_ ) { int extend = !VEC_constructor_elt_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_constructor_elt_gc *) vec_gc_o_reserve (*vec_, alloc_, __builtin_offsetof (VEC_constructor_elt_gc, base.vec), sizeof (constructor_elt) ); return extend; } static __inline__ int VEC_constructor_elt_gc_reserve_exact (VEC_constructor_elt_gc **vec_, int alloc_ ) { int extend = !VEC_constructor_elt_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_constructor_elt_gc *) vec_gc_o_reserve_exact (*vec_, alloc_, __builtin_offsetof (VEC_constructor_elt_gc, base.vec), sizeof (constructor_elt) ); return extend; } static __inline__ void VEC_constructor_elt_gc_safe_grow (VEC_constructor_elt_gc **vec_, int size_ ) { (void)(size_ >= 0 && VEC_constructor_elt_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_constructor_elt_gc_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_constructor_elt_gc_safe_grow_cleared (VEC_constructor_elt_gc **vec_, int size_ ) { int oldsize = VEC_constructor_elt_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_constructor_elt_gc_safe_grow (vec_, size_ ); memset (&(VEC_constructor_elt_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (constructor_elt) * (size_ - oldsize)); } static __inline__ constructor_elt *VEC_constructor_elt_gc_safe_push (VEC_constructor_elt_gc **vec_, const constructor_elt *obj_ ) { VEC_constructor_elt_gc_reserve (vec_, 1 ); return VEC_constructor_elt_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ constructor_elt *VEC_constructor_elt_gc_safe_insert (VEC_constructor_elt_gc **vec_, unsigned ix_, const constructor_elt *obj_ ) { VEC_constructor_elt_gc_reserve (vec_, 1 ); return VEC_constructor_elt_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;

struct tree_constructor
{
  struct tree_common common;
  VEC_constructor_elt_gc *elts;
};
# 1580 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern void protected_set_expr_location (tree, location_t);
# 1801 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
enum omp_clause_schedule_kind
{
  OMP_CLAUSE_SCHEDULE_STATIC,
  OMP_CLAUSE_SCHEDULE_DYNAMIC,
  OMP_CLAUSE_SCHEDULE_GUIDED,
  OMP_CLAUSE_SCHEDULE_AUTO,
  OMP_CLAUSE_SCHEDULE_RUNTIME
};




enum omp_clause_default_kind
{
  OMP_CLAUSE_DEFAULT_UNSPECIFIED,
  OMP_CLAUSE_DEFAULT_SHARED,
  OMP_CLAUSE_DEFAULT_NONE,
  OMP_CLAUSE_DEFAULT_PRIVATE,
  OMP_CLAUSE_DEFAULT_FIRSTPRIVATE
};




struct tree_exp
{
  struct tree_common common;
  location_t locus;
  tree block;
  tree

    operands[1];
};
# 1877 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct ptr_info_def;






typedef struct ssa_use_operand_d
{
  struct ssa_use_operand_d* prev;
  struct ssa_use_operand_d* next;





  union { gimple stmt; tree ssa_name; } loc;
  tree * use;
} ssa_use_operand_t;




struct tree_ssa_name
{
  struct tree_common common;


  tree var;


  gimple def_stmt;


  unsigned int version;


  struct ptr_info_def *ptr_info;






  tree value_handle;


  struct ssa_use_operand_d imm_uses;
};

struct phi_arg_d
{


  struct ssa_use_operand_d imm_use;
  tree def;
};
# 1948 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_omp_clause
{
  struct tree_common common;
  enum omp_clause_code code;
  union omp_clause_subcode {
    enum omp_clause_default_kind default_kind;
    enum omp_clause_schedule_kind schedule_kind;
    enum tree_code reduction_code;
  } subcode;



  gimple_seq gimple_reduction_init;
  gimple_seq gimple_reduction_merge;

  tree ops[1];
};


struct varray_head_tag;
# 2018 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_block
{
  struct tree_common common;

  unsigned abstract_flag : 1;
  unsigned block_num : 31;

  location_t locus;

  tree vars;
  VEC_tree_gc *nonlocalized_vars;

  tree subblocks;
  tree supercontext;
  tree abstract_origin;
  tree fragment_origin;
  tree fragment_chain;
};
# 2079 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern enum machine_mode vector_type_mode (const_tree);
# 2257 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct die_struct;

struct tree_type
{
  struct tree_common common;
  tree values;
  tree size;
  tree size_unit;
  tree attributes;
  unsigned int uid;

  unsigned int precision : 9;
  __extension__ enum machine_mode mode : 7;

  unsigned string_flag : 1;
  unsigned no_force_blk_flag : 1;
  unsigned needs_constructing_flag : 1;
  unsigned transparent_union_flag : 1;
  unsigned packed_flag : 1;
  unsigned restrict_flag : 1;
  unsigned contains_placeholder_bits : 2;

  unsigned lang_flag_0 : 1;
  unsigned lang_flag_1 : 1;
  unsigned lang_flag_2 : 1;
  unsigned lang_flag_3 : 1;
  unsigned lang_flag_4 : 1;
  unsigned lang_flag_5 : 1;
  unsigned lang_flag_6 : 1;
  unsigned user_align : 1;

  unsigned int align;
  alias_set_type alias_set;
  tree pointer_to;
  tree reference_to;
  union tree_type_symtab {
    int address;
    const char * pointer;
    struct die_struct * die;
  } symtab;

  tree name;
  tree minval;
  tree maxval;
  tree next_variant;
  tree main_variant;
  tree binfo;
  tree context;
  tree canonical;

  struct lang_type *lang_specific;
};
# 2413 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_binfo
{
  struct tree_common common;

  tree offset;
  tree vtable;
  tree virtuals;
  tree vptr_field;
  VEC_tree_gc *base_accesses;
  tree inheritance;

  tree vtt_subvtt;
  tree vtt_vptr;

  VEC_tree_none base_binfos;
};
# 2451 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
enum symbol_visibility
{
  VISIBILITY_DEFAULT,
  VISIBILITY_PROTECTED,
  VISIBILITY_HIDDEN,
  VISIBILITY_INTERNAL
};


struct function;
# 2489 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_decl_minimal
{
  struct tree_common common;
  location_t locus;
  unsigned int uid;
  tree name;
  tree context;
};
# 2515 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_memory_tag
{
  struct tree_decl_minimal common;

  bitmap aliases;


  unsigned int is_global : 1;
};







struct tree_memory_partition_tag
{
  struct tree_memory_tag common;


  bitmap symbols;
};
# 2687 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_decl_common
{
  struct tree_decl_minimal common;
  tree size;

  __extension__ enum machine_mode mode : 8;

  unsigned nonlocal_flag : 1;
  unsigned virtual_flag : 1;
  unsigned ignored_flag : 1;
  unsigned abstract_flag : 1;
  unsigned artificial_flag : 1;
  unsigned user_align : 1;
  unsigned preserve_flag: 1;
  unsigned debug_expr_is_from : 1;

  unsigned lang_flag_0 : 1;
  unsigned lang_flag_1 : 1;
  unsigned lang_flag_2 : 1;
  unsigned lang_flag_3 : 1;
  unsigned lang_flag_4 : 1;
  unsigned lang_flag_5 : 1;
  unsigned lang_flag_6 : 1;
  unsigned lang_flag_7 : 1;



  unsigned decl_flag_0 : 1;

  unsigned decl_flag_1 : 1;



  unsigned decl_flag_2 : 1;


  unsigned decl_flag_3 : 1;


  unsigned gimple_reg_flag : 1;

  unsigned no_tbaa_flag : 1;

  unsigned decl_common_unused : 2;

  unsigned int align : 24;

  unsigned int off_align : 8;

  tree size_unit;
  tree initial;
  tree attributes;
  tree abstract_origin;

  alias_set_type pointer_alias_set;

  struct lang_decl *lang_specific;
};

extern tree decl_value_expr_lookup (tree);
extern void decl_value_expr_insert (tree, tree);
# 2788 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_decl_with_rtl
{
  struct tree_decl_common common;
  rtx rtl;
};
# 2857 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_field_decl
{
  struct tree_decl_common common;

  tree offset;
  tree bit_field_type;
  tree qualifier;
  tree bit_offset;
  tree fcontext;

};
# 2879 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_label_decl
{
  struct tree_decl_with_rtl common;
};

struct tree_result_decl
{
  struct tree_decl_with_rtl common;
};

struct tree_const_decl
{
  struct tree_decl_with_rtl common;
};
# 2902 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_parm_decl
{
  struct tree_decl_with_rtl common;
  rtx incoming_rtl;
};
# 2946 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree decl_restrict_base_lookup (tree);
extern void decl_restrict_base_insert (tree, tree);
# 3030 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_decl_with_vis
{
 struct tree_decl_with_rtl common;
 tree assembler_name;
 tree section_name;


 unsigned defer_output:1;
 unsigned hard_register:1;
 unsigned thread_local:1;
 unsigned common_flag:1;
 unsigned in_text_section : 1;
 unsigned gimple_formal_temp : 1;
 unsigned dllimport_flag : 1;
 unsigned based_on_restrict_p : 1;

 unsigned shadowed_for_var_p : 1;


 unsigned weak_flag:1;
 unsigned seen_in_bind_expr : 1;
 unsigned comdat_flag : 1;
 __extension__ enum symbol_visibility visibility : 2;
 unsigned visibility_specified : 1;

 unsigned one_only : 1;
 unsigned init_priority_p:1;


 __extension__ enum tls_model tls_model : 3;

};
# 3076 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree decl_debug_expr_lookup (tree);
extern void decl_debug_expr_insert (tree, tree);
# 3088 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
typedef unsigned short priority_type;

extern priority_type decl_init_priority_lookup (tree);
extern priority_type decl_fini_priority_lookup (tree);
extern void decl_init_priority_insert (tree, priority_type);
extern void decl_fini_priority_insert (tree, priority_type);
# 3136 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_var_decl
{
  struct tree_decl_with_vis common;
};
# 3156 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_decl_non_common

{
  struct tree_decl_with_vis common;

  tree saved_tree;

  tree arguments;

  tree result;

  tree vindex;
};
# 3293 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_function_decl
{
  struct tree_decl_non_common common;

  struct function *f;


  tree function_specific_target;
  tree function_specific_optimization;





  __extension__ enum built_in_function function_code : 11;
  __extension__ enum built_in_class built_in_class : 2;

  unsigned static_ctor_flag : 1;
  unsigned static_dtor_flag : 1;
  unsigned uninlinable : 1;

  unsigned possibly_inlined : 1;
  unsigned novops_flag : 1;
  unsigned returns_twice_flag : 1;
  unsigned malloc_flag : 1;
  unsigned operator_new_flag : 1;
  unsigned declared_inline_flag : 1;
  unsigned regdecl_flag : 1;

  unsigned no_inline_warning_flag : 1;
  unsigned no_instrument_function_entry_exit : 1;
  unsigned no_limit_stack : 1;
  unsigned disregard_inline_limits : 1;
  unsigned pure_flag : 1;
  unsigned looping_const_or_pure_flag : 1;



};
# 3347 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_type_decl
{
  struct tree_decl_non_common common;

};
# 3364 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
struct tree_statement_list_node
 
{
  struct tree_statement_list_node *prev;
  struct tree_statement_list_node *next;
  tree stmt;
};

struct tree_statement_list
 
{
  struct tree_common common;
  struct tree_statement_list_node *head;
  struct tree_statement_list_node *tail;
};




struct tree_optimization_option
{
  struct tree_common common;


  struct cl_optimization opts;
};





extern tree build_optimization_node (void);



struct tree_target_option
{
  struct tree_common common;


  struct cl_target_option opts;
};





extern tree build_target_option_node (void);






union tree_node

{
  struct tree_base base;
  struct tree_common common;
  struct tree_int_cst int_cst;
  struct tree_real_cst real_cst;
  struct tree_fixed_cst fixed_cst;
  struct tree_vector vector;
  struct tree_string string;
  struct tree_complex complex;
  struct tree_identifier identifier;
  struct tree_decl_minimal decl_minimal;
  struct tree_decl_common decl_common;
  struct tree_decl_with_rtl decl_with_rtl;
  struct tree_decl_non_common decl_non_common;
  struct tree_parm_decl parm_decl;
  struct tree_decl_with_vis decl_with_vis;
  struct tree_var_decl var_decl;
  struct tree_field_decl field_decl;
  struct tree_label_decl label_decl;
  struct tree_result_decl result_decl;
  struct tree_const_decl const_decl;
  struct tree_type_decl type_decl;
  struct tree_function_decl function_decl;
  struct tree_type type;
  struct tree_list list;
  struct tree_vec vec;
  struct tree_exp exp;
  struct tree_ssa_name ssa_name;
  struct tree_block block;
  struct tree_binfo binfo;
  struct tree_statement_list stmt_list;
  struct tree_constructor constructor;
  struct tree_memory_tag mtag;
  struct tree_omp_clause omp_clause;
  struct tree_memory_partition_tag mpt;
  struct tree_optimization_option optimization;
  struct tree_target_option target_option;
};



enum tree_index
{
  TI_ERROR_MARK,
  TI_INTQI_TYPE,
  TI_INTHI_TYPE,
  TI_INTSI_TYPE,
  TI_INTDI_TYPE,
  TI_INTTI_TYPE,

  TI_UINTQI_TYPE,
  TI_UINTHI_TYPE,
  TI_UINTSI_TYPE,
  TI_UINTDI_TYPE,
  TI_UINTTI_TYPE,

  TI_UINT32_TYPE,
  TI_UINT64_TYPE,

  TI_INTEGER_ZERO,
  TI_INTEGER_ONE,
  TI_INTEGER_MINUS_ONE,
  TI_NULL_POINTER,

  TI_SIZE_ZERO,
  TI_SIZE_ONE,

  TI_BITSIZE_ZERO,
  TI_BITSIZE_ONE,
  TI_BITSIZE_UNIT,

  TI_PUBLIC,
  TI_PROTECTED,
  TI_PRIVATE,

  TI_BOOLEAN_FALSE,
  TI_BOOLEAN_TRUE,

  TI_COMPLEX_INTEGER_TYPE,
  TI_COMPLEX_FLOAT_TYPE,
  TI_COMPLEX_DOUBLE_TYPE,
  TI_COMPLEX_LONG_DOUBLE_TYPE,

  TI_FLOAT_TYPE,
  TI_DOUBLE_TYPE,
  TI_LONG_DOUBLE_TYPE,

  TI_FLOAT_PTR_TYPE,
  TI_DOUBLE_PTR_TYPE,
  TI_LONG_DOUBLE_PTR_TYPE,
  TI_INTEGER_PTR_TYPE,

  TI_VOID_TYPE,
  TI_PTR_TYPE,
  TI_CONST_PTR_TYPE,
  TI_SIZE_TYPE,
  TI_PID_TYPE,
  TI_PTRDIFF_TYPE,
  TI_VA_LIST_TYPE,
  TI_VA_LIST_GPR_COUNTER_FIELD,
  TI_VA_LIST_FPR_COUNTER_FIELD,
  TI_BOOLEAN_TYPE,
  TI_FILEPTR_TYPE,

  TI_DFLOAT32_TYPE,
  TI_DFLOAT64_TYPE,
  TI_DFLOAT128_TYPE,
  TI_DFLOAT32_PTR_TYPE,
  TI_DFLOAT64_PTR_TYPE,
  TI_DFLOAT128_PTR_TYPE,

  TI_VOID_LIST_NODE,

  TI_MAIN_IDENTIFIER,

  TI_SAT_SFRACT_TYPE,
  TI_SAT_FRACT_TYPE,
  TI_SAT_LFRACT_TYPE,
  TI_SAT_LLFRACT_TYPE,
  TI_SAT_USFRACT_TYPE,
  TI_SAT_UFRACT_TYPE,
  TI_SAT_ULFRACT_TYPE,
  TI_SAT_ULLFRACT_TYPE,
  TI_SFRACT_TYPE,
  TI_FRACT_TYPE,
  TI_LFRACT_TYPE,
  TI_LLFRACT_TYPE,
  TI_USFRACT_TYPE,
  TI_UFRACT_TYPE,
  TI_ULFRACT_TYPE,
  TI_ULLFRACT_TYPE,
  TI_SAT_SACCUM_TYPE,
  TI_SAT_ACCUM_TYPE,
  TI_SAT_LACCUM_TYPE,
  TI_SAT_LLACCUM_TYPE,
  TI_SAT_USACCUM_TYPE,
  TI_SAT_UACCUM_TYPE,
  TI_SAT_ULACCUM_TYPE,
  TI_SAT_ULLACCUM_TYPE,
  TI_SACCUM_TYPE,
  TI_ACCUM_TYPE,
  TI_LACCUM_TYPE,
  TI_LLACCUM_TYPE,
  TI_USACCUM_TYPE,
  TI_UACCUM_TYPE,
  TI_ULACCUM_TYPE,
  TI_ULLACCUM_TYPE,
  TI_QQ_TYPE,
  TI_HQ_TYPE,
  TI_SQ_TYPE,
  TI_DQ_TYPE,
  TI_TQ_TYPE,
  TI_UQQ_TYPE,
  TI_UHQ_TYPE,
  TI_USQ_TYPE,
  TI_UDQ_TYPE,
  TI_UTQ_TYPE,
  TI_SAT_QQ_TYPE,
  TI_SAT_HQ_TYPE,
  TI_SAT_SQ_TYPE,
  TI_SAT_DQ_TYPE,
  TI_SAT_TQ_TYPE,
  TI_SAT_UQQ_TYPE,
  TI_SAT_UHQ_TYPE,
  TI_SAT_USQ_TYPE,
  TI_SAT_UDQ_TYPE,
  TI_SAT_UTQ_TYPE,
  TI_HA_TYPE,
  TI_SA_TYPE,
  TI_DA_TYPE,
  TI_TA_TYPE,
  TI_UHA_TYPE,
  TI_USA_TYPE,
  TI_UDA_TYPE,
  TI_UTA_TYPE,
  TI_SAT_HA_TYPE,
  TI_SAT_SA_TYPE,
  TI_SAT_DA_TYPE,
  TI_SAT_TA_TYPE,
  TI_SAT_UHA_TYPE,
  TI_SAT_USA_TYPE,
  TI_SAT_UDA_TYPE,
  TI_SAT_UTA_TYPE,

  TI_OPTIMIZATION_DEFAULT,
  TI_OPTIMIZATION_CURRENT,
  TI_TARGET_OPTION_DEFAULT,
  TI_TARGET_OPTION_CURRENT,
  TI_CURRENT_TARGET_PRAGMA,
  TI_CURRENT_OPTIMIZE_PRAGMA,

  TI_MAX
};

extern tree global_trees[TI_MAX];
# 3796 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
enum integer_type_kind
{
  itk_char,
  itk_signed_char,
  itk_unsigned_char,
  itk_short,
  itk_unsigned_short,
  itk_int,
  itk_unsigned_int,
  itk_long,
  itk_unsigned_long,
  itk_long_long,
  itk_unsigned_long_long,
  itk_none
};

typedef enum integer_type_kind integer_type_kind;



extern tree integer_types[itk_none];
# 3832 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern enum tls_model flag_tls_default;
# 3856 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
enum ptrmemfunc_vbit_where_t
{
  ptrmemfunc_vbit_in_pfn,
  ptrmemfunc_vbit_in_delta
};



extern tree decl_assembler_name (tree);
extern unsigned char decl_assembler_name_equal (tree decl, const_tree asmname);
extern hashval_t decl_assembler_name_hash (const_tree asmname);




extern size_t tree_size (const_tree);




extern size_t tree_code_size (enum tree_code);





extern tree make_node_stat (enum tree_code );




extern tree copy_node_stat (tree );




extern tree copy_list (tree);


extern tree make_tree_binfo_stat (unsigned );




extern tree make_tree_vec_stat (int );





extern tree get_identifier (const char *);
# 3919 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree get_identifier_with_length (const char *, size_t);





extern tree maybe_get_identifier (const char *);



extern tree build_nt (enum tree_code, ...);
extern tree build_nt_call_list (tree, tree);

extern tree build0_stat (enum tree_code, tree );

extern tree build1_stat (enum tree_code, tree, tree );

extern tree build2_stat (enum tree_code, tree, tree, tree );

extern tree build3_stat (enum tree_code, tree, tree, tree, tree );

extern tree build4_stat (enum tree_code, tree, tree, tree, tree,
    tree );

extern tree build5_stat (enum tree_code, tree, tree, tree, tree, tree,
    tree );

extern tree build7_stat (enum tree_code, tree, tree, tree, tree, tree,
    tree, tree, tree );



extern tree build_int_cst (tree, long);
extern tree build_int_cst_type (tree, long);
extern tree build_int_cstu (tree, unsigned long);
extern tree build_int_cst_wide (tree, unsigned long, long);
extern tree build_int_cst_wide_type (tree,
         unsigned long, long);
extern tree build_vector (tree, tree);
extern tree build_vector_from_ctor (tree, VEC_constructor_elt_gc *);
extern tree build_constructor (tree, VEC_constructor_elt_gc *);
extern tree build_constructor_single (tree, tree, tree);
extern tree build_constructor_from_list (tree, tree);
extern tree build_real_from_int_cst (tree, const_tree);
extern tree build_complex (tree, tree, tree);
extern tree build_one_cst (tree);
extern tree build_string (int, const char *);
extern tree build_tree_list_stat (tree, tree );

extern tree build_decl_stat (enum tree_code, tree, tree );
extern tree build_fn_decl (const char *, tree);

extern tree build_block (tree, tree, tree, tree);
extern tree build_empty_stmt (void);
extern tree build_omp_clause (enum omp_clause_code);

extern tree build_vl_exp_stat (enum tree_code, int );


extern tree build_call_list (tree, tree, tree);
extern tree build_call_nary (tree, tree, int, ...);
extern tree build_call_valist (tree, tree, int, va_list);
extern tree build_call_array (tree, tree, int, tree*);



extern tree make_signed_type (int);
extern tree make_unsigned_type (int);
extern tree signed_or_unsigned_type_for (int, tree);
extern tree signed_type_for (tree);
extern tree unsigned_type_for (tree);
extern void initialize_sizetypes (unsigned char);
extern void set_sizetype (tree);
extern void fixup_unsigned_type (tree);
extern tree build_pointer_type_for_mode (tree, enum machine_mode, unsigned char);
extern tree build_pointer_type (tree);
extern tree build_reference_type_for_mode (tree, enum machine_mode, unsigned char);
extern tree build_reference_type (tree);
extern tree build_vector_type_for_mode (tree, enum machine_mode);
extern tree build_vector_type (tree innertype, int nunits);
extern tree build_type_no_quals (tree);
extern tree build_index_type (tree);
extern tree build_index_2_type (tree, tree);
extern tree build_array_type (tree, tree);
extern tree build_function_type (tree, tree);
extern tree build_function_type_list (tree, ...);
extern tree build_function_type_skip_args (tree, bitmap);
extern tree build_function_decl_skip_args (tree, bitmap);
extern tree build_varargs_function_type_list (tree, ...);
extern tree build_method_type_directly (tree, tree, tree);
extern tree build_method_type (tree, tree);
extern tree build_offset_type (tree, tree);
extern tree build_complex_type (tree);
extern tree build_resx (int);
extern tree array_type_nelts (const_tree);
extern unsigned char in_array_bounds_p (tree);
extern unsigned char range_in_array_bounds_p (tree);

extern tree value_member (tree, tree);
extern tree purpose_member (const_tree, tree);

extern int attribute_list_equal (const_tree, const_tree);
extern int attribute_list_contained (const_tree, const_tree);
extern int tree_int_cst_equal (const_tree, const_tree);
extern int tree_int_cst_lt (const_tree, const_tree);
extern int tree_int_cst_compare (const_tree, const_tree);
extern int host_integerp (const_tree, int);
extern long tree_low_cst (const_tree, int);
extern int tree_int_cst_msb (const_tree);
extern int tree_int_cst_sgn (const_tree);
extern int tree_int_cst_sign_bit (const_tree);
extern unsigned int tree_int_cst_min_precision (tree, unsigned char);
extern unsigned char tree_expr_nonnegative_p (tree);
extern unsigned char tree_expr_nonnegative_warnv_p (tree, unsigned char *);
extern unsigned char may_negate_without_overflow_p (const_tree);
extern tree strip_array_types (tree);



extern tree make_fract_type (int, int, int);
extern tree make_accum_type (int, int, int);
# 4071 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree make_tree (tree, rtx);







extern tree build_type_attribute_variant (tree, tree);
extern tree build_decl_attribute_variant (tree, tree);


struct attribute_spec
{


  const char *const name;

  const int min_length;


  const int max_length;







  const unsigned char decl_required;


  const unsigned char type_required;




  const unsigned char function_type_required;
# 4123 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
  tree (*const handler) (tree *node, tree name, tree args,
     int flags, unsigned char *no_add_attrs);
};



enum attribute_flags
{



  ATTR_FLAG_DECL_NEXT = 1,



  ATTR_FLAG_FUNCTION_NEXT = 2,



  ATTR_FLAG_ARRAY_NEXT = 4,


  ATTR_FLAG_TYPE_IN_PLACE = 8,



  ATTR_FLAG_BUILT_IN = 16
};



extern tree merge_decl_attributes (tree, tree);
extern tree merge_type_attributes (tree, tree);




extern int is_attribute_p (const char *, const_tree);




extern tree lookup_attribute (const char *, tree);




extern tree remove_attribute (const char *, tree);



extern tree merge_attributes (tree, tree);
# 4188 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern unsigned char check_qualified_type (const_tree, const_tree, int);





extern tree get_qualified_type (tree, int);




extern tree build_qualified_type (tree, int);
# 4213 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree build_distinct_type_copy (tree);
extern tree build_variant_type_copy (tree);




extern void finish_builtin_struct (tree, const char *,
        tree, tree);





extern void layout_type (tree);
# 4235 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
typedef struct record_layout_info_s
{

  tree t;


  tree offset;

  unsigned int offset_align;

  tree bitpos;

  unsigned int record_align;


  unsigned int unpacked_align;

  tree prev_field;


  tree pending_statics;

  int remaining_in_alignment;


  int packed_maybe_necessary;
} *record_layout_info;

extern record_layout_info start_record_layout (tree);
extern tree bit_from_pos (tree, tree);
extern tree byte_from_pos (tree, tree);
extern void pos_from_bit (tree *, tree *, unsigned int, tree);
extern void normalize_offset (tree *, tree *, unsigned int);
extern tree rli_size_unit_so_far (record_layout_info);
extern tree rli_size_so_far (record_layout_info);
extern void normalize_rli (record_layout_info);
extern void place_field (record_layout_info, tree);
extern void compute_record_mode (tree);
extern void finish_record_layout (record_layout_info, int);






extern tree type_hash_canon (unsigned int, tree);
# 4290 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern void layout_decl (tree, unsigned);




extern void relayout_decl (tree);






extern enum machine_mode mode_for_size_tree (const_tree, enum mode_class, int);



extern tree non_lvalue (tree);

extern tree convert (tree, tree);
extern unsigned int expr_align (const_tree);
extern tree expr_first (tree);
extern tree expr_last (tree);
extern tree expr_only (tree);
extern tree size_in_bytes (const_tree);
extern long int_size_in_bytes (const_tree);
extern long max_int_size_in_bytes (const_tree);
extern tree bit_position (const_tree);
extern long int_bit_position (const_tree);
extern tree byte_position (const_tree);
extern long int_byte_position (const_tree);




enum size_type_kind
{
  SIZETYPE,
  SSIZETYPE,
  BITSIZETYPE,
  SBITSIZETYPE,
  TYPE_KIND_LAST};

extern tree sizetype_tab[(int) TYPE_KIND_LAST];






extern tree size_int_kind (long, enum size_type_kind);
extern tree size_binop (enum tree_code, tree, tree);
extern tree size_diffop (tree, tree);






extern tree round_up (tree, int);
extern tree round_down (tree, int);
extern tree get_pending_sizes (void);
extern void put_pending_size (tree);
extern void put_pending_sizes (tree);
# 4362 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern unsigned int maximum_field_alignment;

extern unsigned int initial_max_fld_align;





extern tree chainon (tree, tree);



extern tree tree_cons_stat (tree, tree, tree );




extern tree tree_last (tree);



extern tree nreverse (tree);




extern int list_length (const_tree);



extern int fields_length (const_tree);




extern unsigned char initializer_zerop (const_tree);



extern tree ctor_to_list (tree);
# 4414 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern unsigned char categorize_ctor_elements (const_tree, long *, long *,
          unsigned char *);

extern long count_type_elements (const_tree, unsigned char);



extern int integer_zerop (const_tree);



extern int integer_onep (const_tree);




extern int integer_all_onesp (const_tree);




extern int integer_pow2p (const_tree);




extern int integer_nonzerop (const_tree);

extern unsigned char cst_and_fits_in_hwi (const_tree);
extern tree num_ending_zeros (const_tree);




extern int fixed_zerop (const_tree);




extern tree staticp (tree);





extern tree save_expr (tree);




extern tree skip_simple_arithmetic (tree);



enum tree_node_structure_enum tree_node_structure (const_tree);







extern unsigned char contains_placeholder_p (const_tree);
# 4488 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern unsigned char type_contains_placeholder_p (tree);






extern tree substitute_in_expr (tree, tree, tree);
# 4506 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree substitute_placeholder_in_expr (tree, tree);
# 4521 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree variable_size (tree);





extern tree stabilize_reference (tree);





extern tree stabilize_reference_1 (tree);






extern tree get_unwidened (tree, tree);






extern tree get_narrower (tree, int *);



extern int handled_component_p (const_tree);





extern tree get_inner_reference (tree, long *, long *,
     tree *, enum machine_mode *, int *, int *,
     unsigned char);





extern unsigned char contains_packed_reference (const_tree exp);




extern tree array_ref_element_size (tree);




extern tree array_ref_low_bound (tree);




extern tree array_ref_up_bound (tree);




extern tree component_ref_field_offset (tree);




extern tree get_containing_scope (const_tree);



extern tree decl_function_context (const_tree);



extern tree decl_type_context (const_tree);


extern int real_zerop (const_tree);






extern int pedantic_lvalues;



extern tree current_function_decl;


extern const char * current_function_func_begin_label;


typedef struct {
  tree fntype;
  tree next;
} function_args_iterator;



static __inline__ void
function_args_iter_init (function_args_iterator *i, tree fntype)
{
  i->fntype = fntype;
  i->next = ((fntype)->type.values);
}




static __inline__ tree *
function_args_iter_cond_ptr (function_args_iterator *i)
{
  return (i->next) ? &((i->next)->list.value) : ((void *)0);
}




static __inline__ tree
function_args_iter_cond (function_args_iterator *i)
{
  return (i->next) ? ((i->next)->list.value) : (tree) ((void *)0);
}


static __inline__ void
function_args_iter_next (function_args_iterator *i)
{
  ((void)(!(i->next != (tree) ((void *)0)) ? fancy_abort ("/home/mzorgati/gcc-4.4.0/gcc/tree.h", 4654, __FUNCTION__), 0 : 0));
  i->next = ((i->next)->common.chain);
}



static __inline__ unsigned char
inlined_function_outer_scope_p (const_tree block)
{
 return ((block)->block.locus) != ((source_location) 0);
}
# 4685 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern unsigned crc32_string (unsigned, const char *);
extern void clean_symbol_name (char *);
extern tree get_file_function_name (const char *);
extern tree get_callee_fndecl (const_tree);
extern void change_decl_assembler_name (tree, tree);
extern int type_num_arguments (const_tree);
extern unsigned char associative_tree_code (enum tree_code);
extern unsigned char commutative_tree_code (enum tree_code);
extern tree upper_bound_in_type (tree, tree);
extern tree lower_bound_in_type (tree, tree);
extern int operand_equal_for_phi_arg_p (const_tree, const_tree);
extern tree call_expr_arg (tree, int);
extern tree *call_expr_argp (tree, int);
extern tree call_expr_arglist (tree);
extern tree create_artificial_label (void);
extern const char *get_name (tree);
extern unsigned char stdarg_p (tree);
extern unsigned char prototype_p (tree);
extern int function_args_count (tree);
extern unsigned char auto_var_in_fn_p (const_tree, const_tree);


extern tree unshare_expr (tree);



extern void expand_expr_stmt (tree);
extern int warn_if_unused_value (const_tree, location_t);
extern void expand_label (tree);
extern void expand_goto (tree);

extern rtx expand_stack_save (void);
extern void expand_stack_restore (tree);
extern void expand_return (tree);


extern void using_eh_for_cleanups (void);





extern int folding_initializer;


extern int native_encode_expr (const_tree, unsigned char *, int);
extern tree native_interpret_expr (tree, const unsigned char *, int);







extern tree fold (tree);
extern tree fold_unary (enum tree_code, tree, tree);
extern tree fold_unary_ignore_overflow (enum tree_code, tree, tree);
extern tree fold_binary (enum tree_code, tree, tree, tree);
extern tree fold_ternary (enum tree_code, tree, tree, tree, tree);
extern tree fold_build1_stat (enum tree_code, tree, tree );

extern tree fold_build2_stat (enum tree_code, tree, tree, tree );

extern tree fold_build3_stat (enum tree_code, tree, tree, tree, tree );

extern tree fold_build1_initializer (enum tree_code, tree, tree);
extern tree fold_build2_initializer (enum tree_code, tree, tree, tree);
extern tree fold_build3_initializer (enum tree_code, tree, tree, tree, tree);
extern tree fold_build_call_array (tree, tree, int, tree *);
extern tree fold_build_call_array_initializer (tree, tree, int, tree *);
extern unsigned char fold_convertible_p (const_tree, const_tree);
extern tree fold_convert (tree, tree);
extern tree fold_single_bit_test (enum tree_code, tree, tree, tree);
extern tree fold_ignored_result (tree);
extern tree fold_abs_const (tree, tree);
extern tree fold_indirect_ref_1 (tree, tree);
extern void fold_defer_overflow_warnings (void);
extern void fold_undefer_overflow_warnings (unsigned char, const_gimple, int);
extern void fold_undefer_and_ignore_overflow_warnings (void);
extern unsigned char fold_deferring_overflow_warnings_p (void);
extern tree maybe_fold_offset_to_reference (tree, tree, tree);
extern tree maybe_fold_offset_to_address (tree, tree, tree);
extern tree maybe_fold_stmt_addition (tree, tree, tree);

extern tree force_fit_type_double (tree, unsigned long, long,
       int, unsigned char);

extern int fit_double_type (unsigned long, long,
       unsigned long *, long *, const_tree);
extern int add_double_with_sign (unsigned long, long,
     unsigned long, long,
     unsigned long *, long *,
     unsigned char);


extern int neg_double (unsigned long, long,
         unsigned long *, long *);
extern int mul_double_with_sign (unsigned long, long,
     unsigned long, long,
     unsigned long *, long *,
     unsigned char);


extern void lshift_double (unsigned long, long,
      long, unsigned int,
      unsigned long *, long *, int);
extern void rshift_double (unsigned long, long,
      long, unsigned int,
      unsigned long *, long *, int);
extern void lrotate_double (unsigned long, long,
       long, unsigned int,
       unsigned long *, long *);
extern void rrotate_double (unsigned long, long,
       long, unsigned int,
       unsigned long *, long *);

extern int div_and_round_double (enum tree_code, int, unsigned long,
     long, unsigned long,
     long, unsigned long *,
     long *, unsigned long *,
     long *);

enum operand_equal_flag
{
  OEP_ONLY_CONST = 1,
  OEP_PURE_SAME = 2
};

extern int operand_equal_p (const_tree, const_tree, unsigned int);
extern int multiple_of_p (tree, const_tree, const_tree);
extern tree omit_one_operand (tree, tree, tree);
extern tree omit_two_operands (tree, tree, tree, tree);
extern tree invert_truthvalue (tree);
extern tree fold_truth_not_expr (tree);
extern tree fold_unary_to_constant (enum tree_code, tree, tree);
extern tree fold_binary_to_constant (enum tree_code, tree, tree, tree);
extern tree fold_read_from_constant_string (tree);
extern tree int_const_binop (enum tree_code, const_tree, const_tree, int);
extern tree build_fold_addr_expr (tree);
extern tree fold_build_cleanup_point_expr (tree type, tree expr);
extern tree fold_strip_sign_ops (tree);
extern tree build_fold_addr_expr_with_type (tree, tree);
extern tree build_fold_indirect_ref (tree);
extern tree fold_indirect_ref (tree);
extern tree constant_boolean_node (int, tree);
extern tree build_low_bits_mask (tree, unsigned);

extern unsigned char tree_swap_operands_p (const_tree, const_tree, unsigned char);
extern enum tree_code swap_tree_comparison (enum tree_code);

extern unsigned char ptr_difference_const (tree, tree, long *);
extern enum tree_code invert_tree_comparison (enum tree_code, unsigned char);

extern unsigned char tree_expr_nonzero_p (tree);
extern unsigned char tree_unary_nonzero_warnv_p (enum tree_code, tree, tree, unsigned char *);
extern unsigned char tree_binary_nonzero_warnv_p (enum tree_code, tree, tree, tree op1,
                                         unsigned char *);
extern unsigned char tree_single_nonzero_warnv_p (tree, unsigned char *);
extern unsigned char tree_expr_nonzero_warnv_p (tree, unsigned char *);
extern unsigned char tree_unary_nonnegative_warnv_p (enum tree_code, tree, tree, unsigned char *);
extern unsigned char tree_binary_nonnegative_warnv_p (enum tree_code, tree, tree, tree,
                                             unsigned char *);
extern unsigned char tree_single_nonnegative_warnv_p (tree t, unsigned char *strict_overflow_p);
extern unsigned char tree_invalid_nonnegative_warnv_p (tree t, unsigned char *strict_overflow_p);
extern unsigned char tree_call_nonnegative_warnv_p (tree, tree, tree, tree, unsigned char *);

extern unsigned char tree_expr_nonzero_warnv_p (tree, unsigned char *);

extern unsigned char fold_real_zero_addition_p (const_tree, const_tree, int);


static __inline__ unsigned char
truth_value_p (enum tree_code code)
{
  return (tree_code_type[(int) (code)] == tcc_comparison
   || code == TRUTH_AND_EXPR || code == TRUTH_ANDIF_EXPR
   || code == TRUTH_OR_EXPR || code == TRUTH_ORIF_EXPR
   || code == TRUTH_XOR_EXPR || code == TRUTH_NOT_EXPR);
}



extern tree fold_call_expr (tree, unsigned char);
extern tree fold_builtin_fputs (tree, tree, unsigned char, unsigned char, tree);
extern tree fold_builtin_strcpy (tree, tree, tree, tree);
extern tree fold_builtin_strncpy (tree, tree, tree, tree, tree);
extern tree fold_builtin_memory_chk (tree, tree, tree, tree, tree, tree, unsigned char,
         enum built_in_function);
extern tree fold_builtin_stxcpy_chk (tree, tree, tree, tree, tree, unsigned char,
         enum built_in_function);
extern tree fold_builtin_strncpy_chk (tree, tree, tree, tree, tree);
extern tree fold_builtin_snprintf_chk (tree, tree, enum built_in_function);
extern unsigned char fold_builtin_next_arg (tree, unsigned char);
extern enum built_in_function builtin_mathfn_code (const_tree);
extern tree build_function_call_expr (tree, tree);
extern tree fold_builtin_call_array (tree, tree, int, tree *);
extern void debug_fold_checksum (const_tree);
extern tree build_call_expr (tree, int, ...);
extern tree mathfn_built_in (tree, enum built_in_function fn);
extern tree strip_float_extensions (tree);
extern tree c_strlen (tree, int);
extern tree std_gimplify_va_arg_expr (tree, tree, gimple_seq *, gimple_seq *);
extern tree build_va_arg_indirect_ref (tree);
extern tree build_string_literal (int, const char *);
extern unsigned char validate_arglist (const_tree, ...);
extern rtx builtin_memset_read_str (void *, long, enum machine_mode);
extern int get_pointer_alignment (tree, unsigned int);
extern int get_object_alignment (tree, unsigned int, unsigned int);
extern tree fold_call_stmt (gimple, unsigned char);
extern tree gimple_fold_builtin_snprintf_chk (gimple, tree, enum built_in_function);


extern tree strip_float_extensions (tree);


extern int really_constant_p (const_tree);
extern unsigned char decl_address_invariant_p (const_tree);
extern unsigned char decl_address_ip_invariant_p (const_tree);
extern int int_fits_type_p (const_tree, const_tree);

extern void get_type_static_bounds (const_tree, mpz_t, mpz_t);

extern unsigned char variably_modified_type_p (tree, tree);
extern int tree_log2 (const_tree);
extern int tree_floor_log2 (const_tree);
extern int simple_cst_equal (const_tree, const_tree);
extern hashval_t iterative_hash_expr (const_tree, hashval_t);
extern hashval_t iterative_hash_exprs_commutative (const_tree,
                                                   const_tree, hashval_t);
extern hashval_t iterative_hash_hashval_t (hashval_t, hashval_t);
extern int compare_tree_int (const_tree, unsigned long);
extern int type_list_equal (const_tree, const_tree);
extern int chain_member (const_tree, const_tree);
extern tree type_hash_lookup (unsigned int, tree);
extern void type_hash_add (unsigned int, tree);
extern int simple_cst_list_equal (const_tree, const_tree);
extern void dump_tree_statistics (void);
extern void expand_function_end (void);
extern void expand_function_start (tree);
extern void stack_protect_prologue (void);
extern void stack_protect_epilogue (void);
extern void recompute_tree_invariant_for_addr_expr (tree);
extern unsigned char needs_to_live_in_memory (const_tree);
extern tree reconstruct_complex_type (tree, tree);

extern int real_onep (const_tree);
extern int real_twop (const_tree);
extern int real_minus_onep (const_tree);
extern void init_ttree (void);
extern void build_common_tree_nodes (unsigned char, unsigned char);
extern void build_common_tree_nodes_2 (int);
extern void build_common_builtin_nodes (void);
extern tree build_nonstandard_integer_type (unsigned long, int);
extern tree build_range_type (tree, tree, tree);
extern long int_cst_value (const_tree);
extern tree build_addr (tree, tree);

extern unsigned char fields_compatible_p (const_tree, const_tree);
extern tree find_compatible_field (tree, tree);

extern void set_expr_locus (tree, source_location *);

extern tree *tree_block (tree);
extern location_t *block_nonartificial_location (tree);
extern location_t tree_nonartificial_location (tree);


extern void expand_main_function (void);
extern void init_dummy_function_start (void);
extern void expand_dummy_function_end (void);
extern unsigned int init_function_for_compilation (void);
extern void allocate_struct_function (tree, unsigned char);
extern void push_struct_function (tree fndecl);
extern void init_function_start (tree);
extern unsigned char use_register_for_decl (const_tree);
extern void generate_setjmp_warnings (void);
extern void init_temp_slots (void);
extern void free_temp_slots (void);
extern void pop_temp_slots (void);
extern void push_temp_slots (void);
extern void preserve_temp_slots (rtx);
extern int aggregate_value_p (const_tree, const_tree);
extern void push_function_context (void);
extern void pop_function_context (void);
extern gimple_seq gimplify_parameters (void);



extern void print_rtl (FILE *, const_rtx);



extern void debug_tree (tree);

extern void dump_addr (FILE*, const char *, const void *);
extern void print_node (FILE *, const char *, tree, int);
extern void print_node_brief (FILE *, const char *, const_tree, int);
extern void indent_to (FILE *, int);



extern unsigned char debug_find_tree (tree, tree);


extern tree unsave_expr_now (tree);
extern tree build_duplicate_type (tree);
# 5023 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern int flags_from_decl_or_type (const_tree);
extern int call_expr_flags (const_tree);

extern int setjmp_call_p (const_tree);
extern unsigned char gimple_alloca_call_p (const_gimple);
extern unsigned char alloca_call_p (const_tree);
extern unsigned char must_pass_in_stack_var_size (enum machine_mode, const_tree);
extern unsigned char must_pass_in_stack_var_size_or_pad (enum machine_mode, const_tree);
extern tree block_ultimate_origin (const_tree);



extern const struct attribute_spec *lookup_attribute_spec (tree);
# 5045 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern tree decl_attributes (tree *, tree, int);


extern void set_decl_abstract_flags (tree, int);
extern void set_decl_origin_self (tree);


extern void set_min_and_max_values_for_integral_type (tree, int, unsigned char);
extern void fixup_signed_type (tree);
extern void internal_reference_types (void);
extern unsigned int update_alignment_for_field (record_layout_info, tree,
                                                unsigned int);

extern void make_decl_rtl (tree);
extern void make_decl_one_only (tree);
extern int supports_one_only (void);
extern void resolve_unique_section (tree, int, int);
extern void mark_referenced (tree);
extern void mark_decl_referenced (tree);
extern void notice_global_symbol (tree);
extern void set_user_assembler_name (tree, const char *);
extern void process_pending_assemble_externals (void);
extern void finish_aliases_1 (void);
extern void finish_aliases_2 (void);
extern tree emutls_decl (tree);


extern void expand_computed_goto (tree);
extern unsigned char parse_output_constraint (const char **, int, int, int,
         unsigned char *, unsigned char *, unsigned char *);
extern unsigned char parse_input_constraint (const char **, int, int, int, int,
        const char * const *, unsigned char *, unsigned char *);
extern void expand_asm_expr (tree);
extern tree resolve_asm_operand_names (tree, tree, tree);
extern void expand_case (tree);
extern void expand_decl (tree);
# 5091 "/home/mzorgati/gcc-4.4.0/gcc/tree.h"
extern char *dwarf2out_cfi_label (void);



extern void dwarf2out_def_cfa (const char *, unsigned, long);



extern void dwarf2out_window_save (const char *);




extern void dwarf2out_args_size (const char *, long);



extern void dwarf2out_reg_save (const char *, unsigned, long);



extern void dwarf2out_return_save (const char *, long);



extern void dwarf2out_return_reg (const char *, unsigned);



extern void dwarf2out_reg_save_reg (const char *, rtx, rtx);





struct pointer_set_t;



typedef tree (*walk_tree_fn) (tree *, int *, void *);



typedef tree (*walk_tree_lh) (tree *, int *, tree (*) (tree *, int *, void *),
         void *, struct pointer_set_t*);

extern tree walk_tree_1 (tree*, walk_tree_fn, void*, struct pointer_set_t*,
    walk_tree_lh);
extern tree walk_tree_without_duplicates_1 (tree*, walk_tree_fn, void*,
         walk_tree_lh);







extern void set_decl_rtl (tree, rtx);
extern void set_decl_incoming_rtl (tree, rtx, unsigned char);



typedef enum
{
  d_kind,
  t_kind,
  b_kind,
  s_kind,
  r_kind,
  e_kind,
  c_kind,
  id_kind,
  perm_list_kind,
  temp_list_kind,
  vec_kind,
  binfo_kind,
  ssa_name_kind,
  constr_kind,
  x_kind,
  lang_decl,
  lang_type,
  omp_clause_kind,
  all_kinds
} tree_node_kind;

extern int tree_node_counts[];
extern int tree_node_sizes[];




extern unsigned char in_gimple_form;


extern tree get_base_address (tree t);


extern void vect_set_verbosity_level (const char *);



struct tree_map_base
{
  tree from;
};

extern int tree_map_base_eq (const void *, const void *);
extern unsigned int tree_map_base_hash (const void *);
extern int tree_map_base_marked_p (const void *);



struct tree_map
{
  struct tree_map_base base;
  unsigned int hash;
  tree to;
};


extern unsigned int tree_map_hash (const void *);




struct tree_int_map
{
  struct tree_map_base base;
  unsigned int to;
};







struct tree_priority_map
{
  struct tree_map_base base;
  priority_type init;
  priority_type fini;
};






extern tree tree_mem_ref_addr (tree, tree);
extern void copy_mem_ref_info (tree, tree);


extern unsigned char ssa_name_nonzero_p (const_tree);
extern unsigned char ssa_name_nonnegative_p (const_tree);


extern void init_object_sizes (void);
extern void fini_object_sizes (void);
extern unsigned long compute_builtin_object_size (tree, int);


extern unsigned long highest_pow2_factor (const_tree);



void init_inline_once (void);




static __inline__ int
tree_operand_length (const_tree node)
{
  if ((tree_code_type[(int) (((enum tree_code) (node)->base.code))] == tcc_vl_exp))
    return ((int)((((node)->exp.operands[0])->int_cst.int_cst).low));
  else
    return tree_code_length[(int) (((enum tree_code) (node)->base.code))];
}






typedef struct call_expr_arg_iterator_d
{
  tree t;
  int n;
  int i;
} call_expr_arg_iterator;

typedef struct const_call_expr_arg_iterator_d
{
  const_tree t;
  int n;
  int i;
} const_call_expr_arg_iterator;



static __inline__ void
init_call_expr_arg_iterator (tree exp, call_expr_arg_iterator *iter)
{
  iter->t = exp;
  iter->n = (((int)((((exp)->exp.operands[0])->int_cst.int_cst).low)) - 3);
  iter->i = 0;
}

static __inline__ void
init_const_call_expr_arg_iterator (const_tree exp, const_call_expr_arg_iterator *iter)
{
  iter->t = exp;
  iter->n = (((int)((((exp)->exp.operands[0])->int_cst.int_cst).low)) - 3);
  iter->i = 0;
}



static __inline__ tree
next_call_expr_arg (call_expr_arg_iterator *iter)
{
  tree result;
  if (iter->i >= iter->n)
    return (tree) ((void *)0);
  result = (((iter->t))->exp.operands[(iter->i) + 3]);
  iter->i++;
  return result;
}

static __inline__ const_tree
next_const_call_expr_arg (const_call_expr_arg_iterator *iter)
{
  const_tree result;
  if (iter->i >= iter->n)
    return (tree) ((void *)0);
  result = (((iter->t))->exp.operands[(iter->i) + 3]);
  iter->i++;
  return result;
}





static __inline__ tree
first_call_expr_arg (tree exp, call_expr_arg_iterator *iter)
{
  init_call_expr_arg_iterator (exp, iter);
  return next_call_expr_arg (iter);
}

static __inline__ const_tree
first_const_call_expr_arg (const_tree exp, const_call_expr_arg_iterator *iter)
{
  init_const_call_expr_arg_iterator (exp, iter);
  return next_const_call_expr_arg (iter);
}



static __inline__ unsigned char
more_call_expr_args_p (const call_expr_arg_iterator *iter)
{
  return (iter->i < iter->n);
}

static __inline__ unsigned char
more_const_call_expr_args_p (const const_call_expr_arg_iterator *iter)
{
  return (iter->i < iter->n);
}
# 48 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/regs.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/regs.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/varray.h" 1
# 38 "/home/mzorgati/gcc-4.4.0/gcc/varray.h"
enum varray_data_enum {
  VARRAY_DATA_C,
  VARRAY_DATA_UC,
  VARRAY_DATA_S,
  VARRAY_DATA_US,
  VARRAY_DATA_I,
  VARRAY_DATA_U,
  VARRAY_DATA_L,
  VARRAY_DATA_UL,
  VARRAY_DATA_HINT,
  VARRAY_DATA_UHINT,
  VARRAY_DATA_GENERIC,
  VARRAY_DATA_GENERIC_NOGC,
  VARRAY_DATA_CPTR,
  VARRAY_DATA_RTX,
  VARRAY_DATA_RTVEC,
  VARRAY_DATA_TREE,
  VARRAY_DATA_BITMAP,
  VARRAY_DATA_REG,
  VARRAY_DATA_BB,
  VARRAY_DATA_TE,
  VARRAY_DATA_EDGE,
  VARRAY_DATA_TREE_PTR,
  NUM_VARRAY_DATA
};


typedef union varray_data_tag {
  char vdt_c[1];

  unsigned char vdt_uc[1];

  short vdt_s[1];

  unsigned short vdt_us[1];

  int vdt_i[1];

  unsigned int vdt_u[1];

  long vdt_l[1];

  unsigned long vdt_ul[1];

  long vdt_hint[1];

  unsigned long vdt_uhint[1];

  void * vdt_generic[1];

  void * vdt_generic_nogc[1];

  char * vdt_cptr[1];

  rtx vdt_rtx[1];

  rtvec vdt_rtvec[1];

  tree vdt_tree[1];

  struct bitmap_head_def * vdt_bitmap[1];

  struct reg_info_def * vdt_reg[1];

  struct basic_block_def * vdt_bb[1];

  struct elt_list * vdt_te[1];

  struct edge_def * vdt_e[1];

  tree * vdt_tp[1];

} varray_data;


struct varray_head_tag {
  size_t num_elements;
  size_t elements_used;

  enum varray_data_enum type;
  const char *name;
  varray_data data;

};
typedef struct varray_head_tag *varray_type;



extern varray_type varray_init (size_t, enum varray_data_enum, const char *);
# 200 "/home/mzorgati/gcc-4.4.0/gcc/varray.h"
extern varray_type varray_grow (varray_type, size_t);
# 211 "/home/mzorgati/gcc-4.4.0/gcc/varray.h"
extern void varray_clear (varray_type);
extern void dump_varray_statistics (void);
# 26 "/home/mzorgati/gcc-4.4.0/gcc/regs.h" 2

# 1 "/home/mzorgati/gcc-4.4.0/gcc/hard-reg-set.h" 1
# 42 "/home/mzorgati/gcc-4.4.0/gcc/hard-reg-set.h"
typedef unsigned long HARD_REG_ELT_TYPE;
# 114 "/home/mzorgati/gcc-4.4.0/gcc/hard-reg-set.h"
static __inline__ unsigned char
hard_reg_set_subset_p (const HARD_REG_ELT_TYPE x, const HARD_REG_ELT_TYPE y)
{
  return (x & ~y) == ((HARD_REG_ELT_TYPE) (0));
}

static __inline__ unsigned char
hard_reg_set_equal_p (const HARD_REG_ELT_TYPE x, const HARD_REG_ELT_TYPE y)
{
  return x == y;
}

static __inline__ unsigned char
hard_reg_set_intersect_p (const HARD_REG_ELT_TYPE x, const HARD_REG_ELT_TYPE y)
{
  return (x & y) != ((HARD_REG_ELT_TYPE) (0));
}

static __inline__ unsigned char
hard_reg_set_empty_p (const HARD_REG_ELT_TYPE x)
{
  return x == ((HARD_REG_ELT_TYPE) (0));
}
# 484 "/home/mzorgati/gcc-4.4.0/gcc/hard-reg-set.h"
typedef struct
{

  HARD_REG_ELT_TYPE *pelt;


  unsigned short length;


  unsigned short word_no;




  HARD_REG_ELT_TYPE bits;
} hard_reg_set_iterator;





static __inline__ void
hard_reg_set_iter_init (hard_reg_set_iterator *iter, HARD_REG_ELT_TYPE set,
                        unsigned min, unsigned *regno)
{




  iter->pelt = &set;
  iter->length = 1;

  iter->word_no = min / ((unsigned) (8 * 4));
  if (iter->word_no < iter->length)
    {
      iter->bits = iter->pelt[iter->word_no];
      iter->bits >>= min % ((unsigned) (8 * 4));


      min += !iter->bits;
    }
  *regno = min;
}

static __inline__ unsigned char
hard_reg_set_iter_set (hard_reg_set_iterator *iter, unsigned *regno)
{
  while (1)
    {

      if (iter->word_no >= iter->length)
        return 0;

      if (iter->bits)
        {

          while (!(iter->bits & 1))
            {
              iter->bits >>= 1;
              *regno += 1;
            }
          return (*regno < FIRST_PSEUDO_REGISTER);
        }


      *regno = (*regno + ((unsigned) (8 * 4)) - 1);
      *regno -= *regno % ((unsigned) (8 * 4));


      while (++iter->word_no < iter->length)
        {
          iter->bits = iter->pelt[iter->word_no];
          if (iter->bits)
            break;
          *regno += ((unsigned) (8 * 4));
        }
    }
}

static __inline__ void
hard_reg_set_iter_next (hard_reg_set_iterator *iter, unsigned *regno)
{
  iter->bits >>= 1;
  *regno += 1;
}
# 583 "/home/mzorgati/gcc-4.4.0/gcc/hard-reg-set.h"
extern char fixed_regs[FIRST_PSEUDO_REGISTER];



extern HARD_REG_ELT_TYPE fixed_reg_set;






extern char call_used_regs[FIRST_PSEUDO_REGISTER];







extern HARD_REG_ELT_TYPE call_used_reg_set;







extern char call_fixed_regs[FIRST_PSEUDO_REGISTER];



extern HARD_REG_ELT_TYPE call_fixed_reg_set;






extern char global_regs[FIRST_PSEUDO_REGISTER];
# 630 "/home/mzorgati/gcc-4.4.0/gcc/hard-reg-set.h"
extern HARD_REG_ELT_TYPE regs_invalidated_by_call;




extern HARD_REG_ELT_TYPE no_caller_save_reg_set;
# 649 "/home/mzorgati/gcc-4.4.0/gcc/hard-reg-set.h"
extern HARD_REG_ELT_TYPE reg_class_contents[N_REG_CLASSES];



extern unsigned int reg_class_size[N_REG_CLASSES];



extern enum reg_class reg_class_subclasses[N_REG_CLASSES][N_REG_CLASSES];




extern enum reg_class reg_class_subunion[N_REG_CLASSES][N_REG_CLASSES];




extern enum reg_class reg_class_superunion[N_REG_CLASSES][N_REG_CLASSES];



extern const char * reg_names[FIRST_PSEUDO_REGISTER];



extern const char * reg_class_names[];
# 28 "/home/mzorgati/gcc-4.4.0/gcc/regs.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h" 1
# 24 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/bitmap.h" 1
# 29 "/home/mzorgati/gcc-4.4.0/gcc/bitmap.h"
typedef unsigned long BITMAP_WORD;
# 45 "/home/mzorgati/gcc-4.4.0/gcc/bitmap.h"
typedef struct bitmap_obstack
{
  struct bitmap_element_def *elements;
  struct bitmap_head_def *heads;
  struct obstack obstack;
} bitmap_obstack;
# 64 "/home/mzorgati/gcc-4.4.0/gcc/bitmap.h"
typedef struct bitmap_element_def
{
  struct bitmap_element_def *next;
  struct bitmap_element_def *prev;
  unsigned int indx;
  BITMAP_WORD bits[((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u))];
} bitmap_element;

struct bitmap_descriptor;




typedef struct bitmap_head_def {
  bitmap_element *first;
  bitmap_element *current;
  unsigned int indx;
  bitmap_obstack *obstack;




} bitmap_head;


extern bitmap_element bitmap_zero_bits;
extern bitmap_obstack bitmap_default_obstack;


extern void bitmap_clear (bitmap);


extern void bitmap_copy (bitmap, const_bitmap);


extern unsigned char bitmap_equal_p (const_bitmap, const_bitmap);


extern unsigned char bitmap_intersect_p (const_bitmap, const_bitmap);



extern unsigned char bitmap_intersect_compl_p (const_bitmap, const_bitmap);





extern unsigned char bitmap_single_bit_set_p (const_bitmap);


extern unsigned long bitmap_count_bits (const_bitmap);





extern void bitmap_and (bitmap, const_bitmap, const_bitmap);
extern void bitmap_and_into (bitmap, const_bitmap);
extern unsigned char bitmap_and_compl (bitmap, const_bitmap, const_bitmap);
extern unsigned char bitmap_and_compl_into (bitmap, const_bitmap);

extern void bitmap_compl_and_into (bitmap, const_bitmap);
extern void bitmap_clear_range (bitmap, unsigned int, unsigned int);
extern void bitmap_set_range (bitmap, unsigned int, unsigned int);
extern unsigned char bitmap_ior (bitmap, const_bitmap, const_bitmap);
extern unsigned char bitmap_ior_into (bitmap, const_bitmap);
extern void bitmap_xor (bitmap, const_bitmap, const_bitmap);
extern void bitmap_xor_into (bitmap, const_bitmap);


extern unsigned char bitmap_ior_and_compl (bitmap DST, const_bitmap A, const_bitmap B, const_bitmap C);

extern unsigned char bitmap_ior_and_compl_into (bitmap DST, const_bitmap B, const_bitmap C);


extern unsigned char bitmap_clear_bit (bitmap, int);


extern unsigned char bitmap_set_bit (bitmap, int);


extern int bitmap_bit_p (bitmap, int);


extern void debug_bitmap (const_bitmap);
extern void debug_bitmap_file (FILE *, const_bitmap);


extern void bitmap_print (FILE *, const_bitmap, const char *, const char *);


extern void bitmap_obstack_initialize (bitmap_obstack *);
extern void bitmap_obstack_release (bitmap_obstack *);
extern void bitmap_register (bitmap );
extern void dump_bitmap_statistics (void);




static __inline__ void
bitmap_initialize_stat (bitmap head, bitmap_obstack *obstack )
{
  head->first = head->current = ((void *)0);
  head->obstack = obstack;



}



extern bitmap bitmap_obstack_alloc_stat (bitmap_obstack *obstack );

extern bitmap bitmap_gc_alloc_stat (void);

extern void bitmap_obstack_free (bitmap);




extern unsigned bitmap_first_set_bit (const_bitmap);


extern hashval_t bitmap_hash(const_bitmap);
# 202 "/home/mzorgati/gcc-4.4.0/gcc/bitmap.h"
typedef struct
{

  bitmap_element *elt1;


  bitmap_element *elt2;


  unsigned word_no;




  BITMAP_WORD bits;
} bitmap_iterator;




static __inline__ void
bmp_iter_set_init (bitmap_iterator *bi, const_bitmap map,
     unsigned start_bit, unsigned *bit_no)
{
  bi->elt1 = map->first;
  bi->elt2 = ((void *)0);


  while (1)
    {
      if (!bi->elt1)
 {
   bi->elt1 = &bitmap_zero_bits;
   break;
 }

      if (bi->elt1->indx >= start_bit / (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u)))
 break;
      bi->elt1 = bi->elt1->next;
    }


  if (bi->elt1->indx != start_bit / (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u)))
    start_bit = bi->elt1->indx * (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u));


  bi->word_no = start_bit / (8 * 4 * 1u) % ((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u));
  bi->bits = bi->elt1->bits[bi->word_no];
  bi->bits >>= start_bit % (8 * 4 * 1u);





  start_bit += !bi->bits;

  *bit_no = start_bit;
}




static __inline__ void
bmp_iter_and_init (bitmap_iterator *bi, const_bitmap map1, const_bitmap map2,
     unsigned start_bit, unsigned *bit_no)
{
  bi->elt1 = map1->first;
  bi->elt2 = map2->first;



  while (1)
    {
      if (!bi->elt1)
 {
   bi->elt2 = ((void *)0);
   break;
 }

      if (bi->elt1->indx >= start_bit / (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u)))
 break;
      bi->elt1 = bi->elt1->next;
    }


  while (1)
    {
      if (!bi->elt2)
 {
   bi->elt1 = bi->elt2 = &bitmap_zero_bits;
   break;
 }

      if (bi->elt2->indx >= bi->elt1->indx)
 break;
      bi->elt2 = bi->elt2->next;
    }


  if (bi->elt1->indx == bi->elt2->indx)
    {


      if (bi->elt1->indx != start_bit / (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u)))
 start_bit = bi->elt1->indx * (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u));

      bi->word_no = start_bit / (8 * 4 * 1u) % ((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u));
      bi->bits = bi->elt1->bits[bi->word_no] & bi->elt2->bits[bi->word_no];
      bi->bits >>= start_bit % (8 * 4 * 1u);
    }
  else
    {


      bi->word_no = ((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) - 1;
      bi->bits = 0;
    }





  start_bit += !bi->bits;

  *bit_no = start_bit;
}




static __inline__ void
bmp_iter_and_compl_init (bitmap_iterator *bi, const_bitmap map1, const_bitmap map2,
    unsigned start_bit, unsigned *bit_no)
{
  bi->elt1 = map1->first;
  bi->elt2 = map2->first;


  while (1)
    {
      if (!bi->elt1)
 {
   bi->elt1 = &bitmap_zero_bits;
   break;
 }

      if (bi->elt1->indx >= start_bit / (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u)))
 break;
      bi->elt1 = bi->elt1->next;
    }


  while (bi->elt2 && bi->elt2->indx < bi->elt1->indx)
    bi->elt2 = bi->elt2->next;



  if (bi->elt1->indx != start_bit / (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u)))
    start_bit = bi->elt1->indx * (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u));

  bi->word_no = start_bit / (8 * 4 * 1u) % ((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u));
  bi->bits = bi->elt1->bits[bi->word_no];
  if (bi->elt2 && bi->elt1->indx == bi->elt2->indx)
    bi->bits &= ~bi->elt2->bits[bi->word_no];
  bi->bits >>= start_bit % (8 * 4 * 1u);





  start_bit += !bi->bits;

  *bit_no = start_bit;
}




static __inline__ void
bmp_iter_next (bitmap_iterator *bi, unsigned *bit_no)
{
  bi->bits >>= 1;
  *bit_no += 1;
}





static __inline__ unsigned char
bmp_iter_set (bitmap_iterator *bi, unsigned *bit_no)
{

  if (bi->bits)
    {
    next_bit:
      while (!(bi->bits & 1))
 {
   bi->bits >>= 1;
   *bit_no += 1;
 }
      return 1;
    }




  *bit_no = ((*bit_no + (8 * 4 * 1u) - 1)
      / (8 * 4 * 1u) * (8 * 4 * 1u));
  bi->word_no++;

  while (1)
    {

      while (bi->word_no != ((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)))
 {
   bi->bits = bi->elt1->bits[bi->word_no];
   if (bi->bits)
     goto next_bit;
   *bit_no += (8 * 4 * 1u);
   bi->word_no++;
 }


      bi->elt1 = bi->elt1->next;
      if (!bi->elt1)
 return 0;
      *bit_no = bi->elt1->indx * (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u));
      bi->word_no = 0;
    }
}





static __inline__ unsigned char
bmp_iter_and (bitmap_iterator *bi, unsigned *bit_no)
{

  if (bi->bits)
    {
    next_bit:
      while (!(bi->bits & 1))
 {
   bi->bits >>= 1;
   *bit_no += 1;
 }
      return 1;
    }




  *bit_no = ((*bit_no + (8 * 4 * 1u) - 1)
      / (8 * 4 * 1u) * (8 * 4 * 1u));
  bi->word_no++;

  while (1)
    {

      while (bi->word_no != ((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)))
 {
   bi->bits = bi->elt1->bits[bi->word_no] & bi->elt2->bits[bi->word_no];
   if (bi->bits)
     goto next_bit;
   *bit_no += (8 * 4 * 1u);
   bi->word_no++;
 }


      do
 {


   do
     {
       bi->elt1 = bi->elt1->next;
       if (!bi->elt1)
  return 0;
     }
   while (bi->elt1->indx < bi->elt2->indx);



   while (bi->elt2->indx < bi->elt1->indx)
     {
       bi->elt2 = bi->elt2->next;
       if (!bi->elt2)
  return 0;
     }
 }
      while (bi->elt1->indx != bi->elt2->indx);

      *bit_no = bi->elt1->indx * (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u));
      bi->word_no = 0;
    }
}





static __inline__ unsigned char
bmp_iter_and_compl (bitmap_iterator *bi, unsigned *bit_no)
{

  if (bi->bits)
    {
    next_bit:
      while (!(bi->bits & 1))
 {
   bi->bits >>= 1;
   *bit_no += 1;
 }
      return 1;
    }




  *bit_no = ((*bit_no + (8 * 4 * 1u) - 1)
      / (8 * 4 * 1u) * (8 * 4 * 1u));
  bi->word_no++;

  while (1)
    {

      while (bi->word_no != ((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)))
 {
   bi->bits = bi->elt1->bits[bi->word_no];
   if (bi->elt2 && bi->elt2->indx == bi->elt1->indx)
     bi->bits &= ~bi->elt2->bits[bi->word_no];
   if (bi->bits)
     goto next_bit;
   *bit_no += (8 * 4 * 1u);
   bi->word_no++;
 }


      bi->elt1 = bi->elt1->next;
      if (!bi->elt1)
 return 0;


      while (bi->elt2 && bi->elt2->indx < bi->elt1->indx)
 bi->elt2 = bi->elt2->next;

      *bit_no = bi->elt1->indx * (((128 + (8 * 4 * 1u) - 1) / (8 * 4 * 1u)) * (8 * 4 * 1u));
      bi->word_no = 0;
    }
}
# 25 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/sbitmap.h" 1
# 39 "/home/mzorgati/gcc-4.4.0/gcc/sbitmap.h"
typedef struct simple_bitmap_def
{
  unsigned char *popcount;
  unsigned int n_bits;
  unsigned int size;
  unsigned long elms[1];
} *sbitmap;
typedef const struct simple_bitmap_def *const_sbitmap;

typedef unsigned long *sbitmap_ptr;
typedef const unsigned long *const_sbitmap_ptr;
# 62 "/home/mzorgati/gcc-4.4.0/gcc/sbitmap.h"
static __inline__ void
SET_BIT (sbitmap map, unsigned int bitno)
{
  if (map->popcount)
    {
      unsigned char oldbit;
      oldbit = ((map)->elms [(bitno) / ((unsigned) (8 * 4))] >> (bitno) % ((unsigned) (8 * 4)) & 1);
      if (!oldbit)
 map->popcount[bitno / ((unsigned) (8 * 4))]++;
    }
  map->elms[bitno / ((unsigned) (8 * 4))]
    |= (unsigned long) 1 << (bitno) % ((unsigned) (8 * 4));
}






static __inline__ void
RESET_BIT (sbitmap map, unsigned int bitno)
{
  if (map->popcount)
    {
      unsigned char oldbit;
      oldbit = ((map)->elms [(bitno) / ((unsigned) (8 * 4))] >> (bitno) % ((unsigned) (8 * 4)) & 1);
      if (oldbit)
 map->popcount[bitno / ((unsigned) (8 * 4))]--;
    }
  map->elms[bitno / ((unsigned) (8 * 4))]
    &= ~((unsigned long) 1 << (bitno) % ((unsigned) (8 * 4)));
}


typedef struct {

  const unsigned long *ptr;


  unsigned int size;


  unsigned int word_num;


  unsigned int bit_num;


  unsigned long word;
} sbitmap_iterator;




static __inline__ void
sbitmap_iter_init (sbitmap_iterator *i, const_sbitmap bmp, unsigned int min)
{
  i->word_num = min / (unsigned int) ((unsigned) (8 * 4));
  i->bit_num = min;
  i->size = bmp->size;
  i->ptr = bmp->elms;

  if (i->word_num >= i->size)
    i->word = 0;
  else
    i->word = (i->ptr[i->word_num]
        >> (i->bit_num % (unsigned int) ((unsigned) (8 * 4))));
}





static __inline__ unsigned char
sbitmap_iter_cond (sbitmap_iterator *i, unsigned int *n)
{

  for (; i->word == 0; i->word = i->ptr[i->word_num])
    {
      i->word_num++;


      if (i->word_num >= i->size)
 return 0;

      i->bit_num = i->word_num * ((unsigned) (8 * 4));
    }


  for (; (i->word & 1) == 0; i->word >>= 1)
    i->bit_num++;

  *n = i->bit_num;

  return 1;
}



static __inline__ void
sbitmap_iter_next (sbitmap_iterator *i)
{
  i->word >>= 1;
  i->bit_num++;
}
# 208 "/home/mzorgati/gcc-4.4.0/gcc/sbitmap.h"
struct int_list;

extern void dump_sbitmap (FILE *, const_sbitmap);
extern void dump_sbitmap_file (FILE *, const_sbitmap);
extern void dump_sbitmap_vector (FILE *, const char *, const char *, sbitmap *,
     int);
extern sbitmap sbitmap_alloc (unsigned int);
extern sbitmap sbitmap_alloc_with_popcount (unsigned int);
extern sbitmap *sbitmap_vector_alloc (unsigned int, unsigned int);
extern sbitmap sbitmap_resize (sbitmap, unsigned int, int);
extern void sbitmap_copy (sbitmap, const_sbitmap);
extern void sbitmap_copy_n (sbitmap, const_sbitmap, unsigned int);
extern int sbitmap_equal (const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_empty_p (const_sbitmap);
extern unsigned char sbitmap_range_empty_p (const_sbitmap, unsigned int, unsigned int);
extern void sbitmap_zero (sbitmap);
extern void sbitmap_ones (sbitmap);
extern void sbitmap_vector_zero (sbitmap *, unsigned int);
extern void sbitmap_vector_ones (sbitmap *, unsigned int);

extern void sbitmap_union_of_diff (sbitmap, const_sbitmap, const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_union_of_diff_cg (sbitmap, const_sbitmap, const_sbitmap, const_sbitmap);
extern void sbitmap_difference (sbitmap, const_sbitmap, const_sbitmap);
extern void sbitmap_not (sbitmap, const_sbitmap);
extern void sbitmap_a_or_b_and_c (sbitmap, const_sbitmap, const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_a_or_b_and_c_cg (sbitmap, const_sbitmap, const_sbitmap, const_sbitmap);
extern void sbitmap_a_and_b_or_c (sbitmap, const_sbitmap, const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_a_and_b_or_c_cg (sbitmap, const_sbitmap, const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_any_common_bits (const_sbitmap, const_sbitmap);
extern void sbitmap_a_and_b (sbitmap, const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_a_and_b_cg (sbitmap, const_sbitmap, const_sbitmap);
extern void sbitmap_a_or_b (sbitmap, const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_a_or_b_cg (sbitmap, const_sbitmap, const_sbitmap);
extern void sbitmap_a_xor_b (sbitmap, const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_a_xor_b_cg (sbitmap, const_sbitmap, const_sbitmap);
extern unsigned char sbitmap_a_subset_b_p (const_sbitmap, const_sbitmap);

extern int sbitmap_first_set_bit (const_sbitmap);
extern int sbitmap_last_set_bit (const_sbitmap);

extern void sbitmap_intersect_of_predsucc (sbitmap, sbitmap *, int,
        struct int_list **);



extern void sbitmap_union_of_predsucc (sbitmap, sbitmap *, int,
           struct int_list **);






extern void sbitmap_intersection_of_succs (sbitmap, sbitmap *, int);
extern void sbitmap_intersection_of_preds (sbitmap, sbitmap *, int);
extern void sbitmap_union_of_succs (sbitmap, sbitmap *, int);
extern void sbitmap_union_of_preds (sbitmap, sbitmap *, int);

extern void debug_sbitmap (const_sbitmap);
extern sbitmap sbitmap_realloc (sbitmap, unsigned int);
extern unsigned long sbitmap_popcount(const_sbitmap, unsigned long);
extern void sbitmap_verify_popcount (const_sbitmap);
# 26 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h" 2

# 1 "/home/mzorgati/gcc-4.4.0/include/partition.h" 1
# 46 "/home/mzorgati/gcc-4.4.0/include/partition.h"
struct partition_elem
{


  int class_element;


  struct partition_elem* next;


  unsigned class_count;
};

typedef struct partition_def
{

  int num_elements;

  struct partition_elem elements[1];
} *partition;

extern partition partition_new (int);
extern void partition_delete (partition);
extern int partition_union (partition, int, int);
extern void partition_print (partition, FILE*);
# 28 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h" 2

# 1 "/home/mzorgati/gcc-4.4.0/gcc/predict.h" 1
# 24 "/home/mzorgati/gcc-4.4.0/gcc/predict.h"
enum br_predictor
{
# 1 "/home/mzorgati/gcc-4.4.0/gcc/predict.def" 1
# 38 "/home/mzorgati/gcc-4.4.0/gcc/predict.def"
PRED_COMBINED,


PRED_DS_THEORY,



PRED_FIRST_MATCH,


PRED_NO_PREDICTION,


PRED_UNCONDITIONAL,





PRED_LOOP_ITERATIONS,



PRED_BUILTIN_EXPECT,



PRED_LOOP_ITERATIONS_GUESSED,



PRED_CONTINUE,


PRED_NORETURN,



PRED_COLD_FUNCTION,



PRED_LOOP_BRANCH,



PRED_LOOP_EXIT,



PRED_POINTER,
PRED_TREE_POINTER,


PRED_OPCODE_POSITIVE,
PRED_OPCODE_NONEQUAL,
PRED_FPOPCODE,
PRED_TREE_OPCODE_POSITIVE,
PRED_TREE_OPCODE_NONEQUAL,
PRED_TREE_FPOPCODE,


PRED_CALL,


PRED_TREE_EARLY_RETURN,


PRED_GOTO,


PRED_CONST_RETURN,


PRED_NEGATIVE_RETURN,


PRED_NULL_RETURN,


PRED_MUDFLAP,
# 27 "/home/mzorgati/gcc-4.4.0/gcc/predict.h" 2


  END_PREDICTORS
};

enum prediction
{
   NOT_TAKEN,
   TAKEN
};

extern void predict_insn_def (rtx, enum br_predictor, enum prediction);
extern int counts_to_freqs (void);
extern void estimate_bb_frequencies (void);
extern const char *predictor_name (enum br_predictor);
extern tree build_predict_expr (enum br_predictor, enum prediction);
# 30 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h" 2

# 1 "/home/mzorgati/gcc-4.4.0/gcc/function.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/tree.h" 1
# 26 "/home/mzorgati/gcc-4.4.0/gcc/function.h" 2
# 34 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
struct sequence_stack
{

  rtx first;
  rtx last;
  struct sequence_stack *next;
};

struct emit_status
{


  int x_reg_rtx_no;


  int x_first_label_num;






  rtx x_first_insn;
  rtx x_last_insn;





  struct sequence_stack *sequence_stack;



  int x_cur_insn_uid;



  location_t x_last_location;





  int regno_pointer_align_length;




  unsigned char * regno_pointer_align;
};







extern rtx * regno_reg_rtx;







struct expr_status
{


  int x_pending_stack_adjust;
# 120 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
  int x_inhibit_defer_pop;





  int x_stack_pointer_delta;




  rtx x_saveregs_value;


  rtx x_apply_args_value;


  rtx x_forced_labels;
};

typedef struct call_site_record *call_site_record;
static __inline__ void VEC_call_site_record_must_be_pointer_type (void) { (void)((call_site_record)1 == (void *)1); } typedef struct VEC_call_site_record_base { unsigned num; unsigned alloc; call_site_record vec[1]; } VEC_call_site_record_base; typedef struct VEC_call_site_record_none { VEC_call_site_record_base base; } VEC_call_site_record_none; static __inline__ unsigned VEC_call_site_record_base_length (const VEC_call_site_record_base *vec_) { return vec_ ? vec_->num : 0; } static __inline__ call_site_record VEC_call_site_record_base_last (const VEC_call_site_record_base *vec_ ) { (void)(vec_ && vec_->num); return vec_->vec[vec_->num - 1]; } static __inline__ call_site_record VEC_call_site_record_base_index (const VEC_call_site_record_base *vec_, unsigned ix_ ) { (void)(vec_ && ix_ < vec_->num); return vec_->vec[ix_]; } static __inline__ int VEC_call_site_record_base_iterate (const VEC_call_site_record_base *vec_, unsigned ix_, call_site_record *ptr) { if (vec_ && ix_ < vec_->num) { *ptr = vec_->vec[ix_]; return 1; } else { *ptr = 0; return 0; } } static __inline__ size_t VEC_call_site_record_base_embedded_size (int alloc_) { return __builtin_offsetof (VEC_call_site_record_base, vec) + alloc_ * sizeof(call_site_record); } static __inline__ void VEC_call_site_record_base_embedded_init (VEC_call_site_record_base *vec_, int alloc_) { vec_->num = 0; vec_->alloc = alloc_; } static __inline__ int VEC_call_site_record_base_space (VEC_call_site_record_base *vec_, int alloc_ ) { (void)(alloc_ >= 0); return vec_ ? vec_->alloc - vec_->num >= (unsigned)alloc_ : !alloc_; } static __inline__ call_site_record *VEC_call_site_record_base_quick_push (VEC_call_site_record_base *vec_, call_site_record obj_ ) { call_site_record *slot_; (void)(vec_->num < vec_->alloc); slot_ = &vec_->vec[vec_->num++]; *slot_ = obj_; return slot_; } static __inline__ call_site_record VEC_call_site_record_base_pop (VEC_call_site_record_base *vec_ ) { call_site_record obj_; (void)(vec_->num); obj_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_call_site_record_base_truncate (VEC_call_site_record_base *vec_, unsigned size_ ) { (void)(vec_ ? vec_->num >= size_ : !size_); if (vec_) vec_->num = size_; } static __inline__ call_site_record VEC_call_site_record_base_replace (VEC_call_site_record_base *vec_, unsigned ix_, call_site_record obj_ ) { call_site_record old_obj_; (void)(ix_ < vec_->num); old_obj_ = vec_->vec[ix_]; vec_->vec[ix_] = obj_; return old_obj_; } static __inline__ call_site_record *VEC_call_site_record_base_quick_insert (VEC_call_site_record_base *vec_, unsigned ix_, call_site_record obj_ ) { call_site_record *slot_; (void)(vec_->num < vec_->alloc); (void)(ix_ <= vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_ + 1, slot_, (vec_->num++ - ix_) * sizeof (call_site_record)); *slot_ = obj_; return slot_; } static __inline__ call_site_record VEC_call_site_record_base_ordered_remove (VEC_call_site_record_base *vec_, unsigned ix_ ) { call_site_record *slot_; call_site_record obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; memmove (slot_, slot_ + 1, (--vec_->num - ix_) * sizeof (call_site_record)); return obj_; } static __inline__ call_site_record VEC_call_site_record_base_unordered_remove (VEC_call_site_record_base *vec_, unsigned ix_ ) { call_site_record *slot_; call_site_record obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; *slot_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_call_site_record_base_block_remove (VEC_call_site_record_base *vec_, unsigned ix_, unsigned len_ ) { call_site_record *slot_; (void)(ix_ + len_ <= vec_->num); slot_ = &vec_->vec[ix_]; vec_->num -= len_; memmove (slot_, slot_ + len_, (vec_->num - ix_) * sizeof (call_site_record)); } static __inline__ call_site_record *VEC_call_site_record_base_address (VEC_call_site_record_base *vec_) { return vec_ ? vec_->vec : 0; } static __inline__ unsigned VEC_call_site_record_base_lower_bound (VEC_call_site_record_base *vec_, const call_site_record obj_, unsigned char (*lessthan_)(const call_site_record, const call_site_record) ) { unsigned int len_ = VEC_call_site_record_base_length (vec_); unsigned int half_, middle_; unsigned int first_ = 0; while (len_ > 0) { call_site_record middle_elem_; half_ = len_ >> 1; middle_ = first_; middle_ += half_; middle_elem_ = VEC_call_site_record_base_index (vec_, middle_ ); if (lessthan_ (middle_elem_, obj_)) { first_ = middle_; ++first_; len_ = len_ - half_ - 1; } else len_ = half_; } return first_; } struct vec_swallow_trailing_semi;
typedef struct VEC_call_site_record_gc { VEC_call_site_record_base base; } VEC_call_site_record_gc; static __inline__ VEC_call_site_record_gc *VEC_call_site_record_gc_alloc (int alloc_ ) { return (VEC_call_site_record_gc *) vec_gc_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_call_site_record_gc_free (VEC_call_site_record_gc **vec_) { if (*vec_) ggc_free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_call_site_record_gc *VEC_call_site_record_gc_copy (VEC_call_site_record_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_call_site_record_gc *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_call_site_record_gc *)(vec_gc_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (call_site_record) * len_); } return new_vec_; } static __inline__ int VEC_call_site_record_gc_reserve (VEC_call_site_record_gc **vec_, int alloc_ ) { int extend = !VEC_call_site_record_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_call_site_record_gc *) vec_gc_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_call_site_record_gc_reserve_exact (VEC_call_site_record_gc **vec_, int alloc_ ) { int extend = !VEC_call_site_record_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_call_site_record_gc *) vec_gc_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_call_site_record_gc_safe_grow (VEC_call_site_record_gc **vec_, int size_ ) { (void)(size_ >= 0 && VEC_call_site_record_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_call_site_record_gc_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_call_site_record_gc_safe_grow_cleared (VEC_call_site_record_gc **vec_, int size_ ) { int oldsize = VEC_call_site_record_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_call_site_record_gc_safe_grow (vec_, size_ ); memset (&(VEC_call_site_record_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (call_site_record) * (size_ - oldsize)); } static __inline__ call_site_record *VEC_call_site_record_gc_safe_push (VEC_call_site_record_gc **vec_, call_site_record obj_ ) { VEC_call_site_record_gc_reserve (vec_, 1 ); return VEC_call_site_record_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ call_site_record *VEC_call_site_record_gc_safe_insert (VEC_call_site_record_gc **vec_, unsigned ix_, call_site_record obj_ ) { VEC_call_site_record_gc_reserve (vec_, 1 ); return VEC_call_site_record_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;


struct rtl_eh
{
  rtx filter;
  rtx exc_ptr;

  int built_landing_pads;

  rtx ehr_stackadj;
  rtx ehr_handler;
  rtx ehr_label;

  rtx sjlj_fc;
  rtx sjlj_exit_after;

  htab_t exception_handler_label_map;

  VEC_tree_gc *ttype_data;
  varray_type ehspec_data;
  varray_type action_record_data;

  VEC_call_site_record_gc *call_site_record;
};
# 175 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
struct gimple_df;
struct temp_slot;
typedef struct temp_slot *temp_slot_p;
struct call_site_record;

static __inline__ void VEC_temp_slot_p_must_be_pointer_type (void) { (void)((temp_slot_p)1 == (void *)1); } typedef struct VEC_temp_slot_p_base { unsigned num; unsigned alloc; temp_slot_p vec[1]; } VEC_temp_slot_p_base; typedef struct VEC_temp_slot_p_none { VEC_temp_slot_p_base base; } VEC_temp_slot_p_none; static __inline__ unsigned VEC_temp_slot_p_base_length (const VEC_temp_slot_p_base *vec_) { return vec_ ? vec_->num : 0; } static __inline__ temp_slot_p VEC_temp_slot_p_base_last (const VEC_temp_slot_p_base *vec_ ) { (void)(vec_ && vec_->num); return vec_->vec[vec_->num - 1]; } static __inline__ temp_slot_p VEC_temp_slot_p_base_index (const VEC_temp_slot_p_base *vec_, unsigned ix_ ) { (void)(vec_ && ix_ < vec_->num); return vec_->vec[ix_]; } static __inline__ int VEC_temp_slot_p_base_iterate (const VEC_temp_slot_p_base *vec_, unsigned ix_, temp_slot_p *ptr) { if (vec_ && ix_ < vec_->num) { *ptr = vec_->vec[ix_]; return 1; } else { *ptr = 0; return 0; } } static __inline__ size_t VEC_temp_slot_p_base_embedded_size (int alloc_) { return __builtin_offsetof (VEC_temp_slot_p_base, vec) + alloc_ * sizeof(temp_slot_p); } static __inline__ void VEC_temp_slot_p_base_embedded_init (VEC_temp_slot_p_base *vec_, int alloc_) { vec_->num = 0; vec_->alloc = alloc_; } static __inline__ int VEC_temp_slot_p_base_space (VEC_temp_slot_p_base *vec_, int alloc_ ) { (void)(alloc_ >= 0); return vec_ ? vec_->alloc - vec_->num >= (unsigned)alloc_ : !alloc_; } static __inline__ temp_slot_p *VEC_temp_slot_p_base_quick_push (VEC_temp_slot_p_base *vec_, temp_slot_p obj_ ) { temp_slot_p *slot_; (void)(vec_->num < vec_->alloc); slot_ = &vec_->vec[vec_->num++]; *slot_ = obj_; return slot_; } static __inline__ temp_slot_p VEC_temp_slot_p_base_pop (VEC_temp_slot_p_base *vec_ ) { temp_slot_p obj_; (void)(vec_->num); obj_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_temp_slot_p_base_truncate (VEC_temp_slot_p_base *vec_, unsigned size_ ) { (void)(vec_ ? vec_->num >= size_ : !size_); if (vec_) vec_->num = size_; } static __inline__ temp_slot_p VEC_temp_slot_p_base_replace (VEC_temp_slot_p_base *vec_, unsigned ix_, temp_slot_p obj_ ) { temp_slot_p old_obj_; (void)(ix_ < vec_->num); old_obj_ = vec_->vec[ix_]; vec_->vec[ix_] = obj_; return old_obj_; } static __inline__ temp_slot_p *VEC_temp_slot_p_base_quick_insert (VEC_temp_slot_p_base *vec_, unsigned ix_, temp_slot_p obj_ ) { temp_slot_p *slot_; (void)(vec_->num < vec_->alloc); (void)(ix_ <= vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_ + 1, slot_, (vec_->num++ - ix_) * sizeof (temp_slot_p)); *slot_ = obj_; return slot_; } static __inline__ temp_slot_p VEC_temp_slot_p_base_ordered_remove (VEC_temp_slot_p_base *vec_, unsigned ix_ ) { temp_slot_p *slot_; temp_slot_p obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; memmove (slot_, slot_ + 1, (--vec_->num - ix_) * sizeof (temp_slot_p)); return obj_; } static __inline__ temp_slot_p VEC_temp_slot_p_base_unordered_remove (VEC_temp_slot_p_base *vec_, unsigned ix_ ) { temp_slot_p *slot_; temp_slot_p obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; *slot_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_temp_slot_p_base_block_remove (VEC_temp_slot_p_base *vec_, unsigned ix_, unsigned len_ ) { temp_slot_p *slot_; (void)(ix_ + len_ <= vec_->num); slot_ = &vec_->vec[ix_]; vec_->num -= len_; memmove (slot_, slot_ + len_, (vec_->num - ix_) * sizeof (temp_slot_p)); } static __inline__ temp_slot_p *VEC_temp_slot_p_base_address (VEC_temp_slot_p_base *vec_) { return vec_ ? vec_->vec : 0; } static __inline__ unsigned VEC_temp_slot_p_base_lower_bound (VEC_temp_slot_p_base *vec_, const temp_slot_p obj_, unsigned char (*lessthan_)(const temp_slot_p, const temp_slot_p) ) { unsigned int len_ = VEC_temp_slot_p_base_length (vec_); unsigned int half_, middle_; unsigned int first_ = 0; while (len_ > 0) { temp_slot_p middle_elem_; half_ = len_ >> 1; middle_ = first_; middle_ += half_; middle_elem_ = VEC_temp_slot_p_base_index (vec_, middle_ ); if (lessthan_ (middle_elem_, obj_)) { first_ = middle_; ++first_; len_ = len_ - half_ - 1; } else len_ = half_; } return first_; } struct vec_swallow_trailing_semi;
typedef struct VEC_temp_slot_p_gc { VEC_temp_slot_p_base base; } VEC_temp_slot_p_gc; static __inline__ VEC_temp_slot_p_gc *VEC_temp_slot_p_gc_alloc (int alloc_ ) { return (VEC_temp_slot_p_gc *) vec_gc_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_temp_slot_p_gc_free (VEC_temp_slot_p_gc **vec_) { if (*vec_) ggc_free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_temp_slot_p_gc *VEC_temp_slot_p_gc_copy (VEC_temp_slot_p_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_temp_slot_p_gc *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_temp_slot_p_gc *)(vec_gc_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (temp_slot_p) * len_); } return new_vec_; } static __inline__ int VEC_temp_slot_p_gc_reserve (VEC_temp_slot_p_gc **vec_, int alloc_ ) { int extend = !VEC_temp_slot_p_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_temp_slot_p_gc *) vec_gc_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_temp_slot_p_gc_reserve_exact (VEC_temp_slot_p_gc **vec_, int alloc_ ) { int extend = !VEC_temp_slot_p_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_temp_slot_p_gc *) vec_gc_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_temp_slot_p_gc_safe_grow (VEC_temp_slot_p_gc **vec_, int size_ ) { (void)(size_ >= 0 && VEC_temp_slot_p_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_temp_slot_p_gc_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_temp_slot_p_gc_safe_grow_cleared (VEC_temp_slot_p_gc **vec_, int size_ ) { int oldsize = VEC_temp_slot_p_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_temp_slot_p_gc_safe_grow (vec_, size_ ); memset (&(VEC_temp_slot_p_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (temp_slot_p) * (size_ - oldsize)); } static __inline__ temp_slot_p *VEC_temp_slot_p_gc_safe_push (VEC_temp_slot_p_gc **vec_, temp_slot_p obj_ ) { VEC_temp_slot_p_gc_reserve (vec_, 1 ); return VEC_temp_slot_p_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ temp_slot_p *VEC_temp_slot_p_gc_safe_insert (VEC_temp_slot_p_gc **vec_, unsigned ix_, temp_slot_p obj_ ) { VEC_temp_slot_p_gc_reserve (vec_, 1 ); return VEC_temp_slot_p_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;
struct ipa_opt_pass;
typedef struct ipa_opt_pass *ipa_opt_pass;

static __inline__ void VEC_ipa_opt_pass_must_be_pointer_type (void) { (void)((ipa_opt_pass)1 == (void *)1); } typedef struct VEC_ipa_opt_pass_base { unsigned num; unsigned alloc; ipa_opt_pass vec[1]; } VEC_ipa_opt_pass_base; typedef struct VEC_ipa_opt_pass_none { VEC_ipa_opt_pass_base base; } VEC_ipa_opt_pass_none; static __inline__ unsigned VEC_ipa_opt_pass_base_length (const VEC_ipa_opt_pass_base *vec_) { return vec_ ? vec_->num : 0; } static __inline__ ipa_opt_pass VEC_ipa_opt_pass_base_last (const VEC_ipa_opt_pass_base *vec_ ) { (void)(vec_ && vec_->num); return vec_->vec[vec_->num - 1]; } static __inline__ ipa_opt_pass VEC_ipa_opt_pass_base_index (const VEC_ipa_opt_pass_base *vec_, unsigned ix_ ) { (void)(vec_ && ix_ < vec_->num); return vec_->vec[ix_]; } static __inline__ int VEC_ipa_opt_pass_base_iterate (const VEC_ipa_opt_pass_base *vec_, unsigned ix_, ipa_opt_pass *ptr) { if (vec_ && ix_ < vec_->num) { *ptr = vec_->vec[ix_]; return 1; } else { *ptr = 0; return 0; } } static __inline__ size_t VEC_ipa_opt_pass_base_embedded_size (int alloc_) { return __builtin_offsetof (VEC_ipa_opt_pass_base, vec) + alloc_ * sizeof(ipa_opt_pass); } static __inline__ void VEC_ipa_opt_pass_base_embedded_init (VEC_ipa_opt_pass_base *vec_, int alloc_) { vec_->num = 0; vec_->alloc = alloc_; } static __inline__ int VEC_ipa_opt_pass_base_space (VEC_ipa_opt_pass_base *vec_, int alloc_ ) { (void)(alloc_ >= 0); return vec_ ? vec_->alloc - vec_->num >= (unsigned)alloc_ : !alloc_; } static __inline__ ipa_opt_pass *VEC_ipa_opt_pass_base_quick_push (VEC_ipa_opt_pass_base *vec_, ipa_opt_pass obj_ ) { ipa_opt_pass *slot_; (void)(vec_->num < vec_->alloc); slot_ = &vec_->vec[vec_->num++]; *slot_ = obj_; return slot_; } static __inline__ ipa_opt_pass VEC_ipa_opt_pass_base_pop (VEC_ipa_opt_pass_base *vec_ ) { ipa_opt_pass obj_; (void)(vec_->num); obj_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_ipa_opt_pass_base_truncate (VEC_ipa_opt_pass_base *vec_, unsigned size_ ) { (void)(vec_ ? vec_->num >= size_ : !size_); if (vec_) vec_->num = size_; } static __inline__ ipa_opt_pass VEC_ipa_opt_pass_base_replace (VEC_ipa_opt_pass_base *vec_, unsigned ix_, ipa_opt_pass obj_ ) { ipa_opt_pass old_obj_; (void)(ix_ < vec_->num); old_obj_ = vec_->vec[ix_]; vec_->vec[ix_] = obj_; return old_obj_; } static __inline__ ipa_opt_pass *VEC_ipa_opt_pass_base_quick_insert (VEC_ipa_opt_pass_base *vec_, unsigned ix_, ipa_opt_pass obj_ ) { ipa_opt_pass *slot_; (void)(vec_->num < vec_->alloc); (void)(ix_ <= vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_ + 1, slot_, (vec_->num++ - ix_) * sizeof (ipa_opt_pass)); *slot_ = obj_; return slot_; } static __inline__ ipa_opt_pass VEC_ipa_opt_pass_base_ordered_remove (VEC_ipa_opt_pass_base *vec_, unsigned ix_ ) { ipa_opt_pass *slot_; ipa_opt_pass obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; memmove (slot_, slot_ + 1, (--vec_->num - ix_) * sizeof (ipa_opt_pass)); return obj_; } static __inline__ ipa_opt_pass VEC_ipa_opt_pass_base_unordered_remove (VEC_ipa_opt_pass_base *vec_, unsigned ix_ ) { ipa_opt_pass *slot_; ipa_opt_pass obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; *slot_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_ipa_opt_pass_base_block_remove (VEC_ipa_opt_pass_base *vec_, unsigned ix_, unsigned len_ ) { ipa_opt_pass *slot_; (void)(ix_ + len_ <= vec_->num); slot_ = &vec_->vec[ix_]; vec_->num -= len_; memmove (slot_, slot_ + len_, (vec_->num - ix_) * sizeof (ipa_opt_pass)); } static __inline__ ipa_opt_pass *VEC_ipa_opt_pass_base_address (VEC_ipa_opt_pass_base *vec_) { return vec_ ? vec_->vec : 0; } static __inline__ unsigned VEC_ipa_opt_pass_base_lower_bound (VEC_ipa_opt_pass_base *vec_, const ipa_opt_pass obj_, unsigned char (*lessthan_)(const ipa_opt_pass, const ipa_opt_pass) ) { unsigned int len_ = VEC_ipa_opt_pass_base_length (vec_); unsigned int half_, middle_; unsigned int first_ = 0; while (len_ > 0) { ipa_opt_pass middle_elem_; half_ = len_ >> 1; middle_ = first_; middle_ += half_; middle_elem_ = VEC_ipa_opt_pass_base_index (vec_, middle_ ); if (lessthan_ (middle_elem_, obj_)) { first_ = middle_; ++first_; len_ = len_ - half_ - 1; } else len_ = half_; } return first_; } struct vec_swallow_trailing_semi;
typedef struct VEC_ipa_opt_pass_heap { VEC_ipa_opt_pass_base base; } VEC_ipa_opt_pass_heap; static __inline__ VEC_ipa_opt_pass_heap *VEC_ipa_opt_pass_heap_alloc (int alloc_ ) { return (VEC_ipa_opt_pass_heap *) vec_heap_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_ipa_opt_pass_heap_free (VEC_ipa_opt_pass_heap **vec_) { if (*vec_) free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_ipa_opt_pass_heap *VEC_ipa_opt_pass_heap_copy (VEC_ipa_opt_pass_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_ipa_opt_pass_heap *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_ipa_opt_pass_heap *)(vec_heap_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (ipa_opt_pass) * len_); } return new_vec_; } static __inline__ int VEC_ipa_opt_pass_heap_reserve (VEC_ipa_opt_pass_heap **vec_, int alloc_ ) { int extend = !VEC_ipa_opt_pass_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_ipa_opt_pass_heap *) vec_heap_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_ipa_opt_pass_heap_reserve_exact (VEC_ipa_opt_pass_heap **vec_, int alloc_ ) { int extend = !VEC_ipa_opt_pass_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_ipa_opt_pass_heap *) vec_heap_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_ipa_opt_pass_heap_safe_grow (VEC_ipa_opt_pass_heap **vec_, int size_ ) { (void)(size_ >= 0 && VEC_ipa_opt_pass_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_ipa_opt_pass_heap_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_ipa_opt_pass_heap_safe_grow_cleared (VEC_ipa_opt_pass_heap **vec_, int size_ ) { int oldsize = VEC_ipa_opt_pass_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_ipa_opt_pass_heap_safe_grow (vec_, size_ ); memset (&(VEC_ipa_opt_pass_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (ipa_opt_pass) * (size_ - oldsize)); } static __inline__ ipa_opt_pass *VEC_ipa_opt_pass_heap_safe_push (VEC_ipa_opt_pass_heap **vec_, ipa_opt_pass obj_ ) { VEC_ipa_opt_pass_heap_reserve (vec_, 1 ); return VEC_ipa_opt_pass_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ ipa_opt_pass *VEC_ipa_opt_pass_heap_safe_insert (VEC_ipa_opt_pass_heap **vec_, unsigned ix_, ipa_opt_pass obj_ ) { VEC_ipa_opt_pass_heap_reserve (vec_, 1 ); return VEC_ipa_opt_pass_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;

enum function_frequency {


  FUNCTION_FREQUENCY_UNLIKELY_EXECUTED,

  FUNCTION_FREQUENCY_NORMAL,


  FUNCTION_FREQUENCY_HOT
};

struct varasm_status
{

  struct rtx_constant_pool *pool;



  unsigned int deferred_constants;
};


struct incoming_args
{



  int pops_args;




  int size;




  int pretend_args_size;



  rtx arg_offset_rtx;



  CUMULATIVE_ARGS info;


  rtx internal_arg_pointer;
};


struct function_subsections
{




  const char *hot_section_label;
  const char *cold_section_label;
  const char *hot_section_end_label;
  const char *cold_section_end_label;




  const char *unlikely_text_section_name;
};


struct rtl_data
{
  struct expr_status expr;
  struct emit_status emit;
  struct varasm_status varasm;
  struct incoming_args args;
  struct function_subsections subsections;
  struct rtl_eh eh;





  int outgoing_args_size;





  rtx return_rtx;



  struct initial_value_struct *hard_reg_initial_vals;



  tree stack_protect_guard;



  rtx x_nonlocal_goto_handler_labels;




  rtx x_return_label;




  rtx x_naked_return_label;



  rtx x_stack_slot_list;


  rtx x_stack_check_probe_note;





  rtx x_arg_pointer_save_area;


  rtx drap_reg;




  long x_frame_offset;


  rtx x_parm_birth_insn;


  VEC_temp_slot_p_gc *x_used_temp_slots;


  struct temp_slot *x_avail_temp_slots;


  int x_temp_slot_level;



  unsigned int stack_alignment_needed;



  unsigned int preferred_stack_boundary;


  unsigned int parm_stack_boundary;


  unsigned int max_used_stack_slot_alignment;
# 355 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
  unsigned int stack_alignment_estimated;





  rtx epilogue_delay_list;



  unsigned char accesses_prior_frames;


  unsigned char calls_eh_return;



  unsigned char saves_all_registers;



  unsigned char has_nonlocal_goto;


  unsigned char has_asm_statement;






  unsigned char all_throwers_are_sibcalls;



  unsigned char limit_stack;


  unsigned char profile;


  unsigned char uses_const_pool;


  unsigned char uses_pic_offset_table;


  unsigned char uses_eh_lsda;


  unsigned char tail_call_emit;


  unsigned char arg_pointer_save_area_init;



  unsigned char frame_pointer_needed;


  unsigned char maybe_hot_insn_p;






  unsigned char stack_realign_needed;




  unsigned char stack_realign_tried;



  unsigned char need_drap;




  unsigned char stack_realign_processed;



  unsigned char stack_realign_finalized;


  unsigned char dbr_scheduled_p;
};
# 461 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
extern struct rtl_data x_rtl;
# 471 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
struct function
{
  struct eh_status *eh;


  struct control_flow_graph *cfg;


  struct gimple_seq_d *gimple_body;


  struct gimple_df *gimple_df;


  struct loops *x_current_loops;


  htab_t value_histograms;




  tree decl;



  tree static_chain_decl;




  tree nonlocal_goto_save_area;


  tree local_decls;




  struct machine_function * machine;


  struct language_function * language;


  htab_t used_types_hash;


  int last_stmt_uid;


  int funcdef_no;


  location_t function_start_locus;


  location_t function_end_locus;


  unsigned int curr_properties;
  unsigned int last_verified;



  VEC_ipa_opt_pass_heap * ipa_transforms_to_apply;






  unsigned int va_list_gpr_size : 8;



  unsigned int va_list_fpr_size : 8;




  __extension__ enum function_frequency function_frequency : 2;


  unsigned int calls_setjmp : 1;



  unsigned int calls_alloca : 1;



  unsigned int has_nonlocal_label : 1;


  unsigned int stdarg : 1;
# 575 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
  unsigned int dont_save_pending_sizes_p : 1;

  unsigned int after_inlining : 1;
  unsigned int always_inline_functions_inlined : 1;






  unsigned int returns_struct : 1;



  unsigned int returns_pcc_struct : 1;


  unsigned int after_tree_profile : 1;



  unsigned int has_local_explicit_reg_vars : 1;





  unsigned int is_thunk : 1;
};







extern struct function *cfun;







extern int virtuals_instantiated;


extern int trampolines_created;


extern void set_cfun (struct function *new_cfun);
extern void push_cfun (struct function *new_cfun);
extern void pop_cfun (void);
extern void instantiate_decl_rtl (rtx x);
# 640 "/home/mzorgati/gcc-4.4.0/gcc/function.h"
extern void reorder_blocks (void);


extern void number_blocks (tree);

extern void clear_block_marks (tree);
extern tree blocks_nreverse (tree);




extern long get_frame_size (void);




extern unsigned char frame_offset_overflow (long, tree);



extern struct machine_function * (*init_machine_status) (void);


extern void free_after_parsing (struct function *);
extern void free_after_compilation (struct function *);

extern void init_varasm_status (void);


extern void diddle_return_value (void (*)(rtx, void*), void*);
extern void clobber_return_register (void);


extern rtx get_arg_pointer_save_area (void);


extern const char *current_function_name (void);

extern const char *current_function_assembler_name (void);

extern void do_warn_unused_parameter (tree);

extern unsigned char pass_by_reference (CUMULATIVE_ARGS *, enum machine_mode,
          tree, unsigned char);
extern unsigned char reference_callee_copied (CUMULATIVE_ARGS *, enum machine_mode,
         tree, unsigned char);

extern void used_types_insert (tree);

extern int get_next_funcdef_no (void);
# 32 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h" 2


typedef bitmap_head regset_head;


typedef bitmap regset;
# 83 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
extern void reg_set_to_hard_reg_set (HARD_REG_ELT_TYPE *, const_bitmap);






typedef bitmap_iterator reg_set_iterator;
# 112 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
extern regset regs_invalidated_by_call_regset;






typedef long long gcov_type;


struct edge_def
{

  struct basic_block_def *src;
  struct basic_block_def *dest;


  union edge_def_insns {
    gimple_seq g;
    rtx r;
  } insns;


  void * aux;


  tree goto_block;
  location_t goto_locus;



  unsigned int dest_idx;

  int flags;
  int probability;
  gcov_type count;

};

typedef struct edge_def *edge;
typedef const struct edge_def *const_edge;
static __inline__ void VEC_edge_must_be_pointer_type (void) { (void)((edge)1 == (void *)1); } typedef struct VEC_edge_base { unsigned num; unsigned alloc; edge vec[1]; } VEC_edge_base; typedef struct VEC_edge_none { VEC_edge_base base; } VEC_edge_none; static __inline__ unsigned VEC_edge_base_length (const VEC_edge_base *vec_) { return vec_ ? vec_->num : 0; } static __inline__ edge VEC_edge_base_last (const VEC_edge_base *vec_ ) { (void)(vec_ && vec_->num); return vec_->vec[vec_->num - 1]; } static __inline__ edge VEC_edge_base_index (const VEC_edge_base *vec_, unsigned ix_ ) { (void)(vec_ && ix_ < vec_->num); return vec_->vec[ix_]; } static __inline__ int VEC_edge_base_iterate (const VEC_edge_base *vec_, unsigned ix_, edge *ptr) { if (vec_ && ix_ < vec_->num) { *ptr = vec_->vec[ix_]; return 1; } else { *ptr = 0; return 0; } } static __inline__ size_t VEC_edge_base_embedded_size (int alloc_) { return __builtin_offsetof (VEC_edge_base, vec) + alloc_ * sizeof(edge); } static __inline__ void VEC_edge_base_embedded_init (VEC_edge_base *vec_, int alloc_) { vec_->num = 0; vec_->alloc = alloc_; } static __inline__ int VEC_edge_base_space (VEC_edge_base *vec_, int alloc_ ) { (void)(alloc_ >= 0); return vec_ ? vec_->alloc - vec_->num >= (unsigned)alloc_ : !alloc_; } static __inline__ edge *VEC_edge_base_quick_push (VEC_edge_base *vec_, edge obj_ ) { edge *slot_; (void)(vec_->num < vec_->alloc); slot_ = &vec_->vec[vec_->num++]; *slot_ = obj_; return slot_; } static __inline__ edge VEC_edge_base_pop (VEC_edge_base *vec_ ) { edge obj_; (void)(vec_->num); obj_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_edge_base_truncate (VEC_edge_base *vec_, unsigned size_ ) { (void)(vec_ ? vec_->num >= size_ : !size_); if (vec_) vec_->num = size_; } static __inline__ edge VEC_edge_base_replace (VEC_edge_base *vec_, unsigned ix_, edge obj_ ) { edge old_obj_; (void)(ix_ < vec_->num); old_obj_ = vec_->vec[ix_]; vec_->vec[ix_] = obj_; return old_obj_; } static __inline__ edge *VEC_edge_base_quick_insert (VEC_edge_base *vec_, unsigned ix_, edge obj_ ) { edge *slot_; (void)(vec_->num < vec_->alloc); (void)(ix_ <= vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_ + 1, slot_, (vec_->num++ - ix_) * sizeof (edge)); *slot_ = obj_; return slot_; } static __inline__ edge VEC_edge_base_ordered_remove (VEC_edge_base *vec_, unsigned ix_ ) { edge *slot_; edge obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; memmove (slot_, slot_ + 1, (--vec_->num - ix_) * sizeof (edge)); return obj_; } static __inline__ edge VEC_edge_base_unordered_remove (VEC_edge_base *vec_, unsigned ix_ ) { edge *slot_; edge obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; *slot_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_edge_base_block_remove (VEC_edge_base *vec_, unsigned ix_, unsigned len_ ) { edge *slot_; (void)(ix_ + len_ <= vec_->num); slot_ = &vec_->vec[ix_]; vec_->num -= len_; memmove (slot_, slot_ + len_, (vec_->num - ix_) * sizeof (edge)); } static __inline__ edge *VEC_edge_base_address (VEC_edge_base *vec_) { return vec_ ? vec_->vec : 0; } static __inline__ unsigned VEC_edge_base_lower_bound (VEC_edge_base *vec_, const edge obj_, unsigned char (*lessthan_)(const edge, const edge) ) { unsigned int len_ = VEC_edge_base_length (vec_); unsigned int half_, middle_; unsigned int first_ = 0; while (len_ > 0) { edge middle_elem_; half_ = len_ >> 1; middle_ = first_; middle_ += half_; middle_elem_ = VEC_edge_base_index (vec_, middle_ ); if (lessthan_ (middle_elem_, obj_)) { first_ = middle_; ++first_; len_ = len_ - half_ - 1; } else len_ = half_; } return first_; } struct vec_swallow_trailing_semi;
typedef struct VEC_edge_gc { VEC_edge_base base; } VEC_edge_gc; static __inline__ VEC_edge_gc *VEC_edge_gc_alloc (int alloc_ ) { return (VEC_edge_gc *) vec_gc_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_edge_gc_free (VEC_edge_gc **vec_) { if (*vec_) ggc_free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_edge_gc *VEC_edge_gc_copy (VEC_edge_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_edge_gc *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_edge_gc *)(vec_gc_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (edge) * len_); } return new_vec_; } static __inline__ int VEC_edge_gc_reserve (VEC_edge_gc **vec_, int alloc_ ) { int extend = !VEC_edge_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_edge_gc *) vec_gc_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_edge_gc_reserve_exact (VEC_edge_gc **vec_, int alloc_ ) { int extend = !VEC_edge_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_edge_gc *) vec_gc_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_edge_gc_safe_grow (VEC_edge_gc **vec_, int size_ ) { (void)(size_ >= 0 && VEC_edge_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_edge_gc_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_edge_gc_safe_grow_cleared (VEC_edge_gc **vec_, int size_ ) { int oldsize = VEC_edge_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_edge_gc_safe_grow (vec_, size_ ); memset (&(VEC_edge_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (edge) * (size_ - oldsize)); } static __inline__ edge *VEC_edge_gc_safe_push (VEC_edge_gc **vec_, edge obj_ ) { VEC_edge_gc_reserve (vec_, 1 ); return VEC_edge_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ edge *VEC_edge_gc_safe_insert (VEC_edge_gc **vec_, unsigned ix_, edge obj_ ) { VEC_edge_gc_reserve (vec_, 1 ); return VEC_edge_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;
typedef struct VEC_edge_heap { VEC_edge_base base; } VEC_edge_heap; static __inline__ VEC_edge_heap *VEC_edge_heap_alloc (int alloc_ ) { return (VEC_edge_heap *) vec_heap_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_edge_heap_free (VEC_edge_heap **vec_) { if (*vec_) free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_edge_heap *VEC_edge_heap_copy (VEC_edge_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_edge_heap *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_edge_heap *)(vec_heap_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (edge) * len_); } return new_vec_; } static __inline__ int VEC_edge_heap_reserve (VEC_edge_heap **vec_, int alloc_ ) { int extend = !VEC_edge_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_edge_heap *) vec_heap_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_edge_heap_reserve_exact (VEC_edge_heap **vec_, int alloc_ ) { int extend = !VEC_edge_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_edge_heap *) vec_heap_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_edge_heap_safe_grow (VEC_edge_heap **vec_, int size_ ) { (void)(size_ >= 0 && VEC_edge_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_edge_heap_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_edge_heap_safe_grow_cleared (VEC_edge_heap **vec_, int size_ ) { int oldsize = VEC_edge_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_edge_heap_safe_grow (vec_, size_ ); memset (&(VEC_edge_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (edge) * (size_ - oldsize)); } static __inline__ edge *VEC_edge_heap_safe_push (VEC_edge_heap **vec_, edge obj_ ) { VEC_edge_heap_reserve (vec_, 1 ); return VEC_edge_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ edge *VEC_edge_heap_safe_insert (VEC_edge_heap **vec_, unsigned ix_, edge obj_ ) { VEC_edge_heap_reserve (vec_, 1 ); return VEC_edge_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;
# 185 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
extern const struct gcov_ctr_summary *profile_info;


struct loop;


struct edge_prediction;
struct rtl_bb_info;
# 220 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
struct basic_block_def
{

  VEC_edge_gc *preds;
  VEC_edge_gc *succs;


  void * aux;


  struct loop *loop_father;


  struct et_node * dom[2];


  struct basic_block_def *prev_bb;
  struct basic_block_def *next_bb;

  union basic_block_il_dependent {
      struct gimple_bb_info * gimple;
      struct rtl_bb_info * rtl;
    } il;


  gcov_type count;


  int index;


  int loop_depth;


  int frequency;


  int flags;
};

struct rtl_bb_info
{

  rtx head_;
  rtx end_;



  rtx header;
  rtx footer;


  int visited;
};

struct gimple_bb_info
{

  gimple_seq seq;


  gimple_seq phi_nodes;
};

typedef struct basic_block_def *basic_block;
typedef const struct basic_block_def *const_basic_block;

static __inline__ void VEC_basic_block_must_be_pointer_type (void) { (void)((basic_block)1 == (void *)1); } typedef struct VEC_basic_block_base { unsigned num; unsigned alloc; basic_block vec[1]; } VEC_basic_block_base; typedef struct VEC_basic_block_none { VEC_basic_block_base base; } VEC_basic_block_none; static __inline__ unsigned VEC_basic_block_base_length (const VEC_basic_block_base *vec_) { return vec_ ? vec_->num : 0; } static __inline__ basic_block VEC_basic_block_base_last (const VEC_basic_block_base *vec_ ) { (void)(vec_ && vec_->num); return vec_->vec[vec_->num - 1]; } static __inline__ basic_block VEC_basic_block_base_index (const VEC_basic_block_base *vec_, unsigned ix_ ) { (void)(vec_ && ix_ < vec_->num); return vec_->vec[ix_]; } static __inline__ int VEC_basic_block_base_iterate (const VEC_basic_block_base *vec_, unsigned ix_, basic_block *ptr) { if (vec_ && ix_ < vec_->num) { *ptr = vec_->vec[ix_]; return 1; } else { *ptr = 0; return 0; } } static __inline__ size_t VEC_basic_block_base_embedded_size (int alloc_) { return __builtin_offsetof (VEC_basic_block_base, vec) + alloc_ * sizeof(basic_block); } static __inline__ void VEC_basic_block_base_embedded_init (VEC_basic_block_base *vec_, int alloc_) { vec_->num = 0; vec_->alloc = alloc_; } static __inline__ int VEC_basic_block_base_space (VEC_basic_block_base *vec_, int alloc_ ) { (void)(alloc_ >= 0); return vec_ ? vec_->alloc - vec_->num >= (unsigned)alloc_ : !alloc_; } static __inline__ basic_block *VEC_basic_block_base_quick_push (VEC_basic_block_base *vec_, basic_block obj_ ) { basic_block *slot_; (void)(vec_->num < vec_->alloc); slot_ = &vec_->vec[vec_->num++]; *slot_ = obj_; return slot_; } static __inline__ basic_block VEC_basic_block_base_pop (VEC_basic_block_base *vec_ ) { basic_block obj_; (void)(vec_->num); obj_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_basic_block_base_truncate (VEC_basic_block_base *vec_, unsigned size_ ) { (void)(vec_ ? vec_->num >= size_ : !size_); if (vec_) vec_->num = size_; } static __inline__ basic_block VEC_basic_block_base_replace (VEC_basic_block_base *vec_, unsigned ix_, basic_block obj_ ) { basic_block old_obj_; (void)(ix_ < vec_->num); old_obj_ = vec_->vec[ix_]; vec_->vec[ix_] = obj_; return old_obj_; } static __inline__ basic_block *VEC_basic_block_base_quick_insert (VEC_basic_block_base *vec_, unsigned ix_, basic_block obj_ ) { basic_block *slot_; (void)(vec_->num < vec_->alloc); (void)(ix_ <= vec_->num); slot_ = &vec_->vec[ix_]; memmove (slot_ + 1, slot_, (vec_->num++ - ix_) * sizeof (basic_block)); *slot_ = obj_; return slot_; } static __inline__ basic_block VEC_basic_block_base_ordered_remove (VEC_basic_block_base *vec_, unsigned ix_ ) { basic_block *slot_; basic_block obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; memmove (slot_, slot_ + 1, (--vec_->num - ix_) * sizeof (basic_block)); return obj_; } static __inline__ basic_block VEC_basic_block_base_unordered_remove (VEC_basic_block_base *vec_, unsigned ix_ ) { basic_block *slot_; basic_block obj_; (void)(ix_ < vec_->num); slot_ = &vec_->vec[ix_]; obj_ = *slot_; *slot_ = vec_->vec[--vec_->num]; return obj_; } static __inline__ void VEC_basic_block_base_block_remove (VEC_basic_block_base *vec_, unsigned ix_, unsigned len_ ) { basic_block *slot_; (void)(ix_ + len_ <= vec_->num); slot_ = &vec_->vec[ix_]; vec_->num -= len_; memmove (slot_, slot_ + len_, (vec_->num - ix_) * sizeof (basic_block)); } static __inline__ basic_block *VEC_basic_block_base_address (VEC_basic_block_base *vec_) { return vec_ ? vec_->vec : 0; } static __inline__ unsigned VEC_basic_block_base_lower_bound (VEC_basic_block_base *vec_, const basic_block obj_, unsigned char (*lessthan_)(const basic_block, const basic_block) ) { unsigned int len_ = VEC_basic_block_base_length (vec_); unsigned int half_, middle_; unsigned int first_ = 0; while (len_ > 0) { basic_block middle_elem_; half_ = len_ >> 1; middle_ = first_; middle_ += half_; middle_elem_ = VEC_basic_block_base_index (vec_, middle_ ); if (lessthan_ (middle_elem_, obj_)) { first_ = middle_; ++first_; len_ = len_ - half_ - 1; } else len_ = half_; } return first_; } struct vec_swallow_trailing_semi;
typedef struct VEC_basic_block_gc { VEC_basic_block_base base; } VEC_basic_block_gc; static __inline__ VEC_basic_block_gc *VEC_basic_block_gc_alloc (int alloc_ ) { return (VEC_basic_block_gc *) vec_gc_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_basic_block_gc_free (VEC_basic_block_gc **vec_) { if (*vec_) ggc_free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_basic_block_gc *VEC_basic_block_gc_copy (VEC_basic_block_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_basic_block_gc *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_basic_block_gc *)(vec_gc_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (basic_block) * len_); } return new_vec_; } static __inline__ int VEC_basic_block_gc_reserve (VEC_basic_block_gc **vec_, int alloc_ ) { int extend = !VEC_basic_block_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_basic_block_gc *) vec_gc_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_basic_block_gc_reserve_exact (VEC_basic_block_gc **vec_, int alloc_ ) { int extend = !VEC_basic_block_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_basic_block_gc *) vec_gc_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_basic_block_gc_safe_grow (VEC_basic_block_gc **vec_, int size_ ) { (void)(size_ >= 0 && VEC_basic_block_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_basic_block_gc_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_basic_block_gc_safe_grow_cleared (VEC_basic_block_gc **vec_, int size_ ) { int oldsize = VEC_basic_block_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_basic_block_gc_safe_grow (vec_, size_ ); memset (&(VEC_basic_block_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (basic_block) * (size_ - oldsize)); } static __inline__ basic_block *VEC_basic_block_gc_safe_push (VEC_basic_block_gc **vec_, basic_block obj_ ) { VEC_basic_block_gc_reserve (vec_, 1 ); return VEC_basic_block_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ basic_block *VEC_basic_block_gc_safe_insert (VEC_basic_block_gc **vec_, unsigned ix_, basic_block obj_ ) { VEC_basic_block_gc_reserve (vec_, 1 ); return VEC_basic_block_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;
typedef struct VEC_basic_block_heap { VEC_basic_block_base base; } VEC_basic_block_heap; static __inline__ VEC_basic_block_heap *VEC_basic_block_heap_alloc (int alloc_ ) { return (VEC_basic_block_heap *) vec_heap_p_reserve_exact (((void *)0), alloc_ ); } static __inline__ void VEC_basic_block_heap_free (VEC_basic_block_heap **vec_) { if (*vec_) free (*vec_); *vec_ = ((void *)0); } static __inline__ VEC_basic_block_heap *VEC_basic_block_heap_copy (VEC_basic_block_base *vec_ ) { size_t len_ = vec_ ? vec_->num : 0; VEC_basic_block_heap *new_vec_ = ((void *)0); if (len_) { new_vec_ = (VEC_basic_block_heap *)(vec_heap_p_reserve_exact (((void *)0), len_ )); new_vec_->base.num = len_; memcpy (new_vec_->base.vec, vec_->vec, sizeof (basic_block) * len_); } return new_vec_; } static __inline__ int VEC_basic_block_heap_reserve (VEC_basic_block_heap **vec_, int alloc_ ) { int extend = !VEC_basic_block_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_basic_block_heap *) vec_heap_p_reserve (*vec_, alloc_ ); return extend; } static __inline__ int VEC_basic_block_heap_reserve_exact (VEC_basic_block_heap **vec_, int alloc_ ) { int extend = !VEC_basic_block_base_space (((*vec_) ? &(*vec_)->base : 0), alloc_ ); if (extend) *vec_ = (VEC_basic_block_heap *) vec_heap_p_reserve_exact (*vec_, alloc_ ); return extend; } static __inline__ void VEC_basic_block_heap_safe_grow (VEC_basic_block_heap **vec_, int size_ ) { (void)(size_ >= 0 && VEC_basic_block_base_length ((*vec_) ? &(*vec_)->base : 0) <= (unsigned)size_); VEC_basic_block_heap_reserve_exact (vec_, size_ - (int)(*vec_ ? ((*vec_) ? &(*vec_)->base : 0)->num : 0) ); ((*vec_) ? &(*vec_)->base : 0)->num = size_; } static __inline__ void VEC_basic_block_heap_safe_grow_cleared (VEC_basic_block_heap **vec_, int size_ ) { int oldsize = VEC_basic_block_base_length ((*vec_) ? &(*vec_)->base : 0); VEC_basic_block_heap_safe_grow (vec_, size_ ); memset (&(VEC_basic_block_base_address ((*vec_) ? &(*vec_)->base : 0))[oldsize], 0, sizeof (basic_block) * (size_ - oldsize)); } static __inline__ basic_block *VEC_basic_block_heap_safe_push (VEC_basic_block_heap **vec_, basic_block obj_ ) { VEC_basic_block_heap_reserve (vec_, 1 ); return VEC_basic_block_base_quick_push (((*vec_) ? &(*vec_)->base : 0), obj_ ); } static __inline__ basic_block *VEC_basic_block_heap_safe_insert (VEC_basic_block_heap **vec_, unsigned ix_, basic_block obj_ ) { VEC_basic_block_heap_reserve (vec_, 1 ); return VEC_basic_block_base_quick_insert (((*vec_) ? &(*vec_)->base : 0), ix_, obj_ ); } struct vec_swallow_trailing_semi;
# 301 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
enum bb_flags
{

  BB_NEW = 1 << 0,



  BB_REACHABLE = 1 << 1,


  BB_IRREDUCIBLE_LOOP = 1 << 2,


  BB_SUPERBLOCK = 1 << 3,



  BB_DISABLE_SCHEDULE = 1 << 4,


  BB_HOT_PARTITION = 1 << 5,


  BB_COLD_PARTITION = 1 << 6,


  BB_DUPLICATED = 1 << 7,


  BB_NON_LOCAL_GOTO_TARGET = 1 << 8,


  BB_RTL = 1 << 9 ,



  BB_FORWARDER_BLOCK = 1 << 10,



  BB_NONTHREADABLE_BLOCK = 1 << 11
};
# 361 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
enum dom_state
{
  DOM_NONE,
  DOM_NO_FAST_QUERY,
  DOM_OK
};





struct control_flow_graph
{


  basic_block x_entry_block_ptr;
  basic_block x_exit_block_ptr;


  VEC_basic_block_gc *x_basic_block_info;


  int x_n_basic_blocks;


  int x_n_edges;


  int x_last_basic_block;



  VEC_basic_block_gc *x_label_to_block_map;

  enum profile_status {
    PROFILE_ABSENT,
    PROFILE_GUESSED,
    PROFILE_READ
  } x_profile_status;


  enum dom_state x_dom_computed[2];


  unsigned x_n_bbs_in_dom_tree[2];



  int max_jumptable_ents;


  int last_label_uid;
};
# 489 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
extern bitmap_obstack reg_obstack;
# 508 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
extern void compute_bb_for_insn (void);
extern unsigned int free_bb_for_insn (void);
extern void update_bb_for_insn (basic_block);

extern void insert_insn_on_edge (rtx, edge);
basic_block split_edge_and_insert (edge, rtx);

extern void commit_edge_insertions (void);

extern void remove_fake_edges (void);
extern void remove_fake_exit_edges (void);
extern void add_noreturn_fake_exit_edges (void);
extern void connect_infinite_loops_to_exit (void);
extern edge unchecked_make_edge (basic_block, basic_block, int);
extern edge cached_make_edge (sbitmap, basic_block, basic_block, int);
extern edge make_edge (basic_block, basic_block, int);
extern edge make_single_succ_edge (basic_block, basic_block, int);
extern void remove_edge_raw (edge);
extern void redirect_edge_succ (edge, basic_block);
extern edge redirect_edge_succ_nodup (edge, basic_block);
extern void redirect_edge_pred (edge, basic_block);
extern basic_block create_basic_block_structure (rtx, rtx, rtx, basic_block);
extern void clear_bb_flags (void);
extern int post_order_compute (int *, unsigned char, unsigned char);
extern int inverted_post_order_compute (int *);
extern int pre_and_rev_post_order_compute (int *, int *, unsigned char);
extern int dfs_enumerate_from (basic_block, int,
          unsigned char (*)(const_basic_block, const void *),
          basic_block *, int, const void *);
extern void compute_dominance_frontiers (bitmap *);
extern bitmap compute_idf (bitmap, bitmap *);
extern void dump_bb_info (basic_block, unsigned char, unsigned char, int, const char *, FILE *);
extern void dump_edge_info (FILE *, edge, int);
extern void brief_dump_cfg (FILE *);
extern void clear_edges (void);
extern void scale_bbs_frequencies_int (basic_block *, int, int, int);
extern void scale_bbs_frequencies_gcov_type (basic_block *, int, gcov_type,
          gcov_type);






typedef struct ce_if_block
{
  basic_block test_bb;
  basic_block then_bb;
  basic_block else_bb;
  basic_block join_bb;
  basic_block last_test_bb;
  int num_multiple_test_blocks;
  int num_and_and_blocks;
  int num_or_or_blocks;
  int num_multiple_test_insns;
  int and_and_p;
  int num_then_insns;
  int num_else_insns;
  int pass;





} ce_if_block_t;


struct edge_list
{
  int num_blocks;
  int num_edges;
  edge *index_to_edge;
};
# 628 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
static __inline__ unsigned char
single_succ_p (const_basic_block bb)
{
  return (VEC_edge_base_length((((bb->succs)) ? &((bb->succs))->base : 0))) == 1;
}



static __inline__ unsigned char
single_pred_p (const_basic_block bb)
{
  return (VEC_edge_base_length((((bb->preds)) ? &((bb->preds))->base : 0))) == 1;
}




static __inline__ edge
single_succ_edge (const_basic_block bb)
{
  ((void)(!(single_succ_p (bb)) ? fancy_abort ("/home/mzorgati/gcc-4.4.0/gcc/basic-block.h", 648, __FUNCTION__), 0 : 0));
  return (VEC_edge_base_index((((bb)->succs) ? &((bb)->succs)->base : 0),(0) ));
}




static __inline__ edge
single_pred_edge (const_basic_block bb)
{
  ((void)(!(single_pred_p (bb)) ? fancy_abort ("/home/mzorgati/gcc-4.4.0/gcc/basic-block.h", 658, __FUNCTION__), 0 : 0));
  return (VEC_edge_base_index((((bb)->preds) ? &((bb)->preds)->base : 0),(0) ));
}




static __inline__ basic_block
single_succ (const_basic_block bb)
{
  return single_succ_edge (bb)->dest;
}




static __inline__ basic_block
single_pred (const_basic_block bb)
{
  return single_pred_edge (bb)->src;
}



typedef struct {
  unsigned index;
  VEC_edge_gc **container;
} edge_iterator;

static __inline__ VEC_edge_gc *
ei_container (edge_iterator i)
{
  ((void)(!(i.container) ? fancy_abort ("/home/mzorgati/gcc-4.4.0/gcc/basic-block.h", 690, __FUNCTION__), 0 : 0));
  return *i.container;
}





static __inline__ edge_iterator
ei_start_1 (VEC_edge_gc **ev)
{
  edge_iterator i;

  i.index = 0;
  i.container = ev;

  return i;
}



static __inline__ edge_iterator
ei_last_1 (VEC_edge_gc **ev)
{
  edge_iterator i;

  i.index = (VEC_edge_base_length((((*ev)) ? &((*ev))->base : 0))) - 1;
  i.container = ev;

  return i;
}


static __inline__ unsigned char
ei_end_p (edge_iterator i)
{
  return (i.index == (VEC_edge_base_length((((ei_container (i))) ? &((ei_container (i)))->base : 0))));
}



static __inline__ unsigned char
ei_one_before_end_p (edge_iterator i)
{
  return (i.index + 1 == (VEC_edge_base_length((((ei_container (i))) ? &((ei_container (i)))->base : 0))));
}


static __inline__ void
ei_next (edge_iterator *i)
{
  ((void)(!(i->index < (VEC_edge_base_length((((ei_container (*i))) ? &((ei_container (*i)))->base : 0)))) ? fancy_abort ("/home/mzorgati/gcc-4.4.0/gcc/basic-block.h", 741, __FUNCTION__), 0 : 0));
  i->index++;
}


static __inline__ void
ei_prev (edge_iterator *i)
{
  ((void)(!(i->index > 0) ? fancy_abort ("/home/mzorgati/gcc-4.4.0/gcc/basic-block.h", 749, __FUNCTION__), 0 : 0));
  i->index--;
}


static __inline__ edge
ei_edge (edge_iterator i)
{
  return (VEC_edge_base_index((((ei_container (i))) ? &((ei_container (i)))->base : 0),(i.index) ));
}




static __inline__ edge
ei_safe_edge (edge_iterator i)
{
  return !ei_end_p (i) ? ei_edge (i) : ((void *)0);
}





static __inline__ unsigned char
ei_cond (edge_iterator ei, edge *p)
{
  if (!ei_end_p (ei))
    {
      *p = ei_edge (ei);
      return 1;
    }
  else
    {
      *p = ((void *)0);
      return 0;
    }
}
# 808 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
struct edge_list * create_edge_list (void);
void free_edge_list (struct edge_list *);
void print_edge_list (FILE *, struct edge_list *);
void verify_edge_list (FILE *, struct edge_list *);
int find_edge_index (struct edge_list *, basic_block, basic_block);
edge find_edge (basic_block, basic_block);
# 826 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h"
extern struct edge_list *pre_edge_lcm (int, sbitmap *, sbitmap *,
           sbitmap *, sbitmap *, sbitmap **,
           sbitmap **);
extern struct edge_list *pre_edge_rev_lcm (int, sbitmap *,
        sbitmap *, sbitmap *,
        sbitmap *, sbitmap **,
        sbitmap **);
extern void compute_available (sbitmap *, sbitmap *, sbitmap *, sbitmap *);


extern unsigned char maybe_hot_bb_p (const_basic_block);
extern unsigned char maybe_hot_edge_p (edge);
extern unsigned char probably_never_executed_bb_p (const_basic_block);
extern unsigned char optimize_bb_for_size_p (const_basic_block);
extern unsigned char optimize_bb_for_speed_p (const_basic_block);
extern unsigned char optimize_edge_for_size_p (edge);
extern unsigned char optimize_edge_for_speed_p (edge);
extern unsigned char optimize_function_for_size_p (struct function *);
extern unsigned char optimize_function_for_speed_p (struct function *);
extern unsigned char optimize_loop_for_size_p (struct loop *);
extern unsigned char optimize_loop_for_speed_p (struct loop *);
extern unsigned char optimize_loop_nest_for_size_p (struct loop *);
extern unsigned char optimize_loop_nest_for_speed_p (struct loop *);
extern unsigned char gimple_predicted_by_p (const_basic_block, enum br_predictor);
extern unsigned char rtl_predicted_by_p (const_basic_block, enum br_predictor);
extern void gimple_predict_edge (edge, enum br_predictor, int);
extern void rtl_predict_edge (edge, enum br_predictor, int);
extern void predict_edge_def (edge, enum br_predictor, enum prediction);
extern void guess_outgoing_edge_probabilities (basic_block);
extern void remove_predictions_associated_with_edge (edge);
extern unsigned char edge_probability_reliable_p (const_edge);
extern unsigned char br_prob_note_reliable_p (const_rtx);
extern unsigned char predictable_edge_p (edge);


extern void dump_regset (regset, FILE *);
extern void debug_regset (regset);
extern void init_flow (struct function *);
extern void debug_bb (basic_block);
extern basic_block debug_bb_n (int);
extern void dump_regset (regset, FILE *);
extern void debug_regset (regset);
extern void expunge_block (basic_block);
extern void link_block (basic_block, basic_block);
extern void unlink_block (basic_block);
extern void compact_blocks (void);
extern basic_block alloc_block (void);
extern void alloc_aux_for_block (basic_block, int);
extern void alloc_aux_for_blocks (int);
extern void clear_aux_for_blocks (void);
extern void free_aux_for_blocks (void);
extern void alloc_aux_for_edge (edge, int);
extern void alloc_aux_for_edges (int);
extern void clear_aux_for_edges (void);
extern void free_aux_for_edges (void);


extern void find_unreachable_blocks (void);
extern unsigned char forwarder_block_p (const_basic_block);
extern unsigned char can_fallthru (basic_block, basic_block);
extern unsigned char could_fall_through (basic_block, basic_block);
extern void flow_nodes_print (const char *, const_sbitmap, FILE *);
extern void flow_edge_list_print (const char *, const edge *, int, FILE *);


extern basic_block force_nonfallthru (edge);
extern rtx block_label (basic_block);
extern unsigned char purge_all_dead_edges (void);
extern unsigned char purge_dead_edges (basic_block);


extern void find_many_sub_basic_blocks (sbitmap);
extern void rtl_make_eh_edge (sbitmap, basic_block, rtx);
extern void find_basic_blocks (rtx);


extern unsigned char cleanup_cfg (int);
extern unsigned char delete_unreachable_blocks (void);

extern unsigned char mark_dfs_back_edges (void);
extern void set_edge_can_fallthru_flag (void);
extern void update_br_prob_note (basic_block);
extern void fixup_abnormal_edges (void);
extern unsigned char inside_basic_block_p (const_rtx);
extern unsigned char control_flow_insn_p (const_rtx);
extern rtx get_last_bb_insn (basic_block);


extern void reorder_basic_blocks (void);



enum cdi_direction
{
  CDI_DOMINATORS = 1,
  CDI_POST_DOMINATORS = 2
};

extern enum dom_state dom_info_state (enum cdi_direction);
extern void set_dom_info_availability (enum cdi_direction, enum dom_state);
extern unsigned char dom_info_available_p (enum cdi_direction);
extern void calculate_dominance_info (enum cdi_direction);
extern void free_dominance_info (enum cdi_direction);
extern basic_block nearest_common_dominator (enum cdi_direction,
          basic_block, basic_block);
extern basic_block nearest_common_dominator_for_set (enum cdi_direction,
           bitmap);
extern void set_immediate_dominator (enum cdi_direction, basic_block,
         basic_block);
extern basic_block get_immediate_dominator (enum cdi_direction, basic_block);
extern unsigned char dominated_by_p (enum cdi_direction, const_basic_block, const_basic_block);
extern VEC_basic_block_heap *get_dominated_by (enum cdi_direction, basic_block);
extern VEC_basic_block_heap *get_dominated_by_region (enum cdi_direction,
        basic_block *,
        unsigned);
extern void add_to_dominance_info (enum cdi_direction, basic_block);
extern void delete_from_dominance_info (enum cdi_direction, basic_block);
basic_block recompute_dominator (enum cdi_direction, basic_block);
extern void redirect_immediate_dominators (enum cdi_direction, basic_block,
        basic_block);
extern void iterate_fix_dominators (enum cdi_direction,
        VEC_basic_block_heap *, unsigned char);
extern void verify_dominators (enum cdi_direction);
extern basic_block first_dom_son (enum cdi_direction, basic_block);
extern basic_block next_dom_son (enum cdi_direction, basic_block);
unsigned bb_dom_dfs_in (enum cdi_direction, basic_block);
unsigned bb_dom_dfs_out (enum cdi_direction, basic_block);

extern edge try_redirect_by_replacing_jump (edge, basic_block, unsigned char);
extern void break_superblocks (void);
extern void relink_block_chain (unsigned char);
extern void check_bb_profile (basic_block, FILE *);
extern void update_bb_profile_for_threading (basic_block, int, gcov_type, edge);
extern void init_rtl_bb_info (basic_block);

extern void initialize_original_copy_tables (void);
extern void free_original_copy_tables (void);
extern void set_bb_original (basic_block, basic_block);
extern basic_block get_bb_original (basic_block);
extern void set_bb_copy (basic_block, basic_block);
extern basic_block get_bb_copy (basic_block);
void set_loop_copy (struct loop *, struct loop *);
struct loop *get_loop_copy (struct loop *);


extern rtx insert_insn_end_bb_new (rtx, basic_block);

# 1 "/home/mzorgati/gcc-4.4.0/gcc/cfghooks.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/cfghooks.h"
struct cfg_hooks
{

  const char *name;


  int (*verify_flow_info) (void);
  void (*dump_bb) (basic_block, FILE *, int, int);




  basic_block (*create_basic_block) (void *head, void *end, basic_block after);





  edge (*redirect_edge_and_branch) (edge e, basic_block b);




  basic_block (*redirect_edge_and_branch_force) (edge, basic_block);



  unsigned char (*can_remove_branch_p) (const_edge);


  void (*delete_basic_block) (basic_block);



  basic_block (*split_block) (basic_block b, void * i);


  unsigned char (*move_block_after) (basic_block b, basic_block a);


  unsigned char (*can_merge_blocks_p) (basic_block a, basic_block b);


  void (*merge_blocks) (basic_block a, basic_block b);


  void (*predict_edge) (edge e, enum br_predictor predictor, int probability);



  unsigned char (*predicted_by_p) (const_basic_block bb, enum br_predictor predictor);


  unsigned char (*can_duplicate_block_p) (const_basic_block a);


  basic_block (*duplicate_block) (basic_block a);



  basic_block (*split_edge) (edge);
  void (*make_forwarder_block) (edge);


  void (*tidy_fallthru_edge) (edge);



  unsigned char (*block_ends_with_call_p) (basic_block);



  unsigned char (*block_ends_with_condjump_p) (const_basic_block);
# 106 "/home/mzorgati/gcc-4.4.0/gcc/cfghooks.h"
  int (*flow_call_edges_add) (sbitmap);



  void (*execute_on_growing_pred) (edge);



  void (*execute_on_shrinking_pred) (edge);



  unsigned char (*cfg_hook_duplicate_loop_to_header_edge) (struct loop *, edge,
        unsigned, sbitmap,
        edge, VEC_edge_heap **,
        int);



  void (*lv_add_condition_to_bb) (basic_block, basic_block, basic_block,
      void *);

  void (*lv_adjust_loop_header_phi) (basic_block, basic_block,
         basic_block, edge);



  void (*extract_cond_bb_edges) (basic_block, edge *, edge *);




  void (*flush_pending_stmts) (edge);
};

extern void verify_flow_info (void);
extern void dump_bb (basic_block, FILE *, int);
extern edge redirect_edge_and_branch (edge, basic_block);
extern basic_block redirect_edge_and_branch_force (edge, basic_block);
extern unsigned char can_remove_branch_p (const_edge);
extern void remove_branch (edge);
extern void remove_edge (edge);
extern edge split_block (basic_block, void *);
extern edge split_block_after_labels (basic_block);
extern unsigned char move_block_after (basic_block, basic_block);
extern void delete_basic_block (basic_block);
extern basic_block split_edge (edge);
extern basic_block create_basic_block (void *, void *, basic_block);
extern basic_block create_empty_bb (basic_block);
extern unsigned char can_merge_blocks_p (basic_block, basic_block);
extern void merge_blocks (basic_block, basic_block);
extern edge make_forwarder_block (basic_block, unsigned char (*)(edge),
      void (*) (basic_block));
extern void tidy_fallthru_edge (edge);
extern void tidy_fallthru_edges (void);
extern void predict_edge (edge e, enum br_predictor predictor, int probability);
extern unsigned char predicted_by_p (const_basic_block bb, enum br_predictor predictor);
extern unsigned char can_duplicate_block_p (const_basic_block);
extern basic_block duplicate_block (basic_block, edge, basic_block);
extern unsigned char block_ends_with_call_p (basic_block bb);
extern unsigned char block_ends_with_condjump_p (const_basic_block bb);
extern int flow_call_edges_add (sbitmap);
extern void execute_on_growing_pred (edge);
extern void execute_on_shrinking_pred (edge);
extern unsigned char cfg_hook_duplicate_loop_to_header_edge (struct loop *loop, edge,
          unsigned int ndupl,
          sbitmap wont_exit,
          edge orig,
          VEC_edge_heap **to_remove,
          int flags);

extern void lv_flush_pending_stmts (edge);
extern void extract_cond_bb_edges (basic_block, edge *, edge*);
extern void lv_adjust_loop_header_phi (basic_block, basic_block, basic_block,
           edge);
extern void lv_add_condition_to_bb (basic_block, basic_block, basic_block,
        void *);


extern struct cfg_hooks gimple_cfg_hooks;
extern struct cfg_hooks rtl_cfg_hooks;
extern struct cfg_hooks cfg_layout_rtl_cfg_hooks;


extern enum ir_type current_ir_type (void);
extern void rtl_register_cfg_hooks (void);
extern void cfg_layout_rtl_register_cfg_hooks (void);
extern void gimple_register_cfg_hooks (void);
extern struct cfg_hooks get_cfg_hooks (void);
extern void set_cfg_hooks (struct cfg_hooks);
# 974 "/home/mzorgati/gcc-4.4.0/gcc/basic-block.h" 2


static __inline__ unsigned char
bb_has_eh_pred (basic_block bb)
{
  edge e;
  edge_iterator ei;

  for ((ei) = ei_start_1 (&((bb->preds))); ei_cond ((ei), &(e)); ei_next (&(ei)))
    {
      if (e->flags & 8)
 return 1;
    }
  return 0;
}


static __inline__ unsigned char
bb_has_abnormal_pred (basic_block bb)
{
  edge e;
  edge_iterator ei;

  for ((ei) = ei_start_1 (&((bb->preds))); ei_cond ((ei), &(e)); ei_next (&(ei)))
    {
      if (e->flags & 2)
 return 1;
    }
  return 0;
}


extern edge mfb_kj_edge;
extern unsigned char mfb_keep_just (edge);


extern void rtl_profile_for_bb (basic_block);
extern void rtl_profile_for_edge (edge);
extern void default_rtl_profile (void);
# 29 "/home/mzorgati/gcc-4.4.0/gcc/regs.h" 2
# 47 "/home/mzorgati/gcc-4.4.0/gcc/regs.h"
extern int max_regno;
# 69 "/home/mzorgati/gcc-4.4.0/gcc/regs.h"
struct regstat_n_sets_and_refs_t
{
  int sets;
  int refs;
};

extern struct regstat_n_sets_and_refs_t *regstat_n_sets_and_refs;


static __inline__ int
REG_N_REFS(int regno)
{
  return regstat_n_sets_and_refs[regno].refs;
}






static __inline__ int
REG_N_SETS (int regno)
{
  return regstat_n_sets_and_refs[regno].sets;
}







extern void regstat_init_n_sets_and_refs (void);
extern void regstat_free_n_sets_and_refs (void);
extern void regstat_compute_ri (void);
extern void regstat_free_ri (void);
extern bitmap regstat_get_setjmp_crosses (void);
extern void regstat_compute_calls_crossed (void);
extern void regstat_free_calls_crossed (void);





struct reg_info_t
{
  int freq;
  int deaths;
  int live_length;
  int calls_crossed;
  int freq_calls_crossed;
  int throw_calls_crossed;
  int basic_block;
};

extern struct reg_info_t *reg_info_p;


extern size_t reg_info_p_size;
# 221 "/home/mzorgati/gcc-4.4.0/gcc/regs.h"
extern short *reg_renumber;



extern unsigned char have_regs_of_mode [MAX_MACHINE_MODE];






extern enum machine_mode reg_raw_mode[FIRST_PSEUDO_REGISTER];




extern int caller_save_needed;
# 267 "/home/mzorgati/gcc-4.4.0/gcc/regs.h"
extern char contains_reg_of_mode [N_REG_CLASSES] [MAX_MACHINE_MODE];

typedef unsigned short move_table[N_REG_CLASSES];



extern move_table *move_cost[MAX_MACHINE_MODE];


extern unsigned char hard_regno_nregs[FIRST_PSEUDO_REGISTER][MAX_MACHINE_MODE];



extern move_table *may_move_in_cost[MAX_MACHINE_MODE];



extern move_table *may_move_out_cost[MAX_MACHINE_MODE];




static __inline__ unsigned int
end_hard_regno (enum machine_mode mode, unsigned int regno)
{
  return regno + hard_regno_nregs[regno][(int) mode];
}
# 306 "/home/mzorgati/gcc-4.4.0/gcc/regs.h"
static __inline__ void
add_to_hard_reg_set (HARD_REG_ELT_TYPE *regs, enum machine_mode mode,
       unsigned int regno)
{
  unsigned int end_regno;

  end_regno = end_hard_regno (mode, regno);
  do
    ((*regs) |= ((HARD_REG_ELT_TYPE) (1)) << (regno));
  while (++regno < end_regno);
}



static __inline__ void
remove_from_hard_reg_set (HARD_REG_ELT_TYPE *regs, enum machine_mode mode,
     unsigned int regno)
{
  unsigned int end_regno;

  end_regno = end_hard_regno (mode, regno);
  do
    ((*regs) &= ~(((HARD_REG_ELT_TYPE) (1)) << (regno)));
  while (++regno < end_regno);
}



static __inline__ unsigned char
in_hard_reg_set_p (const HARD_REG_ELT_TYPE regs, enum machine_mode mode,
     unsigned int regno)
{
  unsigned int end_regno;

  if (!(!!((regs) & (((HARD_REG_ELT_TYPE) (1)) << (regno)))))
    return 0;

  end_regno = end_hard_regno (mode, regno);
  while (++regno < end_regno)
    if (!(!!((regs) & (((HARD_REG_ELT_TYPE) (1)) << (regno)))))
      return 0;

  return 1;
}



static __inline__ unsigned char
overlaps_hard_reg_set_p (const HARD_REG_ELT_TYPE regs, enum machine_mode mode,
    unsigned int regno)
{
  unsigned int end_regno;

  if ((!!((regs) & (((HARD_REG_ELT_TYPE) (1)) << (regno)))))
    return 1;

  end_regno = end_hard_regno (mode, regno);
  while (++regno < end_regno)
    if ((!!((regs) & (((HARD_REG_ELT_TYPE) (1)) << (regno)))))
      return 1;

  return 0;
}
# 49 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/hard-reg-set.h" 1
# 50 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/real.h" 1
# 51 "c816.c" 2
# 1 "/home/mzorgati/gcc_build/gcc/insn-config.h" 1
# 52 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/conditions.h" 1
# 54 "/home/mzorgati/gcc-4.4.0/gcc/conditions.h"
typedef struct {int flags; rtx value1, value2; int mdep;} CC_STATUS;



extern CC_STATUS cc_prev_status;



extern CC_STATUS cc_status;
# 53 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/output.h" 1
# 26 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
extern void init_final (const char *);



extern void app_enable (void);



extern void app_disable (void);




extern int dbr_sequence_length (void);


extern void init_insn_lengths (void);



extern int get_attr_length (rtx);



extern int get_attr_min_length (rtx);



extern void shorten_branches (rtx);






extern void final_start_function (rtx, FILE *, int);




extern void final_end_function (void);


extern void final (rtx, FILE *, int);




extern rtx final_scan_insn (rtx, FILE *, int, int, int *);



extern rtx alter_subreg (rtx *);



extern void output_operand_lossage (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2))) __attribute__ ((__nonnull__ (1)));



extern void output_asm_insn (const char *, rtx *);




extern int insn_current_reference_address (rtx);



extern int label_to_alignment (rtx);


extern void output_asm_label (rtx);


extern void mark_symbol_refs_as_used (rtx);



extern void output_address (rtx);




extern void output_addr_const (FILE *, rtx);
# 119 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
typedef long __gcc_host_wide_int__;




extern void asm_fprintf (FILE *file, const char *p, ...)
     __attribute__ ((__format__ (__asm_fprintf__, 2, 3))) __attribute__ ((__nonnull__ (2)));



extern void split_double (rtx, rtx *, rtx *);


extern int leaf_function_p (void);




extern int final_forward_branch_p (rtx);



extern int only_leaf_regs_used (void);



extern void leaf_renumber_regs_insn (rtx);


extern const char *get_insn_template (int, rtx);




extern void declare_weak (tree);

extern void merge_weak (tree, tree);


extern void weak_finish (void);


extern void emutls_finish (void);
# 170 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
extern int decode_reg_name (const char *);

extern void assemble_alias (tree, tree);

extern void default_assemble_visibility (tree, int);



extern void assemble_asm (tree);





extern void assemble_start_function (tree, const char *);



extern void assemble_end_function (tree, const char *);
# 199 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
extern void assemble_variable (tree, int, int, int);



extern void align_variable (tree decl, unsigned char dont_output_data);




extern void assemble_external (tree);


extern void assemble_zeros (unsigned long);


extern void assemble_align (int);


extern void assemble_string (const char *, int);


extern void assemble_external_libcall (rtx);


extern void assemble_label (const char *);





extern void assemble_name_raw (FILE *, const char *);





extern void assemble_name (FILE *, const char *);
# 244 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
extern const char *integer_asm_op (int, int);



extern void assemble_integer_with_op (const char *, rtx);


extern unsigned char default_assemble_integer (rtx, unsigned int, int);





extern unsigned char assemble_integer (rtx, unsigned, unsigned, int);
# 267 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
extern void assemble_real (struct real_value, enum machine_mode, unsigned);



extern void assemble_addr_to_section (rtx, section *);


extern int get_pool_size (void);





extern void output_shared_constant_pool (void);

extern void output_object_blocks (void);






extern unsigned char constructor_static_from_elts_p (const_tree);
# 300 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
extern tree initializer_constant_valid_p (tree, tree);
# 310 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
extern void output_constant (tree, unsigned long, unsigned int);







extern rtx final_sequence;
# 330 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
extern FILE *asm_out_file;



extern const char *first_global_object_name;


extern const char *weak_global_object_name;






extern int current_function_is_leaf;





extern int current_function_sp_is_unchanging;





extern int current_function_uses_only_leaf_regs;




extern FILE *dump_file;



extern rtx current_insn_predicate;


extern rtx current_output_insn;




extern rtx this_is_asm_operands;



extern int size_directive_output;
extern tree last_assemble_variable_decl;

extern unsigned char first_function_block_is_cold;



extern unsigned char decl_readonly_section (const_tree, int);



extern int compute_reloc_for_constant (tree);


extern const char *user_label_prefix;


extern void default_function_pro_epilogue (FILE *, long);


extern void no_asm_to_stream (FILE *);
# 435 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
enum section_category
{
  SECCAT_TEXT,

  SECCAT_RODATA,
  SECCAT_RODATA_MERGE_STR,
  SECCAT_RODATA_MERGE_STR_INIT,
  SECCAT_RODATA_MERGE_CONST,
  SECCAT_SRODATA,

  SECCAT_DATA,
# 456 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
  SECCAT_DATA_REL,
  SECCAT_DATA_REL_LOCAL,
  SECCAT_DATA_REL_RO,
  SECCAT_DATA_REL_RO_LOCAL,

  SECCAT_SDATA,
  SECCAT_TDATA,

  SECCAT_BSS,
  SECCAT_SBSS,
  SECCAT_TBSS,

  SECCAT_EMUTLS_VAR,
  SECCAT_EMUTLS_TMPL
};


struct section_common {

  unsigned int flags;
};


struct named_section {
  struct section_common common;


  const char *name;



  tree decl;
};



typedef void (*unnamed_section_callback) (const void *);


struct unnamed_section {
  struct section_common common;



  unnamed_section_callback callback;
  const void * data;


  section *next;
};
# 516 "/home/mzorgati/gcc-4.4.0/gcc/output.h"
typedef unsigned char (*noswitch_section_callback) (tree decl, const char *name,
        unsigned long size,
        unsigned long rounded);


struct noswitch_section {
  struct section_common common;


  noswitch_section_callback callback;
};


union section
{
  struct section_common common;
  struct named_section named;
  struct unnamed_section unnamed;
  struct noswitch_section noswitch;
};




struct object_block;


extern section *text_section;
extern section *data_section;
extern section *readonly_data_section;
extern section *sdata_section;
extern section *ctors_section;
extern section *dtors_section;
extern section *bss_section;
extern section *sbss_section;
extern section *exception_section;
extern section *eh_frame_section;
extern section *tls_comm_section;
extern section *comm_section;
extern section *lcomm_section;
extern section *bss_noswitch_section;

extern section *in_section;
extern unsigned char in_cold_section_p;

extern section *get_unnamed_section (unsigned int, void (*) (const void *),
         const void *);
extern section *get_section (const char *, unsigned int, tree);
extern section *get_named_section (tree, const char *, int);
extern void place_block_symbol (rtx);
extern rtx get_section_anchor (struct object_block *, long,
          enum tls_model);
extern section *mergeable_constant_section (enum machine_mode,
         unsigned long,
         unsigned int);
extern section *function_section (tree);
extern section *unlikely_text_section (void);
extern section *current_function_section (void);



extern section *get_cdtor_priority_section (int, unsigned char);

extern unsigned char unlikely_text_section_p (section *);
extern void switch_to_section (section *);
extern void output_section_asm_op (const void *);

extern unsigned int default_section_type_flags (tree, const char *, int);

extern unsigned char have_global_bss_p (void);
extern void default_no_named_section (const char *, unsigned int, tree);
extern void default_elf_asm_named_section (const char *, unsigned int, tree);
extern enum section_category categorize_decl_for_section (const_tree, int);
extern void default_coff_asm_named_section (const char *, unsigned int, tree);
extern void default_pe_asm_named_section (const char *, unsigned int, tree);

extern void default_stabs_asm_out_destructor (rtx, int);
extern void default_named_section_asm_out_destructor (rtx, int);
extern void default_dtor_section_asm_out_destructor (rtx, int);
extern void default_stabs_asm_out_constructor (rtx, int);
extern void default_named_section_asm_out_constructor (rtx, int);
extern void default_ctor_section_asm_out_constructor (rtx, int);

extern section *default_select_section (tree, int, unsigned long);
extern section *default_elf_select_section (tree, int, unsigned long);
extern void default_unique_section (tree, int);
extern section *default_function_rodata_section (tree);
extern section *default_no_function_rodata_section (tree);
extern section *default_select_rtx_section (enum machine_mode, rtx,
         unsigned long);
extern section *default_elf_select_rtx_section (enum machine_mode, rtx,
      unsigned long);
extern void default_encode_section_info (tree, rtx, int);
extern const char *default_strip_name_encoding (const char *);
extern void default_asm_output_anchor (rtx);
extern unsigned char default_use_anchors_for_symbol_p (const_rtx);
extern unsigned char default_binds_local_p (const_tree);
extern unsigned char default_binds_local_p_1 (const_tree, int);
extern void default_globalize_label (FILE *, const char *);
extern void default_globalize_decl_name (FILE *, tree);
extern void default_emit_unwind_label (FILE *, tree, int, int);
extern void default_emit_except_table_label (FILE *);
extern void default_internal_label (FILE *, const char *, unsigned long);
extern void default_file_start (void);
extern void file_end_indicate_exec_stack (void);
extern unsigned char default_valid_pointer_mode (enum machine_mode);

extern void default_elf_asm_output_external (FILE *file, tree,
          const char *);
extern int maybe_assemble_visibility (tree);

extern int default_address_cost (rtx, unsigned char);
# 54 "c816.c" 2
# 1 "/home/mzorgati/gcc_build/gcc/insn-attr.h" 1
# 10 "/home/mzorgati/gcc_build/gcc/insn-attr.h"
enum attr_type {TYPE_NORMAL, TYPE_LIB};
extern enum attr_type get_attr_type (rtx);

typedef void *state_t;
# 55 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/flags.h" 1
# 29 "/home/mzorgati/gcc-4.4.0/gcc/flags.h"
enum debug_info_type
{
  NO_DEBUG,
  DBX_DEBUG,
  SDB_DEBUG,
  DWARF2_DEBUG,
  XCOFF_DEBUG,
  VMS_DEBUG,
  VMS_AND_DWARF2_DEBUG

};


extern enum debug_info_type write_symbols;


extern const char *const debug_type_names[];

enum debug_info_level
{
  DINFO_LEVEL_NONE,
  DINFO_LEVEL_TERSE,
  DINFO_LEVEL_NORMAL,
  DINFO_LEVEL_VERBOSE
};


extern enum debug_info_level debug_info_level;
# 66 "/home/mzorgati/gcc-4.4.0/gcc/flags.h"
enum debug_info_usage
{
  DINFO_USAGE_DFN,
  DINFO_USAGE_DIR_USE,
  DINFO_USAGE_IND_USE,
  DINFO_USAGE_NUM_ENUMS
};

extern unsigned char should_emit_struct_debug (tree type_decl, enum debug_info_usage);
extern void set_struct_debug_option (const char *value);



extern unsigned char use_gnu_debug_info_extensions;
# 95 "/home/mzorgati/gcc-4.4.0/gcc/flags.h"
extern enum symbol_visibility default_visibility;

struct visibility_flags
{
  unsigned inpragma : 1;
  unsigned inlines_hidden : 1;
};


extern struct visibility_flags visibility_options;



extern int optimize;



extern int optimize_size;




extern unsigned char extra_warnings;
# 126 "/home/mzorgati/gcc-4.4.0/gcc/flags.h"
extern void set_Wstrict_aliasing (int onoff);





extern unsigned char warn_larger_than;
extern long larger_than_size;




extern unsigned char warn_frame_larger_than;
extern long frame_larger_than_size;




extern int flag_print_asm_name;





extern int flag_signed_char;




extern int flag_short_enums;



extern int flag_pcc_struct_return;





extern int flag_complex_method;



extern int rtl_dump_and_exit;



extern int flag_gen_aux_info;




extern int flag_dump_unnumbered;




extern int flag_pedantic_errors;



extern int flag_permissive;




extern int flag_shlib;
# 201 "/home/mzorgati/gcc-4.4.0/gcc/flags.h"
extern int flag_debug_asm;



extern int flag_next_runtime;

extern int flag_dump_rtl_in_asm;


enum ira_algorithm
{
  IRA_ALGORITHM_CB,
  IRA_ALGORITHM_PRIORITY
};

extern enum ira_algorithm flag_ira_algorithm;


enum ira_region
{
  IRA_REGION_ONE,
  IRA_REGION_ALL,
  IRA_REGION_MIXED
};

extern enum ira_region flag_ira_region;

extern unsigned int flag_ira_verbose;





extern int flag_evaluation_order;


extern unsigned long g_switch_value;
extern unsigned char g_switch_set;


extern unsigned char sel_sched_switch_set;






extern int align_loops_log;
extern int align_loops_max_skip;
extern int align_jumps_log;
extern int align_jumps_max_skip;
extern int align_labels_log;
extern int align_labels_max_skip;
extern int align_functions_log;


extern int dump_for_graph;


enum graph_dump_types
{
  no_graph = 0,
  vcg
};
extern enum graph_dump_types graph_dump_format;



extern int flag_detailed_statistics;



extern int flag_remove_unreachable_functions;


extern int flag_var_tracking;



extern unsigned char flag_speculative_prefetching_set;


enum stack_check_type
{

  NO_STACK_CHECK = 0,



  GENERIC_STACK_CHECK,




  STATIC_BUILTIN_STACK_CHECK,



  FULL_BUILTIN_STACK_CHECK
};
extern enum stack_check_type flag_stack_check;
# 311 "/home/mzorgati/gcc-4.4.0/gcc/flags.h"
extern unsigned char flag_instrument_functions_exclude_p (tree fndecl);
# 366 "/home/mzorgati/gcc-4.4.0/gcc/flags.h"
enum warn_strict_overflow_code
{



  WARN_STRICT_OVERFLOW_ALL = 1,




  WARN_STRICT_OVERFLOW_CONDITIONAL = 2,


  WARN_STRICT_OVERFLOW_COMPARISON = 3,


  WARN_STRICT_OVERFLOW_MISC = 4,


  WARN_STRICT_OVERFLOW_MAGNITUDE = 5
};
# 56 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/recog.h" 1
# 25 "/home/mzorgati/gcc-4.4.0/gcc/recog.h"
enum op_type {
  OP_IN,
  OP_OUT,
  OP_INOUT
};

struct operand_alternative
{


  const char *constraint;


  enum reg_class cl;



  unsigned int reject;


  int matches;



  int matched;


  unsigned int earlyclobber:1;


  unsigned int memory_ok:1;

  unsigned int offmem_ok:1;

  unsigned int nonoffmem_ok:1;

  unsigned int decmem_ok:1;

  unsigned int incmem_ok:1;

  unsigned int is_address:1;


  unsigned int anything_ok:1;
};


extern void init_recog (void);
extern void init_recog_no_volatile (void);
extern int check_asm_operands (rtx);
extern int asm_operand_ok (rtx, const char *, const char **);
extern unsigned char validate_change (rtx, rtx *, rtx, unsigned char);
extern unsigned char validate_unshare_change (rtx, rtx *, rtx, unsigned char);
extern unsigned char canonicalize_change_group (rtx insn, rtx x);
extern int insn_invalid_p (rtx);
extern int verify_changes (int);
extern void confirm_change_group (void);
extern int apply_change_group (void);
extern int num_validated_changes (void);
extern void cancel_changes (int);
extern int constrain_operands (int);
extern int constrain_operands_cached (int);
extern int memory_address_p (enum machine_mode, rtx);
extern int strict_memory_address_p (enum machine_mode, rtx);
extern int validate_replace_rtx (rtx, rtx, rtx);
extern int validate_replace_rtx_part (rtx, rtx, rtx *, rtx);
extern int validate_replace_rtx_part_nosimplify (rtx, rtx, rtx *, rtx);
extern void validate_replace_rtx_group (rtx, rtx, rtx);
extern void validate_replace_src_group (rtx, rtx, rtx);
extern unsigned char validate_simplify_insn (rtx insn);
extern int num_changes_pending (void);

extern int next_insn_tests_no_inequality (rtx);

extern int reg_fits_class_p (rtx, enum reg_class, int, enum machine_mode);

extern int offsettable_memref_p (rtx);
extern int offsettable_nonstrict_memref_p (rtx);
extern int offsettable_address_p (int, enum machine_mode, rtx);
extern int mode_dependent_address_p (rtx);

extern int recog (rtx, rtx, int *);

static __inline__ int recog_memoized (rtx insn);

extern void add_clobbers (rtx, int);
extern int added_clobbers_hard_reg_p (int);
extern void insn_extract (rtx);
extern void extract_insn (rtx);
extern void extract_constrain_insn_cached (rtx);
extern void extract_insn_cached (rtx);
extern void preprocess_constraints (void);
extern rtx peep2_next_insn (int);
extern int peep2_regno_dead_p (int, int);
extern int peep2_reg_dead_p (int, rtx);

extern rtx peep2_find_free_register (int, int, const char *,
         enum machine_mode, HARD_REG_ELT_TYPE *);

extern rtx peephole2_insns (rtx, rtx, int *);

extern int store_data_bypass_p (rtx, rtx);
extern int if_test_bypass_p (rtx, rtx);
# 139 "/home/mzorgati/gcc-4.4.0/gcc/recog.h"
static __inline__ int
recog_memoized (rtx insn)
{
  if ((((insn)->u.fld[6]).rt_int) < 0)
    (((insn)->u.fld[6]).rt_int) = recog ((((insn)->u.fld[5]).rt_rtx), insn, 0);
  return (((insn)->u.fld[6]).rt_int);
}




static __inline__ const char *
skip_alternative (const char *p)
{
  const char *r = p;
  while (*r != '\0' && *r != ',')
    r++;
  if (*r == ',')
    r++;
  return r;
}


extern int volatile_ok;



extern int which_alternative;



struct recog_data
{







  rtx operand[30];


  rtx *operand_loc[30];


  const char *constraints[30];


  enum machine_mode operand_mode[30];


  enum op_type operand_type[30];



  rtx *dup_loc[3];



  char dup_num[3];
# 212 "/home/mzorgati/gcc-4.4.0/gcc/recog.h"
  char n_operands;


  char n_dups;


  char n_alternatives;





  unsigned char alternative_enabled_p [30];


  rtx insn;
};

extern struct recog_data recog_data;



extern struct operand_alternative recog_op_alt[30][30];




typedef int (*insn_operand_predicate_fn) (rtx, enum machine_mode);
typedef const char * (*insn_output_fn) (rtx *, rtx);
typedef rtx (*insn_gen_fn) (rtx, ...);

struct insn_operand_data
{
  const insn_operand_predicate_fn predicate;

  const char *const constraint;

  __extension__ enum machine_mode const mode : 16;

  const char strict_low;

  const char eliminable;
};
# 263 "/home/mzorgati/gcc-4.4.0/gcc/recog.h"
struct insn_data
{
  const char *const name;

  union {
    const char *single;
    const char *const *multi;
    insn_output_fn function;
  } output;







  const insn_gen_fn genfun;
  const struct insn_operand_data *const operand;

  const char n_operands;
  const char n_dups;
  const char n_alternatives;
  const char output_format;
};

extern const struct insn_data insn_data[];
extern int peep2_current_count;
# 57 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/expr.h" 1
# 28 "/home/mzorgati/gcc-4.4.0/gcc/expr.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/rtl.h" 1
# 29 "/home/mzorgati/gcc-4.4.0/gcc/expr.h" 2

# 1 "/home/mzorgati/gcc-4.4.0/gcc/flags.h" 1
# 31 "/home/mzorgati/gcc-4.4.0/gcc/expr.h" 2
# 52 "/home/mzorgati/gcc-4.4.0/gcc/expr.h"
enum expand_modifier {EXPAND_NORMAL = 0, EXPAND_STACK_PARM, EXPAND_SUM,
        EXPAND_CONST_ADDRESS, EXPAND_INITIALIZER, EXPAND_WRITE,
        EXPAND_MEMORY};
# 95 "/home/mzorgati/gcc-4.4.0/gcc/expr.h"
enum direction {none, upward, downward};






struct args_size
{
  long constant;
  tree var;
};



struct locate_and_pad_arg_data
{



  struct args_size size;

  struct args_size offset;


  struct args_size slot_offset;


  struct args_size alignment_pad;

  enum direction where_pad;

  unsigned int boundary;
};
# 280 "/home/mzorgati/gcc-4.4.0/gcc/expr.h"
enum optab_methods
{
  OPTAB_DIRECT,
  OPTAB_LIB,
  OPTAB_WIDEN,
  OPTAB_LIB_WIDEN,
  OPTAB_MUST_WIDEN
};




extern rtx expand_simple_binop (enum machine_mode, enum rtx_code, rtx,
    rtx, rtx, int, enum optab_methods);
extern rtx expand_simple_unop (enum machine_mode, enum rtx_code, rtx, rtx,
          int);



extern int have_insn_for (enum rtx_code, enum machine_mode);


extern void emit_libcall_block (rtx, rtx, rtx, rtx);




extern rtx gen_add2_insn (rtx, rtx);
extern rtx gen_add3_insn (rtx, rtx, rtx);
extern rtx gen_sub2_insn (rtx, rtx);
extern rtx gen_sub3_insn (rtx, rtx, rtx);
extern rtx gen_move_insn (rtx, rtx);
extern int have_add2_insn (rtx, rtx);
extern int have_sub2_insn (rtx, rtx);



extern void emit_cmp_and_jump_insns (rtx, rtx, enum rtx_code, rtx,
         enum machine_mode, int, rtx);


extern void emit_indirect_jump (rtx);


extern rtx gen_cond_trap (enum rtx_code, rtx, rtx, rtx);
# 337 "/home/mzorgati/gcc-4.4.0/gcc/expr.h"
rtx emit_conditional_add (rtx, enum rtx_code, rtx, rtx, enum machine_mode,
     rtx, rtx, enum machine_mode, int);

rtx expand_val_compare_and_swap (rtx, rtx, rtx, rtx);
rtx expand_bool_compare_and_swap (rtx, rtx, rtx, rtx);
rtx expand_sync_operation (rtx, rtx, enum rtx_code);
rtx expand_sync_fetch_operation (rtx, rtx, enum rtx_code, unsigned char, rtx);
rtx expand_sync_lock_test_and_set (rtx, rtx, rtx);





extern rtx negate_rtx (enum machine_mode, rtx);


extern rtx expand_and (enum machine_mode, rtx, rtx, rtx);


extern rtx emit_store_flag (rtx, enum rtx_code, rtx, rtx, enum machine_mode,
       int, int);


extern rtx emit_store_flag_force (rtx, enum rtx_code, rtx, rtx,
      enum machine_mode, int, int);


extern rtx expand_builtin (tree, rtx, rtx, enum machine_mode, int);
extern tree std_build_builtin_va_list (void);
extern tree std_fn_abi_va_list (tree);
extern tree std_canonical_va_list_type (tree);

extern void std_expand_builtin_va_start (tree, rtx);
extern rtx default_expand_builtin (tree, rtx, rtx, enum machine_mode, int);
extern void expand_builtin_setjmp_setup (rtx, rtx);
extern void expand_builtin_setjmp_receiver (rtx);
extern rtx expand_builtin_saveregs (void);
extern void expand_builtin_trap (void);
extern rtx builtin_strncpy_read_str (void *, long, enum machine_mode);





extern void init_expr_target (void);


extern void init_expr (void);



extern void convert_move (rtx, rtx, int);


extern rtx convert_to_mode (enum machine_mode, rtx, int);


extern rtx convert_modes (enum machine_mode, enum machine_mode, rtx, int);



enum block_op_methods
{
  BLOCK_OP_NORMAL,
  BLOCK_OP_NO_LIBCALL,
  BLOCK_OP_CALL_PARM,

  BLOCK_OP_TAILCALL
};

extern tree block_clear_fn;
extern void init_block_move_fn (const char *);
extern void init_block_clear_fn (const char *);

extern rtx emit_block_move (rtx, rtx, rtx, enum block_op_methods);
extern rtx emit_block_move_via_libcall (rtx, rtx, rtx, unsigned char);
extern rtx emit_block_move_hints (rtx, rtx, rtx, enum block_op_methods,
             unsigned int, long);



extern void move_block_to_reg (int, rtx, int, enum machine_mode);



extern void move_block_from_reg (int, rtx, int);


extern rtx gen_group_rtx (rtx);



extern void emit_group_load (rtx, rtx, tree, int);


extern rtx emit_group_load_into_temps (rtx, rtx, tree, int);



extern void emit_group_move (rtx, rtx);


extern rtx emit_group_move_into_temps (rtx);



extern void emit_group_store (rtx, rtx, tree, int);


extern rtx copy_blkmode_from_reg (rtx, rtx, tree);


extern void use_reg (rtx *, rtx);



extern void use_regs (rtx *, int, int);


extern void use_group_regs (rtx *, rtx);



extern rtx clear_storage (rtx, rtx, enum block_op_methods);
extern rtx clear_storage_hints (rtx, rtx, enum block_op_methods,
           unsigned int, long);

rtx set_storage_via_libcall (rtx, rtx, rtx, unsigned char);


extern unsigned char set_storage_via_setmem (rtx, rtx, rtx, unsigned int,
        unsigned int, long);




extern int can_move_by_pieces (unsigned long, unsigned int);
# 482 "/home/mzorgati/gcc-4.4.0/gcc/expr.h"
extern int can_store_by_pieces (unsigned long,
    rtx (*) (void *, long,
      enum machine_mode),
    void *, unsigned int, unsigned char);







extern rtx store_by_pieces (rtx, unsigned long,
       rtx (*) (void *, long, enum machine_mode),
       void *, unsigned int, unsigned char, int);


extern rtx emit_move_insn (rtx, rtx);


extern rtx emit_move_insn_1 (rtx, rtx);

extern rtx emit_move_complex_push (enum machine_mode, rtx, rtx);
extern rtx emit_move_complex_parts (rtx, rtx);



extern rtx push_block (rtx, int, int);


extern void emit_push_insn (rtx, enum machine_mode, tree, rtx, unsigned int,
       int, rtx, int, rtx, rtx, int, rtx);


extern void expand_assignment (tree, tree, unsigned char);





extern rtx store_expr (tree, rtx, int, unsigned char);




extern rtx force_operand (rtx, rtx);


extern rtx expand_expr_real (tree, rtx, enum machine_mode,
        enum expand_modifier, rtx *);




static __inline__ rtx
expand_expr (tree exp, rtx target, enum machine_mode mode,
      enum expand_modifier modifier)
{
  return expand_expr_real (exp, target, mode, modifier, ((void *)0));
}

static __inline__ rtx
expand_normal (tree exp)
{
  return expand_expr_real (exp, (rtx) 0, VOIDmode, EXPAND_NORMAL, ((void *)0));
}



extern void init_pending_stack_adjust (void);


extern void discard_pending_stack_adjust (void);



extern void clear_pending_stack_adjust (void);


extern void do_pending_stack_adjust (void);



extern tree string_constant (tree, tree *);


extern void jumpifnot (tree, rtx);


extern void jumpif (tree, rtx);



extern void do_jump (tree, rtx, rtx);


extern rtx compare_from_rtx (rtx, rtx, enum rtx_code, int, enum machine_mode,
        rtx);
extern void do_compare_rtx_and_jump (rtx, rtx, enum rtx_code, int,
         enum machine_mode, rtx, rtx, rtx);


extern int try_casesi (tree, tree, tree, tree, rtx, rtx, rtx);
extern int try_tablejump (tree, tree, tree, tree, rtx, rtx);



extern unsigned int case_values_threshold (void);







extern rtx expr_size (tree);



extern long int_expr_size (tree);



extern rtx hard_function_value (const_tree, const_tree, const_tree, int);

extern rtx prepare_call_address (rtx, rtx, rtx *, int, int);

extern unsigned char shift_return_value (enum machine_mode, unsigned char, rtx);

extern rtx expand_call (tree, rtx, int);

extern void fixup_tail_calls (void);


extern rtx expand_shift (enum tree_code, enum machine_mode, rtx, tree, rtx,
    int);
extern rtx expand_divmod (int, enum tree_code, enum machine_mode, rtx, rtx,
     rtx, int);


extern void locate_and_pad_parm (enum machine_mode, tree, int, int, tree,
     struct args_size *,
     struct locate_and_pad_arg_data *);


extern rtx label_rtx (tree);




extern rtx force_label_rtx (tree);




extern rtx eliminate_constant_term (rtx, rtx *);



extern rtx memory_address (enum machine_mode, rtx);





extern rtx change_address (rtx, enum machine_mode, rtx);
# 667 "/home/mzorgati/gcc-4.4.0/gcc/expr.h"
extern rtx adjust_address_1 (rtx, enum machine_mode, long, int, int);
extern rtx adjust_automodify_address_1 (rtx, enum machine_mode, rtx,
     long, int);




extern rtx offset_address (rtx, rtx, unsigned long);


# 1 "/home/mzorgati/gcc-4.4.0/gcc/emit-rtl.h" 1
# 24 "/home/mzorgati/gcc-4.4.0/gcc/emit-rtl.h"
extern void set_mem_alias_set (rtx, alias_set_type);


extern void set_mem_align (rtx, unsigned int);


extern void set_mem_expr (rtx, tree);


extern void set_mem_offset (rtx, rtx);


extern void set_mem_size (rtx, rtx);


extern void set_mem_attrs_for_spill (rtx);
extern tree get_spill_slot_decl (unsigned char);





extern rtx replace_equiv_address (rtx, rtx);


extern rtx replace_equiv_address_nv (rtx, rtx);
# 678 "/home/mzorgati/gcc-4.4.0/gcc/expr.h" 2



extern rtx widen_memory_access (rtx, enum machine_mode, long);



extern rtx validize_mem (rtx);

extern rtx use_anchored_address (rtx);




extern void set_mem_attributes (rtx, tree, int);




extern void set_mem_attributes_minus_bitpos (rtx, tree, int, long);




extern int get_mem_align_offset (rtx, int);


extern rtx assemble_trampoline_template (void);


extern rtx copy_to_reg (rtx);


extern rtx copy_addr_to_reg (rtx);


extern rtx copy_to_mode_reg (enum machine_mode, rtx);


extern rtx copy_to_suggested_reg (rtx, rtx, enum machine_mode);



extern rtx force_reg (enum machine_mode, rtx);


extern rtx force_not_mem (rtx);


extern enum machine_mode promote_mode (const_tree, enum machine_mode, int *, int);


extern void adjust_stack (rtx);


extern void anti_adjust_stack (rtx);


enum save_level {SAVE_BLOCK, SAVE_FUNCTION, SAVE_NONLOCAL};


extern void emit_stack_save (enum save_level, rtx *, rtx);


extern void emit_stack_restore (enum save_level, rtx, rtx);


extern void update_nonlocal_goto_save_area (void);



extern rtx allocate_dynamic_stack_space (rtx, rtx, int);






extern void probe_stack_range (long, rtx);



extern rtx hard_libcall_value (enum machine_mode);





enum extraction_pattern { EP_insv, EP_extv, EP_extzv };
extern enum machine_mode
mode_for_extraction (enum extraction_pattern, int);

extern void store_bit_field (rtx, unsigned long,
        unsigned long, enum machine_mode, rtx);
extern rtx extract_bit_field (rtx, unsigned long,
         unsigned long, int, rtx,
         enum machine_mode, enum machine_mode);
extern rtx extract_low_bits (enum machine_mode, enum machine_mode, rtx);
extern rtx expand_mult (enum machine_mode, rtx, rtx, rtx, int);
extern rtx expand_mult_highpart_adjust (enum machine_mode, rtx, rtx, rtx, rtx, int);

extern rtx assemble_static_space (unsigned long);
extern int safe_from_p (const_rtx, tree, int);



extern void init_optabs (void);
extern void init_all_optabs (void);


extern rtx init_one_libfunc (const char *);
extern rtx set_user_assembler_libfunc (const char *, const char *);

extern int vector_mode_valid_p (enum machine_mode);
# 58 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/function.h" 1
# 59 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/optabs.h" 1
# 24 "/home/mzorgati/gcc-4.4.0/gcc/optabs.h"
# 1 "/home/mzorgati/gcc_build/gcc/insn-codes.h" 1






enum insn_code {
  CODE_FOR_movqi = 0,
  CODE_FOR_movhi = 1,
  CODE_FOR_movsi = 2,
  CODE_FOR_movsf = 3,
  CODE_FOR_addhi3 = 5,
  CODE_FOR_addsi3 = 6,
  CODE_FOR_subqi3 = 9,
  CODE_FOR_subhi3 = 10,
  CODE_FOR_subsi3 = 11,
  CODE_FOR_negqi2 = 14,
  CODE_FOR_neghi2 = 15,
  CODE_FOR_negsi2 = 16,
  CODE_FOR_negsf2 = 17,
  CODE_FOR_mulqi3 = 18,
  CODE_FOR_one_cmplqi2 = 54,
  CODE_FOR_one_cmplhi2 = 55,
  CODE_FOR_one_cmplsi2 = 56,
  CODE_FOR_ashlqi3 = 57,
  CODE_FOR_ashrqi3 = 62,
  CODE_FOR_lshrqi3 = 67,
  CODE_FOR_cmpqi = 72,
  CODE_FOR_tsthi = 73,
  CODE_FOR_cmphi = 74,
  CODE_FOR_tstsi = 75,
  CODE_FOR_cmpsi = 76,
  CODE_FOR_tstsf = 77,
  CODE_FOR_extendqihi2 = 94,
  CODE_FOR_extendqisi2 = 95,
  CODE_FOR_extendhisi2 = 96,
  CODE_FOR_zero_extendqihi2 = 97,
  CODE_FOR_zero_extendqisi2 = 98,
  CODE_FOR_zero_extendhisi2 = 99,
  CODE_FOR_nop = 112,
  CODE_FOR_jump = 113,
  CODE_FOR_addqi3 = 119,
  CODE_FOR_addsf3 = 120,
  CODE_FOR_subsf3 = 121,
  CODE_FOR_mulqihi3 = 122,
  CODE_FOR_umulqihi3 = 123,
  CODE_FOR_mulhi3 = 124,
  CODE_FOR_mulhisi3 = 125,
  CODE_FOR_umulhisi3 = 126,
  CODE_FOR_mulsi3 = 127,
  CODE_FOR_mulsf3 = 128,
  CODE_FOR_divmodqi4 = 129,
  CODE_FOR_udivmodqi4 = 130,
  CODE_FOR_divmodhi4 = 131,
  CODE_FOR_udivmodhi4 = 132,
  CODE_FOR_divmodsi4 = 133,
  CODE_FOR_udivmodsi4 = 134,
  CODE_FOR_divsf3 = 135,
  CODE_FOR_andqi3 = 136,
  CODE_FOR_andhi3 = 137,
  CODE_FOR_andsi3 = 138,
  CODE_FOR_iorqi3 = 139,
  CODE_FOR_iorhi3 = 140,
  CODE_FOR_iorsi3 = 141,
  CODE_FOR_xorqi3 = 142,
  CODE_FOR_xorhi3 = 143,
  CODE_FOR_xorsi3 = 144,
  CODE_FOR_ashlhi3 = 145,
  CODE_FOR_ashlsi3 = 146,
  CODE_FOR_ashrhi3 = 147,
  CODE_FOR_ashrsi3 = 148,
  CODE_FOR_lshrhi3 = 149,
  CODE_FOR_lshrsi3 = 150,
  CODE_FOR_cmpsf = 151,
  CODE_FOR_floatunsqisf2 = 152,
  CODE_FOR_floathisf2 = 153,
  CODE_FOR_floatunshisf2 = 154,
  CODE_FOR_floatsisf2 = 155,
  CODE_FOR_floatunssisf2 = 156,
  CODE_FOR_ble = 157,
  CODE_FOR_bge = 158,
  CODE_FOR_blt = 159,
  CODE_FOR_bgt = 160,
  CODE_FOR_bleu = 161,
  CODE_FOR_bgeu = 162,
  CODE_FOR_bltu = 163,
  CODE_FOR_bgtu = 164,
  CODE_FOR_beq = 165,
  CODE_FOR_bne = 166,
  CODE_FOR_call = 167,
  CODE_FOR_call_value = 168,
  CODE_FOR_movstrqi = 169,
  CODE_FOR_movstrhi = 170,
  CODE_FOR_indirect_jump = 171,
  CODE_FOR_tablejump = 172,
  CODE_FOR_nothing
};
# 25 "/home/mzorgati/gcc-4.4.0/gcc/optabs.h" 2
# 42 "/home/mzorgati/gcc-4.4.0/gcc/optabs.h"
struct optab_handlers
{
  enum insn_code insn_code;
};

struct optab
{
  enum rtx_code code;
  const char *libcall_basename;
  char libcall_suffix;
  void (*libcall_gen)(struct optab *, const char *name, char suffix, enum machine_mode);
  struct optab_handlers handlers[NUM_MACHINE_MODES];
};
typedef struct optab * optab;




struct convert_optab
{
  enum rtx_code code;
  const char *libcall_basename;
  void (*libcall_gen)(struct convert_optab *, const char *name,
        enum machine_mode,
        enum machine_mode);
  struct optab_handlers handlers[NUM_MACHINE_MODES][NUM_MACHINE_MODES];
};
typedef struct convert_optab *convert_optab;






enum optab_index
{

  OTI_ssadd,
  OTI_usadd,
  OTI_sssub,
  OTI_ussub,
  OTI_ssmul,
  OTI_usmul,
  OTI_ssdiv,
  OTI_usdiv,
  OTI_ssneg,
  OTI_usneg,
  OTI_ssashl,
  OTI_usashl,

  OTI_add,
  OTI_addv,
  OTI_sub,
  OTI_subv,


  OTI_smul,
  OTI_smulv,

  OTI_smul_highpart,
  OTI_umul_highpart,

  OTI_smul_widen,
  OTI_umul_widen,

  OTI_usmul_widen,


  OTI_smadd_widen,


  OTI_umadd_widen,



  OTI_ssmadd_widen,



  OTI_usmadd_widen,


  OTI_smsub_widen,


  OTI_umsub_widen,



  OTI_ssmsub_widen,



  OTI_usmsub_widen,


  OTI_sdiv,
  OTI_sdivv,

  OTI_sdivmod,
  OTI_udiv,
  OTI_udivmod,

  OTI_smod,
  OTI_umod,

  OTI_fmod,
  OTI_remainder,

  OTI_ftrunc,


  OTI_and,

  OTI_ior,

  OTI_xor,


  OTI_ashl,

  OTI_lshr,

  OTI_ashr,

  OTI_rotl,

  OTI_rotr,


  OTI_vashl,

  OTI_vlshr,

  OTI_vashr,

  OTI_vrotl,

  OTI_vrotr,


  OTI_smin,

  OTI_smax,

  OTI_umin,

  OTI_umax,

  OTI_pow,

  OTI_atan2,


  OTI_mov,

  OTI_movstrict,

  OTI_movmisalign,

  OTI_storent,



  OTI_neg,
  OTI_negv,

  OTI_abs,
  OTI_absv,

  OTI_bswap,

  OTI_one_cmpl,

  OTI_ffs,
  OTI_clz,
  OTI_ctz,
  OTI_popcount,
  OTI_parity,

  OTI_sqrt,

  OTI_sincos,

  OTI_sin,

  OTI_asin,

  OTI_cos,

  OTI_acos,

  OTI_exp,

  OTI_exp10,

  OTI_exp2,

  OTI_expm1,

  OTI_ldexp,

  OTI_scalb,

  OTI_logb,
  OTI_ilogb,

  OTI_log,

  OTI_log10,

  OTI_log2,

  OTI_log1p,

  OTI_floor,
  OTI_ceil,
  OTI_btrunc,
  OTI_round,
  OTI_nearbyint,
  OTI_rint,

  OTI_tan,

  OTI_atan,

  OTI_copysign,

  OTI_signbit,

  OTI_isinf,


  OTI_cmp,

  OTI_ucmp,

  OTI_tst,


  OTI_eq,
  OTI_ne,
  OTI_gt,
  OTI_ge,
  OTI_lt,
  OTI_le,
  OTI_unord,


  OTI_strlen,


  OTI_cbranch,
  OTI_cmov,
  OTI_cstore,


  OTI_push,


  OTI_addcc,


  OTI_reduc_smax,
  OTI_reduc_umax,
  OTI_reduc_smin,
  OTI_reduc_umin,
  OTI_reduc_splus,
  OTI_reduc_uplus,


  OTI_ssum_widen,
  OTI_usum_widen,


  OTI_sdot_prod,
  OTI_udot_prod,


  OTI_vec_set,

  OTI_vec_extract,

  OTI_vec_extract_even,
  OTI_vec_extract_odd,

  OTI_vec_interleave_high,
  OTI_vec_interleave_low,

  OTI_vec_init,

  OTI_vec_shl,
  OTI_vec_shr,

  OTI_vec_realign_load,


  OTI_vec_widen_umult_hi,
  OTI_vec_widen_umult_lo,
  OTI_vec_widen_smult_hi,
  OTI_vec_widen_smult_lo,


  OTI_vec_unpacks_hi,
  OTI_vec_unpacks_lo,


  OTI_vec_unpacku_hi,
  OTI_vec_unpacku_lo,



  OTI_vec_unpacks_float_hi,
  OTI_vec_unpacks_float_lo,
  OTI_vec_unpacku_float_hi,
  OTI_vec_unpacku_float_lo,


  OTI_vec_pack_trunc,
  OTI_vec_pack_usat,
  OTI_vec_pack_ssat,



  OTI_vec_pack_sfix_trunc,
  OTI_vec_pack_ufix_trunc,


  OTI_powi,

  OTI_MAX
};

extern struct optab optab_table[OTI_MAX];
# 548 "/home/mzorgati/gcc-4.4.0/gcc/optabs.h"
enum convert_optab_index
{
  COI_sext,
  COI_zext,
  COI_trunc,

  COI_sfix,
  COI_ufix,

  COI_sfixtrunc,
  COI_ufixtrunc,

  COI_sfloat,
  COI_ufloat,

  COI_lrint,
  COI_lround,
  COI_lfloor,
  COI_lceil,

  COI_fract,
  COI_fractuns,
  COI_satfract,
  COI_satfractuns,

  COI_MAX
};

extern struct convert_optab convert_optab_table[COI_MAX];
# 599 "/home/mzorgati/gcc-4.4.0/gcc/optabs.h"
extern enum insn_code reload_in_optab[NUM_MACHINE_MODES];
extern enum insn_code reload_out_optab[NUM_MACHINE_MODES];


extern optab code_to_optab[((int) LAST_AND_UNUSED_RTX_CODE) + 1];


typedef rtx (*rtxfun) (rtx);




extern rtxfun bcc_gen_fctn[((int) LAST_AND_UNUSED_RTX_CODE)];





extern enum insn_code setcc_gen_code[((int) LAST_AND_UNUSED_RTX_CODE)];
# 629 "/home/mzorgati/gcc-4.4.0/gcc/optabs.h"
extern enum insn_code vcond_gen_code[NUM_MACHINE_MODES];
extern enum insn_code vcondu_gen_code[NUM_MACHINE_MODES];


extern enum insn_code movmem_optab[NUM_MACHINE_MODES];


extern enum insn_code setmem_optab[NUM_MACHINE_MODES];



extern enum insn_code cmpstr_optab[NUM_MACHINE_MODES];
extern enum insn_code cmpstrn_optab[NUM_MACHINE_MODES];
extern enum insn_code cmpmem_optab[NUM_MACHINE_MODES];



extern enum insn_code sync_add_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_sub_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_ior_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_and_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_xor_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_nand_optab[NUM_MACHINE_MODES];



extern enum insn_code sync_old_add_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_old_sub_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_old_ior_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_old_and_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_old_xor_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_old_nand_optab[NUM_MACHINE_MODES];



extern enum insn_code sync_new_add_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_new_sub_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_new_ior_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_new_and_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_new_xor_optab[NUM_MACHINE_MODES];
extern enum insn_code sync_new_nand_optab[NUM_MACHINE_MODES];


extern enum insn_code sync_compare_and_swap[NUM_MACHINE_MODES];
extern enum insn_code sync_compare_and_swap_cc[NUM_MACHINE_MODES];


extern enum insn_code sync_lock_test_and_set[NUM_MACHINE_MODES];


extern enum insn_code sync_lock_release[NUM_MACHINE_MODES];



extern rtx expand_widen_pattern_expr (tree exp, rtx op0, rtx op1, rtx wide_op,
                                      rtx target, int unsignedp);

extern rtx expand_ternary_op (enum machine_mode mode, optab ternary_optab,
         rtx op0, rtx op1, rtx op2, rtx target,
         int unsignedp);


extern rtx expand_binop (enum machine_mode, optab, rtx, rtx, rtx, int,
    enum optab_methods);

extern unsigned char force_expand_binop (enum machine_mode, optab, rtx, rtx, rtx, int,
    enum optab_methods);


extern rtx sign_expand_binop (enum machine_mode, optab, optab, rtx, rtx,
         rtx, int, enum optab_methods);


extern int expand_twoval_unop (optab, rtx, rtx, rtx, int);


extern int expand_twoval_binop (optab, rtx, rtx, rtx, rtx, int);



extern unsigned char expand_twoval_binop_libfunc (optab, rtx, rtx, rtx, rtx,
      enum rtx_code);


extern rtx expand_unop (enum machine_mode, optab, rtx, rtx, int);


extern rtx expand_abs_nojump (enum machine_mode, rtx, rtx, int);
extern rtx expand_abs (enum machine_mode, rtx, rtx, int, int);


extern rtx expand_copysign (rtx, rtx, rtx);



extern void emit_unop_insn (int, rtx, rtx, enum rtx_code);
extern unsigned char maybe_emit_unop_insn (int, rtx, rtx, enum rtx_code);


extern void emit_cmp_insn (rtx, rtx, enum rtx_code, rtx, enum machine_mode,
      int);




enum optab_subtype
{
  optab_default,
  optab_scalar,
  optab_vector
};




extern optab optab_for_tree_code (enum tree_code, const_tree, enum optab_subtype);



enum can_compare_purpose
{
  ccp_jump,
  ccp_cmov,
  ccp_store_flag
};



extern int can_compare_p (enum rtx_code, enum machine_mode,
     enum can_compare_purpose);


extern enum insn_code can_extend_p (enum machine_mode, enum machine_mode, int);



extern rtx gen_extend_insn (rtx, rtx, enum machine_mode,
       enum machine_mode, int);


extern void set_optab_libfunc (optab, enum machine_mode, const char *);
extern void set_conv_libfunc (convert_optab, enum machine_mode,
         enum machine_mode, const char *);


extern void expand_fixed_convert (rtx, rtx, int, int);


extern void expand_float (rtx, rtx, int);


extern void expand_fix (rtx, rtx, int);


extern unsigned char expand_sfix_optab (rtx, rtx, convert_optab);


unsigned char expand_vec_cond_expr_p (tree, enum machine_mode);


extern rtx expand_vec_cond_expr (tree, rtx);


extern rtx expand_vec_shift_expr (tree, rtx);





extern rtx optab_libfunc (optab optab, enum machine_mode mode);
extern rtx optab_libfunc (optab optab, enum machine_mode mode);
extern rtx convert_optab_libfunc (convert_optab optab, enum machine_mode mode1,
             enum machine_mode mode2);
# 60 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/toplev.h" 1
# 30 "/home/mzorgati/gcc-4.4.0/gcc/toplev.h"
extern int toplev_main (unsigned int, const char **);
extern int read_integral_parameter (const char *, const char *, const int);
extern void strip_off_ending (char *, int);
extern const char *trim_filename (const char *);
extern void _fatal_insn_not_found (const_rtx, const char *, int, const char *)
     __attribute__ ((__noreturn__));
extern void _fatal_insn (const char *, const_rtx, const char *, int, const char *)
     __attribute__ ((__noreturn__));
# 57 "/home/mzorgati/gcc-4.4.0/gcc/toplev.h"
extern void internal_error (const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 1, 2))) __attribute__ ((__nonnull__ (1)))
     __attribute__ ((__noreturn__));

extern unsigned char warning (int, const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 2, 3))) __attribute__ ((__nonnull__ (2)));
extern unsigned char warning_at (location_t, int, const char *, ...)
    __attribute__ ((__format__ (__gcc_tdiag__, 3, 4))) __attribute__ ((__nonnull__ (3)));
extern void error (const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 1, 2))) __attribute__ ((__nonnull__ (1)));
extern void error_at (location_t, const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 2, 3))) __attribute__ ((__nonnull__ (2)));
extern void fatal_error (const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 1, 2))) __attribute__ ((__nonnull__ (1)))
     __attribute__ ((__noreturn__));

extern unsigned char pedwarn (location_t, int, const char *, ...)
     __attribute__ ((__format__ (__gcc_tdiag__, 3, 4))) __attribute__ ((__nonnull__ (3)));
extern unsigned char permerror (location_t, const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 2, 3))) __attribute__ ((__nonnull__ (2)));
extern void sorry (const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 1, 2))) __attribute__ ((__nonnull__ (1)));
extern void inform (location_t, const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 2, 3))) __attribute__ ((__nonnull__ (2)));
extern void verbatim (const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 1, 2))) __attribute__ ((__nonnull__ (1)));

extern void rest_of_decl_compilation (tree, int, int);
extern void rest_of_type_compilation (tree, int);
extern void tree_rest_of_compilation (tree);
extern void init_optimization_passes (void);
extern void finish_optimization_passes (void);
extern unsigned char enable_rtl_dump_file (void);

extern void announce_function (tree);

extern void error_for_asm (const_rtx, const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 2, 3))) __attribute__ ((__nonnull__ (2)));
extern void warning_for_asm (const_rtx, const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 2, 3))) __attribute__ ((__nonnull__ (2)));
extern void warn_deprecated_use (tree);
extern unsigned char parse_optimize_options (tree, unsigned char);


extern void output_quoted_string (FILE *, const char *);
extern void output_file_directive (FILE *, const char *);





extern void fnotice (FILE *, const char *, ...)
     __attribute__ ((__format__ (__printf__, 2, 3))) __attribute__ ((__nonnull__ (2)));


extern void wrapup_global_declaration_1 (tree);
extern unsigned char wrapup_global_declaration_2 (tree);
extern unsigned char wrapup_global_declarations (tree *, int);
extern void check_global_declaration_1 (tree);
extern void check_global_declarations (tree *, int);
extern void emit_debug_global_declarations (tree *, int);
extern void write_global_declarations (void);

extern void dump_memory_report (unsigned char);

extern void target_reinit (void);


extern unsigned local_tick;

extern const char *progname;
extern const char *dump_base_name;
extern const char *aux_base_name;
extern const char *aux_info_file_name;
extern const char *profile_data_prefix;
extern const char *asm_file_name;
extern unsigned char exit_after_options;




extern unsigned char user_defined_section_attribute;


extern int flag_crossjumping;
extern int flag_if_conversion;
extern int flag_if_conversion2;
extern int flag_keep_static_consts;
extern int flag_peel_loops;
extern int flag_rerun_cse_after_loop;
extern int flag_thread_jumps;
extern int flag_tracer;
extern int flag_unroll_loops;
extern int flag_unroll_all_loops;
extern int flag_unswitch_loops;
extern int flag_cprop_registers;
extern int time_report;
extern int flag_ira_coalesce;
extern int flag_ira_move_spills;
extern int flag_ira_share_save_slots;
extern int flag_ira_share_spill_slots;


extern void print_version (FILE *, const char *);
extern void * default_get_pch_validity (size_t *);
extern const char * default_pch_valid_p (const void *, size_t);


extern struct ht *ident_hash;




extern void set_fast_math_flags (int);

extern void set_unsafe_math_optimizations_flags (int);


extern void decode_d_option (const char *);


extern unsigned char fast_math_flags_set_p (void);
extern unsigned char fast_math_flags_struct_set_p (struct cl_optimization *);


extern int exact_log2 (unsigned long);


extern int floor_log2 (unsigned long);
# 189 "/home/mzorgati/gcc-4.4.0/gcc/toplev.h"
extern __inline__ int
floor_log2 (unsigned long x)
{
  return x ? (8 * 4) - 1 - (int) __builtin_clzl (x) : -1;
}

extern __inline__ int
exact_log2 (unsigned long x)
{
  return x == (x & -x) && x ? (int) __builtin_ctzl (x) : -1;
}





extern const char *get_src_pwd (void);
extern unsigned char set_src_pwd (const char *);



extern const char *get_random_seed (unsigned char);
extern const char *set_random_seed (const char *);
# 61 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/c-pragma.h" 1
# 24 "/home/mzorgati/gcc-4.4.0/gcc/c-pragma.h"
# 1 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h" 1
# 28 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
# 1 "/home/mzorgati/gcc-4.4.0/libcpp/include/symtab.h" 1
# 29 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/libcpp/include/line-map.h" 1
# 30 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h" 2





typedef struct cpp_reader cpp_reader;
typedef struct cpp_buffer cpp_buffer;
typedef struct cpp_options cpp_options;
typedef struct cpp_token cpp_token;
typedef struct cpp_string cpp_string;
typedef struct cpp_hashnode cpp_hashnode;
typedef struct cpp_macro cpp_macro;
typedef struct cpp_callbacks cpp_callbacks;
typedef struct cpp_dir cpp_dir;

struct answer;
struct _cpp_file;
# 146 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
enum cpp_ttype
{
  CPP_EQ, CPP_NOT, CPP_GREATER, CPP_LESS, CPP_PLUS, CPP_MINUS, CPP_MULT, CPP_DIV, CPP_MOD, CPP_AND, CPP_OR, CPP_XOR, CPP_RSHIFT, CPP_LSHIFT, CPP_COMPL, CPP_AND_AND, CPP_OR_OR, CPP_QUERY, CPP_COLON, CPP_COMMA, CPP_OPEN_PAREN, CPP_CLOSE_PAREN, CPP_EOF, CPP_EQ_EQ, CPP_NOT_EQ, CPP_GREATER_EQ, CPP_LESS_EQ, CPP_PLUS_EQ, CPP_MINUS_EQ, CPP_MULT_EQ, CPP_DIV_EQ, CPP_MOD_EQ, CPP_AND_EQ, CPP_OR_EQ, CPP_XOR_EQ, CPP_RSHIFT_EQ, CPP_LSHIFT_EQ, CPP_HASH, CPP_PASTE, CPP_OPEN_SQUARE, CPP_CLOSE_SQUARE, CPP_OPEN_BRACE, CPP_CLOSE_BRACE, CPP_SEMICOLON, CPP_ELLIPSIS, CPP_PLUS_PLUS, CPP_MINUS_MINUS, CPP_DEREF, CPP_DOT, CPP_SCOPE, CPP_DEREF_STAR, CPP_DOT_STAR, CPP_ATSIGN, CPP_NAME, CPP_AT_NAME, CPP_NUMBER, CPP_CHAR, CPP_WCHAR, CPP_CHAR16, CPP_CHAR32, CPP_OTHER, CPP_STRING, CPP_WSTRING, CPP_STRING16, CPP_STRING32, CPP_OBJC_STRING, CPP_HEADER_NAME, CPP_COMMENT, CPP_MACRO_ARG, CPP_PRAGMA, CPP_PRAGMA_EOL, CPP_PADDING,
  N_TTYPES,


  CPP_LAST_EQ = CPP_LSHIFT,
  CPP_FIRST_DIGRAPH = CPP_HASH,
  CPP_LAST_PUNCTUATOR= CPP_ATSIGN,
  CPP_LAST_CPP_OP = CPP_LESS_EQ
};




enum c_lang {CLK_GNUC89 = 0, CLK_GNUC99, CLK_STDC89, CLK_STDC94, CLK_STDC99,
      CLK_GNUCXX, CLK_CXX98, CLK_GNUCXX0X, CLK_CXX0X, CLK_ASM};


struct cpp_string
{
  unsigned int len;
  const unsigned char *text;
};
# 184 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
enum cpp_token_fld_kind {
  CPP_TOKEN_FLD_NODE,
  CPP_TOKEN_FLD_SOURCE,
  CPP_TOKEN_FLD_STR,
  CPP_TOKEN_FLD_ARG_NO,
  CPP_TOKEN_FLD_PRAGMA,
  CPP_TOKEN_FLD_NONE
};



struct cpp_token
{
  source_location src_loc;
  __extension__ enum cpp_ttype type : 8;
  unsigned char flags;

  union cpp_token_u
  {

    cpp_hashnode *
     



  node;


    cpp_token * source;


    struct cpp_string str;


    unsigned int arg_no;


    unsigned int pragma;
  } val;
};


extern enum cpp_token_fld_kind cpp_token_val_index (cpp_token *tok);
# 243 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
typedef unsigned int cppchar_t;
typedef int cppchar_signed_t;


enum cpp_deps_style { DEPS_NONE = 0, DEPS_USER, DEPS_SYSTEM };


enum cpp_normalize_level {

  normalized_KC = 0,

  normalized_C,


  normalized_identifier_C,

  normalized_none
};



struct cpp_options
{

  unsigned int tabstop;


  enum c_lang lang;


  unsigned char cplusplus;


  unsigned char cplusplus_comments;




  unsigned char objc;


  unsigned char discard_comments;



  unsigned char discard_comments_in_macro_exp;


  unsigned char trigraphs;


  unsigned char digraphs;


  unsigned char extended_numbers;


  unsigned char uliterals;


  unsigned char print_include_names;


  unsigned char pedantic_errors;


  unsigned char inhibit_warnings;


  unsigned char warn_deprecated;


  unsigned char warn_system_headers;



  unsigned char inhibit_errors;


  unsigned char warn_comments;



  unsigned char warn_missing_include_dirs;


  unsigned char warn_trigraphs;


  unsigned char warn_multichar;



  unsigned char warn_traditional;


  unsigned char warn_long_long;


  unsigned char warn_endif_labels;



  unsigned char warn_num_sign_change;



  unsigned char warn_variadic_macros;



  unsigned char warn_builtin_macro_redefined;


  unsigned char warnings_are_errors;



  unsigned char remap;


  unsigned char dollars_in_ident;


  unsigned char extended_identifiers;



  unsigned char warn_dollars;


  unsigned char warn_undef;


  unsigned char warn_unused_macros;


  unsigned char c99;


  unsigned char std;


  unsigned char pedantic;



  unsigned char preprocessed;


  unsigned char show_column;


  unsigned char operator_names;


  unsigned char traditional;


  const char *narrow_charset;


  const char *wide_charset;


  const char *input_charset;



  enum cpp_normalize_level warn_normalize;


  unsigned char warn_invalid_pch;


  unsigned char restore_pch_deps;


  struct
  {

    enum cpp_deps_style style;


    unsigned char missing_files;



    unsigned char phony_targets;


    unsigned char ignore_main_file;
  } deps;





  size_t precision, char_precision, int_precision, wchar_precision;


  unsigned char unsigned_char, unsigned_wchar;



  unsigned char bytes_big_endian;


  unsigned char stdc_0_in_system_headers;


  unsigned char client_diagnostic;


  unsigned char directives_only;
};







typedef const char *(*missing_header_cb)(cpp_reader *, const char *header, cpp_dir **);


struct cpp_callbacks
{

  void (*line_change) (cpp_reader *, const cpp_token *, int);





  void (*file_change) (cpp_reader *, const struct line_map *);

  void (*dir_change) (cpp_reader *, const char *);
  void (*include) (cpp_reader *, unsigned int, const unsigned char *,
     const char *, int, const cpp_token **);
  void (*define) (cpp_reader *, unsigned int, cpp_hashnode *);
  void (*undef) (cpp_reader *, unsigned int, cpp_hashnode *);
  void (*ident) (cpp_reader *, unsigned int, const cpp_string *);
  void (*def_pragma) (cpp_reader *, unsigned int);
  int (*valid_pch) (cpp_reader *, const char *, int);
  void (*read_pch) (cpp_reader *, const char *, int, const char *);
  missing_header_cb missing_header;



  cpp_hashnode * (*macro_to_expand) (cpp_reader *, const cpp_token *);



  void (*error) (cpp_reader *, int, const char *, va_list *)
       __attribute__ ((__format__ (__printf__, 3, 0))) __attribute__ ((__nonnull__ (3)));



  void (*used_define) (cpp_reader *, unsigned int, cpp_hashnode *);
  void (*used_undef) (cpp_reader *, unsigned int, cpp_hashnode *);


  void (*before_define) (cpp_reader *);
};


struct cpp_dir
{

  struct cpp_dir *next;


  char *name;
  unsigned int len;



  unsigned char sysp;


  unsigned char user_supplied_p;



  char *canonical_name;



  const char **name_map;





  char *(*construct) (const char *header, cpp_dir *dir);



  ino_t ino;
  dev_t dev;
};


extern const char *progname;
# 572 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
enum node_type
{
  NT_VOID = 0,
  NT_MACRO,
  NT_ASSERTION
};



enum builtin_type
{
  BT_SPECLINE = 0,
  BT_DATE,
  BT_FILE,
  BT_BASE_FILE,
  BT_INCLUDE_LEVEL,
  BT_TIME,
  BT_STDC,
  BT_PRAGMA,
  BT_TIMESTAMP,
  BT_COUNTER
};
# 602 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
enum {
  NTV_MACRO,
  NTV_ANSWER,
  NTV_BUILTIN,
  NTV_ARGUMENT,
  NTV_NONE
};
# 621 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
union _cpp_hashnode_value
{

  cpp_macro * macro;

  struct answer * answers;

  enum builtin_type builtin;

  unsigned short arg_index;
};

struct cpp_hashnode
{
  struct ht_identifier ident;
  unsigned int is_directive : 1;
  unsigned int directive_index : 7;


  unsigned char rid_code;
  __extension__ enum node_type type : 7;
  unsigned int flags : 9;

  union _cpp_hashnode_value value;
};







extern cpp_reader *cpp_create_reader (enum c_lang, struct ht *,
          struct line_maps *);



extern void cpp_set_line_map (cpp_reader *, struct line_maps *);



extern void cpp_set_lang (cpp_reader *, enum c_lang);


extern void cpp_set_include_chains (cpp_reader *, cpp_dir *, cpp_dir *, int);






extern cpp_options *cpp_get_options (cpp_reader *);
extern cpp_callbacks *cpp_get_callbacks (cpp_reader *);
extern void cpp_set_callbacks (cpp_reader *, cpp_callbacks *);
extern struct deps *cpp_get_deps (cpp_reader *);






extern const char *cpp_read_main_file (cpp_reader *, const char *);



extern void cpp_init_special_builtins (cpp_reader *);


extern void cpp_init_builtins (cpp_reader *, int);



extern void cpp_post_options (cpp_reader *);


extern void cpp_init_iconv (cpp_reader *);






extern int cpp_finish (cpp_reader *, FILE *deps_stream);




extern void cpp_destroy (cpp_reader *);


extern unsigned int cpp_errors (cpp_reader *);

extern unsigned int cpp_token_len (const cpp_token *);
extern unsigned char *cpp_token_as_text (cpp_reader *, const cpp_token *);
extern unsigned char *cpp_spell_token (cpp_reader *, const cpp_token *,
           unsigned char *, unsigned char);
extern void cpp_register_pragma (cpp_reader *, const char *, const char *,
     void (*) (cpp_reader *), unsigned char);
extern void cpp_register_deferred_pragma (cpp_reader *, const char *,
       const char *, unsigned, unsigned char, unsigned char);
extern int cpp_avoid_paste (cpp_reader *, const cpp_token *,
       const cpp_token *);
extern const cpp_token *cpp_get_token (cpp_reader *);
extern const cpp_token *cpp_get_token_with_location (cpp_reader *,
           source_location *);
extern const unsigned char *cpp_macro_definition (cpp_reader *,
        const cpp_hashnode *);
extern void _cpp_backup_tokens (cpp_reader *, unsigned int);
extern const cpp_token *cpp_peek_token (cpp_reader *, int);


extern cppchar_t cpp_interpret_charconst (cpp_reader *, const cpp_token *,
       unsigned int *, int *);

extern unsigned char cpp_interpret_string (cpp_reader *,
      const cpp_string *, size_t,
      cpp_string *, enum cpp_ttype);
extern unsigned char cpp_interpret_string_notranslate (cpp_reader *,
           const cpp_string *, size_t,
           cpp_string *, enum cpp_ttype);


extern cppchar_t cpp_host_to_exec_charset (cpp_reader *, cppchar_t);



extern void cpp_define (cpp_reader *, const char *);
extern void cpp_define_formatted (cpp_reader *pfile,
      const char *fmt, ...) __attribute__ ((__format__ (__printf__, 2, 3))) __attribute__ ((__nonnull__ (2)));
extern void cpp_assert (cpp_reader *, const char *);
extern void cpp_undef (cpp_reader *, const char *);
extern void cpp_unassert (cpp_reader *, const char *);

extern cpp_macro *cpp_push_definition (cpp_reader *, const char *);
extern void cpp_pop_definition (cpp_reader *, const char *, cpp_macro *);


extern void cpp_undef_all (cpp_reader *);

extern cpp_buffer *cpp_push_buffer (cpp_reader *, const unsigned char *,
        size_t, int);
extern int cpp_defined (cpp_reader *, const unsigned char *, int);



typedef unsigned long cpp_num_part;
typedef struct cpp_num cpp_num;
struct cpp_num
{
  cpp_num_part high;
  cpp_num_part low;
  unsigned char unsignedp;
  unsigned char overflow;
};
# 813 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
extern unsigned cpp_classify_number (cpp_reader *, const cpp_token *);


extern cpp_num cpp_interpret_integer (cpp_reader *, const cpp_token *,
          unsigned int type);



cpp_num cpp_num_sign_extend (cpp_num, size_t);
# 845 "/home/mzorgati/gcc-4.4.0/libcpp/include/cpplib.h"
extern void cpp_error (cpp_reader *, int, const char *msgid, ...)
  __attribute__ ((__format__ (__printf__, 3, 4))) __attribute__ ((__nonnull__ (3)));



extern void cpp_errno (cpp_reader *, int, const char *msgid);




extern void cpp_error_with_line (cpp_reader *, int, source_location, unsigned,
     const char *msgid, ...) __attribute__ ((__format__ (__printf__, 5, 6))) __attribute__ ((__nonnull__ (5)));


extern int cpp_ideq (const cpp_token *, const char *);
extern void cpp_output_line (cpp_reader *, FILE *);
extern unsigned char *cpp_output_line_to_string (cpp_reader *,
       const unsigned char *);
extern void cpp_output_token (const cpp_token *, FILE *);
extern const char *cpp_type2name (enum cpp_ttype);





extern cppchar_t cpp_parse_escape (cpp_reader *, const unsigned char ** pstr,
       const unsigned char *limit, int wide);




typedef struct
{

  char *comment;


  source_location sloc;
} cpp_comment;



typedef struct
{

  cpp_comment *entries;


  int count;


  int allocated;
} cpp_comment_table;



extern cpp_comment_table *cpp_get_comments (cpp_reader *);





extern cpp_hashnode *cpp_lookup (cpp_reader *, const unsigned char *,
     unsigned int);

typedef int (*cpp_cb) (cpp_reader *, cpp_hashnode *, void *);
extern void cpp_forall_identifiers (cpp_reader *, cpp_cb, void *);


extern void cpp_scan_nooutput (cpp_reader *);
extern int cpp_sys_macro_p (cpp_reader *);
extern unsigned char *cpp_quote_string (unsigned char *, const unsigned char *,
     unsigned int);


extern unsigned char cpp_included (cpp_reader *, const char *);
extern unsigned char cpp_included_before (cpp_reader *, const char *, source_location);
extern void cpp_make_system_header (cpp_reader *, int, int);
extern unsigned char cpp_push_include (cpp_reader *, const char *);
extern void cpp_change_file (cpp_reader *, enum lc_reason, const char *);
extern const char *cpp_get_path (struct _cpp_file *);
extern cpp_dir *cpp_get_dir (struct _cpp_file *);
extern cpp_buffer *cpp_get_buffer (cpp_reader *);
extern struct _cpp_file *cpp_get_file (cpp_buffer *);
extern cpp_buffer *cpp_get_prev (cpp_buffer *);
extern void cpp_clear_file_cache (cpp_reader *);


struct save_macro_data;
extern int cpp_save_state (cpp_reader *, FILE *);
extern int cpp_write_pch_deps (cpp_reader *, FILE *);
extern int cpp_write_pch_state (cpp_reader *, FILE *);
extern int cpp_valid_state (cpp_reader *, const char *, int);
extern void cpp_prepare_state (cpp_reader *, struct save_macro_data **);
extern int cpp_read_state (cpp_reader *, const char *, FILE *,
      struct save_macro_data *);
# 25 "/home/mzorgati/gcc-4.4.0/gcc/c-pragma.h" 2



typedef enum pragma_kind {
  PRAGMA_NONE = 0,

  PRAGMA_OMP_ATOMIC,
  PRAGMA_OMP_BARRIER,
  PRAGMA_OMP_CRITICAL,
  PRAGMA_OMP_FLUSH,
  PRAGMA_OMP_FOR,
  PRAGMA_OMP_MASTER,
  PRAGMA_OMP_ORDERED,
  PRAGMA_OMP_PARALLEL,
  PRAGMA_OMP_PARALLEL_FOR,
  PRAGMA_OMP_PARALLEL_SECTIONS,
  PRAGMA_OMP_SECTION,
  PRAGMA_OMP_SECTIONS,
  PRAGMA_OMP_SINGLE,
  PRAGMA_OMP_TASK,
  PRAGMA_OMP_TASKWAIT,
  PRAGMA_OMP_THREADPRIVATE,

  PRAGMA_GCC_PCH_PREPROCESS,

  PRAGMA_FIRST_EXTERNAL
} pragma_kind;




typedef enum pragma_omp_clause {
  PRAGMA_OMP_CLAUSE_NONE = 0,

  PRAGMA_OMP_CLAUSE_COLLAPSE,
  PRAGMA_OMP_CLAUSE_COPYIN,
  PRAGMA_OMP_CLAUSE_COPYPRIVATE,
  PRAGMA_OMP_CLAUSE_DEFAULT,
  PRAGMA_OMP_CLAUSE_FIRSTPRIVATE,
  PRAGMA_OMP_CLAUSE_IF,
  PRAGMA_OMP_CLAUSE_LASTPRIVATE,
  PRAGMA_OMP_CLAUSE_NOWAIT,
  PRAGMA_OMP_CLAUSE_NUM_THREADS,
  PRAGMA_OMP_CLAUSE_ORDERED,
  PRAGMA_OMP_CLAUSE_PRIVATE,
  PRAGMA_OMP_CLAUSE_REDUCTION,
  PRAGMA_OMP_CLAUSE_SCHEDULE,
  PRAGMA_OMP_CLAUSE_SHARED,
  PRAGMA_OMP_CLAUSE_UNTIED
} pragma_omp_clause;

extern struct cpp_reader* parse_in;
# 98 "/home/mzorgati/gcc-4.4.0/gcc/c-pragma.h"
extern void push_visibility (const char *);
extern void pop_visibility (void);

extern void init_pragma (void);


typedef void (*pragma_handler)(struct cpp_reader *);
extern void c_register_pragma (const char *, const char *, pragma_handler);
extern void c_register_pragma_with_expansion (const char *, const char *,
           pragma_handler);
extern void c_invoke_pragma_handler (unsigned int);

extern void maybe_apply_pragma_weak (tree);
extern void maybe_apply_pending_pragma_weaks (void);
extern tree maybe_apply_renaming_pragma (tree, tree);
extern void add_to_renaming_pragma_list (tree, tree);

extern enum cpp_ttype pragma_lex (tree *);
# 128 "/home/mzorgati/gcc-4.4.0/gcc/c-pragma.h"
extern enum cpp_ttype c_lex_with_flags (tree *, location_t *, unsigned char *,
     int);

extern void c_pp_lookup_pragma (unsigned int, const char **, const char **);
# 62 "c816.c" 2
# 1 "/home/mzorgati/gcc_build/gcc/tm_p.h" 1
# 63 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/ggc.h" 1
# 29 "/home/mzorgati/gcc-4.4.0/gcc/ggc.h"
extern const char empty_string[];
extern const char digit_vector[];






typedef void (*gt_pointer_operator) (void *, void *);

# 1 "/home/mzorgati/gcc_build/gcc/gtype-desc.h" 1
# 23 "/home/mzorgati/gcc_build/gcc/gtype-desc.h"
enum gt_types_enum {
 gt_ggc_e_15interface_tuple,
 gt_ggc_e_16volatilized_type,
 gt_ggc_e_17string_descriptor,
 gt_ggc_e_7c_scope,
 gt_ggc_e_9c_binding,
 gt_ggc_e_8c_parser,
 gt_ggc_e_9imp_entry,
 gt_ggc_e_16hashed_attribute,
 gt_ggc_e_12hashed_entry,
 gt_ggc_e_14type_assertion,
 gt_ggc_e_18treetreehash_entry,
 gt_ggc_e_5CPool,
 gt_ggc_e_3JCF,
 gt_ggc_e_17module_htab_entry,
 gt_ggc_e_13binding_level,
 gt_ggc_e_9opt_stack,
 gt_ggc_e_16def_pragma_macro,
 gt_ggc_e_22def_pragma_macro_value,
 gt_ggc_e_11align_stack,
 gt_ggc_e_19VEC_const_char_p_gc,
 gt_ggc_e_21pending_abstract_type,
 gt_ggc_e_9cp_parser,
 gt_ggc_e_17cp_parser_context,
 gt_ggc_e_8cp_lexer,
 gt_ggc_e_10tree_check,
 gt_ggc_e_22VEC_deferred_access_gc,
 gt_ggc_e_16pending_template,
 gt_ggc_e_21named_label_use_entry,
 gt_ggc_e_28VEC_deferred_access_check_gc,
 gt_ggc_e_11tinst_level,
 gt_ggc_e_18sorted_fields_type,
 gt_ggc_e_18VEC_tree_pair_s_gc,
 gt_ggc_e_17named_label_entry,
 gt_ggc_e_14cp_token_cache,
 gt_ggc_e_11saved_scope,
 gt_ggc_e_16cxx_int_tree_map,
 gt_ggc_e_23VEC_cp_class_binding_gc,
 gt_ggc_e_24VEC_cxx_saved_binding_gc,
 gt_ggc_e_16cp_binding_level,
 gt_ggc_e_11cxx_binding,
 gt_ggc_e_15binding_entry_s,
 gt_ggc_e_15binding_table_s,
 gt_ggc_e_14VEC_tinfo_s_gc,
 gt_ggc_e_18gnat_binding_level,
 gt_ggc_e_9elab_info,
 gt_ggc_e_10stmt_group,
 gt_ggc_e_16VEC_parm_attr_gc,
 gt_ggc_e_9parm_attr,
 gt_ggc_e_20ssa_operand_memory_d,
 gt_ggc_e_13scev_info_str,
 gt_ggc_e_13VEC_gimple_gc,
 gt_ggc_e_17VEC_alias_pair_gc,
 gt_ggc_e_24constant_descriptor_tree,
 gt_ggc_e_9type_hash,
 gt_ggc_e_16string_pool_data,
 gt_ggc_e_13libfunc_entry,
 gt_ggc_e_23temp_slot_address_entry,
 gt_ggc_e_15throw_stmt_node,
 gt_ggc_e_16VEC_eh_region_gc,
 gt_ggc_e_9eh_region,
 gt_ggc_e_16var_loc_list_def,
 gt_ggc_e_12var_loc_node,
 gt_ggc_e_16limbo_die_struct,
 gt_ggc_e_20VEC_pubname_entry_gc,
 gt_ggc_e_19VEC_dw_attr_node_gc,
 gt_ggc_e_25dw_ranges_by_label_struct,
 gt_ggc_e_16dw_ranges_struct,
 gt_ggc_e_28dw_separate_line_info_struct,
 gt_ggc_e_19dw_line_info_struct,
 gt_ggc_e_25VEC_deferred_locations_gc,
 gt_ggc_e_18dw_loc_list_struct,
 gt_ggc_e_15dwarf_file_data,
 gt_ggc_e_15queued_reg_save,
 gt_ggc_e_20indirect_string_node,
 gt_ggc_e_19dw_loc_descr_struct,
 gt_ggc_e_13dw_fde_struct,
 gt_ggc_e_13dw_cfi_struct,
 gt_ggc_e_8typeinfo,
 gt_ggc_e_22VEC_alias_set_entry_gc,
 gt_ggc_e_15alias_set_entry,
 gt_ggc_e_15cgraph_asm_node,
 gt_ggc_e_12varpool_node,
 gt_ggc_e_11cgraph_edge,
 gt_ggc_e_11cgraph_node,
 gt_ggc_e_18VEC_basic_block_gc,
 gt_ggc_e_14gimple_bb_info,
 gt_ggc_e_11rtl_bb_info,
 gt_ggc_e_11VEC_edge_gc,
 gt_ggc_e_17cselib_val_struct,
 gt_ggc_e_12elt_loc_list,
 gt_ggc_e_13VEC_loop_p_gc,
 gt_ggc_e_4loop,
 gt_ggc_e_9loop_exit,
 gt_ggc_e_13nb_iter_bound,
 gt_ggc_e_17language_function,
 gt_ggc_e_5loops,
 gt_ggc_e_18control_flow_graph,
 gt_ggc_e_9eh_status,
 gt_ggc_e_20initial_value_struct,
 gt_ggc_e_17rtx_constant_pool,
 gt_ggc_e_18VEC_temp_slot_p_gc,
 gt_ggc_e_9temp_slot,
 gt_ggc_e_9gimple_df,
 gt_ggc_e_13ehl_map_entry,
 gt_ggc_e_23VEC_call_site_record_gc,
 gt_ggc_e_16call_site_record,
 gt_ggc_e_14sequence_stack,
 gt_ggc_e_8edge_def,
 gt_ggc_e_8elt_list,
 gt_ggc_e_17tree_priority_map,
 gt_ggc_e_12tree_int_map,
 gt_ggc_e_8tree_map,
 gt_ggc_e_14lang_tree_node,
 gt_ggc_e_24tree_statement_list_node,
 gt_ggc_e_9lang_decl,
 gt_ggc_e_9lang_type,
 gt_ggc_e_10die_struct,
 gt_ggc_e_15varray_head_tag,
 gt_ggc_e_12ptr_info_def,
 gt_ggc_e_22VEC_constructor_elt_gc,
 gt_ggc_e_10tree_ann_d,
 gt_ggc_e_11VEC_tree_gc,
 gt_ggc_e_8function,
 gt_ggc_e_23constant_descriptor_rtx,
 gt_ggc_e_15basic_block_def,
 gt_ggc_e_11fixed_value,
 gt_ggc_e_10real_value,
 gt_ggc_e_10VEC_rtx_gc,
 gt_ggc_e_12object_block,
 gt_ggc_e_9reg_attrs,
 gt_ggc_e_9mem_attrs,
 gt_ggc_e_14bitmap_obstack,
 gt_ggc_e_18bitmap_element_def,
 gt_ggc_e_17gimple_seq_node_d,
 gt_ggc_e_12gimple_seq_d,
 gt_ggc_e_7section,
 gt_ggc_e_18gimple_statement_d,
 gt_ggc_e_9rtvec_def,
 gt_ggc_e_7rtx_def,
 gt_ggc_e_15bitmap_head_def,
 gt_ggc_e_9tree_node,
 gt_ggc_e_6answer,
 gt_ggc_e_9cpp_macro,
 gt_ggc_e_9cpp_token,
 gt_ggc_e_9line_maps,
 gt_e_II17splay_tree_node_s,
 gt_e_SP9tree_node17splay_tree_node_s,
 gt_e_P9tree_nodeP9tree_node17splay_tree_node_s,
 gt_e_IP9tree_node17splay_tree_node_s,
 gt_e_P15interface_tuple4htab,
 gt_e_P16volatilized_type4htab,
 gt_e_P17string_descriptor4htab,
 gt_e_P14type_assertion4htab,
 gt_e_P18treetreehash_entry4htab,
 gt_e_P17module_htab_entry4htab,
 gt_e_P16def_pragma_macro4htab,
 gt_e_P21pending_abstract_type4htab,
 gt_e_P16cxx_int_tree_map4htab,
 gt_e_P17named_label_entry4htab,
 gt_e_P12tree_int_map4htab,
 gt_e_IP9tree_node12splay_tree_s,
 gt_e_P9tree_nodeP9tree_node12splay_tree_s,
 gt_e_P12varpool_node4htab,
 gt_e_P13scev_info_str4htab,
 gt_e_P23constant_descriptor_rtx4htab,
 gt_e_P24constant_descriptor_tree4htab,
 gt_e_P12object_block4htab,
 gt_e_P7section4htab,
 gt_e_P17tree_priority_map4htab,
 gt_e_P8tree_map4htab,
 gt_e_P9type_hash4htab,
 gt_e_P13libfunc_entry4htab,
 gt_e_P23temp_slot_address_entry4htab,
 gt_e_P15throw_stmt_node4htab,
 gt_e_P9reg_attrs4htab,
 gt_e_P9mem_attrs4htab,
 gt_e_P7rtx_def4htab,
 gt_e_SP9tree_node12splay_tree_s,
 gt_e_P16var_loc_list_def4htab,
 gt_e_P10die_struct4htab,
 gt_e_P15dwarf_file_data4htab,
 gt_e_P20indirect_string_node4htab,
 gt_e_P11cgraph_node4htab,
 gt_e_II12splay_tree_s,
 gt_e_P11cgraph_edge4htab,
 gt_e_P9loop_exit4htab,
 gt_e_P9tree_node4htab,
 gt_e_P13ehl_map_entry4htab,
 gt_types_enum_last
};





extern void gt_ggc_mx_interface_tuple (void *);



extern void gt_ggc_mx_volatilized_type (void *);



extern void gt_ggc_mx_string_descriptor (void *);



extern void gt_ggc_mx_c_scope (void *);



extern void gt_ggc_mx_c_binding (void *);



extern void gt_ggc_mx_c_parser (void *);



extern void gt_ggc_mx_imp_entry (void *);



extern void gt_ggc_mx_hashed_attribute (void *);



extern void gt_ggc_mx_hashed_entry (void *);



extern void gt_ggc_mx_type_assertion (void *);



extern void gt_ggc_mx_treetreehash_entry (void *);



extern void gt_ggc_mx_CPool (void *);



extern void gt_ggc_mx_JCF (void *);



extern void gt_ggc_mx_module_htab_entry (void *);



extern void gt_ggc_mx_binding_level (void *);



extern void gt_ggc_mx_opt_stack (void *);



extern void gt_ggc_mx_def_pragma_macro (void *);



extern void gt_ggc_mx_def_pragma_macro_value (void *);



extern void gt_ggc_mx_align_stack (void *);



extern void gt_ggc_mx_VEC_const_char_p_gc (void *);



extern void gt_ggc_mx_pending_abstract_type (void *);



extern void gt_ggc_mx_cp_parser (void *);



extern void gt_ggc_mx_cp_parser_context (void *);



extern void gt_ggc_mx_cp_lexer (void *);



extern void gt_ggc_mx_tree_check (void *);



extern void gt_ggc_mx_VEC_deferred_access_gc (void *);



extern void gt_ggc_mx_pending_template (void *);



extern void gt_ggc_mx_named_label_use_entry (void *);



extern void gt_ggc_mx_VEC_deferred_access_check_gc (void *);



extern void gt_ggc_mx_tinst_level (void *);



extern void gt_ggc_mx_sorted_fields_type (void *);



extern void gt_ggc_mx_VEC_tree_pair_s_gc (void *);



extern void gt_ggc_mx_named_label_entry (void *);



extern void gt_ggc_mx_cp_token_cache (void *);



extern void gt_ggc_mx_saved_scope (void *);



extern void gt_ggc_mx_cxx_int_tree_map (void *);



extern void gt_ggc_mx_VEC_cp_class_binding_gc (void *);



extern void gt_ggc_mx_VEC_cxx_saved_binding_gc (void *);



extern void gt_ggc_mx_cp_binding_level (void *);



extern void gt_ggc_mx_cxx_binding (void *);



extern void gt_ggc_mx_binding_entry_s (void *);



extern void gt_ggc_mx_binding_table_s (void *);



extern void gt_ggc_mx_VEC_tinfo_s_gc (void *);



extern void gt_ggc_mx_gnat_binding_level (void *);



extern void gt_ggc_mx_elab_info (void *);



extern void gt_ggc_mx_stmt_group (void *);



extern void gt_ggc_mx_VEC_parm_attr_gc (void *);



extern void gt_ggc_mx_parm_attr (void *);



extern void gt_ggc_mx_ssa_operand_memory_d (void *);



extern void gt_ggc_mx_scev_info_str (void *);



extern void gt_ggc_mx_VEC_gimple_gc (void *);



extern void gt_ggc_mx_VEC_alias_pair_gc (void *);



extern void gt_ggc_mx_constant_descriptor_tree (void *);



extern void gt_ggc_mx_type_hash (void *);



extern void gt_ggc_mx_string_pool_data (void *);



extern void gt_ggc_mx_libfunc_entry (void *);



extern void gt_ggc_mx_temp_slot_address_entry (void *);



extern void gt_ggc_mx_throw_stmt_node (void *);



extern void gt_ggc_mx_VEC_eh_region_gc (void *);



extern void gt_ggc_mx_eh_region (void *);



extern void gt_ggc_mx_var_loc_list_def (void *);



extern void gt_ggc_mx_var_loc_node (void *);



extern void gt_ggc_mx_limbo_die_struct (void *);



extern void gt_ggc_mx_VEC_pubname_entry_gc (void *);



extern void gt_ggc_mx_VEC_dw_attr_node_gc (void *);



extern void gt_ggc_mx_dw_ranges_by_label_struct (void *);



extern void gt_ggc_mx_dw_ranges_struct (void *);



extern void gt_ggc_mx_dw_separate_line_info_struct (void *);



extern void gt_ggc_mx_dw_line_info_struct (void *);



extern void gt_ggc_mx_VEC_deferred_locations_gc (void *);



extern void gt_ggc_mx_dw_loc_list_struct (void *);



extern void gt_ggc_mx_dwarf_file_data (void *);



extern void gt_ggc_mx_queued_reg_save (void *);



extern void gt_ggc_mx_indirect_string_node (void *);



extern void gt_ggc_mx_dw_loc_descr_struct (void *);



extern void gt_ggc_mx_dw_fde_struct (void *);



extern void gt_ggc_mx_dw_cfi_struct (void *);



extern void gt_ggc_mx_typeinfo (void *);



extern void gt_ggc_mx_VEC_alias_set_entry_gc (void *);



extern void gt_ggc_mx_alias_set_entry (void *);



extern void gt_ggc_mx_cgraph_asm_node (void *);



extern void gt_ggc_mx_varpool_node (void *);



extern void gt_ggc_mx_cgraph_edge (void *);



extern void gt_ggc_mx_cgraph_node (void *);



extern void gt_ggc_mx_VEC_basic_block_gc (void *);



extern void gt_ggc_mx_gimple_bb_info (void *);



extern void gt_ggc_mx_rtl_bb_info (void *);



extern void gt_ggc_mx_VEC_edge_gc (void *);



extern void gt_ggc_mx_cselib_val_struct (void *);



extern void gt_ggc_mx_elt_loc_list (void *);



extern void gt_ggc_mx_VEC_loop_p_gc (void *);



extern void gt_ggc_mx_loop (void *);



extern void gt_ggc_mx_loop_exit (void *);



extern void gt_ggc_mx_nb_iter_bound (void *);



extern void gt_ggc_mx_language_function (void *);



extern void gt_ggc_mx_loops (void *);



extern void gt_ggc_mx_control_flow_graph (void *);



extern void gt_ggc_mx_eh_status (void *);



extern void gt_ggc_mx_initial_value_struct (void *);



extern void gt_ggc_mx_rtx_constant_pool (void *);



extern void gt_ggc_mx_VEC_temp_slot_p_gc (void *);



extern void gt_ggc_mx_temp_slot (void *);



extern void gt_ggc_mx_gimple_df (void *);



extern void gt_ggc_mx_ehl_map_entry (void *);



extern void gt_ggc_mx_VEC_call_site_record_gc (void *);



extern void gt_ggc_mx_call_site_record (void *);



extern void gt_ggc_mx_sequence_stack (void *);



extern void gt_ggc_mx_edge_def (void *);



extern void gt_ggc_mx_elt_list (void *);



extern void gt_ggc_mx_tree_priority_map (void *);



extern void gt_ggc_mx_tree_int_map (void *);



extern void gt_ggc_mx_tree_map (void *);



extern void gt_ggc_mx_lang_tree_node (void *);



extern void gt_ggc_mx_tree_statement_list_node (void *);



extern void gt_ggc_mx_lang_decl (void *);



extern void gt_ggc_mx_lang_type (void *);



extern void gt_ggc_mx_die_struct (void *);



extern void gt_ggc_mx_varray_head_tag (void *);



extern void gt_ggc_mx_ptr_info_def (void *);



extern void gt_ggc_mx_VEC_constructor_elt_gc (void *);



extern void gt_ggc_mx_tree_ann_d (void *);



extern void gt_ggc_mx_VEC_tree_gc (void *);



extern void gt_ggc_mx_function (void *);



extern void gt_ggc_mx_constant_descriptor_rtx (void *);



extern void gt_ggc_mx_basic_block_def (void *);



extern void gt_ggc_mx_fixed_value (void *);



extern void gt_ggc_mx_real_value (void *);



extern void gt_ggc_mx_VEC_rtx_gc (void *);



extern void gt_ggc_mx_object_block (void *);



extern void gt_ggc_mx_reg_attrs (void *);



extern void gt_ggc_mx_mem_attrs (void *);



extern void gt_ggc_mx_bitmap_obstack (void *);



extern void gt_ggc_mx_bitmap_element_def (void *);



extern void gt_ggc_mx_gimple_seq_node_d (void *);



extern void gt_ggc_mx_gimple_seq_d (void *);



extern void gt_ggc_mx_section (void *);



extern void gt_ggc_mx_gimple_statement_d (void *);



extern void gt_ggc_mx_rtvec_def (void *);



extern void gt_ggc_mx_rtx_def (void *);



extern void gt_ggc_mx_bitmap_head_def (void *);







extern void gt_ggc_mx_answer (void *);



extern void gt_ggc_mx_cpp_macro (void *);



extern void gt_ggc_mx_cpp_token (void *);



extern void gt_ggc_mx_line_maps (void *);
extern void gt_ggc_m_II17splay_tree_node_s (void *);
extern void gt_ggc_m_SP9tree_node17splay_tree_node_s (void *);
extern void gt_ggc_m_P9tree_nodeP9tree_node17splay_tree_node_s (void *);
extern void gt_ggc_m_IP9tree_node17splay_tree_node_s (void *);
extern void gt_ggc_m_P15interface_tuple4htab (void *);
extern void gt_ggc_m_P16volatilized_type4htab (void *);
extern void gt_ggc_m_P17string_descriptor4htab (void *);
extern void gt_ggc_m_P14type_assertion4htab (void *);
extern void gt_ggc_m_P18treetreehash_entry4htab (void *);
extern void gt_ggc_m_P17module_htab_entry4htab (void *);
extern void gt_ggc_m_P16def_pragma_macro4htab (void *);
extern void gt_ggc_m_P21pending_abstract_type4htab (void *);
extern void gt_ggc_m_P16cxx_int_tree_map4htab (void *);
extern void gt_ggc_m_P17named_label_entry4htab (void *);
extern void gt_ggc_m_P12tree_int_map4htab (void *);
extern void gt_ggc_m_IP9tree_node12splay_tree_s (void *);
extern void gt_ggc_m_P9tree_nodeP9tree_node12splay_tree_s (void *);
extern void gt_ggc_m_P12varpool_node4htab (void *);
extern void gt_ggc_m_P13scev_info_str4htab (void *);
extern void gt_ggc_m_P23constant_descriptor_rtx4htab (void *);
extern void gt_ggc_m_P24constant_descriptor_tree4htab (void *);
extern void gt_ggc_m_P12object_block4htab (void *);
extern void gt_ggc_m_P7section4htab (void *);
extern void gt_ggc_m_P17tree_priority_map4htab (void *);
extern void gt_ggc_m_P8tree_map4htab (void *);
extern void gt_ggc_m_P9type_hash4htab (void *);
extern void gt_ggc_m_P13libfunc_entry4htab (void *);
extern void gt_ggc_m_P23temp_slot_address_entry4htab (void *);
extern void gt_ggc_m_P15throw_stmt_node4htab (void *);
extern void gt_ggc_m_P9reg_attrs4htab (void *);
extern void gt_ggc_m_P9mem_attrs4htab (void *);
extern void gt_ggc_m_P7rtx_def4htab (void *);
extern void gt_ggc_m_SP9tree_node12splay_tree_s (void *);
extern void gt_ggc_m_P16var_loc_list_def4htab (void *);
extern void gt_ggc_m_P10die_struct4htab (void *);
extern void gt_ggc_m_P15dwarf_file_data4htab (void *);
extern void gt_ggc_m_P20indirect_string_node4htab (void *);
extern void gt_ggc_m_P11cgraph_node4htab (void *);
extern void gt_ggc_m_II12splay_tree_s (void *);
extern void gt_ggc_m_P11cgraph_edge4htab (void *);
extern void gt_ggc_m_P9loop_exit4htab (void *);
extern void gt_ggc_m_P9tree_node4htab (void *);
extern void gt_ggc_m_P13ehl_map_entry4htab (void *);





extern void gt_pch_nx_interface_tuple (void *);



extern void gt_pch_nx_volatilized_type (void *);



extern void gt_pch_nx_string_descriptor (void *);



extern void gt_pch_nx_c_scope (void *);



extern void gt_pch_nx_c_binding (void *);



extern void gt_pch_nx_c_parser (void *);



extern void gt_pch_nx_imp_entry (void *);



extern void gt_pch_nx_hashed_attribute (void *);



extern void gt_pch_nx_hashed_entry (void *);



extern void gt_pch_nx_type_assertion (void *);



extern void gt_pch_nx_treetreehash_entry (void *);



extern void gt_pch_nx_CPool (void *);



extern void gt_pch_nx_JCF (void *);



extern void gt_pch_nx_module_htab_entry (void *);



extern void gt_pch_nx_binding_level (void *);



extern void gt_pch_nx_opt_stack (void *);



extern void gt_pch_nx_def_pragma_macro (void *);



extern void gt_pch_nx_def_pragma_macro_value (void *);



extern void gt_pch_nx_align_stack (void *);



extern void gt_pch_nx_VEC_const_char_p_gc (void *);



extern void gt_pch_nx_pending_abstract_type (void *);



extern void gt_pch_nx_cp_parser (void *);



extern void gt_pch_nx_cp_parser_context (void *);



extern void gt_pch_nx_cp_lexer (void *);



extern void gt_pch_nx_tree_check (void *);



extern void gt_pch_nx_VEC_deferred_access_gc (void *);



extern void gt_pch_nx_pending_template (void *);



extern void gt_pch_nx_named_label_use_entry (void *);



extern void gt_pch_nx_VEC_deferred_access_check_gc (void *);



extern void gt_pch_nx_tinst_level (void *);



extern void gt_pch_nx_sorted_fields_type (void *);



extern void gt_pch_nx_VEC_tree_pair_s_gc (void *);



extern void gt_pch_nx_named_label_entry (void *);



extern void gt_pch_nx_cp_token_cache (void *);



extern void gt_pch_nx_saved_scope (void *);



extern void gt_pch_nx_cxx_int_tree_map (void *);



extern void gt_pch_nx_VEC_cp_class_binding_gc (void *);



extern void gt_pch_nx_VEC_cxx_saved_binding_gc (void *);



extern void gt_pch_nx_cp_binding_level (void *);



extern void gt_pch_nx_cxx_binding (void *);



extern void gt_pch_nx_binding_entry_s (void *);



extern void gt_pch_nx_binding_table_s (void *);



extern void gt_pch_nx_VEC_tinfo_s_gc (void *);



extern void gt_pch_nx_gnat_binding_level (void *);



extern void gt_pch_nx_elab_info (void *);



extern void gt_pch_nx_stmt_group (void *);



extern void gt_pch_nx_VEC_parm_attr_gc (void *);



extern void gt_pch_nx_parm_attr (void *);



extern void gt_pch_nx_ssa_operand_memory_d (void *);



extern void gt_pch_nx_scev_info_str (void *);



extern void gt_pch_nx_VEC_gimple_gc (void *);



extern void gt_pch_nx_VEC_alias_pair_gc (void *);



extern void gt_pch_nx_constant_descriptor_tree (void *);



extern void gt_pch_nx_type_hash (void *);



extern void gt_pch_nx_string_pool_data (void *);



extern void gt_pch_nx_libfunc_entry (void *);



extern void gt_pch_nx_temp_slot_address_entry (void *);



extern void gt_pch_nx_throw_stmt_node (void *);



extern void gt_pch_nx_VEC_eh_region_gc (void *);



extern void gt_pch_nx_eh_region (void *);



extern void gt_pch_nx_var_loc_list_def (void *);



extern void gt_pch_nx_var_loc_node (void *);



extern void gt_pch_nx_limbo_die_struct (void *);



extern void gt_pch_nx_VEC_pubname_entry_gc (void *);



extern void gt_pch_nx_VEC_dw_attr_node_gc (void *);



extern void gt_pch_nx_dw_ranges_by_label_struct (void *);



extern void gt_pch_nx_dw_ranges_struct (void *);



extern void gt_pch_nx_dw_separate_line_info_struct (void *);



extern void gt_pch_nx_dw_line_info_struct (void *);



extern void gt_pch_nx_VEC_deferred_locations_gc (void *);



extern void gt_pch_nx_dw_loc_list_struct (void *);



extern void gt_pch_nx_dwarf_file_data (void *);



extern void gt_pch_nx_queued_reg_save (void *);



extern void gt_pch_nx_indirect_string_node (void *);



extern void gt_pch_nx_dw_loc_descr_struct (void *);



extern void gt_pch_nx_dw_fde_struct (void *);



extern void gt_pch_nx_dw_cfi_struct (void *);



extern void gt_pch_nx_typeinfo (void *);



extern void gt_pch_nx_VEC_alias_set_entry_gc (void *);



extern void gt_pch_nx_alias_set_entry (void *);



extern void gt_pch_nx_cgraph_asm_node (void *);



extern void gt_pch_nx_varpool_node (void *);



extern void gt_pch_nx_cgraph_edge (void *);



extern void gt_pch_nx_cgraph_node (void *);



extern void gt_pch_nx_VEC_basic_block_gc (void *);



extern void gt_pch_nx_gimple_bb_info (void *);



extern void gt_pch_nx_rtl_bb_info (void *);



extern void gt_pch_nx_VEC_edge_gc (void *);



extern void gt_pch_nx_cselib_val_struct (void *);



extern void gt_pch_nx_elt_loc_list (void *);



extern void gt_pch_nx_VEC_loop_p_gc (void *);



extern void gt_pch_nx_loop (void *);



extern void gt_pch_nx_loop_exit (void *);



extern void gt_pch_nx_nb_iter_bound (void *);



extern void gt_pch_nx_language_function (void *);



extern void gt_pch_nx_loops (void *);



extern void gt_pch_nx_control_flow_graph (void *);



extern void gt_pch_nx_eh_status (void *);



extern void gt_pch_nx_initial_value_struct (void *);



extern void gt_pch_nx_rtx_constant_pool (void *);



extern void gt_pch_nx_VEC_temp_slot_p_gc (void *);



extern void gt_pch_nx_temp_slot (void *);



extern void gt_pch_nx_gimple_df (void *);



extern void gt_pch_nx_ehl_map_entry (void *);



extern void gt_pch_nx_VEC_call_site_record_gc (void *);



extern void gt_pch_nx_call_site_record (void *);



extern void gt_pch_nx_sequence_stack (void *);



extern void gt_pch_nx_edge_def (void *);



extern void gt_pch_nx_elt_list (void *);



extern void gt_pch_nx_tree_priority_map (void *);



extern void gt_pch_nx_tree_int_map (void *);



extern void gt_pch_nx_tree_map (void *);



extern void gt_pch_nx_lang_tree_node (void *);



extern void gt_pch_nx_tree_statement_list_node (void *);



extern void gt_pch_nx_lang_decl (void *);



extern void gt_pch_nx_lang_type (void *);



extern void gt_pch_nx_die_struct (void *);



extern void gt_pch_nx_varray_head_tag (void *);



extern void gt_pch_nx_ptr_info_def (void *);



extern void gt_pch_nx_VEC_constructor_elt_gc (void *);



extern void gt_pch_nx_tree_ann_d (void *);



extern void gt_pch_nx_VEC_tree_gc (void *);



extern void gt_pch_nx_function (void *);



extern void gt_pch_nx_constant_descriptor_rtx (void *);



extern void gt_pch_nx_basic_block_def (void *);



extern void gt_pch_nx_fixed_value (void *);



extern void gt_pch_nx_real_value (void *);



extern void gt_pch_nx_VEC_rtx_gc (void *);



extern void gt_pch_nx_object_block (void *);



extern void gt_pch_nx_reg_attrs (void *);



extern void gt_pch_nx_mem_attrs (void *);



extern void gt_pch_nx_bitmap_obstack (void *);



extern void gt_pch_nx_bitmap_element_def (void *);



extern void gt_pch_nx_gimple_seq_node_d (void *);



extern void gt_pch_nx_gimple_seq_d (void *);



extern void gt_pch_nx_section (void *);



extern void gt_pch_nx_gimple_statement_d (void *);



extern void gt_pch_nx_rtvec_def (void *);



extern void gt_pch_nx_rtx_def (void *);



extern void gt_pch_nx_bitmap_head_def (void *);







extern void gt_pch_nx_answer (void *);



extern void gt_pch_nx_cpp_macro (void *);



extern void gt_pch_nx_cpp_token (void *);



extern void gt_pch_nx_line_maps (void *);
extern void gt_pch_n_II17splay_tree_node_s (void *);
extern void gt_pch_n_SP9tree_node17splay_tree_node_s (void *);
extern void gt_pch_n_P9tree_nodeP9tree_node17splay_tree_node_s (void *);
extern void gt_pch_n_IP9tree_node17splay_tree_node_s (void *);
extern void gt_pch_n_P15interface_tuple4htab (void *);
extern void gt_pch_n_P16volatilized_type4htab (void *);
extern void gt_pch_n_P17string_descriptor4htab (void *);
extern void gt_pch_n_P14type_assertion4htab (void *);
extern void gt_pch_n_P18treetreehash_entry4htab (void *);
extern void gt_pch_n_P17module_htab_entry4htab (void *);
extern void gt_pch_n_P16def_pragma_macro4htab (void *);
extern void gt_pch_n_P21pending_abstract_type4htab (void *);
extern void gt_pch_n_P16cxx_int_tree_map4htab (void *);
extern void gt_pch_n_P17named_label_entry4htab (void *);
extern void gt_pch_n_P12tree_int_map4htab (void *);
extern void gt_pch_n_IP9tree_node12splay_tree_s (void *);
extern void gt_pch_n_P9tree_nodeP9tree_node12splay_tree_s (void *);
extern void gt_pch_n_P12varpool_node4htab (void *);
extern void gt_pch_n_P13scev_info_str4htab (void *);
extern void gt_pch_n_P23constant_descriptor_rtx4htab (void *);
extern void gt_pch_n_P24constant_descriptor_tree4htab (void *);
extern void gt_pch_n_P12object_block4htab (void *);
extern void gt_pch_n_P7section4htab (void *);
extern void gt_pch_n_P17tree_priority_map4htab (void *);
extern void gt_pch_n_P8tree_map4htab (void *);
extern void gt_pch_n_P9type_hash4htab (void *);
extern void gt_pch_n_P13libfunc_entry4htab (void *);
extern void gt_pch_n_P23temp_slot_address_entry4htab (void *);
extern void gt_pch_n_P15throw_stmt_node4htab (void *);
extern void gt_pch_n_P9reg_attrs4htab (void *);
extern void gt_pch_n_P9mem_attrs4htab (void *);
extern void gt_pch_n_P7rtx_def4htab (void *);
extern void gt_pch_n_SP9tree_node12splay_tree_s (void *);
extern void gt_pch_n_P16var_loc_list_def4htab (void *);
extern void gt_pch_n_P10die_struct4htab (void *);
extern void gt_pch_n_P15dwarf_file_data4htab (void *);
extern void gt_pch_n_P20indirect_string_node4htab (void *);
extern void gt_pch_n_P11cgraph_node4htab (void *);
extern void gt_pch_n_II12splay_tree_s (void *);
extern void gt_pch_n_P11cgraph_edge4htab (void *);
extern void gt_pch_n_P9loop_exit4htab (void *);
extern void gt_pch_n_P9tree_node4htab (void *);
extern void gt_pch_n_P13ehl_map_entry4htab (void *);


extern void gt_pch_p_15interface_tuple
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16volatilized_type
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17string_descriptor
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_7c_scope
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9c_binding
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_8c_parser
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9imp_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16hashed_attribute
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_12hashed_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_14type_assertion
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18treetreehash_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_5CPool
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_3JCF
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17module_htab_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13binding_level
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9opt_stack
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16def_pragma_macro
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_22def_pragma_macro_value
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11align_stack
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_19VEC_const_char_p_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_21pending_abstract_type
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9cp_parser
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17cp_parser_context
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_8cp_lexer
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_10tree_check
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_22VEC_deferred_access_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16pending_template
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_21named_label_use_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_28VEC_deferred_access_check_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11tinst_level
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18sorted_fields_type
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18VEC_tree_pair_s_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17named_label_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_14cp_token_cache
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11saved_scope
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16cxx_int_tree_map
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_23VEC_cp_class_binding_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_24VEC_cxx_saved_binding_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16cp_binding_level
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11cxx_binding
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15binding_entry_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15binding_table_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_14VEC_tinfo_s_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18gnat_binding_level
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9elab_info
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_10stmt_group
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16VEC_parm_attr_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9parm_attr
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_20ssa_operand_memory_d
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13scev_info_str
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13VEC_gimple_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17VEC_alias_pair_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_24constant_descriptor_tree
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9type_hash
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16string_pool_data
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13libfunc_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_23temp_slot_address_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15throw_stmt_node
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16VEC_eh_region_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9eh_region
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16var_loc_list_def
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_12var_loc_node
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16limbo_die_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_20VEC_pubname_entry_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_19VEC_dw_attr_node_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_25dw_ranges_by_label_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16dw_ranges_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_28dw_separate_line_info_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_19dw_line_info_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_25VEC_deferred_locations_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18dw_loc_list_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15dwarf_file_data
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15queued_reg_save
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_20indirect_string_node
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_19dw_loc_descr_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13dw_fde_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13dw_cfi_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_8typeinfo
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_22VEC_alias_set_entry_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15alias_set_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15cgraph_asm_node
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_12varpool_node
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11cgraph_edge
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11cgraph_node
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18VEC_basic_block_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_14gimple_bb_info
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11rtl_bb_info
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11VEC_edge_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17cselib_val_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_12elt_loc_list
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13VEC_loop_p_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_4loop
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9loop_exit
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13nb_iter_bound
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17language_function
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_5loops
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18control_flow_graph
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9eh_status
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_20initial_value_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17rtx_constant_pool
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18VEC_temp_slot_p_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9temp_slot
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9gimple_df
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_13ehl_map_entry
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_23VEC_call_site_record_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_16call_site_record
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_14sequence_stack
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_8edge_def
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_8elt_list
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17tree_priority_map
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_12tree_int_map
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_8tree_map
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_14lang_tree_node
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_24tree_statement_list_node
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9lang_decl
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9lang_type
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_10die_struct
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15varray_head_tag
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_12ptr_info_def
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_22VEC_constructor_elt_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_10tree_ann_d
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11VEC_tree_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_8function
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_23constant_descriptor_rtx
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15basic_block_def
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_11fixed_value
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_10real_value
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_10VEC_rtx_gc
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_12object_block
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9reg_attrs
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9mem_attrs
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_14bitmap_obstack
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18bitmap_element_def
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_17gimple_seq_node_d
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_12gimple_seq_d
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_7section
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_18gimple_statement_d
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9rtvec_def
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_7rtx_def
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_15bitmap_head_def
    (void *, void *, gt_pointer_operator, void *);

extern void gt_pch_p_6answer
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9cpp_macro
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9cpp_token
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_9line_maps
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_II17splay_tree_node_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_SP9tree_node17splay_tree_node_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P9tree_nodeP9tree_node17splay_tree_node_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_IP9tree_node17splay_tree_node_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P15interface_tuple4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P16volatilized_type4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P17string_descriptor4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P14type_assertion4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P18treetreehash_entry4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P17module_htab_entry4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P16def_pragma_macro4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P21pending_abstract_type4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P16cxx_int_tree_map4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P17named_label_entry4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P12tree_int_map4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_IP9tree_node12splay_tree_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P9tree_nodeP9tree_node12splay_tree_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P12varpool_node4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P13scev_info_str4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P23constant_descriptor_rtx4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P24constant_descriptor_tree4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P12object_block4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P7section4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P17tree_priority_map4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P8tree_map4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P9type_hash4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P13libfunc_entry4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P23temp_slot_address_entry4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P15throw_stmt_node4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P9reg_attrs4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P9mem_attrs4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P7rtx_def4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_SP9tree_node12splay_tree_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P16var_loc_list_def4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P10die_struct4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P15dwarf_file_data4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P20indirect_string_node4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P11cgraph_node4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_II12splay_tree_s
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P11cgraph_edge4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P9loop_exit4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P9tree_node4htab
    (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_p_P13ehl_map_entry4htab
    (void *, void *, gt_pointer_operator, void *);
# 40 "/home/mzorgati/gcc-4.4.0/gcc/ggc.h" 2




typedef void (*gt_note_pointers) (void *, void *, gt_pointer_operator,
      void *);






typedef void (*gt_handle_reorder) (void *, void *, gt_pointer_operator,
       void *);


extern int gt_pch_note_object (void *, void *, gt_note_pointers,
          enum gt_types_enum);



extern void gt_pch_note_reorder (void *, void *, gt_handle_reorder);


typedef void (*gt_pointer_walker) (void *);



struct ggc_root_tab {
  void *base;
  size_t nelt;
  size_t stride;
  gt_pointer_walker cb;
  gt_pointer_walker pchw;
};


extern const struct ggc_root_tab * const gt_ggc_rtab[];
extern const struct ggc_root_tab * const gt_ggc_deletable_rtab[];
extern const struct ggc_root_tab * const gt_pch_cache_rtab[];
extern const struct ggc_root_tab * const gt_pch_scalar_rtab[];


struct htab;
struct ggc_cache_tab {
  struct htab * *base;
  size_t nelt;
  size_t stride;
  gt_pointer_walker cb;
  gt_pointer_walker pchw;
  int (*marked_p) (const void *);
};


extern const struct ggc_cache_tab * const gt_ggc_cache_rtab[];
# 113 "/home/mzorgati/gcc-4.4.0/gcc/ggc.h"
extern int ggc_set_mark (const void *);




extern int ggc_marked_p (const void *);


extern void ggc_mark_stringpool (void);


extern void ggc_purge_stringpool (void);



extern void ggc_mark_roots (void);



extern void gt_pch_save_stringpool (void);
extern void gt_pch_fixup_stringpool (void);
extern void gt_pch_restore_stringpool (void);



extern void gt_pch_p_S (void *, void *, gt_pointer_operator, void *);
extern void gt_pch_n_S (const void *);
extern void gt_ggc_m_S (const void *);


extern void init_stringpool (void);





struct alloc_zone;


extern void init_ggc (void);


extern struct alloc_zone *new_ggc_zone (const char *);


extern void destroy_ggc_zone (struct alloc_zone *);

struct ggc_pch_data;


extern struct ggc_pch_data *init_ggc_pch (void);





extern void ggc_pch_count_object (struct ggc_pch_data *, void *, size_t, unsigned char,
      enum gt_types_enum);



extern size_t ggc_pch_total_size (struct ggc_pch_data *);



extern void ggc_pch_this_base (struct ggc_pch_data *, void *);




extern char *ggc_pch_alloc_object (struct ggc_pch_data *, void *, size_t, unsigned char,
       enum gt_types_enum);


extern void ggc_pch_prepare_write (struct ggc_pch_data *, FILE *);


extern void ggc_pch_write_object (struct ggc_pch_data *, FILE *, void *,
      void *, size_t, unsigned char);


extern void ggc_pch_finish (struct ggc_pch_data *, FILE *);



extern void ggc_pch_read (FILE *, void *);





extern unsigned char ggc_force_collect;





extern unsigned char ggc_protect_identifiers;


extern void *ggc_alloc_stat (size_t );


extern void *ggc_alloc_typed_stat (enum gt_types_enum, size_t );


extern void *ggc_alloc_cleared_stat (size_t );


extern void *ggc_realloc_stat (void *, size_t );


extern void *ggc_calloc (size_t, size_t);

extern void ggc_free (void *);

extern void ggc_record_overhead (size_t, size_t, void * );
extern void ggc_free_overhead (void *);
extern void ggc_prune_overhead_list (void);

extern void dump_ggc_loc_statistics (unsigned char);
# 258 "/home/mzorgati/gcc-4.4.0/gcc/ggc.h"
extern void *ggc_splay_alloc (int, void *);
extern void ggc_splay_dont_free (void *, void *);




extern const char *ggc_alloc_string (const char *contents, int length);






extern void ggc_collect (void);


extern size_t ggc_get_size (const void *);


extern void gt_pch_save (FILE *f);


extern void gt_pch_restore (FILE *f);





typedef struct ggc_statistics
{

  int unused;
} ggc_statistics;



extern void ggc_print_common_statistics (FILE *, ggc_statistics *);


extern void ggc_print_statistics (void);
extern void stringpool_statistics (void);


extern int ggc_min_expand_heuristic (void);
extern int ggc_min_heapsize_heuristic (void);
extern void init_ggc_heuristics (void);
# 64 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/target.h" 1
# 56 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
typedef enum
{
  SWITCH_TYPE_PASSED,
  SWITCH_TYPE_ENABLED,
  SWITCH_TYPE_DESCRIPTIVE,
  SWITCH_TYPE_LINE_START,
  SWITCH_TYPE_LINE_END
}
print_switch_type;

typedef int (* print_switch_fn_type) (print_switch_type, const char *);


extern int elf_record_gcc_switches (print_switch_type type, const char *);

struct stdarg_info;
struct spec_info_def;


typedef struct secondary_reload_info
{


  int icode;
  int extra_cost;



  struct secondary_reload_info *prev_sri;
  int t_icode;
} secondary_reload_info;


struct _dep;


struct ddg;

struct gcc_target
{

  struct asm_out
  {

    const char *open_paren, *close_paren;


    const char *byte_op;
    struct asm_int_op
    {
      const char *hi;
      const char *si;
      const char *di;
      const char *ti;
    } aligned_op, unaligned_op;






    unsigned char (* integer) (rtx x, unsigned int size, int aligned_p);


    void (* globalize_label) (FILE *, const char *);


    void (* globalize_decl_name) (FILE *, tree);






    void (* unwind_label) (FILE *, tree, int, int);



    void (* except_table_label) (FILE *);


    void (* unwind_emit) (FILE *, rtx);


    void (* internal_label) (FILE *, const char *, unsigned long);


    unsigned char (* ttype) (rtx);



    void (* visibility) (tree, int);


    void (* function_prologue) (FILE *, long);


    void (* function_end_prologue) (FILE *);


    void (* function_begin_epilogue) (FILE *);


    void (* function_epilogue) (FILE *, long);


    void (* init_sections) (void);




    void (* named_section) (const char *name, unsigned int flags, tree decl);





    int (*reloc_rw_mask) (void);





    section *(* select_section) (tree, int, unsigned long);



    section *(* select_rtx_section) (enum machine_mode, rtx,
         unsigned long);



    void (* unique_section) (tree, int);


    section *(* function_rodata_section) (tree);


    void (* constructor) (rtx, int);


    void (* destructor) (rtx, int);






    void (* output_mi_thunk) (FILE *file, tree thunk_decl,
         long delta, long vcall_offset,
         tree function_decl);







    unsigned char (* can_output_mi_thunk) (const_tree thunk_decl, long delta,
      long vcall_offset,
      const_tree function_decl);



    void (*file_start) (void);



    void (*file_end) (void);



    void (*external_libcall) (rtx);



    void (*mark_decl_preserved) (const char *);


    print_switch_fn_type record_gcc_switches;




    const char * record_gcc_switches_section;


    void (*output_anchor) (rtx);


    void (*output_dwarf_dtprel) (FILE *file, int size, rtx x);

  } asm_out;


  struct sched
  {



    int (* adjust_cost) (rtx insn, rtx link, rtx dep_insn, int cost);



    int (* adjust_priority) (rtx, int);




    int (* issue_rate) (void);



    int (* variable_issue) (FILE *, int, rtx, int);


    void (* md_init) (FILE *, int, int);


    void (* md_finish) (FILE *, int);


    void (* md_init_global) (FILE *, int, int);


    void (* md_finish_global) (FILE *, int);



    int (* reorder) (FILE *, int, rtx *, int *, int);
    int (* reorder2) (FILE *, int, rtx *, int *, int);




    void (* dependencies_evaluation_hook) (rtx, rtx);
# 304 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
    void (* init_dfa_pre_cycle_insn) (void);
    rtx (* dfa_pre_cycle_insn) (void);
    void (* init_dfa_post_cycle_insn) (void);
    rtx (* dfa_post_cycle_insn) (void);





    void (* dfa_pre_advance_cycle) (void);
    void (* dfa_post_advance_cycle) (void);
# 323 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
    int (* first_cycle_multipass_dfa_lookahead) (void);






    int (* first_cycle_multipass_dfa_lookahead_guard) (rtx);
# 344 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
    int (* dfa_new_cycle) (FILE *, int, rtx, int, int, int *);
# 355 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
    unsigned char (* is_costly_dependence) (struct _dep *_dep, int, int);




    int (* adjust_cost_2) (rtx insn, int, rtx dep_insn, int cost, int dw);




    void (* h_i_d_extended) (void);




    void *(* alloc_sched_context) (void);


    void (* init_sched_context) (void *, unsigned char);


    void (* set_sched_context) (void *);


    void (* clear_sched_context) (void *);


    void (* free_sched_context) (void *);
# 395 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
    int (* speculate_insn) (rtx, int, rtx *);




    unsigned char (* needs_block_p) (int);
# 410 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
    rtx (* gen_spec_check) (rtx, rtx, int);







    unsigned char (* first_cycle_multipass_dfa_lookahead_guard_spec) (const_rtx);




    void (* set_sched_flags) (struct spec_info_def *);


    int (* get_insn_spec_ds) (rtx);



    int (* get_insn_checked_ds) (rtx);



    unsigned char (* skip_rtx_p) (const_rtx);





    int (* sms_res_mii) (struct ddg *);
  } sched;


  struct vectorize
  {



    tree (* builtin_mask_for_load) (void);



    tree (* builtin_vectorized_function) (unsigned, tree, tree);



    tree (* builtin_conversion) (unsigned, tree);





    tree (* builtin_mul_widen_even) (tree);
    tree (* builtin_mul_widen_odd) (tree);



    int (*builtin_vectorization_cost) (unsigned char);



    unsigned char (* vector_alignment_reachable) (const_tree, unsigned char);


    tree (* builtin_vec_perm) (tree, tree*);
} vectorize;


  int default_target_flags;






  unsigned char (* handle_option) (size_t code, const char *arg, int value);



  void (* target_help) (void);


  enum machine_mode (* eh_return_filter_mode) (void);


  enum machine_mode (* libgcc_cmp_return_mode) (void);


  enum machine_mode (* libgcc_shift_count_mode) (void);


  enum machine_mode (* unwind_word_mode) (void);


  tree (* merge_decl_attributes) (tree, tree);


  tree (* merge_type_attributes) (tree, tree);



  const struct attribute_spec *attribute_table;




  int (* comp_type_attributes) (const_tree type1, const_tree type2);


  void (* set_default_type_attributes) (tree type);


  void (* insert_attributes) (tree decl, tree *attributes);



  unsigned char (* function_attribute_inlinable_p) (const_tree fndecl);



  unsigned char (* ms_bitfield_layout_p) (const_tree record_type);


  unsigned char (* decimal_float_supported_p) (void);


  unsigned char (* fixed_point_supported_p) (void);


  unsigned char (* align_anon_bitfield) (void);



  unsigned char (* narrow_volatile_bitfield) (void);


  void (* init_builtins) (void);


  rtx (* expand_builtin) (tree exp, rtx target, rtx subtarget,
     enum machine_mode mode, int ignore);





  tree (*resolve_overloaded_builtin) (tree decl, tree params);


  tree (* fold_builtin) (tree fndecl, tree arglist, unsigned char ignore);



  tree (* builtin_reciprocal) (unsigned, unsigned char, unsigned char);




  const char * (* mangle_type) (const_tree type);


  void (* init_libfuncs) (void);




  unsigned int (* section_type_flags) (tree, const char *, int);



  unsigned char (* cannot_modify_jumps_p) (void);



  int (* branch_target_register_class) (void);





  unsigned char (* branch_target_register_callee_saved) (unsigned char after_pe_gen);


  unsigned char (* cannot_force_const_mem) (rtx);


  unsigned char (* cannot_copy_insn_p) (rtx);


  unsigned char (* commutative_p) (const_rtx, int);


  rtx (* delegitimize_address) (rtx);


  unsigned char (* use_blocks_for_constant_p) (enum machine_mode, const_rtx);


  long min_anchor_offset;
  long max_anchor_offset;


  unsigned char (* use_anchors_for_symbol_p) (const_rtx);




  unsigned char (*function_ok_for_sibcall) (tree decl, tree exp);




  void (*set_current_function) (tree fndecl);


  unsigned char (* in_small_data_p) (const_tree);



  unsigned char (* binds_local_p) (const_tree);





   tree (* mangle_decl_assembler_name) (tree decl, tree id);



  void (* encode_section_info) (tree, rtx, int);


  const char * (* strip_name_encoding) (const char *);



  unsigned long (* shift_truncation_mask) (enum machine_mode mode);




  unsigned int (* min_divisions_for_recip_mul) (enum machine_mode mode);






  int (* mode_rep_extended) (enum machine_mode mode,
        enum machine_mode mode_rep);


  unsigned char (* valid_pointer_mode) (enum machine_mode mode);




  unsigned char (* scalar_mode_supported_p) (enum machine_mode mode);




  unsigned char (* vector_mode_supported_p) (enum machine_mode mode);


  unsigned char (* vector_opaque_p) (const_tree);






  unsigned char (* rtx_costs) (rtx x, int code, int outer_code, int *total, unsigned char speed);



  int (* address_cost) (rtx x, unsigned char speed);



  rtx (* allocate_initial_value) (rtx x);



  int (* unspec_may_trap_p) (const_rtx x, unsigned flags);







  rtx (* dwarf_register_span) (rtx);





  void (* init_dwarf_reg_sizes_extra) (tree);
# 718 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
  unsigned char (* fixed_condition_code_regs) (unsigned int *, unsigned int *);






  enum machine_mode (* cc_modes_compatible) (enum machine_mode,
          enum machine_mode);



  void (* machine_dependent_reorg) (void);


  tree (* build_builtin_va_list) (void);


  tree (* fn_abi_va_list) (tree);


  tree (* canonical_va_list_type) (tree);


  void (* expand_builtin_va_start) (tree valist, rtx nextarg);


  tree (* gimplify_va_arg_expr) (tree valist, tree type, gimple_seq *pre_p,
     gimple_seq *post_p);







  void * (* get_pch_validity) (size_t *);
  const char * (* pch_valid_p) (const void *, size_t);




  const char *(*check_pch_target_flags) (int);




  unsigned char (* default_short_enums) (void);



  rtx (* builtin_setjmp_frame_value) (void);



  tree (* md_asm_clobbers) (tree, tree, tree);






  int (* dwarf_calling_convention) (const_tree);
# 789 "/home/mzorgati/gcc-4.4.0/gcc/target.h"
  void (* dwarf_handle_frame_unspec) (const char *, rtx, int);




  unsigned char (* stdarg_optimize_hook) (struct stdarg_info *ai, const_gimple stmt);




  tree (* stack_protect_guard) (void);



  tree (* stack_protect_fail) (void);



  const char * (*invalid_within_doloop) (const_rtx);




  unsigned char (* valid_dllimport_attribute_p) (const_tree decl);


  struct calls {
    unsigned char (*promote_function_args) (const_tree fntype);
    unsigned char (*promote_function_return) (const_tree fntype);
    unsigned char (*promote_prototypes) (const_tree fntype);
    rtx (*struct_value_rtx) (tree fndecl, int incoming);
    unsigned char (*return_in_memory) (const_tree type, const_tree fndecl);
    unsigned char (*return_in_msb) (const_tree type);




    unsigned char (*pass_by_reference) (CUMULATIVE_ARGS *ca, enum machine_mode mode,
          const_tree type, unsigned char named_arg);

    rtx (*expand_builtin_saveregs) (void);

    void (*setup_incoming_varargs) (CUMULATIVE_ARGS *ca, enum machine_mode mode,
        tree type, int *pretend_arg_size,
        int second_time);
    unsigned char (*strict_argument_naming) (CUMULATIVE_ARGS *ca);



    unsigned char (*pretend_outgoing_varargs_named) (CUMULATIVE_ARGS *ca);



    unsigned char (* split_complex_arg) (const_tree type);





    unsigned char (* must_pass_in_stack) (enum machine_mode mode, const_tree t);




    unsigned char (* callee_copies) (CUMULATIVE_ARGS *ca, enum machine_mode mode,
       const_tree type, unsigned char named);




    int (* arg_partial_bytes) (CUMULATIVE_ARGS *ca, enum machine_mode mode,
          tree type, unsigned char named);



    const char *(*invalid_arg_for_unprototyped_fn) (const_tree typelist,
               const_tree funcdecl,
          const_tree val);



    rtx (*function_value) (const_tree ret_type, const_tree fn_decl_or_type,
      unsigned char outgoing);



    rtx (*internal_arg_pointer) (void);


    void (*update_stack_boundary) (void);



    rtx (*get_drap_rtx) (void);



    unsigned char (*allocate_stack_slots_for_args) (void);

  } calls;



  const char *(*invalid_conversion) (const_tree fromtype, const_tree totype);



  const char *(*invalid_unary_op) (int op, const_tree type);



  const char *(*invalid_binary_op) (int op, const_tree type1, const_tree type2);


  const enum reg_class *(*ira_cover_classes) (void);


  enum reg_class (*secondary_reload) (unsigned char, rtx, enum reg_class,
          enum machine_mode,
          struct secondary_reload_info *);



  void (* expand_to_rtl_hook) (void);




  void (* instantiate_decls) (void);



  unsigned char (* hard_regno_scratch_ok) (unsigned int regno);


  struct c {


    enum machine_mode (*mode_for_suffix) (char);
  } c;


  struct cxx {

    tree (*guard_type) (void);

    unsigned char (*guard_mask_bit) (void);

    tree (*get_cookie_size) (tree);


    unsigned char (*cookie_has_size) (void);


    int (*import_export_class) (tree, int);

    unsigned char (*cdtor_returns_this) (void);




    unsigned char (*key_method_may_be_inline) (void);







    void (*determine_class_data_visibility) (tree decl);





    unsigned char (*class_data_always_comdat) (void);



    unsigned char (*library_rtti_comdat) (void);


    unsigned char (*use_aeabi_atexit) (void);


    unsigned char (*use_atexit_for_cxa_atexit) (void);




    void (*adjust_class_at_definition) (tree type);
  } cxx;


  struct emutls {

    const char *get_address;
    const char *register_common;


    const char *var_section;
    const char *tmpl_section;


    const char *var_prefix;
    const char *tmpl_prefix;


    tree (*var_fields) (tree, tree *);


    tree (*var_init) (tree, tree, tree);



    unsigned char var_align_fixed;


    unsigned char debug_form_tls_address;
  } emutls;

  struct target_option_hooks {



    unsigned char (*valid_attribute_p) (tree, tree, tree, int);



    void (*save) (struct cl_target_option *);



    void (*restore) (struct cl_target_option *);



    void (*print) (FILE *, int, struct cl_target_option *);





    unsigned char (*pragma_parse) (tree, tree);


    unsigned char (*can_inline_p) (tree, tree);
  } target_option;




  void (*live_on_entry) (bitmap);


  unsigned char unwind_tables_default;




  unsigned char have_named_sections;



  unsigned char have_switchable_bss_sections;



  unsigned char have_ctors_dtors;


  unsigned char have_tls;


  unsigned char have_srodata_section;


  unsigned char terminate_dw2_eh_frame_info;



  unsigned char file_start_app_off;



  unsigned char file_start_file_directive;


  unsigned char handle_pragma_redefine_extname;


  unsigned char handle_pragma_extern_prefix;



  unsigned char relaxed_ordering;




  unsigned char arm_eabi_unwinder;


};

extern struct gcc_target targetm;

struct gcc_targetcm {





  unsigned char (*handle_c_option) (size_t code, const char *arg, int value);
};


extern struct gcc_targetcm targetcm;
# 65 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/target-def.h" 1
# 944 "/home/mzorgati/gcc-4.4.0/gcc/target-def.h"
# 1 "/home/mzorgati/gcc-4.4.0/gcc/hooks.h" 1
# 28 "/home/mzorgati/gcc-4.4.0/gcc/hooks.h"
extern unsigned char hook_bool_void_false (void);
extern unsigned char hook_bool_void_true (void);
extern unsigned char hook_bool_bool_false (unsigned char);
extern unsigned char hook_bool_mode_false (enum machine_mode);
extern unsigned char hook_bool_mode_const_rtx_false (enum machine_mode, const_rtx);
extern unsigned char hook_bool_mode_const_rtx_true (enum machine_mode, const_rtx);
extern unsigned char hook_bool_tree_false (tree);
extern unsigned char hook_bool_const_tree_false (const_tree);
extern unsigned char hook_bool_tree_true (tree);
extern unsigned char hook_bool_const_tree_true (const_tree);
extern unsigned char hook_bool_const_tree_hwi_hwi_const_tree_false (const_tree,
          long,
          long,
          const_tree);
extern unsigned char hook_bool_const_tree_hwi_hwi_const_tree_true (const_tree,
         long,
         long,
         const_tree);
extern unsigned char hook_bool_rtx_false (rtx);
extern unsigned char hook_bool_uintp_uintp_false (unsigned int *, unsigned int *);
extern unsigned char hook_bool_rtx_int_int_intp_bool_false (rtx, int, int, int *, unsigned char);
extern unsigned char hook_bool_constcharptr_size_t_false (const char *, size_t);
extern unsigned char hook_bool_size_t_constcharptr_int_true (size_t, const char *, int);
extern unsigned char hook_bool_tree_tree_false (tree, tree);
extern unsigned char hook_bool_tree_bool_false (tree, unsigned char);

extern void hook_void_void (void);
extern void hook_void_constcharptr (const char *);
extern void hook_void_FILEptr_constcharptr (FILE *, const char *);
extern void hook_void_tree (tree);
extern void hook_void_tree_treeptr (tree, tree *);

extern int hook_int_const_tree_0 (const_tree);
extern int hook_int_const_tree_const_tree_1 (const_tree, const_tree);
extern int hook_int_rtx_0 (rtx);
extern int hook_int_rtx_bool_0 (rtx, unsigned char);
extern int hook_int_size_t_constcharptr_int_0 (size_t, const char *, int);
extern int hook_int_void_no_regs (void);

extern tree hook_tree_tree_tree_null (tree, tree);
extern tree hook_tree_tree_tree_tree_null (tree, tree, tree);
extern tree hook_tree_tree_tree_tree_3rd_identity (tree, tree, tree);
extern tree hook_tree_tree_tree_bool_null (tree, tree, unsigned char);

extern unsigned hook_uint_uint_constcharptrptr_0 (unsigned, const char **);

extern unsigned char default_can_output_mi_thunk_no_vcall (const_tree, long,
        long, const_tree);

extern rtx hook_rtx_rtx_identity (rtx);
extern rtx hook_rtx_rtx_null (rtx);
extern rtx hook_rtx_tree_int_null (tree, int);

extern const char *hook_constcharptr_const_tree_null (const_tree);
extern const char *hook_constcharptr_const_rtx_null (const_rtx);
extern const char *hook_constcharptr_const_tree_const_tree_null (const_tree, const_tree);
extern const char *hook_constcharptr_int_const_tree_null (int, const_tree);
extern const char *hook_constcharptr_int_const_tree_const_tree_null (int, const_tree, const_tree);
# 945 "/home/mzorgati/gcc-4.4.0/gcc/target-def.h" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/targhooks.h" 1
# 20 "/home/mzorgati/gcc-4.4.0/gcc/targhooks.h"
extern void default_external_libcall (rtx);

extern int default_unspec_may_trap_p (const_rtx, unsigned);

extern enum machine_mode default_cc_modes_compatible (enum machine_mode,
            enum machine_mode);

extern unsigned char default_return_in_memory (const_tree, const_tree);

extern rtx default_expand_builtin_saveregs (void);
extern void default_setup_incoming_varargs (CUMULATIVE_ARGS *, enum machine_mode, tree, int *, int);
extern rtx default_builtin_setjmp_frame_value (void);
extern unsigned char default_pretend_outgoing_varargs_named (CUMULATIVE_ARGS *);

extern enum machine_mode default_eh_return_filter_mode (void);
extern enum machine_mode default_libgcc_cmp_return_mode (void);
extern enum machine_mode default_libgcc_shift_count_mode (void);
extern enum machine_mode default_unwind_word_mode (void);
extern unsigned long default_shift_truncation_mask
  (enum machine_mode);
extern unsigned int default_min_divisions_for_recip_mul (enum machine_mode);
extern int default_mode_rep_extended (enum machine_mode, enum machine_mode);

extern tree default_stack_protect_guard (void);
extern tree default_external_stack_protect_fail (void);
extern tree default_hidden_stack_protect_fail (void);

extern enum machine_mode default_mode_for_suffix (char);

extern tree default_cxx_guard_type (void);
extern tree default_cxx_get_cookie_size (tree);

extern unsigned char hook_pass_by_reference_must_pass_in_stack
  (CUMULATIVE_ARGS *, enum machine_mode mode, const_tree, unsigned char);
extern unsigned char hook_callee_copies_named
  (CUMULATIVE_ARGS *ca, enum machine_mode, const_tree, unsigned char);

extern void default_unwind_emit (FILE *, rtx);

extern unsigned char default_scalar_mode_supported_p (enum machine_mode);
extern unsigned char default_decimal_float_supported_p (void);
extern unsigned char default_fixed_point_supported_p (void);

extern const char * default_invalid_within_doloop (const_rtx);

extern tree default_builtin_vectorized_function
  (enum built_in_function, tree, tree);

extern tree default_builtin_vectorized_conversion (enum tree_code, tree);

extern tree default_builtin_reciprocal (enum built_in_function, unsigned char, unsigned char);

extern unsigned char default_builtin_vector_alignment_reachable (const_tree, unsigned char);




extern unsigned char hook_bool_CUMULATIVE_ARGS_false (CUMULATIVE_ARGS *);
extern unsigned char hook_bool_CUMULATIVE_ARGS_true (CUMULATIVE_ARGS *);

extern unsigned char hook_bool_CUMULATIVE_ARGS_mode_tree_bool_false
  (CUMULATIVE_ARGS *, enum machine_mode, const_tree, unsigned char);
extern unsigned char hook_bool_CUMULATIVE_ARGS_mode_tree_bool_true
  (CUMULATIVE_ARGS *, enum machine_mode, const_tree, unsigned char);
extern int hook_int_CUMULATIVE_ARGS_mode_tree_bool_0
  (CUMULATIVE_ARGS *, enum machine_mode, tree, unsigned char);
extern const char *hook_invalid_arg_for_unprototyped_fn
  (const_tree, const_tree, const_tree);
extern unsigned char hook_bool_const_rtx_commutative_p (const_rtx, int);
extern rtx default_function_value (const_tree, const_tree, unsigned char);
extern rtx default_internal_arg_pointer (void);



extern enum reg_class default_secondary_reload (unsigned char, rtx, enum reg_class,
      enum machine_mode,
      secondary_reload_info *);
extern void hook_void_bitmap (bitmap);
extern unsigned char default_handle_c_option (size_t, const char *, int);
extern int default_reloc_rw_mask (void);
extern tree default_mangle_decl_assembler_name (tree, tree);
extern tree default_emutls_var_fields (tree, tree *);
extern tree default_emutls_var_init (tree, tree, tree);
extern unsigned char default_hard_regno_scratch_ok (unsigned int);
extern unsigned char default_target_option_valid_attribute_p (tree, tree, tree, int);
extern unsigned char default_target_option_pragma_parse (tree, tree);
extern unsigned char default_target_option_can_inline_p (tree, tree);
# 945 "/home/mzorgati/gcc-4.4.0/gcc/target-def.h" 2
# 66 "c816.c" 2
# 1 "/home/mzorgati/gcc-4.4.0/gcc/machmode.h" 1
# 67 "c816.c" 2
# 76 "c816.c"
int pragma_interrupt;




int pragma_output = 0;





extern unsigned char warning (int, const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 2, 3))) __attribute__ ((__nonnull__ (2)));
extern void error (const char *, ...) __attribute__ ((__format__ (__gcc_tdiag__, 1, 2))) __attribute__ ((__nonnull__ (1)));
extern void debug_rtx (const_rtx);
extern void print_inline_rtx (FILE *, const_rtx, int);
extern int reg_referenced_p (const_rtx, const_rtx);

extern int regno_clobbered_p (unsigned int, rtx, enum machine_mode, int);
extern int reg_overlap_mentioned_p (const_rtx, const_rtx);

extern int refers_to_regno_p (unsigned int, unsigned int, const_rtx, rtx *);
extern void add_insn_after (rtx, rtx, struct basic_block_def *);

unsigned int
elf32_c816_section_type_flags (tree, const char *, int);






char *cool_page0_cutoff;
static int page0_cutoff = 4;







static rtx addr_regs[4];


static const char *spill_name = "__spill";
static rtx spill_rtx[] = {((void *)0), ((void *)0)};
# 131 "c816.c"
rtx gen_rtx (enum rtx_code code, enum machine_mode mode, ...)
{
  int i;
  const char *fmt;
  rtx rt_val;

  { va_list p; __builtin_va_start(p,mode); { struct Qdmy;
  struct Qdmy;
  struct Qdmy;

  switch (code)
    {
    case CONST_INT:
      rt_val = gen_rtx_CONST_INT (mode, __builtin_va_arg(p,long));
      break;

    case CONST_DOUBLE:
      {
 long arg0 = __builtin_va_arg(p,long);
 long arg1 = __builtin_va_arg(p,long);

        rt_val = gen_rtx_CONST_DOUBLE (mode, arg0, arg1);
      }
      break;

    case REG:
      rt_val = gen_rtx_REG (mode, __builtin_va_arg(p,int));
      break;

    case MEM:
      rt_val = gen_rtx_MEM (mode, __builtin_va_arg(p,rtx));
      break;

    default:
      rt_val = rtx_alloc_stat (code );
      rt_val->mode = mode;

      fmt = (rtx_format[(int) (code)]);
      for (i = 0; i < (rtx_length[(int) (code)]); i++)
 {
   switch (*fmt++)
     {
     case '0':
       break;

     case 'i':
       (((rt_val)->u.fld[i]).rt_int) = __builtin_va_arg(p,int);
       break;

     case 'w':
       ((rt_val)->u.hwint[i]) = __builtin_va_arg(p,long);
       break;

     case 's':
       (((rt_val)->u.fld[i]).rt_str) = __builtin_va_arg(p,char *);
       break;

     case 'e':
     case 'u':
       (((rt_val)->u.fld[i]).rt_rtx) = __builtin_va_arg(p,rtx);
       break;

     case 'E':
       (((rt_val)->u.fld[i]).rt_rtvec) = __builtin_va_arg(p,rtvec);
       break;

     case 'b':
       (((rt_val)->u.fld[i]).rt_bit) = __builtin_va_arg(p,bitmap);
       break;

     case 't':
       (((rt_val)->u.fld[i]).rt_tree) = __builtin_va_arg(p,tree);
       break;

     default:
       fancy_abort ("c816.c", 206, __FUNCTION__);
     }
 }
      break;
    }

  } __builtin_va_end(p); };
  return rt_val;
}






typedef struct _rtx_couple {
   long key;
   rtx elt;
} rtx_couple;
# 236 "c816.c"
static void abort_with_insn(rtx insn, const char *reason, ...)
__attribute__ ((format (printf, 2, 3)));

static void split_const(rtx op, int size, unsigned char *ret_val);
static void split_mem(rtx op, int size, rtx *ret_val);
static void split_reg(rtx op, int size, rtx *ret_val);
static void split_any(rtx op, int size, rtx *ret_val);
static int trunc_if_used_p(rtx x, unsigned int regno);
static rtx next_nnote_nclob_insn(rtx insn);
static rtx next_nnote_nclob_nuse_insn(rtx insn);
static void cancel_insn(rtx insn);
static int find_regs_in_addr(rtx addr, int cur);
static rtx modif_address(rtx mem, unsigned int regno, int modif);
static rtx modif_mem_address(rtx mem, enum machine_mode mode,
int regno, int modif);
static void set_branch_opcode(rtx insn, enum rtx_code code, char *s);
static int compare_rtx_couple(const void *x, const void *y);
static char *xtoimm(unsigned long x, char *s, int nohash);
static int cool_regs_ever_live(int i);
static void output_branch_0_equ(enum rtx_code code, int size,
rtx *op1, rtx *operands, rtx op);
static void output_branch_0(rtx insn, rtx *operands,
enum rtx_code code, rtx op);
static rtx output_logical_1(rtx insn, rtx *ops, int is_dead, int has_auto);
static int is_power_of_2(int n);
static int use_large_frame(rtx op, int size);



static int part_dead_or_set_p(rtx insn, rtx x);



static void
abort_with_insn(rtx insn, const char *reason, ...)
{
   va_list ap;

   error("Assembler output error");
   __builtin_va_start(ap,reason);
   vfprintf(((__getreent())->_stderr), reason, ap);
   __builtin_va_end(ap);
   fputs("\nrtx code is: ", ((__getreent())->_stderr));
   debug_rtx(insn);
   fancy_abort ("c816.c", 280, __FUNCTION__);
}




static void
split_const(rtx op, int size, unsigned char *ret_val)
{
   enum rtx_code code = ((enum rtx_code) (op)->code);
   int i;
   if (code == CONST_INT) {
      long val = ((op)->u.hwint[0]);
      for (i = 0; i < size; i++)
      ret_val[i] = val >> ((size - i) << 3);
      ret_val[size] = val;
      return;
   }
   if (code == CONST_DOUBLE) {
      struct real_value r;
      long val[2] = {0, 0};
      ((r) = *((const struct real_value *) (&(op)->u.rv)));
      if (size > 3)
      real_to_target (val, &(r), mode_for_size (64, MODE_FLOAT, 0));
      else
      ((val[0]) = real_to_target (((void *)0), &(r), mode_for_size (32, MODE_FLOAT, 0)));
      if (size == 2)
      size = 3;
      for (i = size; i > 3; i--)
      ret_val[size - i] = val[0] >> ((i - 4) << 3);
      if (size > 3)
      val[0] = val[1];
      for ( ; i > 0; i--)
      ret_val[size - i] = val[0] >> (i << 3);
      ret_val[size] = val[0];
      return;
   }
   abort_with_insn(op, "Can't compute this constant's value");
}



static void
split_mem(rtx op, int size, rtx *ret_val)
{
   int i;
   if (((enum rtx_code) (op)->code) != MEM)
   abort_with_insn(op, "split_mem called with bad operand");
   if (size == 0) {
      ret_val[0] = op;
      return;
   }
   for (i = size; i >= 0; i--)
   ret_val[i] = modif_mem_address(op, QImode, -1, i);
}



static void
split_reg(rtx op, int size, rtx *ret_val)
{
   int regno = (rhs_regno(op)), i;
   for (i = size; i >= 0; i--)
   ret_val[i] = gen_rtx(REG, QImode, regno + i);
}



static void
split_any(rtx op, int size, rtx *ret_val)
{
   unsigned char val[20];
   int i;
   enum rtx_code code = ((enum rtx_code) (op)->code);

   if (code == REG) {
      split_reg(op, size, ret_val);
      return;
   }
   if (code == MEM) {
      split_mem(op, size, ret_val);
      return;
   }
   if (size == 0) {
      ret_val[0] = op;
      return;
   }
   if (size == 1 && code != CONST_INT && ((rtx_class[(int) (((enum rtx_code) (op)->code))]) == RTX_CONST_OBJ)) {
      ret_val[0] = gen_rtx(HIGH, Pmode, op);
      ret_val[1] = gen_rtx(LO_SUM, Pmode,
      gen_rtx(REG, QImode, ACCU_REG), op);
      return;
   }
   if (code != CONST_INT && code != CONST_DOUBLE)
   abort_with_insn(op, "Bad op to split");
   split_const(op, size, val);
   for (i = 0; i <= size; i++)
   ret_val[i] = gen_rtx(CONST_INT, VOIDmode, val[i]);
}



static int
trunc_if_used_p(rtx x, unsigned int regno)
{
   const char *fmt;
   enum rtx_code code = ((enum rtx_code) (x)->code);
   int i;

   switch (code) {
      case REG:
      return ((rhs_regno(x)) != regno)
      ||
      (((enum machine_mode) (x)->mode) == QImode);
      case SUBREG:
      if ((rhs_regno((((x)->u.fld[0]).rt_rtx))) == regno)

      return ((enum machine_mode) (x)->mode) == QImode && (((x)->u.fld[1]).rt_uint) == 1;



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
   fmt = (rtx_format[(int) (code)]);
   for (i = (rtx_length[(int) (code)]) - 1; i >= 0; i--) {
      if (fmt[i] == 'E') {
         int j;
         for (j = (((((x)->u.fld[i]).rt_rtvec))->num_elem) - 1; j >= 0; j--)
         if (!trunc_if_used_p((((((x)->u.fld[i]).rt_rtvec))->elem[j]), regno))
         return 0;
      } else if (fmt[i] == 'e'
      && !trunc_if_used_p((((x)->u.fld[i]).rt_rtx), regno))
      return 0;
   }
   return 1;
}


static rtx next_nnote_nclob_insn(rtx insn)
{
   rtx next = next_nonnote_insn(insn);
   while (next && ((enum rtx_code) (next)->code) == INSN
   && ((enum rtx_code) ((((next)->u.fld[5]).rt_rtx))->code) == CLOBBER)
   next = next_nonnote_insn(next);
   return next;
}


static rtx next_nnote_nclob_nuse_insn(rtx insn)
{
   rtx next = next_nonnote_insn(insn);
   while (next && ((enum rtx_code) (next)->code) == INSN
   && (((enum rtx_code) ((((next)->u.fld[5]).rt_rtx))->code) == CLOBBER
   || ((enum rtx_code) ((((next)->u.fld[5]).rt_rtx))->code) == USE))
   next = next_nonnote_insn(next);
   return next;
}




static void cancel_insn(rtx insn)
{
   (((insn)->u.fld[5]).rt_rtx) = 0;
   (((insn)->u.fld[7]).rt_rtx) = 0;
   ((insn)->code = (NOTE));
   (((insn)->u.fld[4]).rt_int) = NOTE_INSN_DELETED;
   (((insn)->u.fld[3]).rt_str) = 0;
}



static int
find_regs_in_addr(rtx addr, int cur)
{
   switch (((enum rtx_code) (addr)->code)) {
      case REG:
      addr_regs[cur] = addr;
      return cur + 1;
      case PLUS:
      cur = find_regs_in_addr((((addr)->u.fld[0]).rt_rtx), cur);
      return find_regs_in_addr((((addr)->u.fld[1]).rt_rtx), cur);
      case POST_INC:
      case PRE_DEC:
      return find_regs_in_addr((((addr)->u.fld[0]).rt_rtx), cur);
      case const:
      case CONST_INT:
      case SYMBOL_REF:
      return cur;
      default:
      break;
   }
   abort_with_insn(addr, "Error finding regs in addr");
   return 0;
}



static rtx
modif_address(rtx addr, unsigned int regno, int modif)
{
   enum rtx_code code;
   if (modif == 0)
      return addr;

   code = ((enum rtx_code) (addr)->code);

   if (code == REG && ((rhs_regno(addr)) == regno || regno == (unsigned int)(-1)))
   {
      return gen_rtx(PLUS, Pmode, addr, gen_rtx(CONST_INT, VOIDmode, modif));
   }

   if (regno == (unsigned int)(-1))
   {
      rtx op1, op2;
      if (((enum rtx_code) (addr)->code) == const)
         addr = (((addr)->u.fld[0]).rt_rtx);

      switch (((enum rtx_code) (addr)->code))
      {
         case CONST_INT:
            return gen_rtx(CONST_INT, VOIDmode, ((addr)->u.hwint[0]) + modif);

         case SYMBOL_REF:
            return gen_rtx(const, Pmode, gen_rtx(PLUS, Pmode, addr, gen_rtx(CONST_INT, VOIDmode, modif)));

         case PLUS:
            if (((enum rtx_code) ((((addr)->u.fld[0]).rt_rtx))->code) == CONST_INT)
               op1 = (((addr)->u.fld[1]).rt_rtx), op2 = (((addr)->u.fld[0]).rt_rtx);
            else
               op1 = (((addr)->u.fld[0]).rt_rtx), op2 = (((addr)->u.fld[1]).rt_rtx);

            if (((enum rtx_code) (op2)->code) != CONST_INT || ((enum rtx_code) (op1)->code) != SYMBOL_REF)
               break;

            return gen_rtx(const, Pmode, gen_rtx(PLUS, Pmode, op1, gen_rtx(CONST_INT, VOIDmode, ((op2)->u.hwint[0]) + modif)));

         default:

            break;
      }
   }

   if (code == PLUS)
   {
      rtx r, off;
      if (((enum rtx_code) ((((addr)->u.fld[0]).rt_rtx))->code) == REG)
         r = (((addr)->u.fld[0]).rt_rtx), off = (((addr)->u.fld[1]).rt_rtx);
      else
         r = (((addr)->u.fld[1]).rt_rtx), off = (((addr)->u.fld[0]).rt_rtx);
      if (((enum rtx_code) (r)->code) == REG
      && ((rhs_regno(r)) == regno || regno == (unsigned int)(-1))) {
         rtx op1, op2;
         if (((enum rtx_code) (off)->code) == const)
         off = (((off)->u.fld[0]).rt_rtx);
         switch (((enum rtx_code) (off)->code)) {
            case CONST_INT:
            return gen_rtx(PLUS, Pmode, r,
            gen_rtx(CONST_INT, VOIDmode, ((off)->u.hwint[0]) + modif));
            case SYMBOL_REF:
            return gen_rtx(PLUS, Pmode, r,
            gen_rtx(const, Pmode,
            gen_rtx(PLUS, Pmode, off,
            gen_rtx(CONST_INT,
            VOIDmode, modif))));
            case PLUS:
            if (((enum rtx_code) ((((off)->u.fld[0]).rt_rtx))->code) == CONST_INT)
            op1 = (((addr)->u.fld[1]).rt_rtx), op2 = (((addr)->u.fld[0]).rt_rtx);
            else
            op1 = (((addr)->u.fld[0]).rt_rtx), op2 = (((addr)->u.fld[1]).rt_rtx);
            if (((enum rtx_code) (op2)->code) != CONST_INT)
            break;
            return gen_rtx(PLUS, Pmode, r,
            gen_rtx(const, Pmode,
            gen_rtx(PLUS, Pmode, op1,
            gen_rtx(CONST_INT, VOIDmode,
            ((op2)->u.hwint[0]) + modif))));
            default:

            break;
         }
      }
   }



   return addr;
}




static rtx
modif_mem_address(rtx mem, enum machine_mode mode, int regno, int modif)
{
   if (((enum rtx_code) (mem)->code) != MEM)
   return mem;
   return gen_rtx(MEM, mode,
   modif_address((((mem)->u.fld[0]).rt_rtx), regno, modif));
}


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
      abort_with_insn(insn, "Bad comparison code: %s", (rtx_name[(int) (code)]));
   }
}


static int
compare_rtx_couple(const void *x, const void *y)
{
   rtx_couple *a = (rtx_couple *) x;
   rtx_couple *b = (rtx_couple *) y;
   return a->key == b->key
   ? 0
   : a->key < b->key ? -1 : 1;
}


static char *
xtoimm(unsigned long x, char *s, int nohash)
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


static int
cool_regs_ever_live(int i)
{

   if(



   (i == RAM_IDX_3) || (i == RAM_IDX_3 + 1)
   )
   return 1;






   return regs_ever_live[i];
}


static int
is_power_of_2(int n)
{
   return (n & (n-1)) == 0;
}



static int
use_large_frame(rtx op, int size)
{
   if (((enum rtx_code) (op)->code) == MEM) {
      rtx tem = (((op)->u.fld[0]).rt_rtx);
      if (((enum rtx_code) (tem)->code) == const)
      tem = (((tem)->u.fld[0]).rt_rtx);
      if (((enum rtx_code) (tem)->code) == PLUS) {
         rtx reg = (((tem)->u.fld[0]).rt_rtx);
         rtx off = (((tem)->u.fld[1]).rt_rtx);
         if (((enum rtx_code) (off)->code) == REG) {
            rtx t = reg;
            reg = off;
            off = t;
         }
         if (((enum rtx_code) (reg)->code) == REG
         && (rhs_regno(reg)) == HARD_SP_REG
         && ((enum rtx_code) (off)->code) == CONST_INT
         && ((off)->u.hwint[0]) + size - 1 > 255) {
            return 1;
         }
      }
   }
   return 0;
}




static int
part_dead_or_set_p (rtx insn, rtx x)
{
   int regno, last_regno;
   int i;


   if (((enum rtx_code) (x)->code) == CC0)
   return 1;

   if (((enum rtx_code) (x)->code) != REG)
   fancy_abort ("c816.c", 729, __FUNCTION__);

   regno = (rhs_regno(x));


   if( (regno == HARD_SP_REG) || (regno == HARD_SP_REG + 1)
   || (regno == RAM_IDX_2) || (regno == RAM_IDX_2 + 1))



   return 0;

   last_regno = (regno >= FIRST_PSEUDO_REGISTER ? regno
   : regno + HARD_REGNO_NREGS (regno, ((enum machine_mode) (x)->mode)) - 1);

   for (i = regno; i <= last_regno; i++)
   if (dead_or_set_regno_p (insn, i))
   return 1;

   return 0;
}


void
override_options(void)
{
   if (cool_page0_cutoff) {
      char *res;
      long val = strtol(cool_page0_cutoff, &res, 0);
      if (!strcmp(cool_page0_cutoff, "none"))
      page0_cutoff = 0;
      else if (!strcmp(cool_page0_cutoff, "all"))
      page0_cutoff = -1;
      else if (*res || val < 0)
      error ("bad value `%s' for -mpage0-mvs switch, "
      "acceptable values: all | none | <number>",
      cool_page0_cutoff);
      else
      page0_cutoff = val;
   }
}



unsigned int
elf32_c816_section_type_flags (decl, name, reloc)
tree decl;
const char *name;
int reloc;
{
   unsigned int flags;

   flags = default_section_type_flags (decl, name, reloc);

   if( (!(flags & 0x02000))
   &&(!strncmp(name, ".page0_bss",9))
   )
   flags |= 0x02000;

   return flags;
}





int
cool_const_address_p(rtx x, int offset, rtx reg)
{
   switch (((enum rtx_code) (x)->code)) {
      case LABEL_REF:
      return !offset;
      case CONST_INT:

      if (reg != ((void *)0) && (rhs_regno(reg)) == HARD_SP_REG)

      return 1;





      return ((x)->u.hwint[0]) >= 0 && ((x)->u.hwint[0]) <= 255;

      case SYMBOL_REF:

      return (((x))->volatil);
      case const:
      return cool_const_address_p((((x)->u.fld[0]).rt_rtx), offset, reg);
      case PLUS:
      return cool_const_address_p((((x)->u.fld[0]).rt_rtx), offset, ((void *)0))
      && cool_const_address_p((((x)->u.fld[1]).rt_rtx), offset, ((void *)0));
      default:

      break;
   }
   return 0;
}
# 842 "c816.c"
int
cool_valid_attribute(tree, tree, tree, tree);

int
cool_valid_attribute(decl, attributes, attr, args)
tree decl;
tree attributes __attribute__ ((__unused__));
tree attr;
tree args;
{
   if (args != (tree) ((void *)0))
   return 0;

   if (is_attribute_p ("interrupt_handler", attr))
   return ((enum tree_code) (decl)->base.code) == FUNCTION_DECL;

   if (is_attribute_p ("extra_output", attr))
   {
      pragma_output = 1;
      return 1;
   }

   if (is_attribute_p ("page_0", attr)
   && (((decl)->base.static_flag) || ((decl)->decl_common.decl_flag_2))) {
      if (lookup_attribute ("indirect",

      ((decl)->decl_common.attributes)) != (tree) ((void *)0))



      {
         error("Cannot specify both page_0 and indirect attributes");
         return 0;
      }
      ((decl)->decl_with_vis.section_name) = ((decl)->decl_common.initial) != 0
      ? build_string (12, ".page0_data")
      : build_string (11, ".page0_bss");
      ((decl)->decl_with_vis.common_flag) = 0;
      return 1;
   }
   if (is_attribute_p ("indirect", attr)
   && (((decl)->base.static_flag) || ((decl)->decl_common.decl_flag_2)))
   if (lookup_attribute ("page_0",

   ((decl)->decl_common.attributes)) != (tree) ((void *)0))



   {
      error("Cannot specify both page_0 and indirect attributes");
      return 0;
   }
   return 1;
   return 0;
}




void
cool_encode_section_info(tree decl)
{
   if (((enum tree_code) (decl)->base.code) == FUNCTION_DECL) {
      ((((((((decl)->decl_with_rtl.rtl ? (decl)->decl_with_rtl.rtl : (make_decl_rtl (decl), (decl)->decl_with_rtl.rtl)))->u.fld[0]).rt_rtx)))->volatil) = 1;
      return;
   }
   if (((enum tree_code) (decl)->base.code) == VAR_DECL
   && (((decl)->base.static_flag) || ((decl)->decl_common.decl_flag_2))) {
      int size = 0;
      tree a = lookup_attribute ("indirect",

      ((decl)->decl_common.attributes));



      if (a != (tree) ((void *)0))
      return;

      if (((decl)->base.readonly_flag))
      return;
      a = lookup_attribute ("page_0",

      ((decl)->decl_common.attributes));



      if (a == (tree) ((void *)0)
      && ((((decl)->common.type))->type.size) != (tree) ((void *)0)
      && ((enum tree_code) (((((decl)->common.type))->type.size))->base.code) == INTEGER_CST)
      size = (((((((decl)->common.type))->type.size))->int_cst.int_cst).low)
      / BITS_PER_UNIT;
      if (a != (tree) ((void *)0)
      || (page0_cutoff != 0
      && (page0_cutoff == -1
      || (size > 0 && size <= page0_cutoff)))) {
         ((((((((decl)->decl_with_rtl.rtl ? (decl)->decl_with_rtl.rtl : (make_decl_rtl (decl), (decl)->decl_with_rtl.rtl)))->u.fld[0]).rt_rtx)))->volatil) = 1;

         if (((decl)->decl_with_vis.section_name) == (tree) ((void *)0)
         || ((enum tree_code) (((decl)->decl_with_vis.section_name))->base.code) != STRING_CST
         || strncmp(((const char *)((((decl)->decl_with_vis.section_name))->string.str)),
         ".page0_", 7) != 0)
         ((decl)->decl_with_vis.section_name) = ((decl)->decl_common.initial) != 0
         ? build_string (12, ".page0_data")
         : build_string (11, ".page0_bss");

         ((decl)->decl_with_vis.common_flag) = 0;
      }
   }
}







int
cool_sa_size(void)
{
   int size = 0;
   int i;

   for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
   if ((!fixed_regs[i] && !call_used_regs[i] && cool_regs_ever_live(i))
   || (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1)
   )
   size++;
   return size;
}
# 979 "c816.c"
void cool_output_function_prologue( stream, size)
FILE *stream;
long size __attribute__ ((__unused__));




{
   int i;
   int frame = get_frame_size(), sa = cool_sa_size();
   int sr_start = current_function_outgoing_args_size + frame;

   fprintf(stream, "\n;\t/* function prologue %s */\n",
   current_function_name);
   fprintf(stream, "; frame_pointer_needed = %d\n"
   "; current_function_outgoing_args_size = %d\n"
   "; cool_sa_size() = %d\n"
   "; get_frame_size() = %d\n"
   "; Live registers:\n",
   ((&x_rtl)->frame_pointer_needed), current_function_outgoing_args_size,
   sa, frame);

   for (i = 0; i < FIRST_PSEUDO_REGISTER; i++)
   if (cool_regs_ever_live(i))
   fprintf(stream, ";  %s (%s, %s)\n", reg_names[i],
   fixed_regs[i] ? "fixed" : "_",
   call_used_regs[i] ? "call_clobbered" : "_");
   if ( write_symbols == DBX_DEBUG) {

      fprintf(stream, "\t.stabs  \"%s%%fp:c=i%d\",%d,0,0,0\n",
      current_function_name, ((&x_rtl)->frame_pointer_needed) ? 1 : 0,
      N_GSYM);
      fprintf(stream, "\t.stabs  \"%s%%fph:c=i%d\",%d,0,0,0\n",
      current_function_name, cool_regs_ever_live(HARD_FP_REG) ? 1 : 0,
      N_GSYM);
      fprintf(stream, "\t.stabs  \"%s%%fpl:c=i%d\",%d,0,0,0\n",
      current_function_name, cool_regs_ever_live(HARD_FP_REG + 1) ? 1 : 0,
      N_GSYM);
      fprintf(stream, "\t.stabs  \"%s%%iph:c=i%d\",%d,0,0,0\n",
      current_function_name, cool_regs_ever_live(ROM_IDX) ? 1 : 0,
      N_GSYM);
      fprintf(stream, "\t.stabs  \"%s%%ipl:c=i%d\",%d,0,0,0\n",
      current_function_name, cool_regs_ever_live(ROM_IDX + 1) ? 1 : 0,
      N_GSYM);
      fprintf(stream, "\t.stabs  \"%s%%sa:c=i%d\",%d,0,0,0\n",
      current_function_name, sa,
      N_GSYM);
      fprintf(stream, "\t.stabs  \"%s%%fr:c=i%d\",%d,0,0,0\n",
      current_function_name, frame,
      N_GSYM);
      fprintf(stream, "\t.stabs  \"%s%%oa:c=i%d\",%d,0,0,0\n",
      current_function_name, current_function_outgoing_args_size,
      N_GSYM);
   }

   if (pragma_interrupt) {
      fprintf(stream, "\t;Save interrupt context\n");




      if( !TARGET_SOFTCALL || ( cool_regs_ever_live( 5 ) && !fixed_regs[ 5 ] ) ) {




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
         if ((!fixed_regs[i] && cool_regs_ever_live(i))
            || (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1)
         )
         fprintf(stream, "\tMOVE   -(%%sp,1),%s\n", reg_names[i]);
   }

   if (sr_start + sa > 0) {


      if (!pragma_interrupt) {
         for (i = FIRST_PSEUDO_REGISTER - 1; i >= 0; i--)
         if ((!fixed_regs[i] && !call_used_regs[i] && cool_regs_ever_live(i))
         || (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1)
         )
         fprintf(stream, "\tMOVE   -(%%sp,1),%s\n", reg_names[i]);
      }
      if (sr_start > 0) {
         if ((sr_start & 0xff) == 0) {

            fprintf(stream, "\tSUBS %%i3h,#%d\n", (sr_start >> 8) & 0xff);
         } else {
            if (TARGET_SAFESTACK || sr_start <= 254) {


               int space = sr_start;
               if(space & 0xff00)
               {
                  fprintf(stream, "\tSUBS   %%i3h,#%d\n", (sr_start >> 8) & 0xff);
                  space&=0xff;
               }
               while (space > 0) {
                  fprintf(stream, "\tMOVE   %%a,-(%%sp,%d)\n",
                  space > 127 ? 127 : space);
                  space -= 127;
               }
# 1107 "c816.c"
            } else {
               fprintf(stream, "\tSUBS   %%i3l,#%d\n", sr_start & 0xff);
               fprintf(stream, "\tSUBSC  %%i3h,#%d\n", (sr_start >> 8) & 0xff);
            }
         }
      }
      if (((&x_rtl)->frame_pointer_needed))
      fputs("\tMOVE   %i2h,%i3h\n\tMOVE   %i2l,%i3l\n", stream);
   }
   fputs(";\t/* end of prologue */\n\n", stream);
}


void cool_output_function_epilogue( stream, size )
FILE *stream;
long size __attribute__ ((__unused__));




{
   int i;
   int frame = get_frame_size(), sa = cool_sa_size();
   int sr_start = current_function_outgoing_args_size + frame;

   fprintf(stream, "\n;\t/* function epilogue %s */\n",
   current_function_name);
   if (sr_start > 0) {
      if ((sr_start & 0xff) == 0) {

         fprintf(stream, "\tADD  %%i3h,#%d\n", (sr_start >> 8) & 0xff);
      } else {
         if (TARGET_SAFESTACK || sr_start <= 254) {


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
# 1167 "c816.c"
         } else {
            fprintf(stream, "\tADD  %%i3l,#%d\n", sr_start & 0xff);
            fprintf(stream, "\tADDC %%i3h,#%d\n", (sr_start >> 8) & 0xff);
         }
      }
   }
   if (pragma_interrupt) {
      fprintf(stream, "\t;Restore interrupt context\n");




      if( !TARGET_SOFTCALL || ( cool_regs_ever_live( 5 ) && !fixed_regs[ 5 ] ) ) {
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
         if ((!fixed_regs[i] && cool_regs_ever_live(i))
            || (optimize == 0 && i >= HARD_FP_REG && i <= HARD_FP_REG + 1)
         )
         fprintf(stream, "\tMOVE   %s,(%%sp,1)+\n", reg_names[i]);

         if (TARGET_SOFTCALL)
         fputs("\tRETS\n", stream);
         else
         fputs("\tRET\n", stream);



   } else {
      if (sa > 0) {
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


   spill_rtx[0] = spill_rtx[1] = ((void *)0);

   pragma_interrupt = 0;
}







void
asm_file_start(FILE *stream)
{
   time_t the_time;
   time(&the_time);
   fprintf(stream, "; Compiled by GCC on %s\n", ctime(&the_time));
   fputs("\t.cpu  816\n"
   "\t.altregsyn  1\n"
   "\t.include \"msc816.inc\"\n\n", stream);
}


void
asm_file_end(FILE *stream)
{
   fputs("; End of file\n", stream);
}

extern int do_not_use_isprint_with_safe_ctype;


void
asm_output_ascii(FILE *stream, unsigned char *ptr, int len)
{
   int i = 0, p = 0;
   unsigned int c;
   fputs("\t.ascii \"", stream);
   do {
      c = ptr[i++];
      if (c < 0x80 && do_not_use_isprint_with_safe_ctype) {
         switch (c) {
            case '"': fputs("\\\"", stream); p += 2; break;
            case '\\': fputs("\\\\", stream); p += 2; break;
            default:
            fputc(c, stream); p++;
         }
      } else {
         switch (c) {
            case '\b': fputs("\\b", stream); p += 2; break;
            case '\f': fputs("\\f", stream); p += 2; break;
            case '\n': fputs("\\n", stream); p += 2; break;
            case '\r': fputs("\\r", stream); p += 2; break;
            case '\t': fputs("\\t", stream); p += 2; break;
            case '\v': fputs("\\v", stream); p += 2; break;
            default:
            fprintf(stream,"\\%03o",c); p += 4;
         }
      }
      if (p >= 70 && i < len) {
         fputs("\"\n\t.ascii \"", stream);
         p = 0;
      }
   } while (i < len);
   fputs("\"\n", stream);
}
# 1311 "c816.c"
void
print_operand(FILE *stream, rtx x, int code)
{
   char s[16];
   switch (code) {
      case 0:

      break;
      case '%':
      putc_unlocked ('%', stream);
      return;
      case 'o':

      switch(((enum rtx_code) (x)->code)) {
         case PLUS:
         fputs("ADD", stream);
         break;
         case ,:
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

      if (((enum rtx_code) (x)->code) == MEM) {
         putc_unlocked ('"', stream);
         print_operand_address(stream, (((x)->u.fld[0]).rt_rtx));
         putc_unlocked ('"', stream);
         return;
      }
      break;
      case 'c':

      if (((enum rtx_code) (x)->code) != CONST_INT)
      abort_with_insn(x, "Bad operator code for letter c");
      fputs(xtoimm(((x)->u.hwint[0]), s, 1), stream);
      return;
      case 't': {

         unsigned long l;
         struct real_value r;
         if (((enum rtx_code) (x)->code) != CONST_DOUBLE)
         abort_with_insn(x, "Bad operator code for letter c");
         ((r) = *((const struct real_value *) (&(x)->u.rv)));
         ((l) = real_to_target (((void *)0), &(r), mode_for_size (32, MODE_FLOAT, 0)));
         fputs(xtoimm(l >> 8, s, 1), stream);
         return;
      }
      case 's': {

         unsigned long l;
         struct real_value r;
         if (((enum rtx_code) (x)->code) != CONST_DOUBLE)
         abort_with_insn(x, "Bad operator code for letter c");
         ((r) = *((const struct real_value *) (&(x)->u.rv)));
         ((l) = real_to_target (((void *)0), &(r), mode_for_size (32, MODE_FLOAT, 0)));
         fputs(xtoimm(l, s, 1), stream);
         return;
      }
      case 'd' : {

         if (((enum rtx_code) ((((x)->u.fld[0]).rt_rtx))->code) == PLUS) {
            print_operand_address(stream,(((x)->u.fld[0]).rt_rtx));
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
   switch (((enum rtx_code) (x)->code)) {
      case REG:
      fputs(reg_names[(rhs_regno(x))], stream);
      break;
      case MEM:
      print_operand_address(stream, (((x)->u.fld[0]).rt_rtx));
      break;
      case HIGH:
      fputs("#HIWORD(", stream);
      output_addr_const(stream, (((x)->u.fld[0]).rt_rtx));
      fputs(")", stream);
      break;
      case LO_SUM:
      fputs("#LOWORD(", stream);
      output_addr_const(stream, (((x)->u.fld[1]).rt_rtx));
      fputs(")", stream);
      break;
      case CONST_INT:
      fputs(xtoimm(((x)->u.hwint[0]), s, 0), stream);
      break;
      case CONST_DOUBLE: {
         struct real_value r;
         char s[20];
         ((r) = *((const struct real_value *) (&(x)->u.rv)));
         REAL_VALUE_TO_DECIMAL(r, "%e", s);
         fputs(s, stream);
         break;
      }
      default:
      output_addr_const(stream, x);
   }
}
# 1434 "c816.c"
void
print_operand_address(FILE *stream, rtx x)
{
   rtx op0, op1;

   if (((rtx_class[(int) (((enum rtx_code) (x)->code))]) == RTX_CONST_OBJ)) {
      output_addr_const(stream, x);
      return;
   }
   switch(((enum rtx_code) (x)->code)) {
      case REG:
      fprintf(stream, "(%%i%d)", ((rhs_regno(x)) - RAM_IDX_0) >> 1);
      break;
      case PRE_DEC:
      fprintf(stream, "-(%%i%d)", ((rhs_regno((((x)->u.fld[0]).rt_rtx))) - RAM_IDX_0) >> 1);
      break;
      case POST_INC:
      fprintf(stream, "(%%i%d)+", ((rhs_regno((((x)->u.fld[0]).rt_rtx))) - RAM_IDX_0) >> 1);
      break;
      case PLUS:
      op0 = (((x)->u.fld[0]).rt_rtx), op1 = (((x)->u.fld[1]).rt_rtx);
      if (((rtx_class[(int) (((enum rtx_code) (op0)->code))]) == RTX_CONST_OBJ) && ((rtx_class[(int) (((enum rtx_code) (op1)->code))]) == RTX_CONST_OBJ)) {

         output_addr_const(stream, x);
         break;
      }
      if (((rtx_class[(int) (((enum rtx_code) (op0)->code))]) == RTX_CONST_OBJ)) {
         rtx tem = op0;
         op0 = op1;
         op1 = tem;
      }
      if (!((rtx_class[(int) (((enum rtx_code) (op1)->code))]) == RTX_CONST_OBJ) || ((enum rtx_code) (op0)->code) != REG)
      abort_with_insn(x, "PRINT_OPERAND_ADDRESS, illegal plus");
      fprintf(stream, "(%%i%d,", ((rhs_regno(op0)) - RAM_IDX_0) >> 1);
      output_addr_const(stream, op1);
      fputs(")", stream);
      break;
      default:
      abort_with_insn(x, "PRINT_OPERAND_ADDRESS, illegal insn");
   }
}



int
immediate_inc_operand( rtx op, enum machine_mode mode __attribute__ ((__unused__)))

{
   return (((enum rtx_code) (op)->code) == CONST_INT
   && (((op)->u.hwint[0]) == 1 || ((op)->u.hwint[0]) == -1));
}


int
data_reg_operand(rtx op, enum machine_mode mode)
{
   if (((enum rtx_code) (op)->code) != REG || (rhs_regno(op)) != REG_0)
   return 0;
   return register_operand(op, mode);
}


int
data_reg1_operand(rtx op, enum machine_mode mode)
{
   if (((enum rtx_code) (op)->code) != REG || (rhs_regno(op)) != REG_1)
   return 0;
   return register_operand(op, mode);
}


int
data_reg2_operand(rtx op, enum machine_mode mode)
{
   if (((enum rtx_code) (op)->code) != REG || (rhs_regno(op)) != REG_2)
   return 0;
   return register_operand(op, mode);
}


int
data_reg3_operand(rtx op, enum machine_mode mode)
{
   if (((enum rtx_code) (op)->code) != REG || (rhs_regno(op)) != REG_3)
   return 0;
   return register_operand(op, mode);
}


int
romidx_operand(rtx op, enum machine_mode mode)
{
   if (((enum rtx_code) (op)->code) != REG || (rhs_regno(op)) != ROM_IDX)
   return 0;
   return register_operand(op, mode);
}


int
commutative_operator(rtx op, enum machine_mode mode)
{
   if (((enum machine_mode) (op)->mode) != mode || ((enum rtx_code) (op)->code) == MULT)
   return 0;
   return ((rtx_class[(int) (((enum rtx_code) (op)->code))]) == 'c');
}


int
logical_operator(rtx op, enum machine_mode mode)
{
   enum rtx_code code = ((enum rtx_code) (op)->code);
   if (((enum machine_mode) (op)->mode) != mode)
   return 0;
   return code == , || code == IOR || code == XOR;
}



void
find_hidden_accu(rtx insn, rtx *operands)
{
   if ((((enum rtx_code) (operands[1])->code) == REG
   && (rhs_regno(operands[1])) == ACCU_REG)
   || (((enum rtx_code) (operands[2])->code) == REG
   && (rhs_regno(operands[2])) == ACCU_REG))
   return;
   if (op_in_accu_p(operands[1], insn)) {
      operands[1] = gen_rtx(REG, QImode, ACCU_REG);
      return;
   }
   if (op_in_accu_p(operands[2], insn))
   operands[2] = gen_rtx(REG, QImode, ACCU_REG);
}





const char *
output_left_shift(rtx insn, rtx *operands, int signedp)
{
   enum machine_mode mode = ((enum machine_mode) (operands[0])->mode);
   rtx ops[4];

   if( pragma_output )
   output_asm_insn( ";in output_left_shift", operands );

   if (((enum rtx_code) (operands[1])->code) == CONST_INT
   && ((enum rtx_code) (operands[2])->code) == CONST_INT) {

      unsigned int uval = ((operands[1])->u.hwint[0]), cnt = ((operands[2])->u.hwint[0]);
      operands[1] = gen_rtx(CONST_INT, VOIDmode, uval << cnt);
      return output_move(insn, operands);
   }

   operands[3] = operands[0];
   if (mode == HImode
   && only_use_trunc_p(insn, operands[0])
   && ((((enum machine_mode) (operands[1])->mode) == QImode
   || ((enum machine_mode) (operands[1])->mode) == VOIDmode)
   || (((enum rtx_code) (operands[2])->code) == CONST_INT
   && ((operands[2])->u.hwint[0]) < 8))) {
      rtx nexti = next_nnote_nclob_nuse_insn(insn);
      rtx body = nexti && ((enum rtx_code) (nexti)->code) == INSN ? (((nexti)->u.fld[5]).rt_rtx) : ((void *)0);
      if (body && ((enum rtx_code) (body)->code) == SET
      && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
      && part_dead_or_set_p(nexti, operands[0])
      && (((enum rtx_code) (operands[2])->code) == CONST_INT
      || !reg_overlap_mentioned_p(operands[2], (((body)->u.fld[0]).rt_rtx)))
      && ((((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == SUBREG
      && (rhs_regno(((((((body)->u.fld[1]).rt_rtx))->u.fld[0]).rt_rtx))) == (rhs_regno(operands[0])))
      || (((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG
      && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == (rhs_regno(operands[0])) + 1))) {
         operands[0] = (((body)->u.fld[0]).rt_rtx);
         cancel_insn(nexti);
         if (((enum rtx_code) (operands[0])->code) == REG
         && (rhs_regno(operands[0])) == ACCU_REG) {
            nexti = next_nnote_nclob_nuse_insn(nexti);
            if (nexti && ((enum rtx_code) (nexti)->code) == INSN) {
               body = (((nexti)->u.fld[5]).rt_rtx);
               if (((enum rtx_code) (body)->code) == SET
               && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
               && (((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG
               && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == ACCU_REG)
               && part_dead_or_set_p(nexti, operands[0])) {
                  operands[0] = (((body)->u.fld[0]).rt_rtx);
                  cancel_insn(nexti);
               }
            }
         }
      } else
      operands[0] = gen_rtx(REG, QImode, (rhs_regno(operands[0])) + 1);
      mode = QImode;
   }
   if (mode == QImode) {
      if (((enum rtx_code) (operands[1])->code) != CONST_INT
      && ((enum machine_mode) (operands[1])->mode) != QImode) {
         rtx part[8];
         int size = ((unsigned short) mode_size[((enum machine_mode) (operands[1])->mode)]) - 1;
         split_any(operands[1], size, part);
         operands[1] = part[size];
      }
      if (((enum rtx_code) (operands[2])->code) == CONST_INT) {
         if (((enum rtx_code) (operands[0])->code) == REG
         && ((operands[2])->u.hwint[0]) == 1)
         return "SHL %0,%1";
         operands[3] = ((void *)0);
         if (((enum rtx_code) (operands[0])->code) != REG
         || (rhs_regno(operands[0])) != ACCU_REG)
         operands[3] = operands[0];
         if (((operands[2])->u.hwint[0]) == 1)
         return "SHL %%a,%1";
         if (((enum rtx_code) (operands[1])->code) == REG
         && ((rhs_regno(operands[1])) == ACCU_REG
         || part_dead_or_set_p(insn, operands[1])))
         output_asm_insn("MSHL   %1,%2", operands);
         else
         output_asm_insn("MOVE   %%a,%1\n\tMSHL %%a,%2", operands);
         if (operands[3])
         return "MOVE   %0,%%a";
         return "";
      }
      if (((enum rtx_code) (operands[0])->code) != REG
      || (rhs_regno(operands[0])) == ACCU_REG) {
         rtx tem = operands[3];
         operands[3] = operands[0];
         if (((enum rtx_code) (operands[1])->code) == REG
         && part_dead_or_set_p(insn, operands[1]))
         operands[0] = operands[1];
         else {
            if (((enum machine_mode) (tem)->mode) == QImode)
            operands[0] = tem;
            else {
               rtx part[8];
               int size = ((unsigned short) mode_size[((enum machine_mode) (tem)->mode)]) - 1;
               split_reg(tem, size, part);
               operands[0] = part[size];
            }
         }
      } else
      operands[3] = ((void *)0);
      if (((enum rtx_code) (operands[1])->code) != REG
      || (rhs_regno(operands[1])) != (rhs_regno(operands[0])))
      output_asm_insn("MOVE   %0,%1", operands);
      output_asm_insn("lshlqi3   %m0,%m2", operands);
      if (operands[3])
      return "MOVE   %3,%0";
      return "";
   }
   if (mode == HImode) {
      rtx reg0[2];
      split_reg(operands[0], 1, reg0);
      if (((enum rtx_code) (operands[2])->code) == CONST_INT) {
         rtx op1[2];
         int count = ((operands[2])->u.hwint[0]);
         if (((enum machine_mode) (operands[1])->mode) == QImode) {
            operands[3] = reg0[1];
            if (count == 1) {
               if (signedp) {
                  if (((enum rtx_code) (operands[1])->code) != REG
                  || (rhs_regno(operands[1])) != (rhs_regno(operands[0])))
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
            if (((enum rtx_code) (operands[1])->code) != REG
            || (rhs_regno(operands[1])) != (rhs_regno(operands[0])))
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
            if (((enum rtx_code) (operands[1])->code) != REG
            || (rhs_regno(op1[1])) != (rhs_regno(reg0[0]))) {
               ops[0] = reg0[0], ops[1] = op1[1];
               output_asm_insn("MOVE   %0,%1", ops);
            }
            if (count == 8)
            return "MOVE   %3,#0";
            operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 8);
            return "MOVE   %3,#0\n\t"
            "MSHL %0,%2\n\tMOVE  %0,%%a";
         }
         if (((enum rtx_code) (operands[1])->code) != REG
         || (rhs_regno(operands[1])) != (rhs_regno(operands[0]))) {
            ops[0] = operands[0];
            ops[1] = operands[1];
            output_asm_insn(output_move(insn, ops), ops);
         }
         operands[1] = reg0[1];
         return "lshlihi3  %m0,%m1,%c2";
      }
      if (((enum machine_mode) (operands[1])->mode) == QImode) {
         if (((enum rtx_code) (operands[1])->code) != REG
         || (rhs_regno(operands[1])) != (rhs_regno(reg0[1]))) {
            ops[0] = reg0[1], ops[1] = operands[1];
            output_asm_insn("MOVE   %0,%1", ops);
         }
         if (signedp)
         output_asm_insn("MOVE   %0,%1\n\tMULA  %0,#1", reg0);
         else
         output_asm_insn("MOVE   %0,#0", operands);
      } else if (((enum rtx_code) (operands[1])->code) != REG
      || (rhs_regno(operands[1])) != (rhs_regno(operands[0]))) {
         ops[0] = operands[0], ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
      }
      operands[1] = reg0[1];
      return "lshlhi3   %m0,%m1,%m2";
   }

   if (((enum rtx_code) (operands[2])->code) == CONST_INT) {
      int count = ((operands[2])->u.hwint[0]), i;
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
         ops[1] = (const_int_rtx[64]);
         for (i = 0; i <= 3 && i < count; i++) {
            ops[0] = op0[3 - i];
            output_asm_insn(output_move(insn, ops), ops);
         }
         return "";
      }
      if (((enum rtx_code) (operands[1])->code) != REG
      || (rhs_regno(operands[1])) != REG_0) {
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
   if (((enum rtx_code) (ops[1])->code) != REG) {
      debug_rtx(ops[1]);
      output_asm_insn("MOVE   %%a,%1\n\tMOVE -(%%sp),%%a", ops);
   } else
   output_asm_insn("MOVE   -(%%sp),%1", ops);
   if (((enum rtx_code) (operands[1])->code) == MEM) {
      int nregs = find_regs_in_addr((((operands[1])->u.fld[0]).rt_rtx), 0);
      int i, found = 0;
      for (i = 0; !found && i < nregs; i++)
      found = (rhs_regno(addr_regs[i])) == HARD_SP_REG;
      if (found)
      operands[1] = modif_mem_address(operands[1], ((enum machine_mode) (operands[1])->mode),
      HARD_SP_REG, 1);
   }
   output_asm_insn(output_move(insn, operands), operands);
   return "lshlsi3";
}





const char *
output_right_shift(rtx insn, rtx *operands, int signedp)
{
   enum machine_mode mode = ((enum machine_mode) (operands[0])->mode);
   rtx ops[4];

   if( pragma_output )
   output_asm_insn( ";in output_right_shift", operands );


   if (((enum rtx_code) (operands[1])->code) == CONST_INT && ((enum rtx_code) (operands[2])->code) == CONST_INT)
   {

      int val = ((operands[1])->u.hwint[0]);
      unsigned int uval = val, cnt = ((operands[2])->u.hwint[0]);

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
      if(((enum machine_mode) (operands[1])->mode) == QImode)
         output_asm_insn( ";GET_MODE(operands[1]) = QImode", operands );
      if(((enum machine_mode) (operands[1])->mode) == VOIDmode)
         output_asm_insn( ";GET_MODE(operands[1]) = VOIDmode", operands );
   }
   if( mode == HImode
      && only_use_trunc_p(insn, operands[0])
      && ( ((enum machine_mode) (operands[1])->mode) == QImode


         )
     )
   {
      rtx nexti = next_nnote_nclob_nuse_insn(insn);
      rtx body = nexti && ((enum rtx_code) (nexti)->code) == INSN ? (((nexti)->u.fld[5]).rt_rtx) : ((void *)0);

      if( body && ((enum rtx_code) (body)->code) == SET
      && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
      && part_dead_or_set_p(nexti, operands[0])
      && (((enum rtx_code) (operands[2])->code) == CONST_INT || !reg_overlap_mentioned_p(operands[2], (((body)->u.fld[0]).rt_rtx)))
      && ((((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == SUBREG && (rhs_regno(((((((body)->u.fld[1]).rt_rtx))->u.fld[0]).rt_rtx))) == (rhs_regno(operands[0])))
      || (((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == (rhs_regno(operands[0])) + 1)))
      {
         operands[0] = (((body)->u.fld[0]).rt_rtx);
         cancel_insn(nexti);
         if (((enum rtx_code) (operands[0])->code) == REG && (rhs_regno(operands[0])) == ACCU_REG)
         {
            nexti = next_nnote_nclob_nuse_insn(nexti);
            if (nexti && ((enum rtx_code) (nexti)->code) == INSN)
            {
               body = (((nexti)->u.fld[5]).rt_rtx);
               if (((enum rtx_code) (body)->code) == SET && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
               && ((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG
               && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == ACCU_REG
               && part_dead_or_set_p(nexti, operands[0]))
               {
                  operands[0] = (((body)->u.fld[0]).rt_rtx);
                  cancel_insn(nexti);
               }
            }
         }
      }
      else
      {
         operands[0] = gen_rtx(REG, QImode, (rhs_regno(operands[0])) + 1);
      }

      mode = QImode;
   }

   if (mode == QImode)
   {
      if (((enum rtx_code) (operands[0])->code) != REG || (rhs_regno(operands[0])) == ACCU_REG)
      {
         rtx tem = operands[3];
         operands[3] = operands[0];
         if (((enum rtx_code) (operands[1])->code) == REG && part_dead_or_set_p(insn, operands[1]))
         operands[0] = operands[1];
         else
         {
            if (((enum machine_mode) (tem)->mode) == QImode)
            operands[0] = tem;
            else
            {
               rtx part[8];
               int size = ((unsigned short) mode_size[((enum machine_mode) (tem)->mode)]) - 1;
               split_reg(tem, size, part);
               operands[0] = part[size];
            }
         }
      }
      else
      operands[3] = ((void *)0);

      if (((enum rtx_code) (operands[2])->code) == CONST_INT)
      {
         if (((operands[2])->u.hwint[0]) == 1)
         output_asm_insn(signedp ? "SHRA  %0,%1" : "SHR  %0,%1", operands);
         else
         {
            if (((enum rtx_code) (operands[1])->code) != REG || (rhs_regno(operands[0])) != (rhs_regno(operands[1])))
            output_asm_insn("MOVE   %0,%1", operands);

            output_asm_insn(signedp ? "MSHRA %0,%2" : "MSHR %0,%2", operands);
         }

         if (operands[3])
         return "MOVE   %3,%0";

         return "";
      }

      if (((enum rtx_code) (operands[1])->code) != REG || (rhs_regno(operands[1])) != (rhs_regno(operands[0])))
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

      if (((enum rtx_code) (operands[2])->code) == CONST_INT)
      {
         rtx op1[2];
         int count = ((operands[2])->u.hwint[0]);

         if (((enum machine_mode) (operands[1])->mode) == QImode)
         {
            operands[3] = reg0[1];

            if (count == 1)
            output_asm_insn(signedp ? "SHRA  %3%1" : "SHR   %3%1", operands);
            else if (count < 8)
            {
               if (((enum rtx_code) (operands[1])->code) != REG || (rhs_regno(operands[1])) != (rhs_regno(operands[0])))
               output_asm_insn("MOVE   %3,%1", operands);

               output_asm_insn(signedp ? "MSHRA %3%2" : "MSHR  %3%2", operands);
            }
            else
            {
               if (signedp)
               {
                  if (((enum rtx_code) (operands[1])->code) != REG || (rhs_regno(operands[1])) != (rhs_regno(operands[3])))
                  output_asm_insn("MOVE   %3,%1", operands);


                  output_asm_insn("MULA   %3,#1", operands );



               }
               else
               output_asm_insn("MOVE   %3,#0", operands);
            }

            if (signedp && (((enum rtx_code) (operands[1])->code) != REG || (rhs_regno(operands[1])) != (rhs_regno(operands[0]))))
            output_asm_insn("MOVE   %0,%3", operands);

            return signedp ? "MULA  %0,#1" : "MOVE %0,#0";
         }

         split_any(operands[1], 1, op1);

         if (count == 9)
         {
            operands[3] = reg0[1];

            output_asm_insn(signedp ? "SHRA  %3,%1" : "SHR  %3,%1", operands);

            if (signedp && (((enum rtx_code) (operands[1])->code) != REG || (rhs_regno(operands[1])) != (rhs_regno(operands[0]))))
            {
               output_asm_insn("MOVE   %0,%3", operands);
            }
            return signedp ? "MULA  %0,#1" : "MOVE %0,#0";
         }

         if (count >= 8) {
            operands[3] = reg0[1];
            if (((enum rtx_code) (operands[1])->code) != REG
            || (rhs_regno(op1[1])) != (rhs_regno(reg0[0])))
            output_asm_insn("MOVE   %3,%1", operands);
            if (count != 8) {
               operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 8);
               output_asm_insn(signedp
               ? "MSHRA %3,%2"
               : "MSHR  %3,%2", operands);
            }
            if (signedp
            && (((enum rtx_code) (operands[1])->code) != REG
            || (rhs_regno(operands[1])) != (rhs_regno(operands[0])))) {
               output_asm_insn("MOVE   %0,%3", operands);
            }
            return signedp
            ? "MULA  %0,#1"
            : "MOVE  %0,#0";
         }
         if (((enum rtx_code) (operands[1])->code) != REG
         || (rhs_regno(operands[1])) != (rhs_regno(operands[0]))) {
            ops[0] = operands[0], ops[1] = operands[1],
            ops[2] = reg0[1], ops[3] = op1[1];
            output_asm_insn(signedp
            ? "SHRA  %0,%1\n\tSHRC  %2,%3"
            : "SHR   %0,%1\n\tSHRC  %2,%3",
            ops);
            if (count == 1)
            return "";
            operands[2] = gen_rtx(CONST_INT, VOIDmode, count - 1);
         }
         operands[1] = reg0[1];
         return signedp
         ? "ashrihi3 %m0,%m1,%c2"
         : "lshrihi3 %m0,%m1,%c2";
      }
      if (((enum machine_mode) (operands[1])->mode) == QImode) {
         if (((enum rtx_code) (operands[1])->code) != REG
         || (rhs_regno(operands[1])) != (rhs_regno(reg0[1]))) {
            ops[0] = reg0[1], ops[1] = operands[1];
            output_asm_insn("MOVE   %0,%1", ops);
         }
         if (signedp)
         output_asm_insn("MOVE   %0,%1\n\tMULA  %0,#1", reg0);
         else
         output_asm_insn("MOVE   %0,#0", operands);
      } else if (((enum rtx_code) (operands[1])->code) != REG
      || (rhs_regno(operands[1])) != (rhs_regno(operands[0]))) {
         ops[0] = operands[0], ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
      }
      operands[1] = reg0[1];
      return signedp
      ? "ashrhi3  %m0,%m1,%m2"
      : "lshrhi3  %m0,%m1,%m2";
   }

   if (((enum rtx_code) (operands[2])->code) == CONST_INT) {
      int count = ((operands[2])->u.hwint[0]), i;
      rtx op0[4], op1[4];
      split_any(operands[0], 3, op0);
      split_any(operands[1], 3, op1);
      if (count == 8 || count == 16 || count == 24 || count >= 32) {
         int j;
         i = count >> 3;
         for (j = 3; i <= 3; i++, j--) {
            ops[0] = op0[j], ops[1] = op1[3 - i];
            output_asm_insn("MOVE   %0,%1", ops);
         }
         ops[0] = op0[0], ops[1] = op1[0];
         if (signedp
         && (((enum rtx_code) (operands[1])->code) != REG
         || (rhs_regno(operands[1])) != (rhs_regno(operands[0])))) {
            output_asm_insn("MOVE   %0,%1", operands);
         }
         output_asm_insn(signedp
         ? "MULA  %0,#1"
         : "MOVE  %0,#0", ops);
         for (i = 1; i <= 3 && (i << 3) < count; i++) {
            ops[1] = op0[i];
            output_asm_insn("MOVE   %1,%0", ops);
         }
         return "";
      }
      if (((enum rtx_code) (operands[1])->code) != REG
      || (rhs_regno(operands[1])) != REG_0) {
         ops[0] = op0[0], ops[1] = op1[0];
         output_asm_insn(signedp
         ? "SHRA  %0,%1"
         : "SHR   %0,%1", ops);
         for (i = 1; i < 4; i++) {
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
   if (((enum rtx_code) (ops[1])->code) != REG)
   output_asm_insn("MOVE   %%a,%1\n\tMOVE -(%%sp),%%a", ops);
   else
   output_asm_insn("MOVE   -(%%sp),%1", ops);
   if (((enum rtx_code) (operands[1])->code) == MEM) {
      int nregs = find_regs_in_addr((((operands[1])->u.fld[0]).rt_rtx), 0);
      int i, found = 0;
      for (i = 0; !found && i < nregs; i++)
      found = (rhs_regno(addr_regs[i])) == HARD_SP_REG;
      if (found)
      operands[1] = modif_mem_address(operands[1], ((enum machine_mode) (operands[1])->mode),
      HARD_SP_REG, 1);
   }
   output_asm_insn(output_move(insn, operands), operands);
   return signedp
   ? "ashrsi3"
   : "lshrsi3";
}





static void
output_branch_0_equ(enum rtx_code code, int size,
rtx *op1, rtx *operands, rtx op)
{
   int i = 1;

   if( pragma_output )
   output_asm_insn( ";in output_branch_0_equ", operands );

   if (((enum rtx_code) (op)->code) == REG && size > 1) {
      output_asm_insn("OR     %%a,%0,%1", op1);
      i = 2;
   } else
   output_asm_insn("MOVE   %%a,%0", op1);
   for (; i < size; i++) {
      rtx ops[1];
      ops[0] = op1[i];
      output_asm_insn("OR     %%a,%0", ops);
   }
   output_asm_insn(

   ( (code == EQ) || (code == LEU) )



   ? "JEQ   %l1"
   : "JNE   %l1", operands);
}



static void
output_branch_0(rtx insn, rtx *operands, enum rtx_code code, rtx op)
{
   int size = ((unsigned short) mode_size[((enum machine_mode) (op)->mode)]);
   int is_reg = ((enum rtx_code) (op)->code) == REG;
   rtx op1[8], ops[3];

   if( pragma_output )
   output_asm_insn( ";in output_branch_0", operands );

   if (((enum rtx_code) (op)->code) == CONST_DOUBLE) {

      int do_jump = 0;
      struct real_value r;
      ((r) = *((const struct real_value *) (&(op)->u.rv)));
      switch (code) {
         case EQ:
         do_jump = r == 0.0;
         break;
         case NE:
         do_jump = r != 0.0;
         break;
         case LT:
         do_jump = r < 0.0;
         break;
         case GT:
         do_jump = r > 0.0;
         break;
         case LE:
         do_jump = r <= 0.0;
         break;
         case GE:
         do_jump = r >= 0.0;
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
   if (mode_class[((enum machine_mode) (op)->mode)] == MODE_INT) {
      switch (code) {
         case GT:
         output_asm_insn(is_reg
         ? "TSTB  %0,#7\n\tJZC   .Lgt%="
         : "MOVE  %%a,%0\n\tTSTB %%a,#7\n\tJZC  .Lgt%=",
         ops);
         output_branch_0_equ(NE, size, op1, operands, op);
         output_asm_insn("\n.Lgt%=:", ops);
         break;
         case GE:
         output_asm_insn(is_reg
         ? "TSTB  %0,#7\n\tJZS   %l2"
         : "MOVE  %%a,%0\n\tTSTB %%a,#7\n\tJZS  %l2",
         ops);
         break;
         case LT:
         output_asm_insn(is_reg
         ? "TSTB  %0,#7\n\tJZC   %l2"
         : "MOVE  %%a,%0\n\tTSTB %%a,#7\n\tJZC  %l2",
         ops);
         break;
         case LE:
         output_asm_insn(is_reg
         ? "TSTB  %0,#7\n\tJZC   %l2"
         : "MOVE  %%a,%0\n\tTSTB %%a,#7\n\tJZC  %l2",
         ops);
         output_branch_0_equ(EQ, size, op1, operands, op);
         break;
         default:
         output_branch_0_equ(code, size, op1, operands, op);
      }
      return;
   }

   switch (code) {
      case GT:
      output_asm_insn(is_reg
      ? ("MOVE %%a,%0\n\tJZS  .Lgt%=\n\t"
      "TSTB %1,#7\n\tJZS   %l2\n.Lgt%=:")
      : ("MOVE %%a,%0\n\tJZS  .Lgt%=\n\t"
      "MOVE %%a,%1\n\tTSTB %%a,#7\n\tJZS  %l2\n.Lgt%=:"),
      ops);
      break;
      case GE:
      output_asm_insn(is_reg
      ? ("MOVE %%a,%0\n\tJZS  %l2\n\t"
      "TSTB %1,#7\n\tJZS   %l2")
      : ("MOVE %%a,%0\n\tJZS  %l2\n\t"
      "MOVE %%a,%1\n\tTSTB %%a,#7\n\tJZS  %l2"),
      ops);
      break;
      case LT:
      output_asm_insn(is_reg
      ? ("MOVE %%a,%0\n\tJZS  .Lgt%=\n\t"
      "TSTB %1,#7\n\tJZC   %l2\n.Lgt%=:")
      : ("MOVE %%a,%0\n\tJZS  .Lgt%=\n\t"
      "MOVE %%a,%1\n\tTSTB %%a,#7\n\tJZC  %l2\n.Lgt%=:"),
      ops);
      break;
      case LE:
      output_asm_insn(is_reg
      ? ("MOVE %%a,%0\n\tJZS  %l2\n\t"
      "TSTB %1,#7\n\tJZC   %l2")
      : ("MOVE %%a,%0\n\tJZS  %l2\n\t"
      "MOVE %%a,%1\n\tTSTB %%a,#7\n\tJZC  %l2"),
      ops);
      break;
      default:
      output_branch_0_equ(code, 1, op1, operands, op);
   }
}


const char *
output_branch(rtx insn, rtx *operands, int reverse)
{
   enum rtx_code code = ((enum rtx_code) (operands[0])->code);
   enum machine_mode mode;
   rtx ops[2];
   char s[256];



   if( pragma_output )
   output_asm_insn( ";in output_branch", operands );


   if (reverse)
   code = reverse_condition(code);
   ops[0] = cc_status.mdep.op1, ops[1] = cc_status.mdep.op2;
   if (ops[0] == 0 || ops[1] == 0)
   abort_with_insn(insn, "No values to compare...\n");
   if (((enum rtx_code) (ops[0])->code) == CONST_INT
   && ((enum rtx_code) (ops[1])->code) == CONST_INT) {

      int do_jump = 0;
      int val0 = ((ops[0])->u.hwint[0]), val1 = ((ops[1])->u.hwint[0]);
      unsigned int uval0 = val0, uval1 = val1;
      switch (code) {
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
   mode = ((enum machine_mode) (ops[0])->mode);
   if (mode == VOIDmode)
   mode = ((enum machine_mode) (ops[1])->mode);
   if (ops[1] != (const_int_rtx[64])
   && (((enum rtx_code) (ops[0])->code) == CONST_INT
   || ((enum rtx_code) (ops[0])->code) == CONST_DOUBLE)) {
      rtx tem = ops[0];
      ops[0] = ops[1];
      ops[1] = tem;
      code = swap_condition(code);
   }
   if (mode == QImode)
   {
      int signedp = (code == LT || code == LE
      || code == GT || code == GE);



      if (!((code == EQ || code == NE) && cc_status.mdep.cmp0_done))
      {


         if (((enum rtx_code) (ops[0])->code) != REG && ((enum rtx_code) (ops[1])->code) != REG)
         {
            if (ops[0] == cc_status.mdep.in_accu)
            {

               ops[0] = gen_rtx(REG, QImode, ACCU_REG);
            }
            else
            if (ops[1] == cc_status.mdep.in_accu)
            {

               ops[1] = gen_rtx(REG, QImode, ACCU_REG);
            }
         }
         if (((enum rtx_code) (ops[1])->code) == REG
         && ((enum rtx_code) (ops[0])->code) != REG)
         {
            rtx tem = ops[0];
            ops[0] = ops[1];
            ops[1] = tem;
            code = swap_condition(code);
         }
         if (((enum rtx_code) (ops[0])->code) != REG)
         {
            if (ops[1] == (const_int_rtx[64]) && (code == EQ || code == NE))
            output_asm_insn("MOVE   %%a,%0", ops);
            else
            output_asm_insn(signedp
            ? "MOVE  %%a,%0\n\tCMPA %%a,%1"
            : "MOVE  %%a,%0\n\tCMP  %%a,%1", ops);
         }
         else
         output_asm_insn(signedp
         ? "CMPA  %0,%1"
         : "CMP   %0,%1", ops);
      }


      switch (code) {
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

      }
      abort_with_insn(insn, "Bad branch");
   }
   if ((mode == HImode || mode == SImode)
   && ((enum rtx_code) (ops[0])->code) != REG
   && ((enum rtx_code) (ops[1])->code) == REG) {
      rtx tem = ops[0];
      ops[0] = ops[1];
      ops[1] = tem;
      code = swap_condition(code);
   }
   if (ops[1] == (const_int_rtx[64])) {

      output_branch_0(insn, operands, code, ops[0]);
      return "";
   }
   if (mode == HImode) {
      rtx op1[2], op2[2], parm[5];
      set_branch_opcode(insn, code, s);
      if (((enum rtx_code) (ops[0])->code) != REG) {
         op1[0] = gen_rtx(REG, HImode, REG_0), op1[1] = ops[0];
         output_asm_insn(output_move(insn, op1), op1);
         ops[0] = op1[0];
      }
      split_reg(ops[0], 1, op1);
      parm[0] = operands[1], parm[1] = op1[0], parm[2] = op1[1];
      if (((enum rtx_code) (ops[1])->code) == CONST_INT) {
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
   if (mode == SImode) {
      rtx op1[4], parm[6];
      set_branch_opcode(insn, code, s);
      if (((enum rtx_code) (ops[0])->code) != REG) {
         op1[0] = gen_rtx(REG, SImode, REG_0), op1[1] = ops[0];
         output_asm_insn(output_move(insn, op1), op1);
         ops[0] = op1[0];
      }
      split_reg(ops[0], 3, op1);
      parm[0] = operands[1], parm[1] = op1[0],
      parm[2] = op1[1], parm[3] = op1[2], parm[4] = op1[3];
      if (((enum rtx_code) (ops[1])->code) == CONST_INT) {
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
   if ((((enum rtx_code) (ops[1])->code) == REG
   && (rhs_regno(ops[1])) == REG_0)
   || (((enum rtx_code) (ops[0])->code) == REG
   && (rhs_regno(ops[0])) != REG_0
   && ((enum rtx_code) (ops[1])->code) == MEM)) {
      rtx tem = ops[0];
      ops[0] = ops[1];
      ops[1] = tem;
      code = swap_condition(code);
   }
   if (mode == TQFmode) {
      rtx op1[3], parm[4];
      set_branch_opcode(insn, code, s);
      parm[0] = operands[1];
      if (((enum rtx_code) (ops[1])->code) == CONST_DOUBLE) {
         if (((enum rtx_code) (ops[0])->code) != REG
         || (rhs_regno(ops[0])) != REG_0) {
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
   if (mode == SFmode) {
      rtx op1[4], parm[5];
      set_branch_opcode(insn, code, s);
      parm[0] = operands[1];
      if (((enum rtx_code) (ops[1])->code) == CONST_DOUBLE) {
         if (((enum rtx_code) (ops[0])->code) != REG
         || (rhs_regno(ops[0])) != REG_0) {
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
   abort_with_insn(insn, "Bad comparison mode: %s", mode_name[mode]);
   return "";
}


int
op_in_accu_p(rtx op, rtx insn)
{
   rtx previ = prev_nonnote_insn(insn);

   if (((enum rtx_code) (op)->code) == REG
   && (rhs_regno(op)) == ACCU_REG)
   {
      return 1;
   }
   while (previ && ((enum rtx_code) (previ)->code) == INSN)
   {
      rtx body = (((previ)->u.fld[5]).rt_rtx);

      if (((enum rtx_code) (body)->code) == SET)
      {
         enum rtx_code code_src = ((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code);


         if (use_large_frame((((body)->u.fld[1]).rt_rtx), 1)
         || use_large_frame((((body)->u.fld[0]).rt_rtx), 1))
         return 0;
         if (code_src == REG
         && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == ACCU_REG)
         {
            if (rtx_equal_p(op, (((body)->u.fld[0]).rt_rtx)))
            {
               return 1;
            }
            previ = prev_nonnote_insn(previ);
            continue;
         }
         if (code_src == ASHIFT || code_src == ASHIFTRT || code_src == LSHIFTRT)
         return 0;
         if (((enum rtx_code) ((((body)->u.fld[0]).rt_rtx))->code) == MEM
         && code_src == REG)
         {
            if (rtx_equal_p(op, (((body)->u.fld[0]).rt_rtx)))
            return op_in_accu_p((((body)->u.fld[1]).rt_rtx), previ);
            previ = prev_nonnote_insn(previ);
            continue;
         }







         if (((enum rtx_code) ((((body)->u.fld[0]).rt_rtx))->code) == REG && code_src == REG
         && (rhs_regno((((body)->u.fld[0]).rt_rtx))) == (rhs_regno((((body)->u.fld[1]).rt_rtx))))
         {
            previ = prev_nonnote_insn(previ);
            continue;
         }
         if (rtx_equal_p(op, (((body)->u.fld[0]).rt_rtx))
         || rtx_equal_p(op, (((body)->u.fld[1]).rt_rtx)))
         {
            return ((enum rtx_code) ((((body)->u.fld[0]).rt_rtx))->code) != MEM
            || (code_src != REG && code_src != CONST_INT);
         }
         return 0;
      }
      else
      return 0;
   }
   return 0;
}





int
cc_set_with_accu_p(rtx, rtx);

int
cc_set_with_accu_p(op, insn)
rtx op;
rtx insn;
{
   rtx previ = prev_nonnote_insn(insn);

   while (previ && ((enum rtx_code) (previ)->code) == INSN)
   {
      rtx body = (((previ)->u.fld[5]).rt_rtx);

      if (((enum rtx_code) (body)->code) == SET)
      {
         enum rtx_code code_src = ((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code);


         if (use_large_frame((((body)->u.fld[1]).rt_rtx), 1)
         || use_large_frame((((body)->u.fld[0]).rt_rtx), 1))
         return 0;
         if (code_src == REG
         && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == ACCU_REG)
         {
            if (rtx_equal_p(op, (((body)->u.fld[0]).rt_rtx)))
            {
               return 1;
            }
            previ = prev_nonnote_insn(previ);
            continue;
         }




         if (code_src == ASHIFT || code_src == ASHIFTRT || code_src == LSHIFTRT
         || code_src == MULT || code_src == , || code_src == IOR)
         return 0;
         if (((enum rtx_code) ((((body)->u.fld[0]).rt_rtx))->code) == MEM
         && code_src == REG)
         {
            if (rtx_equal_p(op, (((body)->u.fld[0]).rt_rtx)))
            return cc_set_with_accu_p((((body)->u.fld[1]).rt_rtx), previ);
            previ = prev_nonnote_insn(previ);
            continue;
         }






         if (((enum rtx_code) ((((body)->u.fld[0]).rt_rtx))->code) == REG && code_src == REG
         && (rhs_regno((((body)->u.fld[0]).rt_rtx))) == (rhs_regno((((body)->u.fld[1]).rt_rtx))))
         {
            previ = prev_nonnote_insn(previ);
            continue;
         }
         if (rtx_equal_p(op, (((body)->u.fld[0]).rt_rtx))
         || rtx_equal_p(op, (((body)->u.fld[1]).rt_rtx)))
         {
            return ((enum rtx_code) ((((body)->u.fld[0]).rt_rtx))->code) != MEM
            || (code_src != REG && code_src != CONST_INT);
         }
         return 0;
      }
      else
      return 0;
   }
   return 0;
}
# 2713 "c816.c"
rtx
function_arg(int cum, enum machine_mode mode, tree type, int named)
{
   int size = (mode == BLKmode)
   ? int_size_in_bytes(type)
   : ((unsigned short) mode_size[mode]);



   if( (!type) || (((type)->type.size) == 0) )



   return (rtx) 0;


   if (!named || MUST_PASS_IN_STACK(mode, type))
   return (rtx) 0;
   if (cum + size <= 4)
   return gen_rtx(REG, mode, cum + 1);
   else
   return (rtx) 0;
}






const char* output_commutative(rtx insn, rtx *operands)
{

   int to_reg = ((enum rtx_code) (operands[0])->code) == REG;

   if( pragma_output )
   output_asm_insn( ";in output_commutative", operands );


   if (((enum rtx_code) (operands[2])->code) == REG && ((enum rtx_code) (operands[1])->code) != REG)
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   if (to_reg && ((enum rtx_code) (operands[1])->code) == REG && (rhs_regno(operands[0])) == (rhs_regno(operands[1])))
   {
      if( pragma_output )
      output_asm_insn( ";out output_commutative (+)", operands );

      return "%o3 %0,%2";
   }

   find_hidden_accu(insn, operands);


   if (((enum rtx_code) (operands[2])->code) == REG && ((enum rtx_code) (operands[1])->code) != REG)
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   if (((enum rtx_code) (operands[1])->code) == REG)
   {
      int is_dead;

      if (((enum rtx_code) (operands[2])->code) == REG)
      {
         if( pragma_output )
         output_asm_insn( ";out output_commutative (+)", operands );

         return to_reg ? "%o3 %0,%1,%2" : "%o3  %%a,%1,%2\n\tMOVE %0,%%a";
      }

      is_dead = (rhs_regno(operands[1])) == ACCU_REG || part_dead_or_set_p(insn, operands[1]);

      if (is_dead)
      {
         if( pragma_output )
         output_asm_insn( ";out output_commutative (+)", operands );

         return "%o3 %1,%2\n\tMOVE  %0,%1";
      }


      if( ( ((enum rtx_code) (operands[3])->code) == , ) && ( ((enum rtx_code) (operands[2])->code) == CONST_INT ) )
      {
         unsigned char mask = ((operands[ 2 ])->u.hwint[0]) & 0xFF;


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


   if( pragma_output )
   output_asm_insn( ";out output_commutative (+)", operands );

   return to_reg
   ? "MOVE  %0,%1\n\t%o3   %0,%2"
   : "MOVE  %%a,%1\n\t%o3  %%a,%2\n\tMOVE %0,%%a";
}





const char* output_move(rtx insn, rtx *operands)
{
   enum machine_mode mode = ((enum machine_mode) (operands[0])->mode);
   enum rtx_code code = ((enum rtx_code) (operands[1])->code);
   int size, i, ordered = 0;
   int fix_hi = 0, fix_lo = 0;
   rtx mem0[8], mem1[8];



   rtx tmpFP[3];
   int tmpFPreg=2;



   unsigned char tempFPlives = 1;

   unsigned char i3changed=0;


   if (rtx_equal_p(operands[0], operands[1]))
   goto move_cleanup;
   if (mode == VOIDmode)
   mode = ((enum machine_mode) (operands[1])->mode);
   size = ((unsigned short) mode_size[mode]) - 1;




   if( pragma_output )
   output_asm_insn( ";in output_move", operands );

   for (i = 0; i < 2; i++)
   {
      if (((enum rtx_code) (operands[i])->code) == MEM)
      {
         rtx tem = (((operands[i])->u.fld[0]).rt_rtx);
         if (((enum rtx_code) (tem)->code) == const)
         tem = (((tem)->u.fld[0]).rt_rtx);
         if (((enum rtx_code) (tem)->code) == PLUS)
         {
            rtx reg = (((tem)->u.fld[0]).rt_rtx);
            rtx off = (((tem)->u.fld[1]).rt_rtx);
            if (((enum rtx_code) (off)->code) == REG)
            {
               rtx t = reg;
               reg = off;
               off = t;
            }


            if( ( ((enum rtx_code) (reg)->code) == REG ) && ( (rhs_regno(reg)) == HARD_SP_REG ) &&
                ( ((enum rtx_code) (off)->code) == CONST_INT ) && ( (((off)->u.hwint[0]) + size) > 255) )
            {

               int offset = ((off)->u.hwint[0]);

               rtx ops[4];






               fix_hi = offset >> 8;
               if (fix_hi > 255)

               abort_with_insn(insn, "Stack frame larger than memory");



               {






               unsigned char tmpFPfound = 0;

               while(tmpFPreg>=0 && !tmpFPfound)
               {
                  tmpFP[0] = gen_rtx(REG, HImode, RAM_IDX_0 + (tmpFPreg*2) );

                  if(reg_overlap_mentioned_p(tmpFP[0], operands[1-i]))
                  tmpFPreg--;
                  else
                  tmpFPfound = 1;
               }

               if(!tmpFPfound)
               abort_with_insn(insn,"\nbad move insn:\n an operand uses i0, i1 AND i2!!!\n");
# 2950 "c816.c"
               tmpFP[1] = gen_rtx(REG, QImode, RAM_IDX_0 + (tmpFPreg*2) );

               tmpFP[2] = gen_rtx(REG, QImode, RAM_IDX_0 + 1 + (tmpFPreg*2) );
# 2976 "c816.c"
            }


            if(tempFPlives)
            {


               output_asm_insn(
               "MOVE  -(%%i3),%2\n\t"
               "MOVE  -(%%i3),%1\n\t"
               , tmpFP);



               i3changed=1;


               {

                  rtx opi3 = gen_rtx( REG, HImode, RAM_IDX_3 );
                  if( ( ((enum rtx_code) (operands[1-i])->code) == MEM
                  && reg_overlap_mentioned_p(opi3, operands[1-i])
                  )
                  ||( ((enum rtx_code) (operands[1-i])->code) == REG
                  && ((rhs_regno(operands[1-i])) <= RAM_IDX_3 + 1)
                  && ((rhs_regno(operands[1-i])) + size >= RAM_IDX_3)
                  )
                  )
                  {


                     if( (i==1) && (((enum rtx_code) (operands[0])->code) == REG) )
                     abort_with_insn(insn,"reading stack pointer directly from stack...");

                     i3changed=0;
                     output_asm_insn(
                     "MOVE  %%a,(%%i3,2)+\n\t"
                     , operands);
# 3039 "c816.c"
                  }
               }

               if(i3changed)
               {
                  offset += 2;
               }


            }

            fix_lo = offset & 0xff;
            fix_hi = offset >> 8;
            ops[0] = gen_rtx(CONST_INT, VOIDmode, fix_lo);
            ops[1] = gen_rtx(CONST_INT, VOIDmode, fix_hi);
            ops[2] = tmpFP[1];
            ops[3] = tmpFP[2];

            if ( (fix_lo + size) > 255 )
            {





               output_asm_insn(
               "MOVE  %3,%%i3l\n\t"
               "MOVE  %2,%%i3h\n\t"
               "ADD  %3,%0\n\t"
               "ADDC %2,%1", ops);
               operands[i] = gen_rtx( MEM, mode, tmpFP[1] );
# 3103 "c816.c"
            }
            else
            {




               output_asm_insn(
               "MOVE  %3,%%i3l\n\t"
               "MOVE  %2,%%i3h\n\t"
               "ADD  %2,%1\n\t", ops);
               operands[ i ] = gen_rtx( MEM, mode, gen_rtx( PLUS, Pmode, tmpFP[1], gen_rtx( CONST_INT, VOIDmode, fix_lo ) ) );
# 3147 "c816.c"
            }
            break;
         }

      }
   }
}

if (((enum rtx_code) (operands[0])->code) == REG)
{
   rtx reg0[8];

   split_reg(operands[0], size, reg0);

   if( code == REG )
   {
      rtx reg1[8];
      if ((rhs_regno(operands[0])) == (rhs_regno(operands[1])))
      goto move_cleanup;

      split_reg(operands[1], size, reg1);

      if ((rhs_regno(operands[0])) > (rhs_regno(operands[1])))
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


   if (immediate_operand(operands[1], mode))
   {
      if
      (!
      (
      (
      (
      code == SYMBOL_REF
      || code == LABEL_REF
      || code == const
      )
      && mode == HImode
      )
      || code == CONST_INT
      || code == CONST_DOUBLE
      )
      )
      abort_with_insn(insn, "Bad immediate value");
   }


   {




      if ( code == SYMBOL_REF || code == LABEL_REF || code == const )
      {
         if(mode == HImode)
         {
            rtx ops[2];
            output_asm_insn("MOVE   %0,#HIWORD(%1)", operands);
            ops[0] = reg0[1], ops[1] = operands[1];
            output_asm_insn("MOVE   %0,#LOWORD(%1)", ops);
            goto move_cleanup;
         }
      }

      if (code == CONST_INT || code == CONST_DOUBLE)
      {
         unsigned char val[8];
         split_const(operands[1], size, val);

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


   if (((enum rtx_code) ((((operands[1])->u.fld[0]).rt_rtx))->code) == POST_INC)
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

   if (((enum rtx_code) ((((operands[1])->u.fld[0]).rt_rtx))->code) == PRE_DEC)
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


      int nregs = find_regs_in_addr((((operands[1])->u.fld[0]).rt_rtx), 0);
      int found = 0;

      for (i = 0; !found && i < nregs; i++)
      found = ((rhs_regno(addr_regs[i])) >= (rhs_regno(operands[0])) && (rhs_regno(addr_regs[i])) <= (rhs_regno(operands[0])) + size);

      if (found)
      {
         rtx ops[2];
         if (nregs > 1)
         abort_with_insn(insn, "This move has a strange memory address");




         for (i = 0; i < size; i++)
         {
            ops[0] = mem1[i];
            output_asm_insn("MOVE   %%a,%0\n\tMOVE -(%%sp,1),%%a", ops);
         }


         ops[0] = reg0[size];
         ops[1] = mem1[size];
         output_asm_insn("MOVE   %0,%1", ops);


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


if (code == HIGH || code == LO_SUM)
{
   if (mode != QImode)
   abort_with_insn(insn, "Bad mode for this move");
   return "MOVE   %%a,%1\n\tMOVE %0,%%a";
}

if (((enum rtx_code) ((((operands[0])->u.fld[0]).rt_rtx))->code) == POST_INC)
{
   ordered = 1;
   for (i = 0; i <= size; i++)
   mem0[i] = operands[0];
}
else if (((enum rtx_code) ((((operands[0])->u.fld[0]).rt_rtx))->code) == PRE_DEC)
{
   ordered = -1;
   for (i = 0; i <= size; i++)
   mem0[i] = operands[0];
}
else
{
   split_mem(operands[0], size, mem0);
}

{
   enum rtx_code code2 = ((enum rtx_code) (mem0[0])->code);

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
   split_const(operands[1], size, val);

   if (ordered)
   {



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

if ((code == SYMBOL_REF || code == LABEL_REF || code == const) && mode == HImode)
{
   rtx ops[2];
   if (ordered == -1)
   {
      ops[0] = mem0[0], ops[1] = operands[1];
      output_asm_insn("MOVE   %%a,#LOWORD(%1)\n\tMOVE %0,%%a", ops);
      output_asm_insn("MOVE   %%a,#HIWORD(%1)\n\tMOVE %0,%%a", ops);
      goto move_cleanup;
   }

   ops[0] = mem0[0], ops[1] = operands[1];
   output_asm_insn("MOVE   %%a,#HIWORD(%1)\n\tMOVE %0,%%a", ops);
   ops[0] = mem0[1];
   output_asm_insn("MOVE   %%a,#LOWORD(%1)\n\tMOVE %0,%%a", ops);
   goto move_cleanup;
}


if (code != MEM)
abort_with_insn(insn, "Bad move");

if (((enum rtx_code) ((((operands[1])->u.fld[0]).rt_rtx))->code) == POST_INC)
{
   for (i = 0; i <= size; i++)
   mem1[i] = operands[1];
}
else if (((enum rtx_code) ((((operands[1])->u.fld[0]).rt_rtx))->code) == PRE_DEC)
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
   rtx ops[2];
   ops[0] = mem0[i];
   ops[1] = mem1[i];
   output_asm_insn("MOVE   %%a,%1\n\tMOVE %0,%%a", ops);
}

move_cleanup:


if ( (fix_hi || fix_lo)
&& (tempFPlives)
)
{
   if(!i3changed)
   output_asm_insn(
   "MOVE  %%a,-(%%i3,2)\n\t"
   , operands);

   output_asm_insn(
   "MOVE  %1,(%%i3)+\n\t"
   "MOVE  %2,(%%i3)+\n\t"
   , tmpFP);

}
# 3564 "c816.c"
if( pragma_output )
output_asm_insn( ";out output_move", operands );

return "";
}




const char *
output_add_wide(rtx insn, rtx *operands)
{
   enum machine_mode mode = ((enum machine_mode) (operands[0])->mode);
   int size = ((unsigned short) mode_size[mode]) - 1, i;
   int to_mem = ((enum rtx_code) (operands[0])->code) != REG;
   int is_reg, is_dead, same_reg;
   int delay_clobber = 0, delay_clobber2 = 0;
   rtx op0[8], op1[8], op2[8], saved[8], ops[3];

   if( pragma_output )
   output_asm_insn( ";in output_add_wide", operands );

   split_any(operands[0], size, op0);
   if (((enum rtx_code) (operands[1])->code) == LABEL_REF
   || ((enum rtx_code) (operands[1])->code) == SYMBOL_REF
   || ((enum rtx_code) (operands[1])->code) == const) {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }
   if (((enum rtx_code) (operands[1])->code) == CONST_INT) {
      rtx tem = operands[1];
      if (((enum rtx_code) (operands[2])->code) == CONST_INT) {

         operands[1] = gen_rtx(CONST_INT, VOIDmode,
         ((operands[1])->u.hwint[0])
         + ((operands[2])->u.hwint[0]));
         return output_move(insn, operands);
      }
      if (((enum rtx_code) (operands[2])->code) == LABEL_REF
      || ((enum rtx_code) (operands[2])->code) == SYMBOL_REF
      || ((enum rtx_code) (operands[2])->code) == const) {
         operands[1] = modif_address(operands[2], -1, ((operands[1])->u.hwint[0]));
         return output_move(insn, operands);
      }
      operands[1] = operands[2];
      operands[2] = tem;
   }
   if (((enum rtx_code) (operands[2])->code) == REG) {
      rtx tem = operands[1];
      if (((enum rtx_code) (operands[1])->code) == REG) {
         split_reg(operands[1], size, op1);
         split_reg(operands[2], size, op2);
         ops[0] = op0[size];
         ops[1] = op1[size];
         ops[2] = op2[size];
         output_asm_insn(to_mem
         ? "ADD   %%a,%1,%2\n\tMOVE %0,%%a"
         : "ADD   %0,%1,%2", ops);
         for (i = size - 1; i > 0; i--) {
            ops[0] = op0[i];
            ops[1] = op1[i];
            ops[2] = op2[i];
            output_asm_insn(to_mem
            ? "ADDC  %%a,%1,%2\n\tMOVE %0,%%a"
            : "ADDC  %0,%1,%2", ops);
         }

         if( pragma_output )
         output_asm_insn( ";out output_add_wide (+)", operands );

         return to_mem
         ? "ADDC  %%a,%1,%2\n\tMOVE %0,%%a"
         : "ADDC  %0,%1,%2";
      }
      operands[1] = operands[2];
      operands[2] = tem;
   }
   if (!to_mem &&
   (((enum rtx_code) (operands[1])->code) == MEM || ((enum rtx_code) (operands[2])->code) == MEM)) {


      delay_clobber = (((enum rtx_code) (operands[1])->code) == MEM
      && reg_overlap_mentioned_p(operands[0], operands[1]));
      delay_clobber2 = (((enum rtx_code) (operands[2])->code) == MEM
      && reg_overlap_mentioned_p(operands[0], operands[2]));
      if (delay_clobber2 && !delay_clobber) {
         rtx tem = operands[1];
         operands[1] = operands[2];
         operands[2] = tem;
         delay_clobber = 1, delay_clobber2 = 0;
      }
   }
   is_reg = ((enum rtx_code) (operands[1])->code) == REG;
   is_dead = is_reg && part_dead_or_set_p(insn, operands[1]);
   same_reg = is_reg && !to_mem && ((rhs_regno(operands[0]))
   == (rhs_regno(operands[1])));
   if (is_dead && ((enum rtx_code) (operands[2])->code) == MEM) {
      int nregs = find_regs_in_addr((((operands[2])->u.fld[0]).rt_rtx), 0);
      for (i = 0; is_dead && i < nregs; i++)
      is_dead = (rhs_regno(addr_regs[i])) != (rhs_regno(operands[1]));
   }
   if (delay_clobber) {




      if (spill_rtx[0] == ((void *)0)) {
         spill_rtx[0] = gen_rtx(SYMBOL_REF, Pmode, spill_name);
         (((spill_rtx[0]))->volatil) = 1;
      }
      for (i = size; i > 0; i--) {
         saved[i] = op0[i];
         op0[i] = gen_rtx(MEM, QImode,
         gen_rtx(PLUS, Pmode,
         spill_rtx[0],
         gen_rtx(CONST_INT, VOIDmode, i + 3)));
      }
   }
   split_any(operands[1], size, op1);
   if (((enum rtx_code) (operands[2])->code) == CONST_INT) {
      unsigned char val[8];
      int was_zero = 1;
      split_const(operands[2], size, val);


   if( size == 1 )
   {
      if( ( (rhs_regno(op0[ 0 ])) == (rhs_regno(op1[ 1 ])) ) || ( (rhs_regno(op0[ 1 ])) == (rhs_regno(op1[ 0 ])) ) )
      {
         output_move( insn, operands );

         operands[ 1 ] = operands[ 0 ];

         output_asm_insn(output_add_wide(insn, operands), operands);

         return "";
      }

   }

      for (i = size; i >= 0; i--) {
         ops[0] = op0[i];
         ops[1] = op1[i];
         if (was_zero) {
            was_zero = (val[i] == 0);
            if (val[i] == 0) {
               if (!same_reg)
               output_asm_insn((to_mem || (delay_clobber && i > 0)) && !is_reg
               ? "MOVE  %%a,%1\n\tMOVE %0,%%a"
               : "MOVE  %0,%1", ops);
            } else if (val[i] == 1)
            output_asm_insn((to_mem || (delay_clobber && i > 0))
            ? "INC   %%a,%1\n\tMOVE %0,%%a"
            : "INC   %0,%1", ops);
            else if (val[i] == 0xff)
            output_asm_insn((to_mem || (delay_clobber && i > 0))
            ? "DEC   %%a,%1\n\tMOVE %0,%%a"
            : "DEC   %0,%1", ops);
            else {
               ops[2] = gen_rtx(CONST_INT, VOIDmode, val[i]);
               if (same_reg)
               output_asm_insn("ADD %0,%2", ops);
               else
               output_asm_insn((to_mem || (delay_clobber && i > 0))
               ? (is_dead
               ? "ADD   %1,%2\n\tMOVE  %0,%1"
               : "MOVE  %%a,%1\n\tADD  %%a,%2\n\tMOVE %0,%%a")
               : "MOVE  %0,%1\n\tADD   %0,%2", ops);
            }
         } else {
            if (val[i] == 0)
            output_asm_insn((to_mem || (delay_clobber && i > 0))
            ? "INCC  %%a,%1\n\tMOVE %0,%%a"
            : "INCC  %0,%1", ops);
            else if (val[i] == 0xff)
            output_asm_insn((to_mem || (delay_clobber && i > 0))
            ? "DECC  %%a,%1\n\tMOVE %0,%%a"
            : "DECC  %0,%1", ops);
            else {
               ops[2] = gen_rtx(CONST_INT, VOIDmode, val[i]);
               if (!same_reg)
               output_asm_insn((to_mem || (delay_clobber && i > 0))
               ? (is_dead
               ? "ADDC  %1,%2\n\tMOVE  %0,%1"
               : "MOVE  %%a,%1\n\tADDC %%a,%2\n\tMOVE %0,%%a")
               : "MOVE  %0,%1\n\tADDC  %0,%2", ops);
               else
               output_asm_insn("ADDC   %0,%2", ops);
            }
         }
      }
      if (delay_clobber) {

         for (i = 1; i <= size; i++) {
            ops[0] = saved[i];
            ops[1] = op0[i];
            output_asm_insn("MOVE   %0,%1", ops);
         }
      }
      if( pragma_output )
      output_asm_insn( ";out output_add_wide", operands );
      return "";
   }
   if (((enum rtx_code) (operands[2])->code) == LABEL_REF
   || ((enum rtx_code) (operands[2])->code) == SYMBOL_REF
   || ((enum rtx_code) (operands[2])->code) == const) {
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
      if (delay_clobber) {

         ops[0] = saved[1];
         ops[1] = op0[1];
         output_asm_insn("MOVE   %0,%1", ops);
      }
      if( pragma_output )
      output_asm_insn( ";out output_add_wide", operands );
      return "";
   }


   if(!(to_mem || delay_clobber || same_reg))
   {

      output_asm_insn(output_move(insn, operands), operands);
      same_reg = 1;
   }



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
   for (i = size - 1; i >= 0; i--) {
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
   if (delay_clobber) {

      for (i = 1; i <= size; i++) {
         ops[0] = saved[i];
         ops[1] = op0[i];
         output_asm_insn("MOVE   %0,%1", ops);
      }
   }
   if( pragma_output )
   output_asm_insn( ";out output_add_wide", operands );
   return "";
}




const char *
output_sub_wide(rtx insn, rtx *operands)
{
   enum machine_mode mode = ((enum machine_mode) (operands[0])->mode);
   int size = ((unsigned short) mode_size[mode]) - 1, i;
   int to_mem = ((enum rtx_code) (operands[0])->code) != REG;
   int is_reg1 = ((enum rtx_code) (operands[1])->code) == REG;
   int is_reg2 = ((enum rtx_code) (operands[2])->code) == REG;
   int is_dead = 0, same_reg = 0;
   rtx op0[8], op1[8], op2[8], ops[3];

   if( pragma_output )
   output_asm_insn( ";in output_sub_wide", operands );

   split_any(operands[0], size, op0);
   if (((enum rtx_code) (operands[1])->code) == CONST_INT) {
      unsigned char val[8];
      if (((enum rtx_code) (operands[2])->code) == CONST_INT) {

         operands[1] = gen_rtx(CONST_INT, VOIDmode,
         ((operands[1])->u.hwint[0]) - ((operands[2])->u.hwint[0]));
         return output_move(insn, operands);
      }
      same_reg = is_reg2 && !to_mem && ((rhs_regno(operands[2]))
      == (rhs_regno(operands[0])));
      is_dead = is_reg2 && part_dead_or_set_p(insn, operands[2]);
      if (is_reg2 && !same_reg && !is_dead && mode == QImode) {
         is_dead = op_in_accu_p(operands[2], insn);
         if (is_dead)
         operands[2] = gen_rtx(REG, QImode, ACCU_REG);
      }
      split_const(operands[1], size, val);
      split_any(operands[2], size, op2);
      ops[0] = op0[size];
      ops[2] = op2[size];
# 3902 "c816.c"
      if (val[size] == 0 && ((enum rtx_code) (op2[0])->code) != HIGH)
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
         if (val[i] == 0 && ((enum rtx_code) (op2[0])->code) != HIGH)
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
   if (((enum rtx_code) (operands[1])->code) == REG
   && ((enum rtx_code) (operands[2])->code) == REG) {
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
   && ((rhs_regno(operands[1])) == ACCU_REG
   || part_dead_or_set_p(insn, operands[1])))
   || (is_reg2
   && ((rhs_regno(operands[2])) == ACCU_REG
   || part_dead_or_set_p(insn, operands[2]))));
   same_reg = !to_mem && ((is_reg1 && ((rhs_regno(operands[1]))
   == (rhs_regno(operands[0]))))
   || (is_reg2 && ((rhs_regno(operands[2]))
   == (rhs_regno(operands[0])))));
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



int
only_use_trunc_p(rtx insn, rtx op)
{
   rtx nexti = next_nnote_nclob_insn(insn);
   rtx body;
   rtx r_part = gen_rtx(REG, QImode, (rhs_regno(op)) + 1);
   while (nexti && ((enum rtx_code) (nexti)->code) == INSN) {
      body = (((nexti)->u.fld[5]).rt_rtx);
      if (!trunc_if_used_p(body, (rhs_regno(op))))
      return 0;



      if ((part_dead_or_set_p(nexti, op)
      && reg_mentioned_p(op, body))
      || (part_dead_or_set_p(nexti, r_part)
      && reg_mentioned_p(r_part, body)))
      return 1;
      nexti = next_nnote_nclob_insn(nexti);
   }
   return 0;
}



const char *
output_extend(rtx insn, rtx *operands, int signed_p)
{
   enum machine_mode mode = ((enum machine_mode) (operands[0])->mode);
   int is_reg = ((enum rtx_code) (operands[0])->code) == REG;
   rtx ops[2];

   if( pragma_output )
   output_asm_insn( ";in output_extend", operands );

   if (((enum rtx_code) (operands[1])->code) == CONST_INT)

   return output_move(insn, operands);
   if (((enum machine_mode) (operands[1])->mode) == QImode) {
      rtx op0[8];
      int size = ((unsigned short) mode_size[mode]) - 1;
      split_any(operands[0], size, op0);
      ops[0] = op0[size], ops[1] = operands[1];
      output_asm_insn(output_move(insn, ops), ops);
      ops[0] = op0[size - 1];
      if (is_reg && size == 1 && only_use_trunc_p(insn, operands[0]))
      return "";
      if (signed_p) {
         if (is_reg) {
            ops[1] = op0[size];
            if (!is_reg
            || ((enum rtx_code) (operands[1])->code) != REG
            || (rhs_regno(ops[0])) != (rhs_regno(operands[1])))
            output_asm_insn(output_move(insn, ops), ops);
            output_asm_insn("MULA   %0,#1", ops);
            if (size == 3)
            output_asm_insn("MOVE   %1,%2\n\tMOVE  %0,%2", op0);
            return "";
         }
         if (((enum rtx_code) (operands[1])->code) == REG
         && part_dead_or_set_p(insn, operands[1])) {
            output_asm_insn("MULA   %1,#1", operands);
            output_asm_insn(output_move(insn, ops), ops);
            op0[2] = operands[1];
            if (size == 3)
            output_asm_insn("MOVE   %1,%2\n\tMOVE  %0,%2", op0);
            return "";
         }
         if (((enum rtx_code) (operands[1])->code) == REG)
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
      ops[1] = (const_int_rtx[64]);
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
      if (is_reg && ((enum rtx_code) (operands[1])->code) == MEM) {


         ops[0] = gen_rtx(REG, HImode, (rhs_regno(op0[2])));
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
         if (((enum rtx_code) (operands[1])->code) == REG
         && (rhs_regno(operands[1])) != ACCU_REG
         && part_dead_or_set_p(insn, operands[1])) {
            output_asm_insn("MULA   %1,#1", ops);
            ops[0] = op0[1];
            output_asm_insn(output_move(insn, ops), ops);
            ops[0] = op0[0];
            output_asm_insn(output_move(insn, ops), ops);
            return "";
         }
         if (((enum rtx_code) (operands[1])->code) == REG)
         output_asm_insn("MOVE   %%a,%1", ops);
         output_asm_insn("AND %%a,#0x80\n\t"
         "JZS  .Lex%=\n\t"
         "MOVE %%a,#0xff\n"
         ".Lex%=:\n\t"
         "MOVE %1,%%a\n\t"
         "MOVE %0,%%a", op0);
         return "";
      }
      ops[0] = gen_rtx(((enum rtx_code) (operands[0])->code), HImode, (((operands[0])->u.fld[0]).rt_rtx)),
      ops[1] = (const_int_rtx[64]);
      output_asm_insn(output_move(insn, ops), ops);
      return "";
   }
   if (mode == SFmode) {
      rtx op0[4];
      ops[0] = gen_rtx(((enum rtx_code) (operands[0])->code), TQFmode, (((operands[0])->u.fld[0]).rt_rtx));
      ops[1] = operands[1];
      output_asm_insn(output_move(insn, ops), ops);
      split_any(operands[0], 3, op0);
      ops[0] = op0[3], ops[1] = (const_int_rtx[64]);
      output_asm_insn(output_move(insn, ops), ops);
      return "";
   }
   abort_with_insn(insn, "Unknown extension");
   return "";
}
# 4190 "c816.c"
const char *
output_libcall(rtx insn, rtx *operands, int n_par_r, int n_par_s,
int commutative, const char *template, int fsub, int no_call,
int alt_reg)
{
   enum machine_mode mode = ((enum machine_mode) (operands[1])->mode);
   int size = ((unsigned short) mode_size[mode]), offset = 0;
   rtx ops[2];
   int nregs, found, i, curop = n_par_r + 1, rem_s = n_par_s;
   char s[256];

   if( pragma_output )
   output_asm_insn( ";in output_libcall", operands );

   if (fsub)
   fsub = 2;
   if (mode == VOIDmode) {
      mode = ((enum machine_mode) (operands[2])->mode);
      size = ((unsigned short) mode_size[mode]);
   }
   if ((commutative || fsub)
   && ((((enum rtx_code) (operands[2])->code) == REG
   && (rhs_regno(operands[2])) == REG_0)
   || (((enum rtx_code) (operands[1])->code) == REG
   && (rhs_regno(operands[1])) != REG_0
   && ((enum rtx_code) (operands[2])->code) == MEM))) {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
      if (fsub)
      fsub = 1;
   }
   if (n_par_s > 1 && commutative
   && use_large_frame(operands[2], (size << 1) - 1)) {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }
   while (rem_s > 0) {
      offset += size;
      found = 0;
      if (((enum rtx_code) (operands[curop])->code) == MEM) {
         nregs = find_regs_in_addr((((operands[curop])->u.fld[0]).rt_rtx), 0);
         for (i = 0; !found && i < nregs; i++)
         found = (rhs_regno(addr_regs[i])) == HARD_SP_REG;
         if (found) {
            ops[0] = modif_mem_address(operands[curop], QImode,
            HARD_SP_REG, offset - 1);
            for (i = size - 1; i >= 0; i--)
            if (fsub == curop && i == 1)
            output_asm_insn("MOVE   %%a,%0\n\t"
            "INVB %%a,#7\n\t"
            "MOVE -(%%sp),%%a", ops);
            else
            output_asm_insn("MOVE   %%a,%0\n\t"
            "MOVE -(%%sp),%%a", ops);
         }
      }
      if (!found) {
         rtx part[8];
         split_any(operands[curop], size - 1, part);
         if (((enum rtx_code) (operands[curop])->code) == REG)
         strcpy(s, "MOVE   -(%%sp),%0");
         else
         strcpy(s, "MOVE   %%a,%0\n\tMOVE -(%%sp),%%a");
         for (i = size - 1; i >= 0; i--) {
            ops[0] = part[i];
            if (fsub == curop && i == 1) {
               if (((enum rtx_code) (operands[curop])->code) == REG
               && ((rhs_regno(operands[curop])) == REG_0
               || part_dead_or_set_p(insn, operands[curop])))
               output_asm_insn("INVB   %0,#7\n\t"
               "MOVE -(%%sp),%0", ops);
               else
               output_asm_insn("MOVE   %%a,%0\n\t"
               "INVB %%a,#7\n\t"
               "MOVE -(%%sp),%%a", ops);
            } else
            output_asm_insn(s, ops);
         }
      }
      rem_s -= 1;
      curop += 1;
   }
   if (n_par_r > 0) {
      if (((enum rtx_code) (operands[1])->code) == MEM) {
         nregs = find_regs_in_addr((((operands[1])->u.fld[0]).rt_rtx), 0);
         for (found = 0, i = 0; !found && i < nregs; i++)
         found = (rhs_regno(addr_regs[i])) == HARD_SP_REG;
         if (found)
         operands[1] = modif_mem_address(operands[1], ((enum machine_mode) (operands[1])->mode),
         HARD_SP_REG, offset);
      }
      if (n_par_r > 1) {
         if (n_par_r > 2)
         abort_with_insn(insn, "Too many parameters in registers (%d)",
         n_par_r);
         if (size != 2)
         abort_with_insn(insn, "Unimplemented two parameters of size %d",
         size);
         if (((enum rtx_code) (operands[1])->code) == REG
         && ((rhs_regno(operands[1])) == REG_0
         || (rhs_regno(operands[1])) == REG_2)) {
            if (((enum rtx_code) (operands[2])->code) == REG
            && ((rhs_regno(operands[2])) == REG_0
            || (rhs_regno(operands[2])) == REG_2)) {
               if ((rhs_regno(operands[2])) == REG_0) {
                  if ((rhs_regno(operands[1])) != REG_2) {
                     ops[0] = gen_rtx(REG, HImode, REG_2), ops[1] = operands[1];
                     output_asm_insn(output_move(insn, ops), ops);
                  }
               } else {
                  if ((rhs_regno(operands[1])) != REG_0) {
                     ops[0] = gen_rtx(REG, HImode, REG_0), ops[1] = operands[1];
                     output_asm_insn(output_move(insn, ops), ops);
                  }
               }
            } else {
               if ((rhs_regno(operands[1])) == REG_0) {
                  ops[0] = gen_rtx(REG, HImode, REG_2), ops[1] = operands[2];
                  output_asm_insn(output_move(insn, ops), ops);
               } else {
                  ops[0] = gen_rtx(REG, HImode, REG_0), ops[1] = operands[2];
                  output_asm_insn(output_move(insn, ops), ops);
               }
            }
         } else if (((enum rtx_code) (operands[2])->code) == REG
         && ((rhs_regno(operands[2])) == REG_0
         || (rhs_regno(operands[2])) == REG_2)) {
            if ((rhs_regno(operands[2])) == REG_0) {
               ops[0] = gen_rtx(REG, HImode, REG_2), ops[1] = operands[1];
               output_asm_insn(output_move(insn, ops), ops);
            } else {
               ops[0] = gen_rtx(REG, HImode, REG_0), ops[1] = operands[1];
               output_asm_insn(output_move(insn, ops), ops);
            }
         } else {
            ops[0] = gen_rtx(REG, HImode, REG_0), ops[1] = operands[1];
            output_asm_insn(output_move(insn, ops), ops);
            ops[0] = gen_rtx(REG, HImode, REG_2), ops[1] = operands[2];
            output_asm_insn(output_move(insn, ops), ops);
         }
      } else {
         if (alt_reg)
         ops[0] = gen_rtx(REG, mode, mode == QImode ? REG_3 : REG_2);
         else
         ops[0] = gen_rtx(REG, mode, REG_0);
         ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
         if (fsub == 1) {
            ops[0] = gen_rtx(REG, QImode, REG_1);
            output_asm_insn("INVB   %0,#7", ops);
         }
      }
   }
   if (!no_call) {
      sprintf(s, "%s %s", TARGET_SOFTLIB ? "CALLS" : "CALL", template);
      output_asm_insn(s, operands);

      if ((n_par_s > 0)
      && (strcmp(template, "divmodsi4") != 0) && (strcmp(template, "udivmodsi4") != 0)) {





         sprintf(s, "MOVE  %%%%a,(%%%%i3,%d)+", n_par_s * size);
         output_asm_insn(s, operands);
      }
   }
   return "";
}



const char *
output_fneg(rtx insn, rtx *operands)
{
   rtx op0[8], op1[8];
   int size = ((unsigned short) mode_size[((enum machine_mode) (operands[0])->mode)]) - 1;
   int i;

   if( pragma_output )
   output_asm_insn( ";in output_fneg", operands );

   split_any(operands[0], size, op0);
   split_any(operands[1], size, op1);
   operands[0] = op0[1], operands[1] = op1[1];
   if (((enum rtx_code) (operands[0])->code) == REG) {
      if (((enum rtx_code) (operands[1])->code) != REG) {
         output_asm_insn("MOVE   %0,%1\n\tINVB  %0,#7", operands);
         for (i = 0; i <= size; i++)
         if (i != 1) {
            operands[0] = op0[i], operands[1] = op1[i];
            output_asm_insn("MOVE   %0,%1", operands);
         }
         return "";
      }
      if ((rhs_regno(operands[0])) != (rhs_regno(operands[1]))) {
         if ((rhs_regno(operands[1])) > (rhs_regno(operands[0])))
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
   if (((enum rtx_code) (operands[1])->code) == REG) {
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




const char *
output_mult(rtx insn, rtx *operands, int signedp, unsigned int mask)
{
   enum machine_mode mode = ((enum machine_mode) (operands[0])->mode);

   if( pragma_output )
   output_asm_insn( ";in output_mult", operands );

   if (((enum rtx_code) (operands[1])->code) == CONST_INT
   && ((enum rtx_code) (operands[2])->code) == CONST_INT)
   {


      unsigned int c1 = ((operands[1])->u.hwint[0]);
      unsigned int c2 = ((operands[2])->u.hwint[0]);
      if (!signedp) {
         c1 &= mask;
         c2 &= mask;
      }
      operands[1] = gen_rtx(CONST_INT, VOIDmode, c1*c2);
      if( pragma_output )
      output_asm_insn( ";out output_mult => output_move", operands );

      return output_move(insn, operands);
   }


   if (((enum rtx_code) (operands[1])->code) == CONST_INT)
   {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }

   operands[3] = operands[0];

   if (mode == QImode)
   {
      int is_reg1, is_reg2, is_dead = 0;
      if (((enum rtx_code) (operands[2])->code) == CONST_INT
      && ((operands[2])->u.hwint[0]) == 2)
      {
         if( pragma_output )
         output_asm_insn( ";out output_mult", operands );
         return ((enum rtx_code) (operands[0])->code) == REG
         ? "SHL   %0,%1"
         : "SHL   %%a,%1\n\tMOVE %0,%%a";
      }
      if (((enum rtx_code) (operands[0])->code) != REG
      || (rhs_regno(operands[0])) != ACCU_REG)
      operands[0] = gen_rtx(REG, QImode, ACCU_REG);
      is_reg1 = ((enum rtx_code) (operands[1])->code) == REG;
      is_reg2 = ((enum rtx_code) (operands[2])->code) == REG;
      find_hidden_accu(insn, operands);
      if (is_reg1 && !is_reg2)
      is_dead = (rhs_regno(operands[1])) == ACCU_REG
      || part_dead_or_set_p(insn, operands[1]);
      if (is_reg2 && !is_reg1)
      is_dead = (rhs_regno(operands[2])) == ACCU_REG
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
      rtx body = nexti && ((enum rtx_code) (nexti)->code) == INSN ? (((nexti)->u.fld[5]).rt_rtx) : ((void *)0);
      if (body && ((enum rtx_code) (body)->code) == SET
      && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
      && part_dead_or_set_p(nexti, operands[0])
      && ((((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == SUBREG
      && (rhs_regno(((((((body)->u.fld[1]).rt_rtx))->u.fld[0]).rt_rtx))) == (rhs_regno(operands[0])))
      || (((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG
      && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == (rhs_regno(operands[0])) + 1))) {
         operands[0] = (((body)->u.fld[0]).rt_rtx);
         cancel_insn(nexti);
      } else
      operands[0] = gen_rtx(REG, QImode, (rhs_regno(operands[0])) + 1);
      mode = QImode;
   }
   if (mode == QImode) {
      if (((enum rtx_code) (operands[1])->code) != CONST_INT
      && ((enum machine_mode) (operands[1])->mode) != QImode) {
         rtx part[8];
         int size = ((unsigned short) mode_size[((enum machine_mode) (operands[1])->mode)]) - 1;
         split_any(operands[1], size, part);
         operands[1] = part[size];
      }
      if (((enum rtx_code) (operands[2])->code) != CONST_INT
      && ((enum machine_mode) (operands[2])->mode) != QImode) {
         rtx part[8];
         int size = ((unsigned short) mode_size[((enum machine_mode) (operands[2])->mode)]) - 1;
         split_any(operands[2], size, part);
         operands[2] = part[size];
      }
      if (((enum rtx_code) (operands[0])->code) == REG
      && ((enum rtx_code) (operands[2])->code) == CONST_INT
      && ((operands[2])->u.hwint[0]) == 2)
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
      if (((enum machine_mode) (operands[1])->mode) == QImode) {



         rtx reg0[2];
         split_reg(operands[0], 1, reg0);
         operands[3] = reg0[1];
         if (((enum rtx_code) (operands[1])->code) == REG) {
            if (((enum rtx_code) (operands[2])->code) == REG)
            {
               if( pragma_output )
               output_asm_insn( ";out output_mult", operands );
               if (signedp)
               return "MULA   %0,%1,%2\n\tMOVE  %3,%%a";
               return "MUL %0,%1,%2\n\tMOVE  %3,%%a";
            }
            if ((rhs_regno(operands[1])) != (rhs_regno(reg0[0])))
            output_asm_insn("MOVE   %0,%1", operands);
            if( pragma_output )
            output_asm_insn( ";out output_mult", operands );

            if (signedp)
            return "MULA   %0,%2\n\tMOVE  %3,%%a";
            return "MUL %0,%2\n\tMOVE  %3,%%a";
         }
         if (((enum rtx_code) (operands[2])->code) != REG
         || (rhs_regno(operands[2])) != (rhs_regno(reg0[0]))) {


            if (reg_mentioned_p(reg0[0], operands[1]))
            {

               if
               (
               (reg_mentioned_p(reg0[0], operands[2]))
               && (((enum rtx_code) (operands[1])->code) == MEM)
               && (((enum rtx_code) (operands[2])->code) == MEM)
               )
               {



                  if (rtx_equal_p (operands[1], operands[2]))
                  {
                     output_asm_insn("MOVE   %%a,%2", operands);
                     output_asm_insn("MUL %0,%%a,%%a", operands);
                     output_asm_insn("MOVE   %3,%%a", operands);
                     if( pragma_output )
                     output_asm_insn( ";out output_mult", operands );
                     return "";
                  }






                  output_asm_insn("MOVE   %%a,%2", operands);
                  output_asm_insn("MOVE   -(%%i3,1),%%a", operands);
                  output_asm_insn("MOVE   %0,%1", operands);
                  output_asm_insn("MOVE   %%a,(%%i3,1)+", operands);

                  if (signedp) output_asm_insn( "MULA  %0,%%a", operands );
                  else output_asm_insn( "MUL   %0,%%a", operands );

                  output_asm_insn( "MOVE  %3,%%a", operands );

                  if( pragma_output )
                  output_asm_insn( ";out output_mult", operands );

                  return "";
# 4646 "c816.c"
               }




               output_asm_insn("MOVE   %0,%1", operands);
               if( pragma_output )
               output_asm_insn( ";out output_mult", operands );

               if (signedp) output_asm_insn( "MULA  %0,%2", operands );
               else output_asm_insn( "MUL   %0,%2", operands );
               output_asm_insn( "MOVE  %3,%%a", operands );



               return "";





            }
            output_asm_insn("MOVE   %0,%2", operands);
         }

         if( pragma_output )
         output_asm_insn( ";out output_mult", operands );
         if (signedp)
         return "MULA   %0,%1\n\tMOVE  %3,%%a";
         return "MUL %0,%1\n\tMOVE  %3,%%a";
      }


      if (((enum rtx_code) (operands[2])->code) == CONST_INT
      && is_power_of_2(((operands[2])->u.hwint[0]))) {
         unsigned int val = ((operands[2])->u.hwint[0]), count = 0;
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

   if (((enum machine_mode) (operands[1])->mode) == HImode)
   {

      if( pragma_output )
      output_asm_insn( ";out output_mult => output_libcall", operands );
      return output_libcall(insn, operands, 2, 0, 1,
      signedp ? "mulhisi3" : "umulhisi3", 0, 0, 0);
   }
   if (((enum rtx_code) (operands[2])->code) == CONST_INT
   && is_power_of_2(((operands[2])->u.hwint[0]))) {
      unsigned int val = ((operands[2])->u.hwint[0]), count = 0;
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
# 4725 "c816.c"
const char *
output_divmod(rtx insn, rtx *operands, int signedp)
{
   rtx ops[8], div_dest_hi = ((void *)0), mod_dest_hi = ((void *)0);



   enum machine_mode mode = ((enum machine_mode) (operands[0])->mode);
   if(((unsigned short) mode_size[((enum machine_mode) (operands[3])->mode)])
   > ((unsigned short) mode_size[mode]) )
   mode = ((enum machine_mode) (operands[3])->mode);
# 4748 "c816.c"
   if( pragma_output )
   output_asm_insn( ";in output_divmod", operands );

   if (mode == VOIDmode)
   mode = ((enum machine_mode) (operands[3])->mode);







   {
      unsigned char unused_op0 = 0;
      unsigned char unused_op3 = 0;

      if (((enum rtx_code) (operands[0])->code) == REG
      && find_regno_note(insn, REG_UNUSED, (rhs_regno(operands[0]))))
      unused_op0 = 1;
      if (((enum rtx_code) (operands[3])->code) == REG
      && find_regno_note(insn, REG_UNUSED, (rhs_regno(operands[3]))))
      unused_op3 = 1;

      if(unused_op0 && (!unused_op3))
      operands[0] = (const_int_rtx[64]);
      if((!unused_op0) && unused_op3)
      operands[3] = (const_int_rtx[64]);
   }


   if((((enum rtx_code) (operands[2])->code) == CONST_INT)
   && ((operands[2])->u.hwint[0]) == 0)
   return "";
# 4794 "c816.c"
   if (((enum rtx_code) (operands[1])->code) == CONST_INT
   && ((enum rtx_code) (operands[2])->code) == CONST_INT) {



      if (operands[0] != (const_int_rtx[64])) {
         ops[0] = operands[0];
         ops[1] = gen_rtx(CONST_INT, VOIDmode,
         ((operands[1])->u.hwint[0]) / ((operands[2])->u.hwint[0]));
         output_asm_insn(output_move(insn, ops), ops);
      }
      if (operands[3] != (const_int_rtx[64])) {
         ops[0] = operands[3];
         ops[1] = gen_rtx(CONST_INT, VOIDmode,
         ((operands[1])->u.hwint[0]) % ((operands[2])->u.hwint[0]));
         output_asm_insn(output_move(insn, ops), ops);
      }
      return "";
   }

   if
   (
   (mode == HImode)
   && (((enum machine_mode) (operands[1])->mode) == QImode)
   && (((enum machine_mode) (operands[2])->mode) == QImode)
   )







   {
      if (operands[0] == (const_int_rtx[64])
      || only_use_trunc_p(insn, operands[0]))
      {
         rtx nexti = next_nnote_nclob_nuse_insn(insn);
         rtx body = nexti && ((enum rtx_code) (nexti)->code) == INSN ? (((nexti)->u.fld[5]).rt_rtx) : ((void *)0);
         if (operands[0] != (const_int_rtx[64])) {
            if (body && ((enum rtx_code) (body)->code) == SET
            && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
            && part_dead_or_set_p(nexti, operands[0])
            && ((((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == SUBREG
            && (rhs_regno(((((((body)->u.fld[1]).rt_rtx))->u.fld[0]).rt_rtx))) == (rhs_regno(operands[0])))
            || (((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG
            && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == (rhs_regno(operands[0])) + 1))) {
               operands[0] = (((body)->u.fld[0]).rt_rtx);
               cancel_insn(nexti);
            }
            if (((enum machine_mode) (operands[0])->mode) == HImode) {
               split_reg(operands[0], 1, ops);
               operands[0] = ops[1];
            }
         }
         if (((enum rtx_code) (operands[3])->code) == REG
         && only_use_trunc_p(insn, operands[3]))
         {
            nexti = next_nnote_nclob_nuse_insn(insn);
            body = nexti && ((enum rtx_code) (nexti)->code) == INSN ? (((nexti)->u.fld[5]).rt_rtx) : ((void *)0);
            if (body && ((enum rtx_code) (body)->code) == SET
            && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
            && part_dead_or_set_p(nexti, operands[3])
            && ((((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == SUBREG
            && (rhs_regno(((((((body)->u.fld[1]).rt_rtx))->u.fld[0]).rt_rtx))) == (rhs_regno(operands[3])))
            || (((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG
            && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == (rhs_regno(operands[3])) + 1)))
            {
               operands[3] = (((body)->u.fld[0]).rt_rtx);
               cancel_insn(nexti);
            }
            if (((enum machine_mode) (operands[3])->mode) == HImode)
            {
               split_reg(operands[3], 1, ops);
               operands[3] = ops[1];
            }
         }
         else
         {

            split_any(operands[3], 1, ops);
            operands[3] = ops[1];
            mod_dest_hi = ops[0];
         }
      }
      else
      {

         if (operands[0] != (const_int_rtx[64]))
         {
            split_any(operands[0], 1, ops);
            operands[0] = ops[1];
            div_dest_hi = ops[0];
         }
         if (operands[3] != (const_int_rtx[64]))
         {
            split_any(operands[3], 1, ops);
            operands[3] = ops[1];
            mod_dest_hi = ops[0];
         }
      }

      mode = QImode;

   }
   if (mode == QImode) {
      if (((enum rtx_code) (operands[1])->code) == REG) {
         if ((rhs_regno(operands[1])) != REG_3) {
            if (((enum rtx_code) (operands[2])->code) == REG) {
               if ((rhs_regno(operands[2])) != REG_2) {
                  if ((rhs_regno(operands[1])) == REG_2) {
                     if ((rhs_regno(operands[2])) == REG_3)

                     output_asm_insn("MOVE   %%r2,%%r0\n\t"
                     "MOVE %%r0,%%r1\n\t"
                     "MOVE %%r1,%%r2", operands);
                     else
                     output_asm_insn("MOVE   %%r0,%%r1\n\t"
                     "MOVE %%r1,%2", operands);
                  } else if ((rhs_regno(operands[2])) == REG_3)
                  output_asm_insn("MOVE   %%r1,%%r0\n\t"
                  "MOVE %%r0,%1", operands);
                  else
                  output_asm_insn("MOVE   %%r0,%1\n\t"
                  "MOVE %%r1,%2", operands);
               } else
               output_asm_insn("MOVE   %%r0,%1", operands);
            } else
            output_asm_insn("MOVE   %%r0,%1", operands);
         } else if (((enum rtx_code) (operands[2])->code) == REG
         && (rhs_regno(operands[2])) != REG_2)
         output_asm_insn("MOVE   %%r1,%2", operands);
      } else if (((enum rtx_code) (operands[2])->code) == REG
      && (rhs_regno(operands[2])) != REG_2)
      output_asm_insn("MOVE   %%r1,%2", operands);
      if (((enum rtx_code) (operands[1])->code) != REG) {
         ops[0] = gen_rtx(REG, QImode, REG_3), ops[1] = operands[1];
         output_asm_insn(output_move(insn, ops), ops);
      }
      if (((enum rtx_code) (operands[2])->code) != REG) {
         ops[0] = gen_rtx(REG, QImode, REG_2), ops[1] = operands[2];
         output_asm_insn(output_move(insn, ops), ops);
      }
      if (operands[0] == (const_int_rtx[64])) {

         output_asm_insn(signedp
         ? (TARGET_SOFTLIB
         ? "CALLS modqi3" : "CALL   modqi3")
         : (TARGET_SOFTLIB
         ? "CALLS umodqi3" : "CALL  umodqi3"),
         operands);
         if (mod_dest_hi)
         {
# 4963 "c816.c"
            if (signedp)
            return "MOVE   %%r3,%%r2\n\t"
            "MULA %%r3,#1";
            return "MOVE   %%r3,#0";

         }
         if (((enum rtx_code) (operands[3])->code) != REG
         || (rhs_regno(operands[3])) != REG_1)
         {
            operands[0] = operands[3];



            operands[1] = gen_rtx(REG, QImode, REG_1);

            return output_move(insn, operands);
         }
         return "";
      }
      output_asm_insn(signedp
      ? (TARGET_SOFTLIB
      ? "CALLS divmodqi4" : "CALL   divmodqi4")
      : (TARGET_SOFTLIB
      ? "CALLS udivmodqi4" : "CALL  udivmodqi4"), operands);
      if (operands[3] == (const_int_rtx[64])) {
         if (((enum rtx_code) (operands[0])->code) != REG
         || (rhs_regno(operands[0])) != REG_3) {
            operands[1] = gen_rtx(REG, QImode, REG_3);
            if (div_dest_hi) {
               output_asm_insn(output_move(insn, operands), operands);
               if (signedp)
               output_asm_insn("MULA   %1,#1", operands);
               else
               operands[1] = (const_int_rtx[64]);
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
      if (((enum rtx_code) (operands[0])->code) == REG
      && (rhs_regno(operands[0])) == REG_1) {
         if (((enum rtx_code) (operands[3])->code) == REG
         && (rhs_regno(operands[3])) == REG_3) {

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

         ops[0] = operands[3], ops[1] = gen_rtx(REG, QImode, REG_1);
         output_asm_insn(output_move(insn, ops), ops);
         if (mod_dest_hi) {
            ops[0] = mod_dest_hi;
            if (signedp)
            output_asm_insn("MULA   %1,#1", ops);
            else
            ops[1] = (const_int_rtx[64]);
            output_asm_insn(output_move(insn, ops), ops);
         }
         operands[1] = gen_rtx(REG, QImode, REG_3);
         if (div_dest_hi) {
            output_asm_insn(output_move(insn, operands), operands);
            if (signedp)
            output_asm_insn("MULA   %1,#1", operands);
            else
            operands[1] = (const_int_rtx[64]);
            operands[0] = div_dest_hi;
         }
         return output_move(insn, operands);
      }

      if (((enum rtx_code) (operands[0])->code) == REG
      && (rhs_regno(operands[0])) == REG_3) {
         if (div_dest_hi) {
            ops[0] = div_dest_hi;
            if (signedp) {
               ops[1] = operands[0];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MULA   %0,#1", ops);
            } else {
               ops[1] = (const_int_rtx[64]);
               output_asm_insn(output_move(insn, ops), ops);
            }
         }
      } else {
         ops[0] = operands[0], ops[1] = gen_rtx(REG, QImode, REG_3);
         output_asm_insn(output_move(insn, ops), ops);
         if (div_dest_hi) {
            ops[0] = div_dest_hi;
            if (signedp)
            output_asm_insn("MULA   %1,#1", ops);
            else
            ops[1] = (const_int_rtx[64]);
            output_asm_insn(output_move(insn, ops), ops);
         }
      }
      if (((enum rtx_code) (operands[3])->code) == REG
      && (rhs_regno(operands[3])) == REG_1) {
         if (mod_dest_hi) {
            ops[0] = mod_dest_hi;
            if (signedp) {
               ops[1] = operands[3];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MULA   %0,#1", ops);
            } else {
               ops[1] = (const_int_rtx[64]);
               output_asm_insn(output_move(insn, ops), ops);
            }
         }
         return "";
      }
      operands[0] = operands[3], operands[1] = gen_rtx(REG, QImode, REG_1);
      if (mod_dest_hi) {
         output_asm_insn(output_move(insn, operands), operands);
         if (signedp)
         output_asm_insn("MULA   %1,#1", operands);
         else
         operands[1] = (const_int_rtx[64]);
         operands[0] = mod_dest_hi;
      }
      return output_move(insn, operands);
   }
   if (mode == HImode) {
# 5134 "c816.c"
      if (((enum machine_mode) (operands[1])->mode) == QImode) {

         if (((enum rtx_code) (operands[2])->code) != REG
         || (rhs_regno(operands[2])) != REG_2) {
            if (((enum rtx_code) (operands[1])->code) == REG) {
               if ((rhs_regno(operands[1])) != REG_3)
               output_asm_insn("MOVE   %%r0,%1", operands);
               if ((rhs_regno(operands[1])) != REG_2)
               output_asm_insn("MOVE   %%r1,%%r0", operands);
            } else {
               ops[0] = gen_rtx(REG, QImode, REG_3);
               ops[1] = operands[1];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MOVE   %%r1,%%r0", operands);
            }
            output_asm_insn("MULA   %%r1,#1", operands);
            operands[1] = gen_rtx(REG, HImode, REG_2);
         } else {

            output_asm_insn("MOVE   -(%%sp),%%r0", operands);
            output_asm_insn("MOVE   -(%%sp),%%r1", operands);
            if (((enum rtx_code) (operands[1])->code) == MEM) {
               int nregs = find_regs_in_addr((((operands[1])->u.fld[0]).rt_rtx), 0);
               int found, i;
               for (found = 0, i = 0; !found && i < nregs; i++)
               found = (rhs_regno(addr_regs[i])) == HARD_SP_REG;
               if (found)
               operands[1] = modif_mem_address(operands[1], QImode,
               HARD_SP_REG, 2);
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
            output_asm_insn("MOVE   %%a,(%%i3,2)+", operands);

            return "";
         }
      }
      if (((enum machine_mode) (operands[2])->mode) == QImode) {

         if (((enum rtx_code) (operands[1])->code) != REG
         || (rhs_regno(operands[1])) != REG_0) {
            if (((enum rtx_code) (operands[2])->code) == REG) {
               if ((rhs_regno(operands[2])) != REG_1)
               output_asm_insn("MOVE   %%r2,%2", operands);
               if ((rhs_regno(operands[2])) != REG_0)
               output_asm_insn("MOVE   %%r3,%%r2", operands);
            } else {
               ops[0] = gen_rtx(REG, QImode, REG_1);
               ops[1] = operands[2];
               output_asm_insn(output_move(insn, ops), ops);
               output_asm_insn("MOVE   %%r3,%%r2", operands);
            }
            output_asm_insn("MULA   %%r3,#1", operands);
            operands[2] = gen_rtx(REG, HImode, REG_0);
         } else {
            if (((enum rtx_code) (operands[2])->code) == REG) {
               if ((rhs_regno(operands[2])) != REG_3)
               output_asm_insn("MOVE   %%r0,%2", operands);
               if ((rhs_regno(operands[2])) != REG_2)
               output_asm_insn("MOVE   %%r1,%%r0", operands);
            } else {
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






      return "";
   }

   if (operands[3] != (const_int_rtx[64])) {
      rtx nexti = next_nnote_nclob_nuse_insn(insn);
      rtx body = nexti && ((enum rtx_code) (nexti)->code) == INSN ? (((nexti)->u.fld[5]).rt_rtx) : ((void *)0);
      if (body && ((enum rtx_code) (body)->code) == SET
      && ((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG) {
         if ((rhs_regno((((body)->u.fld[1]).rt_rtx))) == (rhs_regno(operands[3]))
         && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
         && part_dead_or_set_p(nexti, operands[3])) {
            operands[3] = (((body)->u.fld[0]).rt_rtx);
            cancel_insn(nexti);
         } else if ((rhs_regno((((body)->u.fld[1]).rt_rtx))) == REG_0) {
            nexti = next_nnote_nclob_nuse_insn(nexti);
            body = nexti && ((enum rtx_code) (nexti)->code) == INSN ? (((nexti)->u.fld[5]).rt_rtx) : ((void *)0);
            if (body && ((enum rtx_code) (body)->code) == SET
            && (((body)->u.fld[0]).rt_rtx) != (global_rtl[GR_CC0])
            && ((enum rtx_code) ((((body)->u.fld[1]).rt_rtx))->code) == REG
            && (rhs_regno((((body)->u.fld[1]).rt_rtx))) == (rhs_regno(operands[3]))
            && part_dead_or_set_p(nexti, operands[3])) {
               operands[3] = (((body)->u.fld[0]).rt_rtx);
               cancel_insn(nexti);
            }
         }
      }
   }
   output_asm_insn(output_libcall(insn, operands, 1, 1, 0,
   signedp ? "divmodsi4" : "udivmodsi4",
   0, 0, 0),
   operands);
   if (operands[3] != (const_int_rtx[64])) {
      int found = 0, nregs, i;
      char s[256];
      if (((enum rtx_code) (operands[3])->code) == MEM) {
         nregs = find_regs_in_addr((((operands[3])->u.fld[0]).rt_rtx), 0);
         for (i = 0; !found && i < nregs; i++)
         found = (rhs_regno(addr_regs[i])) == HARD_SP_REG;
         if (found) {
            ops[0] = modif_mem_address(operands[3], QImode, HARD_SP_REG, 3);
            for (i = 0; i < 4; i++)
            output_asm_insn("MOVE   %%a,(%%sp)+\n\tMOVE  %0,%%a", ops);
         }
      }
      if (!found) {
         rtx part[8];
         split_any(operands[3], 3, part);
         if (((enum rtx_code) (operands[3])->code) == REG)
         strcpy(s, "MOVE   %0,(%%sp)+");
         else
         strcpy(s, "MOVE   %%a,(%%sp)+\n\tMOVE  %0,%%a");
         for (i = 0; i < 4; i++) {
            ops[0] = part[i];
            output_asm_insn(s, ops);
         }
      }
   } else

   output_asm_insn("MOVE   %%a,(%%sp,4)+", ops);
   return "";
}





static rtx
output_logical_1(rtx insn, rtx *ops, int is_dead, int has_auto)
{

   if( pragma_output )
   output_asm_insn( ";in output_logical_1", ops );

   if (!has_auto && ((enum rtx_code) (ops[2])->code) == CONST_INT) {

      if (((ops[2])->u.hwint[0]) == 0xff) {
         switch (((enum rtx_code) (ops[3])->code)) {
            case IOR:
            return ops[0];
            case ,:
            output_asm_insn(output_move(insn, ops), ops);
            break;
            case XOR:
            output_asm_insn(output_not(insn, ops), ops);
            break;
            default:
            abort_with_insn(insn, "Bad logical operation.");
         }
         return 0;
      }
      if (((ops[2])->u.hwint[0]) == 0) {
         switch (((enum rtx_code) (ops[3])->code)) {
            case ,:
            return ops[0];
            case IOR:
            case XOR:
            output_asm_insn(output_move(insn, ops), ops);
            break;
            default:
            abort_with_insn(insn, "Bad logical operation.");
         }
         return 0;
      }
   }

   if (((enum rtx_code) (ops[0])->code) == REG) {
      if (((enum rtx_code) (ops[1])->code) == REG
      && ((enum rtx_code) (ops[2])->code) == REG) {
         output_asm_insn("%o3 %0,%1,%2", ops);
         return 0;
      }
      output_asm_insn(output_move(insn, ops), ops);
      output_asm_insn("%o3 %0,%2", ops);
      return 0;
   }
   if (is_dead) {
      output_asm_insn("%o3 %1,%2\n\tMOVE  %0,%1", ops);
      return 0;
   }

   if (((enum rtx_code) (ops[1])->code) == REG
   && ((enum rtx_code) (ops[3])->code) == ,
   && ((enum rtx_code) (ops[2])->code) == CONST_INT) {
      output_asm_insn("TSTPAT %1,%2 ; set accu implicitly\n\t"
      "MOVE %0,%%a", ops);
      return 0;
   }
   if (((enum rtx_code) (ops[1])->code) == REG
   && ((enum rtx_code) (ops[2])->code) == REG) {
      output_asm_insn("%o3 %%a,%1,%2\n\t"
      "MOVE %0,%%a", ops);
      return 0;
   }
   output_asm_insn("MOVE   %%a,%1\n\t"
   "%o3  %%a,%2\n\t"
   "MOVE %0,%%a", ops);
   return 0;
}




const char *
output_logical(rtx insn, rtx *operands)
{
   int size = ((unsigned short) mode_size[((enum machine_mode) (operands[0])->mode)]);
   int i, j = 0, is_dead;
   int autoinc = 0;
   rtx op[3][8], ops[4], cst[8], stacked[8];


   for( i = 0; i < 8; i++ )
      {
      stacked[ i ] = 0;
      }


   if( pragma_output )
   output_asm_insn( ";in output_logical", operands );

   if (((enum rtx_code) (operands[1])->code) == CONST_INT
   || (((enum rtx_code) (operands[2])->code) == REG
   && ((enum rtx_code) (operands[1])->code) != REG)
   || (((enum rtx_code) (operands[0])->code) != REG
   && ((enum rtx_code) (operands[2])->code) == REG
   && part_dead_or_set_p(insn, operands[2]))) {
      rtx tem = operands[1];
      operands[1] = operands[2];
      operands[2] = tem;
   }
   is_dead = ((enum rtx_code) (operands[1])->code) == REG && part_dead_or_set_p(insn, operands[1]);
   for (i = 0; i < 3; i++) {
      if (((enum rtx_code) (operands[i])->code) == MEM
      && (((enum rtx_code) ((((operands[i])->u.fld[0]).rt_rtx))->code) == POST_INC
      || ((enum rtx_code) ((((operands[i])->u.fld[0]).rt_rtx))->code) == PRE_DEC)) {
         int inc = ((enum rtx_code) ((((operands[i])->u.fld[0]).rt_rtx))->code) == POST_INC ? 1 : -1;
         rtx tem;
         if (autoinc != 0 && autoinc != inc)
         abort_with_insn(insn,
         "Auto inc and dec in the same instruction"
         " not implemented");
         autoinc = inc;
         tem = gen_rtx(MEM, QImode, (((operands[i])->u.fld[0]).rt_rtx));
         for (inc = 0; inc < size; inc++)
         op[i][inc] = tem;
      } else
      split_any(operands[i], size - 1, op[i]);
   }
   ops[3] = operands[3];


   for (i = (autoinc == -1) ? size - 1 : 0;
   (autoinc == -1) ? i >= 0 : i < size;
   (autoinc == -1) ? i-- : i++) {
      ops[0] = op[0][i]; ops[1] = op[1][i]; ops[2] = op[2][i];
# 5427 "c816.c"
      if( ((autoinc==-1) ? i!=0 : i<size-1)
      && (((enum rtx_code) (ops[0])->code) == REG)
      &&( (((enum rtx_code) (operands[1])->code) == MEM
      && reg_overlap_mentioned_p(ops[0], operands[1])
      )
      || ( ((enum rtx_code) (operands[2])->code) == MEM
      && reg_overlap_mentioned_p(ops[0], operands[2])
      )
      )
      )
      {
         stacked[i]=ops[0];
         ops[0]=gen_rtx(REG, QImode, ACCU_REG);
      }
      else


         if( ((autoinc==-1) ? i!=0 : i<size-1) )
         {
            if( ((enum rtx_code) (ops[ 0 ])->code) == REG )
            {
               int k;

               stacked[ i ] = 0;


               for( k = ( autoinc == -1 ) ? i - 1 : i + 1;
                     ( autoinc == -1 ) ? k >= 0 : k < size;
                     ( autoinc == -1 ) ? k-- : k++ )
               {


                  if( ( ( ((enum rtx_code) (op[ 1 ][ k ])->code) == REG ) && ( output_asm_insn( "; -- 1", operands ), reg_overlap_mentioned_p( ops[ 0 ], op[ 1 ][ k ] ) ) ) ||
                      ( ( ((enum rtx_code) (op[ 2 ][ k ])->code) == REG ) && ( output_asm_insn( "; -- 2", operands ), reg_overlap_mentioned_p( ops[ 0 ], op[ 2 ][ k ] ) ) ) )
                  {
                     stacked[ i ] = ops[ 0 ];
                     ops[0]=gen_rtx(REG, QImode, ACCU_REG);
                  }
               }
            }
         }
      else

      stacked[i] = 0;


      cst[j] = output_logical_1(insn, ops, is_dead, autoinc);
      if (cst[j])
      {

         if(stacked[i])
         {
            cst[j]=stacked[i];
            stacked[i] = 0;
         }
         cst[++j] = 0;
      }
      else
      {

         if(stacked[i])
         output_asm_insn("MOVE  -(%%i3,1), %%a",operands);

      }
   }


   for (i = (autoinc != -1) ? size - 1 : 0;
   (autoinc != -1) ? i >= 0 : i < size;
   (autoinc != -1) ? i-- : i++)
   {

      ops[1] = gen_rtx( MEM, QImode, gen_rtx( POST_INC, Pmode, gen_rtx(REG, QImode, HARD_SP_REG ), gen_rtx( CONST_INT, VOIDmode, 1 ) ) );
      if(stacked[i])
      {

         ops[0]=stacked[i];
         output_move(insn, ops);
      }

   }


   if (cst[0]) {

      int is_reg;
      if (((enum rtx_code) (operands[3])->code) == ,) {
         is_reg = ((enum rtx_code) (cst[0])->code) == REG || page0_mem(cst[0]);
         ops[1] = (const_int_rtx[64]);
      } else {
         is_reg = ((enum rtx_code) (cst[0])->code) == REG;
         ops[1] = gen_rtx(CONST_INT, VOIDmode, 0xff);
      }
      if (!is_reg)
      output_asm_insn("MOVE   %%a,%1", ops);
      for (j = 0; cst[j]; j++) {
         ops[0] = cst[j];
         output_asm_insn(is_reg
         ? "MOVE  %0,%1"
         : "MOVE  %0,%%a", ops);
      }
   }
   return "";
}



const char *
output_not(rtx insn, rtx *operands)
{

   enum rtx_code code = ((enum rtx_code) (operands[1])->code);

   int size = ((unsigned short) mode_size[((enum machine_mode) (operands[0])->mode)]);
   int i;
   rtx op0[8], op1[8], ops[2];


   if( pragma_output )
   output_asm_insn( ";in output_not", operands );
   if( (code == const)
   || (code == CONST_INT)
   || (code == CONST_DOUBLE)
   )
   {

      operands[1] = gen_rtx(code, VOIDmode,
      ~((operands[1])->u.hwint[0]));
      if( pragma_output )
      output_asm_insn( ";out output_not => output_move", operands );
      return output_move(insn, operands);
   }
# 5568 "c816.c"
   split_any(operands[0], size - 1, op0);
   split_any(operands[1], size - 1, op1);


   if( (code == SYMBOL_REF)
   || (code == LABEL_REF)
   || (code == HIGH)
   || (code == LO_SUM)
   )
   {




      if (((enum rtx_code) (operands[0])->code) == REG)
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

   if (((enum rtx_code) (operands[0])->code) == REG)
   {
      for (i = size - 1; i >= 0; i--) {
         ops[0] = op0[i], ops[1] = op1[i];
         output_asm_insn("CPL1   %0,%1", ops);
      }
      if( pragma_output )
      output_asm_insn( ";out output_not", operands );
      return "";
   }
   for (i = size - 1; i >= 0; i--) {
      ops[0] = op0[i], ops[1] = op1[i];
      output_asm_insn("CPL1   %%a,%1\n\t"
      "MOVE %0,%%a", ops);
   }
   if( pragma_output )
   output_asm_insn( ";out output_not", operands );
   return "";
}


int
page0_mem(rtx x)
{
   if (((enum rtx_code) (x)->code) == MEM) {
      rtx addr = (((x)->u.fld[0]).rt_rtx);
      switch (((enum rtx_code) (addr)->code)) {
         case SYMBOL_REF:
         case const:
         return 1;
         case PLUS:
         return CONSTANT_ADDRESS_P((((addr)->u.fld[0]).rt_rtx))
         && CONSTANT_ADDRESS_P((((addr)->u.fld[1]).rt_rtx));
         default:
         break;
      }
      return 0;
   }
   return 0;
}





const char *
output_to_float(rtx insn, rtx *operands, int uns, unsigned int mask)
{
   const char * call = ((void *)0);
   enum machine_mode mode = ((enum machine_mode) (operands[1])->mode);
   rtx ops[2];

   if( pragma_output )
   output_asm_insn( ";in output_to_float", operands );

   if (((enum rtx_code) (operands[1])->code) == CONST_INT) {


      unsigned int c1 = ((operands[1])->u.hwint[0]);
      struct real_value r;
      if (uns)
      c1 &= mask;
      real_from_target(&r,(long) c1,VOIDmode);
      operands[1] = const_double_from_real_value (r, ((enum machine_mode) (operands[0])->mode));
      return output_move(insn, operands);
   }
   switch (mode) {
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





const char *
output_to_int(rtx insn, rtx *operands, int uns)
{
   const char *call = ((void *)0);
   rtx ops[2];

   if( pragma_output )
   output_asm_insn( ";in output_to_int", operands );

   switch (((enum machine_mode) (operands[0])->mode)) {
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
   ops[0] = gen_rtx(REG, ((enum machine_mode) (operands[1])->mode), REG_0);
   ops[1] = operands[1];
   output_asm_insn(output_move(insn, ops), ops);
   if (((enum machine_mode) (operands[1])->mode) == TQFmode)
   output_asm_insn("MOVE   %%r0,#0", operands);
   output_asm_insn(call, operands);
   return "";
}




void
notice_update_cc(rtx exp, rtx insn)
{


   if (((enum rtx_code) (insn)->code) != INSN)
   return;
   if (((enum rtx_code) (insn)->code) == MULT)
   {

   }
   if (((enum rtx_code) (exp)->code) == PARALLEL) {

      (cc_status.flags = 0, cc_status.value1 = 0, cc_status.value2 = 0, 0);
      exp = (((((exp)->u.fld[0]).rt_rtvec))->elem[0]);
      if (((enum rtx_code) (exp)->code) == SET && (((exp)->u.fld[0]).rt_rtx) == (global_rtl[GR_CC0])) {
         cc_status.value1 = (((exp)->u.fld[1]).rt_rtx);


         cc_status.mdep.op1 = recog_data.operand[0];




         if (((enum rtx_code) ((((exp)->u.fld[1]).rt_rtx))->code) == COMPARE)

         cc_status.mdep.op2 = recog_data.operand[1];



         else
         cc_status.mdep.op2 = (const_int_rtx[64]);
      }
      return;
   }
   if (((enum rtx_code) (exp)->code) == SET) {

      if ((((exp)->u.fld[0]).rt_rtx) == (global_rtl[GR_CC0])) {

         (cc_status.flags = 0, cc_status.value1 = 0, cc_status.value2 = 0, 0);
         cc_status.value1 = (((exp)->u.fld[1]).rt_rtx);

         cc_status.mdep.op1 = recog_data.operand[0];



         if (((enum rtx_code) ((((exp)->u.fld[1]).rt_rtx))->code) == COMPARE)
         {


            cc_status.mdep.op2 = recog_data.operand[1];



         }
         else
         {

            cc_status.mdep.op2 = (const_int_rtx[64]);
         }
         if (((enum machine_mode) (cc_status.mdep.op1)->mode) == QImode) {

            if (op_in_accu_p(cc_status.mdep.op1, insn))
            {

               cc_status.mdep.in_accu = cc_status.mdep.op1;
            }
            if (op_in_accu_p(cc_status.mdep.op2, insn))
            {

               cc_status.mdep.in_accu = cc_status.mdep.op2;
            }
            if (cc_status.mdep.op2 == (const_int_rtx[64])
            && cc_status.mdep.in_accu == cc_status.mdep.op1
            && cc_set_with_accu_p(cc_status.mdep.op1,insn))
            {

               cc_status.mdep.cmp0_done = 1;
            }
         }
         return;
      }
      if (((enum rtx_code) ((((exp)->u.fld[0]).rt_rtx))->code) == MEM
      && ((enum rtx_code) ((((exp)->u.fld[1]).rt_rtx))->code) == REG)
      {

         return;
      }

      (cc_status.flags = 0, cc_status.value1 = 0, cc_status.value2 = 0, 0);
   }
}




const char *
output_movstr(rtx insn, rtx *operands)
{

   rtx ops[5];
   enum machine_mode mode = ((enum machine_mode) (operands[2])->mode);

   if( pragma_output )
   output_asm_insn( ";in output_movstr", operands );

   ops[0] = ops[1] = operands[2];
   ops[2] = gen_rtx(CONST_INT, VOIDmode, -1);
   ops[3] = gen_rtx(MEM, BLKmode,
   gen_rtx(POST_INC, Pmode, operands[0]));
   ops[4] = gen_rtx(MEM, BLKmode,
   gen_rtx(POST_INC, Pmode, operands[1]));



   {

      rtx op1[8];
      int size = ((unsigned short) mode_size[mode]);
      int i=1;
      split_any(operands[2], size - 1, op1);






      if (((enum rtx_code) (operands[2])->code) == REG && size > 1) {
         output_asm_insn("OR     %%a,%0,%1", op1);
         i = 2;
      } else
      output_asm_insn("MOVE   %%a,%0", op1);
      for (; i < size; i++) {
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
# 5925 "c816.c"
}


void
c816_cond_reg_usage(void)
{
   if (optimize == 0)
   fixed_regs[HARD_FP_REG]
   = fixed_regs[HARD_FP_REG + 1]
   = call_used_regs[HARD_FP_REG]
   = call_used_regs[HARD_FP_REG + 1] = 1;
}


void
c816_opt_options(int,int);

void
c816_opt_options(level,size)
int level __attribute__ ((__unused__));
int size __attribute__ ((__unused__));

{

   flag_c816_tidy_regs = 1;



}


void
c816_force_positive(rtx exp)
{
   enum rtx_code code = ((enum rtx_code) (exp)->code);
   switch (code) {
      case const:
      c816_force_positive((((exp)->u.fld[0]).rt_rtx));
      return;
      case PLUS:
      if (((enum rtx_code) ((((exp)->u.fld[0]).rt_rtx))->code) == SYMBOL_REF
      && ((enum rtx_code) ((((exp)->u.fld[1]).rt_rtx))->code) == CONST_INT
      && (((((exp)->u.fld[1]).rt_rtx))->u.hwint[0]) < 0)
      (((((exp)->u.fld[1]).rt_rtx))->u.hwint[0]) &= (1 << POINTER_SIZE) - 1;
      if (((enum rtx_code) ((((exp)->u.fld[0]).rt_rtx))->code) == CONST_INT
      && ((enum rtx_code) ((((exp)->u.fld[1]).rt_rtx))->code) == SYMBOL_REF
      && (((((exp)->u.fld[0]).rt_rtx))->u.hwint[0]) < 0)
      (((((exp)->u.fld[0]).rt_rtx))->u.hwint[0]) &= (1 << POINTER_SIZE) - 1;
      return;
      default:
      break;

   }
}


unsigned char
expand_a_shift (enum machine_mode mode, int code, rtx operands[])
{

   {
      char buffer[200];
      char *buffer2;
      switch(code)
      {
         case ASHIFTRT: buffer2="ASHIFTRT"; break;
         case LSHIFTRT: buffer2="LSHIFTRT"; break;
         case ASHIFT: buffer2="ASHIFT"; break;

         default: buffer2="???"; break;
      }
      sprintf(buffer,";in expand_a_shift, code=%d=%s",code,buffer2);
      output_asm_insn( buffer, operands );
   }


   if (((enum rtx_code) (operands[2])->code) != CONST_INT) {
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


   return 1;
}



void
c816_prescan_insn(rtx insn, rtx *opvec, int noperands)
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
      int size = ((unsigned short) mode_size[((enum machine_mode) (opvec[i])->mode)]);
      fix[i].needed = 0;
      fix[i].is_dest = 0;
      if (use_large_frame(opvec[i], size)) {
         count += 1;
         fix[i].needed = 1;
      }
   }
   if ((set = (((((enum rtx_code) (insn)->code) == INSN) || (((enum rtx_code) (insn)->code) == JUMP_INSN) || (((enum rtx_code) (insn)->code) == CALL_INSN)) ? (((enum rtx_code) ((((insn)->u.fld[5]).rt_rtx))->code) == SET ? (((insn)->u.fld[5]).rt_rtx) : single_set_2 (insn, (((insn)->u.fld[5]).rt_rtx))) : (rtx) 0)) != ((void *)0)) {
      enum rtx_code code = ((enum rtx_code) ((((set)->u.fld[0]).rt_rtx))->code);
      enum rtx_code code_src = ((enum rtx_code) ((((set)->u.fld[1]).rt_rtx))->code);
      enum machine_mode mode = ((enum machine_mode) ((((set)->u.fld[0]).rt_rtx))->mode);
      int size = ((unsigned short) mode_size[mode]) - 1;
      if (code == REG
      && (code_src == MINUS || code_src == NEG)
      && size > 0
      && mode_class[mode] == MODE_INT) {





         for (i = 1; i <= (code_src == NEG ? 1 : 2); i++)
         if (((enum rtx_code) (opvec[i])->code) == MEM) {
            int nregs = find_regs_in_addr((((opvec[i])->u.fld[0]).rt_rtx), 0);
            int found = 0, j;
            for (j = 0; !found && j < nregs; j++)
            found = ((rhs_regno(addr_regs[j])) >= (rhs_regno(opvec[0]))
            && (rhs_regno(addr_regs[j])) <= (rhs_regno(opvec[0])) + size);
            if (found && fix[i].needed != 1)
            fix[i].needed = 1, count += 1;
         }
      }
      if ((code_src == PLUS || code_src == MINUS
      || code_src == NEG || code_src == ASHIFT)
      && size > 0
      && mode_class[mode] == MODE_INT) {


         for (i = 0; i <= (code_src == NEG ? 1 : 2); i++)
         if (((enum rtx_code) (opvec[i])->code) == MEM
         && ((enum rtx_code) ((((opvec[i])->u.fld[0]).rt_rtx))->code) == POST_INC) {
            fix[i].needed = 1, count += 1;
         }
      }
      if (code == REG || code == SUBREG || code == MEM) {
         if (code_src == MOD || code_src == UMOD)
         fix[3].is_dest = 1;
         else
         fix[0].is_dest = 1;
         if (((rtx_class[(int) (((enum rtx_code) ((((set)->u.fld[1]).rt_rtx))->code))]) == RTX_CONST_OBJ)
         || code_src == REG || code_src == SUBREG || code_src == MEM)
         is_move = 1;
      }
   } else if (((enum rtx_code) ((((insn)->u.fld[5]).rt_rtx))->code) == PARALLEL) {
      set = ((((((((insn)->u.fld[5]).rt_rtx))->u.fld[0]).rt_rtvec))->elem[0]);
      if (((enum rtx_code) (set)->code) == SET) {
         enum rtx_code code = ((enum rtx_code) ((((set)->u.fld[0]).rt_rtx))->code);
         if (code == REG || code == SUBREG || code == MEM) {
            fix[0].is_dest = 1;
            code = ((enum rtx_code) ((((set)->u.fld[1]).rt_rtx))->code);
            if (noperands == 4 &&
            (code == DIV || code == UDIV))
            fix[3].is_dest = 1;
         }
      }
   }
   if (count == 0)
   return;


   for (i = 0; i < noperands; i++) {
      if (((enum rtx_code) (opvec[i])->code) == REG && (rhs_regno(opvec[i])) == HARD_SP_REG) {
         count += 1;
         fix[i].needed = 1;
      }
   }
   if (is_move && count == 1) {

      if (fix[0].needed) {
         if (!(((enum rtx_code) (opvec[1])->code) == MEM
         && refers_to_regno_p(HARD_SP_REG, HARD_SP_REG + 1,
         opvec[1], ((void *)0))))
         return;
      } else {
         if (!(((enum rtx_code) (opvec[0])->code) == MEM
         && refers_to_regno_p(HARD_SP_REG, HARD_SP_REG + 1,
         opvec[1], ((void *)0))))
         return;
      }
   }
   count = 0;
   for (i = 0; i < noperands; i++)
   if (fix[i].needed && !fix[i].is_dest) {

      rtx ops[2];
      if (count > 1)
      abort_with_insn(insn, "Too many stack operands");
      if (spill_rtx[count] == ((void *)0)) {
         if (count == 0) {
            spill_rtx[count] = gen_rtx(SYMBOL_REF, Pmode, spill_name);
            (((spill_rtx[count]))->volatil) = 1;
         } else {
            spill_rtx[count] = gen_rtx(PLUS, Pmode,
            spill_rtx[0],
            gen_rtx(CONST_INT, VOIDmode,
            count << 2));
         }
      }
      ops[0] = gen_rtx(MEM, ((enum machine_mode) (opvec[i])->mode), spill_rtx[count]);
      ops[1] = opvec[i];
      output_asm_insn(output_move(insn, ops), ops);
      opvec[i] = ops[0];
      count += 1;
   }
   if (is_move)
   return;
   count = 0;
   for (i = 0; i < noperands; i++)
   if (fix[i].needed && fix[i].is_dest) {

      rtx tem, pattern;
      if (count > 1)
      abort_with_insn(insn, "Too many stack operands");
      if (spill_rtx[count] == ((void *)0)) {
         if (count == 0) {
            spill_rtx[count] = gen_rtx(SYMBOL_REF, Pmode, spill_name);
            (((spill_rtx[count]))->volatil) = 1;
         } else {
            spill_rtx[count] = gen_rtx(PLUS, Pmode,
            spill_rtx[0],
            gen_rtx(CONST_INT, VOIDmode,
            count << 2));
         }
      }
      tem = gen_rtx(MEM, ((enum machine_mode) (opvec[i])->mode), spill_rtx[count]);
      pattern = gen_rtx(SET, VOIDmode, opvec[i], tem);
      add_insn_after(make_insn_raw(pattern), insn);
      opvec[i] = tem;
      count += 1;
   }
}
# 6253 "c816.c"
void
c816_tidy_regs(rtx);

void
c816_tidy_regs(insns)
rtx insns __attribute__ ((__unused__));
{
   rtx insn, pattern, last;
   int b, depth;



   depth = 1;
   last = ((void *)0);



   init_recog ();
   for (b = 0; b < ((cfun + 0)->cfg->x_n_basic_blocks); b++) {

      insn = BLOCK_HEAD( b );




      while ((((insn)->u.fld[1]).rt_rtx) != last)
      insn = (((insn)->u.fld[1]).rt_rtx);



      for (; insn != (((BLOCK_END( b ))->u.fld[2]).rt_rtx); insn = (((insn)->u.fld[2]).rt_rtx))



      {

         if (((enum rtx_code) (insn)->code) == NOTE) {
            if ((((insn)->u.fld[4]).rt_int) == NOTE_INSN_LOOP_BEG)
            depth++;
            else if ((((insn)->u.fld[4]).rt_int) == NOTE_INSN_LOOP_END)
            depth--;
            continue;
         }


         if (((enum rtx_code) (insn)->code) != INSN)
         continue;
         pattern = (((insn)->u.fld[5]).rt_rtx);



         if (((enum rtx_code) (pattern)->code) == SET
         && ((enum rtx_code) ((((pattern)->u.fld[1]).rt_rtx))->code) == SIGN_EXTEND
         && ((enum rtx_code) ((((pattern)->u.fld[0]).rt_rtx))->code) == REG
         && ((enum machine_mode) ((((pattern)->u.fld[0]).rt_rtx))->mode) == HImode
         && (reg_info_p[(rhs_regno((((pattern)->u.fld[0]).rt_rtx)))].basic_block) == b
         && REG_N_SETS((rhs_regno((((pattern)->u.fld[0]).rt_rtx)))) == 1) {





            rtx reg = (((pattern)->u.fld[0]).rt_rtx);
            int success = 0, failure = 0;
            rtx nexti;
            rtx npat;
            ((reg)->mode = (QImode));
            for (nexti = (((insn)->u.fld[2]).rt_rtx);

            success == 0 && nexti != (((BLOCK_END( b ))->u.fld[2]).rt_rtx);



            nexti = (((nexti)->u.fld[2]).rt_rtx)) {
               npat = (((nexti)->u.fld[5]).rt_rtx);
               if (((enum rtx_code) (nexti)->code) == INSN) {
                  if (part_dead_or_set_p(nexti, reg)
                  || reg_mentioned_p(reg, npat)) {
                     if (validate_replace_rtx (reg,
                     gen_rtx(SIGN_EXTEND, HImode, reg),
                     nexti)) {
                        if (part_dead_or_set_p(nexti, reg))
                        success = 1;
                        if (((enum rtx_code) (npat)->code) == SET
                        && ((enum rtx_code) ((((npat)->u.fld[1]).rt_rtx))->code) == SUBREG
                        && ((enum rtx_code) (((((((npat)->u.fld[1]).rt_rtx))->u.fld[0]).rt_rtx))->code) == SIGN_EXTEND)

                        (((npat)->u.fld[1]).rt_rtx) = (((((((((npat)->u.fld[1]).rt_rtx))->u.fld[0]).rt_rtx))->u.fld[0]).rt_rtx);
                     } else
                     failure = 1;
                  }
               }
            }
            if (success && !failure) {
               (((pattern)->u.fld[1]).rt_rtx) = ((((((pattern)->u.fld[1]).rt_rtx))->u.fld[0]).rt_rtx);
               (((insn)->u.fld[6]).rt_int) = -1;
               recog_memoized(insn);
            } else {

               rtx old = gen_rtx(SIGN_EXTEND, HImode, reg);
               ((reg)->mode = (HImode));
               for (nexti = (((insn)->u.fld[2]).rt_rtx);

               nexti != (((BLOCK_END( b ))->u.fld[2]).rt_rtx);



               nexti = (((nexti)->u.fld[2]).rt_rtx)) {
                  npat = (((nexti)->u.fld[5]).rt_rtx);
                  if (((enum rtx_code) (nexti)->code) == INSN) {
                     if (part_dead_or_set_p(nexti, reg)
                     || reg_mentioned_p(reg, npat)) {
                        if (!validate_replace_rtx (old, reg, nexti)) {
                           if (((enum rtx_code) (npat)->code) == SET)
                           (((npat)->u.fld[1]).rt_rtx) = gen_rtx(SUBREG, QImode,
                           gen_rtx(SIGN_EXTEND, HImode,
                           (((npat)->u.fld[1]).rt_rtx)),
                           1);
                           if (!validate_replace_rtx (old, reg, nexti))
                           abort_with_insn(nexti, "Error undoing changes");
                        }
                     }
                  }
               }
            }
            continue;
         }


         if (((enum rtx_code) (pattern)->code) == SET
         && ((enum rtx_code) ((((pattern)->u.fld[1]).rt_rtx))->code) == REG
         && (rhs_regno((((pattern)->u.fld[1]).rt_rtx))) < FIRST_PSEUDO_REGISTER
         && ((enum rtx_code) ((((pattern)->u.fld[0]).rt_rtx))->code) == REG) {
            rtx nexti;
            rtx npat;
            rtx reg = (((pattern)->u.fld[0]).rt_rtx);
            int regno = (rhs_regno(reg));
            int span = 2;
            for (nexti = (((insn)->u.fld[2]).rt_rtx);

            nexti != (((BLOCK_END( b ))->u.fld[2]).rt_rtx);



            nexti = (((nexti)->u.fld[2]).rt_rtx)) {
               npat = (((nexti)->u.fld[5]).rt_rtx);
               if (((enum rtx_code) (nexti)->code) == INSN) {
                  if (part_dead_or_set_p(nexti, (((pattern)->u.fld[1]).rt_rtx))
                  || reg_mentioned_p(reg, npat))
                  break;
                  if (((enum rtx_code) (npat)->code) == SET
                  || ((enum rtx_code) (npat)->code) == PARALLEL)
                  span += 1;
               } else if (((enum rtx_code) (nexti)->code) != NOTE)
               break;
            }

            if (nexti == (((BLOCK_END( b ))->u.fld[2]).rt_rtx)
            || ((enum rtx_code) (nexti)->code) != INSN)




            continue;
            if (get_attr_type(nexti) == TYPE_LIB
            && reg_mentioned_p(reg, npat)) {


               if (part_dead_or_set_p(nexti, reg)) {

                  int found = count_occurrences(npat, reg, 0);



                  if (validate_replace_rtx (reg, (((pattern)->u.fld[1]).rt_rtx), nexti)) {
                     rtx note = find_regno_note (nexti, REG_DEAD, regno);
                     remove_note (nexti, note);
                     cancel_insn(insn);
                     REG_N_REFS(regno) -= (found + 1) * depth;
                     REG_N_SETS(regno) -= 1;
                     (reg_info_p[regno].deaths) -= 1;
                     (reg_info_p[regno].live_length) -= span;
                  }
               }
            }
         }
      }

      last = BLOCK_END( b );



   }
}






static tree
cool_handle_page_0_attribute (node, name, args, flags, no_add_attrs)
tree *node;
tree name;
tree args __attribute__ ((__unused__));
int flags __attribute__ ((__unused__));
unsigned char *no_add_attrs;
{
   tree decl = *node;

   if(((decl)->base.static_flag) || ((decl)->decl_common.decl_flag_2) )
   {
      if (lookup_attribute ("indirect",
      ((decl)->decl_common.attributes)) != (tree) ((void *)0))
      {
         error("Cannot specify both page_0 and indirect attributes");
         return (tree) ((void *)0);
      }

      ((decl)->decl_with_vis.section_name) = ((decl)->decl_common.initial) != 0
      ? build_string (12, ".page0_data")
      : build_string (11, ".page0_bss");
      ((decl)->decl_with_vis.common_flag) = 0;
   }
   else
   {
      warning ("`%s' attribute ignored", ((const char *) (name)->identifier.id.str));
      *no_add_attrs = 1;
   }

   return (tree) ((void *)0);
}





static tree
cool_handle_indirect_attribute (node, name, args, flags, no_add_attrs)
tree *node;
tree name;
tree args __attribute__ ((__unused__));
int flags __attribute__ ((__unused__));
unsigned char *no_add_attrs;
{
   tree decl = *node;

   if ((((decl)->base.static_flag) || ((decl)->decl_common.decl_flag_2) ) )
   {
      if( (lookup_attribute ("page_0",
      ((decl)->decl_common.attributes)) != (tree) ((void *)0))
      ||(lookup_attribute ("direct",
      ((decl)->decl_common.attributes)) != (tree) ((void *)0)) )
      {
         error("Cannot specify both page_0 and indirect attributes");
         return (tree) ((void *)0);
      }
   }
   else
   {
      warning ("`%s' attribute ignored", ((const char *) (name)->identifier.id.str));
      *no_add_attrs = 1;
   }
   return (tree) ((void *)0);
}
# 6532 "c816.c"
const struct attribute_spec cool_attribute_table[] =
{
# 6543 "c816.c"
   { "page_0", 0, 0, 1, 0, 0, cool_handle_page_0_attribute },
   { "direct", 0, 0, 1, 0, 0, cool_handle_page_0_attribute },
   { "indirect", 0, 0, 1, 0, 0, cool_handle_indirect_attribute },
   { ((void *)0), 0, 0, 0, 0, 0, ((void *)0) }
};
# 6560 "c816.c"
void
c816_pr_interrupt (cpp_reader * p __attribute__ ((__unused__)))
{
   pragma_interrupt = 1;
}


void
c816_pr_output (cpp_reader * p __attribute__ ((__unused__)))

{
   pragma_output = 1;
}
# 6695 "c816.c"
const struct attribute_spec cool_attribute_table[];
static tree cool_handle_page_0_attribute (tree *, tree, tree, int, unsigned char *);
static tree cool_handle_indirect_attribute (tree *, tree, tree, int, unsigned char *);
# 6711 "c816.c"
struct gcc_target targetm = { {"(", ")", "\t.byte\t", {"\t.word\t", "\t.long\t", ((void *)0), ((void *)0)}, {"\t.word\t", "\t.long\t", ((void *)0), ((void *)0)}, default_assemble_integer, default_globalize_label, default_globalize_decl_name, default_emit_unwind_label, default_emit_except_table_label, default_unwind_emit, default_internal_label, hook_bool_rtx_false, default_assemble_visibility, cool_output_function_prologue, no_asm_to_stream, no_asm_to_stream, cool_output_function_epilogue, hook_void_void, default_no_named_section, default_reloc_rw_mask, default_select_section, default_select_rtx_section, default_unique_section, default_no_function_rodata_section, default_stabs_asm_out_constructor, default_stabs_asm_out_destructor, ((void *)0), hook_bool_const_tree_hwi_hwi_const_tree_false, default_file_start, hook_void_void, default_external_libcall, hook_void_constcharptr, ((void *)0), ".GCC.command.line", ((void *)0), ((void *)0)}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, { 0, default_builtin_vectorized_function, default_builtin_vectorized_conversion, 0, 0, 0, default_builtin_vector_alignment_reachable, 0 }, 0, hook_bool_size_t_constcharptr_int_true, ((void *)0), default_eh_return_filter_mode, default_libgcc_cmp_return_mode, default_libgcc_shift_count_mode, default_unwind_word_mode, merge_decl_attributes, merge_type_attributes, cool_attribute_table, hook_int_const_tree_const_tree_1, hook_void_tree, hook_void_tree_treeptr, hook_bool_const_tree_false, hook_bool_const_tree_false, default_decimal_float_supported_p, default_fixed_point_supported_p, hook_bool_void_false, hook_bool_void_false, hook_void_void, default_expand_builtin, ((void *)0), hook_tree_tree_tree_bool_null, default_builtin_reciprocal, hook_constcharptr_const_tree_null, hook_void_void, elf32_c816_section_type_flags, hook_bool_void_false, hook_int_void_no_regs, hook_bool_bool_false, hook_bool_rtx_false, ((void *)0), hook_bool_const_rtx_commutative_p, hook_rtx_rtx_identity, hook_bool_mode_const_rtx_false, 0, 0, default_use_anchors_for_symbol_p, hook_bool_tree_tree_false, hook_void_tree, hook_bool_const_tree_false, default_binds_local_p, default_mangle_decl_assembler_name, default_encode_section_info, default_strip_name_encoding, default_shift_truncation_mask, default_min_divisions_for_recip_mul, default_mode_rep_extended, default_valid_pointer_mode, default_scalar_mode_supported_p, hook_bool_mode_false, hook_bool_const_tree_false, TARGET_RTX_COSTS, TARGET_ADDRESS_COST, ((void *)0), default_unspec_may_trap_p, hook_rtx_rtx_null, hook_void_tree, hook_bool_uintp_uintp_false, default_cc_modes_compatible, 0, std_build_builtin_va_list, std_fn_abi_va_list, std_canonical_va_list_type, 0, std_gimplify_va_arg_expr, default_get_pch_validity, default_pch_valid_p, ((void *)0), hook_bool_void_false, default_builtin_setjmp_frame_value, hook_tree_tree_tree_tree_3rd_identity, hook_int_const_tree_0, 0, 0, default_stack_protect_guard, default_external_stack_protect_fail, default_invalid_within_doloop, hook_bool_const_tree_true, { hook_bool_const_tree_false, hook_bool_const_tree_false, hook_bool_const_tree_false, hook_rtx_tree_int_null, default_return_in_memory, hook_bool_const_tree_false, hook_bool_CUMULATIVE_ARGS_mode_tree_bool_false, default_expand_builtin_saveregs, default_setup_incoming_varargs, hook_bool_CUMULATIVE_ARGS_true, default_pretend_outgoing_varargs_named, ((void *)0), must_pass_in_stack_var_size_or_pad, hook_bool_CUMULATIVE_ARGS_mode_tree_bool_false, hook_int_CUMULATIVE_ARGS_mode_tree_bool_0, hook_invalid_arg_for_unprototyped_fn, default_function_value, default_internal_arg_pointer, ((void *)0), ((void *)0), hook_bool_void_true }, hook_constcharptr_const_tree_const_tree_null, hook_constcharptr_int_const_tree_null, hook_constcharptr_int_const_tree_const_tree_null, 0, default_secondary_reload, hook_void_void, hook_void_void, default_hard_regno_scratch_ok, { default_mode_for_suffix }, { default_cxx_guard_type, hook_bool_void_false, default_cxx_get_cookie_size, hook_bool_void_false, ((void *)0), hook_bool_void_false, hook_bool_void_true, hook_void_tree, hook_bool_void_true, hook_bool_void_true, hook_bool_void_false, hook_bool_void_false, hook_void_tree }, { "__builtin___emutls_get_address", "__builtin___emutls_register_common", ((void *)0), ((void *)0), ((void *)0), ((void *)0), default_emutls_var_fields, default_emutls_var_init, 0, 0 }, { default_target_option_valid_attribute_p, ((void *)0), ((void *)0), ((void *)0), default_target_option_pragma_parse, default_target_option_can_inline_p, }, hook_void_bitmap, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0 };
