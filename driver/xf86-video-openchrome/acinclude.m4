dnl Copyright 2005 Red Hat, Inc
dnl 
dnl Permission to use, copy, modify, distribute, and sell this software and its
dnl documentation for any purpose is hereby granted without fee, provided that
dnl the above copyright notice appear in all copies and that both that
dnl copyright notice and this permission notice appear in supporting
dnl documentation.
dnl 
dnl The above copyright notice and this permission notice shall be included
dnl in all copies or substantial portions of the Software.
dnl 
dnl THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
dnl OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
dnl MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
dnl IN NO EVENT SHALL THE OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR
dnl OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
dnl ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
dnl OTHER DEALINGS IN THE SOFTWARE.
dnl 
dnl Except as contained in this notice, the name of the copyright holders shall
dnl not be used in advertising or otherwise to promote the sale, use or
dnl other dealings in this Software without prior written authorization
dnl from the copyright holders.
dnl 

# XORG_DRIVER_CHECK_EXT()
# --------------------------
# Checks for the $1 define in xorg-server.h (from the sdk).  If it
# is defined, then add $1 to $REQUIRED_MODULES.

AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
	SAVE_CFLAGS="$CFLAGS"
	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
#include "xorg-server.h"
#if !defined $1
#error $1 not defined
#endif
		]])],
		[_EXT_CHECK=yes],
		[_EXT_CHECK=no])
	CFLAGS="$SAVE_CFLAGS"
	AC_MSG_CHECKING([if $1 is defined])
	AC_MSG_RESULT([$_EXT_CHECK])
	if test "$_EXT_CHECK" != no; then
		REQUIRED_MODULES="$REQUIRED_MODULES $2"
	fi
])
dnl Copyright 2005 Red Hat, Inc
dnl
dnl Permission to use, copy, modify, distribute, and sell this software and its
dnl documentation for any purpose is hereby granted without fee, provided that
dnl the above copyright notice appear in all copies and that both that
dnl copyright notice and this permission notice appear in supporting
dnl documentation.
dnl
dnl The above copyright notice and this permission notice shall be included
dnl in all copies or substantial portions of the Software.
dnl
dnl THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
dnl OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
dnl MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
dnl IN NO EVENT SHALL THE OPEN GROUP BE LIABLE FOR ANY CLAIM, DAMAGES OR
dnl OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
dnl ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
dnl OTHER DEALINGS IN THE SOFTWARE.
dnl
dnl Except as contained in this notice, the name of the copyright holders shall
dnl not be used in advertising or otherwise to promote the sale, use or
dnl other dealings in this Software without prior written authorization
dnl from the copyright holders.
dnl

# XORG_RELEASE_VERSION
# --------------------
# Adds --with/without-release-string and changes the PACKAGE and
# PACKAGE_TARNAME to use "$PACKAGE{_TARNAME}-$RELEASE_VERSION".  If
# no option is given, PACKAGE and PACKAGE_TARNAME are unchanged.
 
AC_DEFUN([XORG_RELEASE_VERSION],[
	AC_ARG_WITH(release-version,
			AC_HELP_STRING([--with-release-version=STRING],
				[Use release version string in package name]),
			[RELEASE_VERSION="$withval"],
			[RELEASE_VERSION=""])
	if test "x$RELEASE_VERSION" != "x"; then
		PACKAGE="$PACKAGE-$RELEASE_VERSION"
		PACKAGE_TARNAME="$PACKAGE_TARNAME-$RELEASE_VERSION"
		AC_MSG_NOTICE([Building with package name set to $PACKAGE])
	fi
])
