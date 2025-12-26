#!/usr/bin/env bash
set -e

# env
GRAFANA_VER="11.4.0"

# main
ARCHIVE="grafana-${GRAFANA_VER}.linux-amd64.tar.gz"
URL="https://dl.grafana.com/oss/release/${ARCHIVE}"

echo "Скачиваем Grafana ${GRAFANA_VER}..."
wget "$URL"

echo "Распаковываем..."
tar -xzf "$ARCHIVE"

echo "Удаляем архив..."
rm -f "$ARCHIVE"

echo "Готово"
