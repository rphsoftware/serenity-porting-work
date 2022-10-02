#!/usr/bin/env -S bash ../.port_include.sh
port=fmt
version=9.1.0
auth_type='sha256'
files="https://github.com/fmtlib/fmt/archive/refs/tags/${version}.tar.gz fmt-${version}.tar.gz 5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2"
useconfigure=true
configopts=("-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt" "-DCMAKE_INSTALL_PREFIX=${DESTDIR}/usr/local")

configure() {
    target_env
    mkdir -p $workdir/build
    (
        cd $workdir/build
        cmake .. "${configopts[@]}" -DFMT_TEST=false
    )
}

build() {
    target_env
    (
        cd $workdir/build
        make "${makeopts[@]}"
    )
}
install() {
    (
        cd $workdir/build
        echo $DESTDIR
        make DESTIR=$DESTDIR install
    )
}