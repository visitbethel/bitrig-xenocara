# $OpenBSD: Makefile,v 1.3 2013/05/19 14:09:56 jsg Exp $
.include <bsd.xconf.mk>

LIB=		drm_radeon

INCSDIR=	${X11BASE}/include/

CPPFLAGS+=	-I${.CURDIR}			\
		-I${.CURDIR}/..			\
		-I${X11BASE}/include		\
		-I/usr/include/dev/pci/drm 

INCS=		radeon_bo.h	\
		radeon_cs.h	\
		radeon_bo_gem.h	\
		radeon_cs_gem.h	\
		radeon_bo_int.h	\
		radeon_cs_int.h \
		r600_pci_ids.h \
		radeon_surface.h

SRCS=		radeon_bo_gem.c		\
		radeon_cs_gem.c		\
		radeon_cs_space.c	\
		radeon_bo.c		\
		radeon_cs.c		\
		radeon_surface.c	\
		bof.c


PKGCONFIG=	libdrm_radeon.pc

LDADD+=		-L${X11BASE}/lib -lX11

.include <bsd.lib.mk>
.include <bsd.xorg.mk>
