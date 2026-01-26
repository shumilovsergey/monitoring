#!/usr/bin/env bash
set -e

# env
MC_VER="RELEASE.2025-08-13T08-35-41Z"

# main
BINARY="mc"
URL="https://dl.min.io/client/mc/release/linux-amd64/archive/mc.${MC_VER}"

echo "Скачиваем mc ${MC_VER}..."
wget "$URL" -O "$BINARY"

echo "Устанавливаем права на выполнение..."
chmod +x "$BINARY"

echo "Готово"
