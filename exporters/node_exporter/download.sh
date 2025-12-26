#!/usr/bin/env bash
set -e

# env
NODE_EXP_VER="1.8.2"

# main
ARCHIVE="node_exporter-${NODE_EXP_VER}.linux-amd64.tar.gz"
URL="https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXP_VER}/${ARCHIVE}"

echo "Скачиваем Node Exporter ${NODE_EXP_VER}..."
wget "$URL"

echo "Распаковываем..."
tar -xzf "$ARCHIVE"

echo "Удаляем архив..."
rm -f "$ARCHIVE"

echo "Готово"
