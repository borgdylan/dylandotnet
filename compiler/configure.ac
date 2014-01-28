#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.67])
AC_INIT([dylandotnet], [11.3.2.1], [borgdylan@hotmail.com])
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE([dylandotnet],[11.3.3.1])

AC_PROG_INSTALL

AC_ARG_ENABLE([debug],[AS_HELP_STRING([--enable-debug],[enables debug symbol making for the compiler (default is yes)])],[],[enable_debug=yes])
AM_CONDITIONAL([DEBUG],[test "x$enable_debug" = "xyes"])

AC_ARG_ENABLE([net45],[AS_HELP_STRING([--enable-net45],[enables use of .NET 4.5 under CLR v.4 (default is yes)])],[],[enable_net45=yes])
AM_CONDITIONAL([NET45],[test "x$enable_net45" = "xyes"])

AC_ARG_ENABLE([rx],[AS_HELP_STRING([--enable-rx],[enables use of Rx.NET under .NET 4.5 (default is yes)])],[],[enable_rx=yes])
AM_CONDITIONAL([RX],[test "x$enable_rx" = "xyes"])

AC_ARG_ENABLE([aot],[AS_HELP_STRING([--enable-aot],[enables use of AOT during installation under i386 (default is no)])],[],[enable_aot=no])
AM_CONDITIONAL([AOT],[test "x$enable_aot" = "xyes"])

dnl pkg-config
AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
if test "x$PKG_CONFIG" = "xno"; then
	AC_MSG_ERROR([You need to install pkg-config])
fi

dnl mono
AC_PATH_PROG(MONO, mono-boehm, no)
if test "x$MONO" = "xno"; then
	AC_MSG_ERROR([You need to install the mono runtime])
fi

dnl mdoc
AC_PATH_PROG(MDOC, mdoc, no)
if test "x$MDOC" = "xno"; then
	AC_MSG_ERROR([You need to install monodoc])
fi

dnl nunit-console
AC_PATH_PROG(NUNIT, nunit-console, no)
if test "x$NUNIT" = "xno"; then
        AC_MSG_ERROR([You need to install nunit-console])
fi

PKG_CHECK_MODULES(NUNITPC, nunit)

dnl dylandotnet
AC_PATH_PROG(DYLANDOTNET, dylandotnet, no)

if test "x$DYLANDOTNET" = "xno"; then
	AC_MSG_WARN([dylan.NET compiler for CLI 4.0 is not installed...This build system has one built-in.])
fi

AC_OUTPUT([
Makefile
tests/Makefile
doc/Makefile
build/4.0/Makefile
4.0/Makefile
dev/Makefile
templateproj/Makefile
unit/Makefile
m4/Makefile
])
