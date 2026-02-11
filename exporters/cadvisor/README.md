[<- На главную](../../README.md)

## Вступление

cAdvisor (Container Advisor) нужен для:
- сбора метрик по каждому контейнеру (CPU, RAM, сеть, диск)
- мониторинга ресурсов Docker на хосте
- экспорта метрик в формате Prometheus

**Важно**: на каждый хост нужен только один cAdvisor. Он автоматически видит все контейнеры на хосте.

## Метрики

Основные группы:
- CPU — использование процессора на контейнер
- Memory — RSS, cache, swap, working set
- Network — трафик Tx/Rx на контейнер
- Disk — IO операции, read/write bytes
- Filesystem — использование overlay storage

## Запуск

```bash
cd /path/to/exporters/cadvisor
docker compose up -d
```

Проверить:

```bash
curl http://localhost:9324/metrics
```

## Прометеус

Scrape config пример:
```yaml
- job_name: 'cadvisor'
  scrape_interval: 30s
  static_configs:
    - targets: ['localhost:9324']
      labels:
        instance: 'server_name'
```
