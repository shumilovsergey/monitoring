## Вступление

JMX Prometheus Javaagent нужен для:
- экспорта JMX метрик из Java приложений
- мониторинга JVM (heap, GC, threads)
- сбора application-specific метрик через JMX

## Метрики

Основные группы:
- Memory — heap, non-heap, pools
- Garbage Collection — частота, длительность GC
- Threads — количество, состояния
- ClassLoading — загруженные классы
- Custom MBeans — метрики приложения

## Конфигурация

Конфиги:
- config.yml — правила экспорта JMX метрик

Формат:
```yaml
rules:
  - pattern: ".*"
```

## Запуск

Добавить к Java приложению:
```bash
java -javaagent:jmx_prometheus_javaagent-1.0.1.jar=8080:config.yml -jar app.jar
```

Параметры:
- `8080` — порт для Prometheus метрик
- `config.yml` — конфигурация экспорта

## Прометеус

Scrape config пример:
```yaml
- job_name: 'cuba_jvm'
  static_configs:
    - targets: ['app-server:8080']
      labels:
        instance: 'server_name'
```
