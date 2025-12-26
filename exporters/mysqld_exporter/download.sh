#!/usr/bin/env bash
set -e

# env
MYSQL_EXP_VER="0.16.0"

# main
ARCHIVE="mysqld_exporter-${MYSQL_EXP_VER}.linux-amd64.tar.gz"
URL="https://github.com/prometheus/mysqld_exporter/releases/download/v${MYSQL_EXP_VER}/${ARCHIVE}"

echo "Скачиваем MySQL Exporter ${MYSQL_EXP_VER}..."
wget "$URL"

echo "Распаковываем..."
tar -xzf "$ARCHIVE"

echo "Удаляем архив..."
rm -f "$ARCHIVE"

echo "Готово"
