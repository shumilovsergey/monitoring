#!/usr/bin/env bash
set -e

# env
JMX_VER="1.0.1"

# main
JAR="jmx_prometheus_javaagent-${JMX_VER}.jar"
URL="https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${JMX_VER}/${JAR}"

echo "Скачиваем JMX Prometheus Javaagent ${JMX_VER}..."
wget "$URL"

echo "Готово"
