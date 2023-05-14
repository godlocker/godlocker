#!/bin/bash

#-- CONSTANTS --#
EXIT_FAILURE=127
EXIT_SUCCESS=0


# global variables may be only in main function
function main ()
{
    #check_root_permissions
    current_os=$(check_distributive_type)
    echo $current_os
    package_manager_upgrade
}

function check_root_permissions ()
{
    if [ "$EUID" -ne 0 ]; then
        printf "Please run this script as root or with sudo permissions."
        exit $EXIT_FAILURE
    fi
}

function check_distributive_type
{
    local release_path="/etc/os-release"
    local os=""

    if grep -iqs "ubuntu" $release_path ; then
        os="ubuntu"
    elif grep -iqs "arch linux" $release_path ; then
        os="arch_linux"
    elif [[ -e "/etc/debian_version" ]]; then
        os="debian"
    elif [[ -e "/etc/almalinux-release" || -e "/etc/rocky-release" || -e "/etc/centos-release" ]]; then
        os="centos"
    elif [[ -e "/etc/fedora-release" ]]; then
        os="fedora"
    else
        printf "Looks like your system is unsupported. \nSupported distros are Arch Linux"
        exit $EXIT_FAILURE
    fi
    printf $os
}

function package_manager_upgrade()
{
    echo $current_os
}

function cron_tasks_setup
{
    echo asd
}

function sshd_setup ()
{
    echo asd
}

main
