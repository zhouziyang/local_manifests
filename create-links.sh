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
    [platform_manifests]=manifest
)

for key in "${!links[@]}"
do
    value=${links[$key]}
    link_name=${ROOT}/${key}.git
    if [ ! -L $link_name ]; then
        echo "$key => $value"
        ln -s "platform/${value}.git" $link_name
    fi
done
