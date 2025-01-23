#!/bin/bash
set -e

compress-caches() {
    cd openwrt
    tar -I "zstd -19 -T$(nproc)" -cf openwrt-caches.tar.zst \
        build_dir \
        staging_dir \
        dl
}

prepare_checksum() {
    cd openwrt
    sha256sum openwrt-caches.tar.zst > sha256.txt
}

compress-caches
prepare_checksum
