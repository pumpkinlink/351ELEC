# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="parallel-n64"
PKG_VERSION="dba9fc8b64351b6cf3dfb0bec2ec39f01101f48e"
PKG_SHA256="1740a6cf3ca4c2c2a1076c55ffb513455c4c6295290bc755314e9d9d925b3f2b"
PKG_REV="2"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/parallel-n64"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain $OPENGLES"
PKG_SECTION="libretro"
PKG_SHORTDESC="Optimized/rewritten Nintendo 64 emulator made specifically for Libretro. Originally based on Mupen64 Plus."
PKG_LONGDESC="Optimized/rewritten Nintendo 64 emulator made specifically for Libretro. Originally based on Mupen64 Plus."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-lto"


if [[ "$ARCH" == "arm" ]]; then
	PKG_MAKE_OPTS_TARGET=" platform=${PROJECT}"
	
	if [ "${DEVICE}" == "RG351P" ]; then
		PKG_MAKE_OPTS_TARGET=" platform=Odroidgoa"
	fi
else
	PKG_MAKE_OPTS_TARGET=" platform=emuelec64-armv8"
	
fi

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
#  if [[ "${DEVICE}" == "RG351P" ]] && [[ "$ARCH" == "aarch64" ]]
#  then
    cp -vP $PKG_BUILD/../../build.${DISTRO}-${DEVICE}.arm-${LIBREELEC_VERSION}/parallel-n64-*/.install_pkg/usr/lib/libretro/parallel_n64_libretro.so ${INSTALL}/usr/lib/libretro/
#  else
    cp parallel_n64_libretro.so $INSTALL/usr/lib/libretro/
#  fi
}
