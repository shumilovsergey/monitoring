[<- На главную](../../README.md)

## Вступление

Docker daemon имеет встроенный эндпоинт метрик Prometheus. Установка не требуется — достаточно включить в конфиге Docker.

Метрики позволяют:
- отслеживать количество контейнеров по состояниям (running/stopped/paused)
- мониторить здоровье и события движка Docker
- контролировать ресурсы самого демона (CPU, RAM, FD)

## Включение

Добавить в `/etc/docker/daemon.json`:

```json
{
  "metrics-addr": "0.0.0.0:9323",
  "experimental": true
}
```

Перезапустить Docker:

```bash
sudo systemctl restart docker
```

Проверить:

```bash
curl http://localhost:9323/metrics
```

## Метрики

Основные группы:
- Container states — количество контейнеров по состояниям
- Health checks — проверки здоровья (total/failed)
- Events — события движка (start, stop, die, kill)
- Container actions — длительность операций с контейнерами
- Process — CPU, память, file descriptors демона
- Go runtime — горутины, GC, heap

## Прометеус

Scrape config пример:
```yaml
- job_name: 'docker'
  scrape_interval: 30s
  static_configs:
    - targets: ['localhost:9323']
      labels:
        instance: 'server_name'
```
