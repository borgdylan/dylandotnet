#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.67])
AC_INIT([dylandotnet-collections], [11.2.8.9], [borgdylan@hotmail.com])
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE(dylandotnet-collections, 11.2.8.9)
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
	AC_MSG_WARN([dylan.NET compiler for CLI 2.0 is needed, please install the dylandotnet package.])
fi

dnl dylandotnet4
AC_PATH_PROG(DYLANDOTNET4, dylandotnet4, no)

if test "x$DYLANDOTNET4" = "xno"; then
	AC_MSG_ERROR([dylan.NET compiler for CLI 4.0 is needed, please install the dylandotnet4 package.])
fi

dnl mdoc
AC_PATH_PROG(MDOC, mdoc, no)

if test "x$MDOC" = "xno"; then
	AC_MSG_ERROR([You need to install monodoc.])
fi


AC_OUTPUT([
Makefile
])
