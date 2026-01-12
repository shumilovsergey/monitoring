#!/usr/bin/env bash
set -e

# env
BLACKBOX_EXP_VER="0.25.0"

# main
ARCHIVE="blackbox_exporter-${BLACKBOX_EXP_VER}.linux-amd64.tar.gz"
URL="https://github.com/prometheus/blackbox_exporter/releases/download/v${BLACKBOX_EXP_VER}/${ARCHIVE}"

echo "Скачиваем Blackbox Exporter ${BLACKBOX_EXP_VER}..."
wget "$URL"

echo "Распаковываем..."
tar -xzf "$ARCHIVE"

echo "Удаляем архив..."
rm -f "$ARCHIVE"

echo "Готово"
