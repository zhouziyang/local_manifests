#!/bin/bash

ROOT=`realpath ../..`

declare -A links=(
    [platform_external_selinux]=external/selinux
    [platform_frameworks_av]=frameworks/av
    [platform_frameworks_base]=frameworks/base
    [platform_frameworks_native]=frameworks/native
    [platform_system_core]=system/core
    [platform_system_libhwbinder]=system/libhwbinder
    [platform_system_netd]=system/netd
    [platform_system_vold]=system/vold
)

for key in "${!links[@]}"
do
    value=${links[$key]}
    echo "$key => $value"
    ln -fs "platform/${value}.git" ${ROOT}/${key}.git
done
