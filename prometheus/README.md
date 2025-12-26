## Вступление

Prometheus нужен для:
- сбора метрик с таргетов (exporters)
- федерации метрик из удалённых Prometheus
- предоставления метрик в Thanos Sidecar

## Схема

```
Remote Prometheus → Federation → Local Prometheus → Thanos Sidecar
Exporters → Scrape → Local Prometheus
```

## Конфигурация

Конфиги:
- prometheus.yml — scrape targets, правила федерации, global настройки
- Флаги запуска:
  - `--storage.tsdb.path` — путь к TSDB
  - `--web.listen-address` — адрес:порт
  - `--web.enable-lifecycle` — reload конфига через API

## Федерация

- Федерирует метрики с удалённых Prometheus через `/federate`
- Использует HTTPS и basic auth
- Фильтр метрик через `match[]` параметры
- Каждый таргет должен иметь label `instance` и `job`
