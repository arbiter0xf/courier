#!/bin/bash

set -e

error_exit() {
    echo "${1}. Exiting"
    exit 1
}

setup_qemu() {
    local -r apt_package_dependencies='qemu-system-arm'

    echo "Setting up Qemu"

    echo "Installing package dependencies"
    sudo apt -y install ${apt_package_dependencies}
}

setup_coreboot() {
    local apt_package_dependencies_temp=''
    apt_package_dependencies_temp+=' bison'
    apt_package_dependencies_temp+=' build-essential'
    apt_package_dependencies_temp+=' curl'
    apt_package_dependencies_temp+=' flex'
    apt_package_dependencies_temp+=' git'
    apt_package_dependencies_temp+=' gnat'
    apt_package_dependencies_temp+=' libncurses5-dev'
    apt_package_dependencies_temp+=' m4'
    apt_package_dependencies_temp+=' zlib1g-dev'
    local -r apt_package_dependencies="${apt_package_dependencies_temp}"

    echo "Setting up Coreboot"

    echo "Installing package dependencies"
    sudo apt install -y ${apt_package_dependencies}

    echo "Building Coreboot toolchain"
    echo "<not yet implemented>"

    echo "Building payload: coreinfo"
    echo "<not yet implemented>"

    echo "Configuring build"
    echo "<not yet implemented>"
    # TODO set and/or verify build configuration
    # See: https://doc.coreboot.org/tutorial/part1.html
}

main() {
    echo "Setting up development environment"

    echo "Updating currently installed packages"
    sudo apt update
    sudo apt upgrade -y

    setup_qemu

    setup_coreboot
}

main "${@}"
