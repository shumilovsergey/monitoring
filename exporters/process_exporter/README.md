## Вступление

Process Exporter нужен для:
- мониторинга конкретных процессов на сервере
- сбора метрик CPU, памяти, IO по процессам
- группировки процессов по имени/командной строке

## Метрики

Основные метрики:
- CPU — время процессора по процессам
- Memory — RSS, VMS, swap по процессам
- IO — read/write bytes, operations
- Threads — количество потоков
- File descriptors — открытые fd

## Конфигурация

Конфиги:
- config.yml — правила группировки процессов

Формат:
```yaml
process_names:
  - name: "{{.Comm}}"
    cmdline:
    - '.+'
```

## Запуск

Флаги:
- `--web.listen-address` — адрес:порт (default :9256)
- `--config.path` — путь к config.yml
- `--procfs` — путь к /proc (default /proc)
