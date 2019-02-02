/* gaol/gaol_configuration.h.  Generated from gaol_configuration.h.in by configure.  */
/* gaol/gaol_configuration.h.in.  Generated from configure.ac by autoheader.  */

/* Define if building universal (internal helper macro) */
/* #undef AC_APPLE_UNIVERSAL_BUILD */

/* Define this to 1 if function clock() is declared in time.h */
/* #undef CLOCK_IN_HEADER */

/* Define this if relation symbols should stand for \"certainly relations\" */
#define GAOL_CERTAINLY_RELATIONS 1

/* define this if you want debugging facilities */
/* #undef GAOL_DEBUGGING */

/* Define this to 1 to allow raising exceptions instead of simply aborting */
#define GAOL_EXCEPTIONS_ENABLED 1

/* Major version for gaol */
#define GAOL_MAJOR_VERSION 4

/* Micro version for gaol */
#define GAOL_MICRO_VERSION 1

/* Minor version for gaol */
#define GAOL_MINOR_VERSION 2

/* Define this if relation symbols should stand for \"possibly relations\" */
/* #undef GAOL_POSSIBLY_RELATIONS */

/* define this to 1 if rounding direction should be preserved */
#define GAOL_PRESERVE_ROUNDING 1

/* Define this if relation symbols should stand for \"set relations\" */
/* #undef GAOL_SET_RELATIONS */

/* Define this to 1 if using the IBM APMathlib library */
#define GAOL_USING_APMATHLIB 1

/* define this to 1 if you want to allow ASM support */
#define GAOL_USING_ASM 1

/* Define this to 1 if using the CRLibm Mathematical library */
/* #undef GAOL_USING_CRLIBM */

/* Define this to 1 to enable verbose mode */
#define GAOL_VERBOSE_MODE 1

/* Version number for gaol */
#define GAOL_VERSION "4.2.1"

/* Define this to 1 if function getrusage() is declared in sys/resource.h */
#define GETRUSAGE_IN_HEADER 1

/* Define to 1 if you have the <cassert> header file. */
#define HAVE_CASSERT 1

/* Define to 1 if you have the `clock' function. */
#define HAVE_CLOCK 1

/* Define to 1 if you have the <crlibm.h> header file. */
/* #undef HAVE_CRLIBM_H */

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the <fenv.h> header file. */
#define HAVE_FENV_H 1

/* Define to 1 if you have the `fesetround' function. */
/* #undef HAVE_FESETROUND */

/* Define to 1 if you have the `finite' function. */
#define HAVE_FINITE 1

/* Define to 1 if you have the <float.h> header file. */
#define HAVE_FLOAT_H 1

/* Define to 1 if you have the `floor' function. */
/* #undef HAVE_FLOOR */

/* Define to 1 if you have the `getrusage' function. */
#define HAVE_GETRUSAGE 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the <limits> header file. */
#define HAVE_LIMITS 1

/* Define to 1 if you have the `localeconv' function. */
#define HAVE_LOCALECONV 1

/* Define to 1 if your system has a GNU libc compatible `malloc' function, and
   to 0 otherwise. */
#define HAVE_MALLOC 1

/* Define to 1 if you have the <MathLib.h> header file. */
#define HAVE_MATHLIB_H 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `memset' function. */
#define HAVE_MEMSET 1

/* Define to 1 if you have the `nextafter' function. */
#define HAVE_NEXTAFTER 1

/* Define to 1 if you have the `pow' function. */
/* #undef HAVE_POW */

/* Define to 1 if your system has a GNU libc compatible `realloc' function,
   and to 0 otherwise. */
#define HAVE_REALLOC 1

/* Define to 1 if you have the `rint' function. */
/* #undef HAVE_RINT */

/* Define to 1 if you have the `round' function. */
/* #undef HAVE_ROUND */

/* Define this to 1 if the compiler supports the "-frounding-math" option */
#define HAVE_ROUNDING_MATH_OPTION 1

/* Define to 1 if you have the `sqrt' function. */
/* #undef HAVE_SQRT */

/* Define to 1 if stdbool.h conforms to C99. */
/* #undef HAVE_STDBOOL_H */

/* Define to 1 if you have the <stddef.h> header file. */
#define HAVE_STDDEF_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <sys/resource.h> header file. */
#define HAVE_SYS_RESOURCE_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <time.h> header file. */
/* #undef HAVE_TIME_H */

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define this to 1 if the compiler supports the "-fvisibility" option */
#define HAVE_VISIBILITY_OPTIONS 1

/* Define to 1 if the system has the type `_Bool'. */
/* #undef HAVE__BOOL */

/* Define to 1 if you have the `__signbit' function. */
#define HAVE___SIGNBIT 1

/* Define this if your system is a cygwin-based ix86 or compatible */
/* #undef IX86_CYGWIN */

/* Define this if your system is a Linux-based ix86 or compatible */
#define IX86_LINUX 1

/* Define this if your system is a Linux-based ix86 or compatible */
/* #undef IX86_MACOSX */

/* Define to the sub-directory in which libtool stores uninstalled libraries.
   */
#define LT_OBJDIR ".libs/"

/* Name of package */
#define PACKAGE "gaol"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "goualard@users.sourceforge.net"

/* Define to the full name of this package. */
#define PACKAGE_NAME "gaol"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "gaol "4.2.1""

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "gaol"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION ""4.2.1""

/* Define this if your system is a PowerPc under MacOs X */
/* #undef POWERPC_UNIX */

/* The size of `int', as computed by sizeof. */
#define SIZEOF_INT 4

/* The size of `long', as computed by sizeof. */
#define SIZEOF_LONG 8

/* The size of `long long int', as computed by sizeof. */
#define SIZEOF_LONG_LONG_INT 8

/* Define this if your system is a SUN Sparc computer under Solaris */
/* #undef SPARC_SOLARIS */

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define this to 1 if SSE2 instructions are to be used */
#define USING_SSE2_INSTRUCTIONS 1

/* Define this to 1 if SSE3 instructions are to be used */
#define USING_SSE3_INSTRUCTIONS 1

/* Version number of package */
#define VERSION ""4.2.1""

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif

/* Define this if the OS is a 64 bits one */
#define X86_64BITS 1

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to rpl_malloc if the replacement function should be used. */
/* #undef malloc */

/* Define to rpl_realloc if the replacement function should be used. */
/* #undef realloc */

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */
