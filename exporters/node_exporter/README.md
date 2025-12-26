[<- На главную](../../README.md)

## Вступление

Node Exporter нужен для:
- сбора системных метрик Linux сервера
- экспорта метрик CPU, памяти, диска, сети
- мониторинга состояния хоста

## Метрики

Основные группы:
- CPU — использование процессора по режимам (user, system, idle)
- Memory — RAM, swap, buffers, cache
- Disk — IO операции, throughput, utilization
- Network — трафик, ошибки, пакеты
- Filesystem — использование дискового пространства

## Запуск

Флаги:
- `--web.listen-address` — адрес:порт (default :9100)
- `--collector.disable-defaults` — отключить стандартные коллекторы
- `--collector.<name>` — включить конкретный коллектор

## Прометеус

Scrape config пример:
```yaml
- job_name: 'node'
  static_configs:
    - targets: ['localhost:9100']
      labels:
        instance: 'server_name'
```
