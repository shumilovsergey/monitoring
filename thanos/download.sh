#!/usr/bin/env bash
set -e

# env
THANOS_VER="0.37.2"

# main
ARCHIVE="thanos-${THANOS_VER}.linux-amd64.tar.gz"
URL="https://github.com/thanos-io/thanos/releases/download/v${THANOS_VER}/${ARCHIVE}"

echo "Скачиваем Thanos ${THANOS_VER}..."
wget "$URL"

echo "Распаковываем..."
tar -xzf "$ARCHIVE"

echo "Удаляем архив..."
rm -f "$ARCHIVE"

echo "Готово"
