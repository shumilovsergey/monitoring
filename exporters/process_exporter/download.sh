#!/usr/bin/env bash
set -e

# env
PROC_EXP_VER="0.8.3"

# main
ARCHIVE="process-exporter-${PROC_EXP_VER}.linux-amd64.tar.gz"
URL="https://github.com/ncabatoff/process-exporter/releases/download/v${PROC_EXP_VER}/${ARCHIVE}"

echo "Скачиваем Process Exporter ${PROC_EXP_VER}..."
wget "$URL"

echo "Распаковываем..."
tar -xzf "$ARCHIVE"

echo "Удаляем архив..."
rm -f "$ARCHIVE"

echo "Готово"
