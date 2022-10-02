#!/usr/bin/env -S bash ../.port_include.sh
port=yaml-cpp
version=0.7.0
auth_type='sha256'
files="https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-${version}.tar.gz yaml-cpp-${version}.tar.gz 43e6a9fcb146ad871515f0d0873947e5d497a1c9c60c58cb102a97b47208b7c3"
useconfigure=true
configopts=("-DCMAKE_INSTALL_PREFIX=${DESTDIR}/usr/local" "-DYAML_CPP_BUILD_TESTS=OFF")

# There has to be a better way to do this...
workdir=yaml-cpp-yaml-cpp-${version}

configure() {
    target_env
    mkdir -p $workdir/build
    (
        cd $workdir/build
        cmake .. "${configopts[@]}"
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