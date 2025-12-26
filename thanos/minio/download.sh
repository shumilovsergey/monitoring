#!/usr/bin/env bash
set -e

# env
MINIO_VER="RELEASE.2024-10-02T17-50-41Z"

# main
BINARY="minio"
URL="https://dl.min.io/server/minio/release/linux-amd64/archive/minio.${MINIO_VER}"

echo "Скачиваем MinIO ${MINIO_VER}..."
wget "$URL" -O "$BINARY"

echo "Устанавливаем права на выполнение..."
chmod +x "$BINARY"

echo "Готово"
