#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.67])
AC_INIT([dylandotnet-ide], [11.2.8.3], [borgdylan@hotmail.com])
AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE(dylandotnet-ide, 11.2.8.3)
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

#dnl dylandotnet
#AC_PATH_PROG(DYLANDOTNET, dylandotnet, no)

#if test "x$DYLANDOTNET" = "xno"; then
#	AC_MSG_WARN([dylan.NET compiler for CLI 2.0 is not installed...This build system has one built-in.])
#fi

dnl pc2dylandotnet
AC_PATH_PROG(PC2DYLANDOTNET, pc2dylandotnet, no)

if test "x$PC2DYLANDOTNET" = "xno"; then
	AC_MSG_ERROR([pc2dylandotnet is needed, please install the dylandotnet-dev package.])
fi

dnl pc2curdir
AC_PATH_PROG(PC2CURDIR, pc2curdir, no)

if test "x$PC2CURDIR" = "xno"; then
	AC_MSG_ERROR([pc2curdir is needed, please install the dylandotnet-dev package.])
fi


dnl dylandotnet4
AC_PATH_PROG(DYLANDOTNET4, dylandotnet4, no)

if test "x$DYLANDOTNET4" = "xno"; then
	AC_MSG_ERROR([dylan.NET compiler for CLI 4.0 is needed, please install the dylandotnet4 package.])
fi

PKG_CHECK_MODULES(DYLANDOTNET4PKG, dylandotnet4 >= 11.2.8.4)
PKG_CHECK_MODULES(DNCOLLECTIONS, dylandotnet-collections4 >= 11.2.8.4)

dnl gtk-sharp
PKG_CHECK_MODULES(GTKSHARP, gtk-sharp-2.0)

AC_OUTPUT([
Makefile
])
