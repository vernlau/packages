#!/bin/bash
set -e

compress-caches() {
    cd openwrt
    tar -I "zstd -19 -T$(nproc)" -cf openwrt-caches.tar.zst \
        staging_dir/toolchain-* \
        build_dir/toolchain-* \
        dl
}

prepare_checksum() {
    cd openwrt
    sha256sum openwrt-caches.tar.zst > sha256.txt
}

compress-caches
prepare_checksum
