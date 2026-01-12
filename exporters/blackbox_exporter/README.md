[<- На главную](../../README.md)

## Вступление

Blackbox Exporter нужен для:
- проверки доступности внешних эндпоинтов (HTTP, TCP, ICMP, DNS)
- измерения времени отклика и SSL сертификатов
- мониторинга веб-сайтов и сервисов

## Модули

Основные пробы:
- `http_2xx` — HTTP GET запросы, ожидается 2xx статус
- `http_post_2xx` — HTTP POST запросы
- `tcp_connect` — проверка TCP соединения
- `icmp` — ICMP ping

## Запуск

Флаги:
- `--config.file` — путь к конфигурации (default: config.yml)
- `--web.listen-address` — адрес:порт (default :9115)

## Прометеус

Scrape config пример для мониторинга google.com:
```yaml
- job_name: 'blackbox'
  scrape_interval: 60s
  metrics_path: /probe
  params:
    module: [http_2xx]
  static_configs:
    - targets:
        - https://google.com
      labels:
        instance: 'google'
  relabel_configs:
    - source_labels: [__address__]
      target_label: __param_target
    - source_labels: [__param_target]
      target_label: instance
    - target_label: __address__
      replacement: localhost:9115
```
