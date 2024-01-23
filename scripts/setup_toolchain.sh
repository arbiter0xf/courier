#!/bin/bash

set -e

error_exit() {
    echo "${1}"
    exit 1
}

check_prerequisites() {
    which git || error_exit "Please install Git"
}

main() {
    local -r path_toolchain_setup='/tmp/courier_toolchain_setup'

    echo ""
    echo "+======================+"
    echo "| Setting up toolchain |"
    echo "+======================+"
    echo ""

    echo ""
    echo "Checking prerequisites"
    echo "======================"
    echo ""

    check_prerequisites

    echo ""
    echo "Installing toolchain dependencies"
    echo "===================="
    echo ""

    if [ ! -d "${path_toolchain_setup}" ] ; then
        mkdir "${path_toolchain_setup}"
    fi
    pushd "${path_toolchain_setup}"
    pwd

    echo "Exiting early"
    exit 1

    # TODO skip clone, if already present
    git clone git://sourceware.org/git/binutils-gdb.git

    # TODO install cross-compilation tools to $HOME/opt/cross

    # TODO
    # Figure out target triplet. `gcc -dumpmachine` unfortunately
    # gives: x86_64-linux-gnu.
}

main "${@}"
