## Вступление

Thanos нужен для:
- агрегации метрик из нескольких Prometheus
- получения одной точки входа для Grafana / PromQL

## Схема

```
Sidecar       = Prometheus → Thanos
Store Gateway = S3 → Thanos
Query         = Thanos → Grafana
Compactor     = S3 maintenance
```

## Sidecar

- Ставится рядом с Prometheus
- Экспортирует локальный TSDB Prometheus в Query
- Загружает блоки метрик в S3

Конфиги:
- s3.yml — подключение к S3 (MinIO)

## Query

- Единая точка входа для Grafana
- Забирает данные из Sidecar и Gateway
- Выполняет дедупликацию и выбор источника по времени

Конфиги:
- stores.yml — инвентарь StoreAPI (sidecar, gateway)

## Compactor

- Обслуживает метрики в S3
- Объединяет мелкие файлы метрик в более крупные
- Уменьшает детализацию старых метрик

Конфиги:
- s3.yml — подключение к S3 (MinIO)

## Minio

- S3-совместимое объектное хранилище
- Используется Thanos для долгосрочного хранения метрик

Конфиги:
- minio.env — параметры MinIO

## Gateway

- Read-only прослойка между Query и S3
- Отдаёт исторические метрики
- Кэширует данные

Конфиги:
- s3.yml — подключение к S3 (MinIO)