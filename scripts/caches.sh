#!/bin/bash

. "$HOME/openwrt-custom/scripts/constfunc.sh"

compress_caches() {
    cd openwrt
    tar -I "zstd -19 -T$(nproc)" -cf openwrt-caches.tar.zst \
        build_dir \
        staging_dir \
        dl \
        ccache  
}

prepare_checksum() {
    cd openwrt
    sha256sum openwrt-caches.tar.zst > sha256.txt
}

compress_caches
prepare_checksum
