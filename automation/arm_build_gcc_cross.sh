#!/bin/bash

D='/Users/hoangtrunghuy/workspace/mac_rootfs'
BUILD_DIR='--prefix='${D}
NAME='--program-prefix=arm-linux-gnueabihf'
FEATURE='--disable-multilib --with-endian=little --enable-threads=posix \
	 --enable-tls'
CPU='--with-cpu=ARM --with-schedule=ARM --with-arch=ARM --with-tune=ARM --with'

./configure ${BUILD_DIR} ${NAME}


  --host=HOST       cross-compile to build programs to run on HOST [BUILD]
  --target=TARGET   configure for building compilers for TARGET [HOST]

Optional Features:
  --disable-option-checking  ignore unrecognized --enable/--with options
  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
  --enable-as-accelerator-for=ARG
                          build as offload target compiler. Specify offload
                          host triple by ARG
  --enable-offload-targets=LIST
                          enable offloading to devices from comma-separated
                          LIST of TARGET[=DIR]. Use optional path to find
                          offload target compiler during the build
  --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
  --enable-ld[=ARG]       build ld [ARG={default,yes,no}]
  --disable-libquadmath   do not build libquadmath directory
  --disable-libquadmath-support
                          disable libquadmath support for Fortran
  --enable-libada         build libada directory
  --enable-libssp         build libssp directory
  --disable-libstdcxx     do not build libstdc++-v3 directory
  --enable-liboffloadmic=ARG
                          build liboffloadmic [ARG={no,host,target}]
  --enable-static-libjava[=ARG]
                          build static libjava [default=no]
  --enable-bootstrap      enable bootstrapping [yes if native build]
  --disable-isl-version-check
                          disable check for ISL version
  --enable-lto            enable link time optimization support
  --enable-linker-plugin-configure-flags=FLAGS
                          additional flags for configuring linker plugins
                          [none]
  --enable-linker-plugin-flags=FLAGS
                          additional flags for configuring and building linker
                          plugins [none]
  --enable-stage1-languages[=all]
                          choose additional languages to build during stage1.
                          Mostly useful for compiler development
  --enable-objc-gc        enable use of Boehm's garbage collector with the GNU
                          Objective-C runtime
  --enable-vtable-verify    Enable vtable verification feature
  --enable-serial-[{host,target,build}-]configure
                          force sequential configuration of sub-packages for
                          the host, target or build machine, or all
                          sub-packages
  --enable-maintainer-mode
                          enable make rules and dependencies not useful (and
                          sometimes confusing) to the casual installer
  --enable-stage1-checking[=all]
                          choose additional checking for stage1 of the
                          compiler
  --enable-werror         enable -Werror in bootstrap stage2 and later
  --enable-host-shared    build host code as shared libraries

Optional Packages:
  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
  --with-build-libsubdir=DIR  Directory where to find libraries for build system
  --with-mpc=PATH         specify prefix directory for installed MPC package.
                          Equivalent to --with-mpc-include=PATH/include plus
                          --with-mpc-lib=PATH/lib
  --with-mpc-include=PATH specify directory for installed MPC include files
  --with-mpc-lib=PATH     specify directory for the installed MPC library
  --with-mpfr-dir=PATH    this option has been REMOVED
  --with-mpfr=PATH        specify prefix directory for installed MPFR package.
                          Equivalent to --with-mpfr-include=PATH/include plus
                          --with-mpfr-lib=PATH/lib
  --with-mpfr-include=PATH
                          specify directory for installed MPFR include files
  --with-mpfr-lib=PATH    specify directory for the installed MPFR library
  --with-gmp-dir=PATH     this option has been REMOVED
  --with-gmp=PATH         specify prefix directory for the installed GMP
                          package. Equivalent to
                          --with-gmp-include=PATH/include plus
                          --with-gmp-lib=PATH/lib
  --with-gmp-include=PATH specify directory for installed GMP include files
  --with-gmp-lib=PATH     specify directory for the installed GMP library
  --with-host-libstdcxx=L use linker arguments L to link with libstdc++ when
                          linking with PPL
  --with-stage1-libs=LIBS libraries for stage1
  --with-stage1-ldflags=FLAGS
                          linker flags for stage1
  --with-boot-libs=LIBS   libraries for stage2 and later
  --with-boot-ldflags=FLAGS
                          linker flags for stage2 and later
  --with-isl=PATH         Specify prefix directory for the installed ISL
                          package. Equivalent to
                          --with-isl-include=PATH/include plus
                          --with-isl-lib=PATH/lib
  --with-isl-include=PATH Specify directory for installed ISL include files
  --with-isl-lib=PATH     Specify the directory for the installed ISL library
  --with-build-sysroot=SYSROOT
                          use sysroot as the system root during the build
  --with-debug-prefix-map='A=B C=D ...'
                          map A to B, C to D ... in debug information
  --with-build-config='NAME NAME2...'
                          use config/NAME.mk build configuration
  --with-build-time-tools=PATH
                          use given path to find target tools during the build

Some influential environment variables:
  CC          C compiler command
  CFLAGS      C compiler flags
  LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
              nonstandard directory <lib dir>
  LIBS        libraries to pass to the linker, e.g. -l<library>
  CPPFLAGS    C/C++/Objective C preprocessor flags, e.g. -I<include dir> if
              you have headers in a nonstandard directory <include dir>
  CXX         C++ compiler command
  CXXFLAGS    C++ compiler flags
  build_configargs
              additional configure arguments for build directories
  host_configargs
              additional configure arguments for host directories
  target_configargs
              additional configure arguments for target directories
  AR          AR for the host
  AS          AS for the host
  DLLTOOL     DLLTOOL for the host
  LD          LD for the host
  LIPO        LIPO for the host
  NM          NM for the host
  RANLIB      RANLIB for the host
  STRIP       STRIP for the host
  WINDRES     WINDRES for the host
  WINDMC      WINDMC for the host
  OBJCOPY     OBJCOPY for the host
  OBJDUMP     OBJDUMP for the host
  READELF     READELF for the host
  CC_FOR_TARGET
              CC for the target
  CXX_FOR_TARGET
              CXX for the target
  GCC_FOR_TARGET
              GCC for the target
  GCJ_FOR_TARGET
              GCJ for the target
  GFORTRAN_FOR_TARGET
              GFORTRAN for the target
  GOC_FOR_TARGET
              GOC for the target
  AR_FOR_TARGET
              AR for the target
  AS_FOR_TARGET
              AS for the target
  DLLTOOL_FOR_TARGET
              DLLTOOL for the target
  LD_FOR_TARGET
              LD for the target
  LIPO_FOR_TARGET
              LIPO for the target
  NM_FOR_TARGET
              NM for the target
  OBJCOPY_FOR_TARGET
              OBJCOPY for the target
  OBJDUMP_FOR_TARGET
              OBJDUMP for the target
  RANLIB_FOR_TARGET
              RANLIB for the target
  READELF_FOR_TARGET
              READELF for the target
  STRIP_FOR_TARGET
              STRIP for the target
  WINDRES_FOR_TARGET
              WINDRES for the target
  WINDMC_FOR_TARGET
              WINDMC for the target

Use these variables to override the choices made by `configure' or to help
it to find libraries and programs with nonstandard names/locations.

Report bugs to the package provider.

