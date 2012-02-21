#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.67])
AC_INIT([dylandotnet], [11.2.8.7], [borgdylan@hotmail.com])
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE(dylandotnet, 11.2.8.7)
AM_MAINTAINER_MODE

AC_PROG_INSTALL

dnl pkg-config
AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
if test "x$PKG_CONFIG" = "xno"; then
	AC_MSG_ERROR([You need to install pkg-config])
fi

dnl mono
AC_PATH_PROG(MONO, mono, no)
if test "x$MONO" = "xno"; then
	AC_MSG_ERROR([You need to install the mono runtime])
fi

dnl dylandotnet
AC_PATH_PROG(DYLANDOTNET, dylandotnet, no)

if test "x$DYLANDOTNET" = "xno"; then
	AC_MSG_WARN([dylan.NET compiler for CLI 2.0 is not installed...This build system has one built-in.])
fi

dnl dylandotnet4
AC_PATH_PROG(DYLANDOTNET4, dylandotnet4, no)

if test "x$DYLANDOTNET4" = "xno"; then
	AC_MSG_WARN([dylan.NET compiler for CLI 4.0 is not installed...This build system has one built-in.])
fi


AC_OUTPUT([
Makefile
tests/Makefile
doc/Makefile
2.0/Makefile
4.0/Makefile
dev/Makefile
])
