#!/bin/bash

set -e

error_exit() {
    echo "${1}. Exiting"
    exit 1
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
}

main() {
    echo "Setting up development environment"

    setup_coreboot
}

main "${@}"
