[<- На главную](../README.md)

## Вступление

Prometheus нужен для:
- сбора метрик с таргетов (exporters)
- федерации метрик из удалённых Prometheus
- предоставления метрик в Thanos Sidecar

Fed-Prometheus нужен для:
- фильтрации собраных метрик в Prometheus

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

## Rule files (recording rules + alert rules)

Rule files используются для гистерезиса в алертах — чтобы порог срабатывания и порог восстановления были разными и не было лишнего шума.

**Подключение:**

Добавить в `prometheus.yml`:
```yaml
rule_files:
  - "/etc/prometheus/rules/*.yml"
```

Путь указывается относительно рабочей директории Prometheus (не конфига). Лучше использовать абсолютный путь.

**Добавление правил:**

Создать файл в папке `rules/`, например `rules/disk.yml`. Структура файла — см. `rules/disk.yml` в этом репозитории.

После изменений — перезапустить Prometheus:
```bash
sudo systemctl restart prometheus
```
Или reload без перезапуска (если включён `--web.enable-lifecycle`):
```bash
curl -X POST http://localhost:9090/-/reload
```

**Проверка в UI:**

- `http://localhost:9090/rules` — список всех загруженных правил и ошибки парсинга
- `http://localhost:9090/alerts` — состояние alert rules (Inactive / Pending / Firing)

**Примечание про Grafana:**

Prometheus alert rules отображаются в Grafana в разделе Alerting → Alert rules как "Data source-managed". Это внутренние sub-алерты — реальные уведомления отправляет только Grafana-managed алерт поверх них. Чтобы скрыть их от команды: Data Sources → Prometheus → отключить **"Manage alerts via Alerting UI"**.
