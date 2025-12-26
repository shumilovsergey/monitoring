## Вступление

Windows Exporter нужен для:
- сбора системных метрик Windows сервера
- экспорта метрик CPU, памяти, диска, сети
- мониторинга Windows служб и процессов

## Метрики

Основные коллекторы:
- CPU — использование процессора
- Memory — RAM, виртуальная память, page file
- Logical Disk — использование дисков, IO
- Network — сетевой трафик, пакеты
- OS — uptime, processes, users
- Service — статус Windows служб

## Конфигурация

Конфиги:
- config.yaml — включение/отключение коллекторов

## Установка

- Скачать .exe через download.sh
- Запустить установщик
- Служба запустится автоматически на порту 9182

Флаги (в свойствах службы):
- `--collectors.enabled` — список активных коллекторов
- `--web.listen-address` — адрес:порт

## Прометеус

Scrape config пример:
```yaml
- job_name: 'windows'
  static_configs:
    - targets: ['windows-server:9182']
      labels:
        instance: 'server_name'
```
