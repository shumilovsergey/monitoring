#!/usr/bin/env bash
set -e

# env
WIN_EXP_VER="0.29.2"

# main
INSTALLER="windows_exporter-${WIN_EXP_VER}-amd64.exe"
URL="https://github.com/prometheus-community/windows_exporter/releases/download/v${WIN_EXP_VER}/${INSTALLER}"

echo "Скачиваем Windows Exporter ${WIN_EXP_VER}..."
wget "$URL"

echo "Готово"
