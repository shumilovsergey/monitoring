## Вступление

- Алерты подойдут как для Linux так и для Windows ( v 0.29.2 | v 0.31.3 )
- Не забыть заменить node_exporter и windows_exporter на ваш нейминг

## Up

```
up{job=~"node_exporter|windows_exporter"}
```

- IS NOT EQUAL TO: 1
- NO DATA: Error
- Не отвечает дольше 2 минут
- {{ $labels.instance }}


## CPU

```
100 * (
  (
    1 - avg by (instance) (
      rate(node_cpu_seconds_total{mode="idle"}[15m])
    )
  )
  or
  (
    1 - avg by (instance) (
      rate(wmi_cpu_time_total{mode="idle"}[15m])
    )
  )
  or
  (
    1 - avg by (instance) (
      rate(windows_cpu_time_total{mode="idle"}[15m])
    )
  )
)

```
- IS ABOVE: 90%
- NO DATA: Last Value
- Уже 15 минут нагрузка на CPU больше 90%
- {{ $labels.instance }}


## RAM

```
100 * (
  (
    1 - (
      node_memory_MemAvailable_bytes
      /
      node_memory_MemTotal_bytes
    )
  )
  or
  (
    1 - (
      wmi_os_physical_memory_free_bytes
      /
      wmi_os_physical_memory_total_bytes
    )
  )
  or
  (
    1 - (
      windows_os_physical_memory_free_bytes
      /
      windows_os_physical_memory_total_bytes
    )
  )
)

```

- IS ABOVE: 95
- NO DATA: Last Value
- Осталось меньше 5% RAM
- {{ $labels.instance }}


## System HDD 

```
100 * (
  (
    node_filesystem_avail_bytes{
      mountpoint="/",
      fstype!~"tmpfs|fuse.*|squashfs|iso9660"
    }
    /
    node_filesystem_size_bytes{
      mountpoint="/",
      fstype!~"tmpfs|fuse.*|squashfs|iso9660"
    }
  )
  or
  (
    wmi_logical_disk_free_bytes{volume="C:"}
    /
    wmi_logical_disk_size_bytes{volume="C:"}
  )
  or
  (
    windows_logical_disk_free_bytes{volume="C:"}
    /
    windows_logical_disk_size_bytes{volume="C:"}
  )
)


```
- IS BELLOW: 10
- NO DATA: Last Value
- На системном разделе осталось меньше 10% свободного места
- {{ $labels.instance }}


## Data HDD

- Percents
```
(
  100 * (
    node_filesystem_avail_bytes{
      mountpoint!="/",
      mountpoint!~"/boot.*|/snap.*",
      fstype!~"tmpfs|fuse.*|squashfs|iso9660"
    }
    /
    node_filesystem_size_bytes{
      mountpoint!="/",
      mountpoint!~"/boot.*|/snap.*",
      fstype!~"tmpfs|fuse.*|squashfs|iso9660"
    }
  )
)
or
(
  100 * (
    wmi_logical_disk_free_bytes{
      volume!="C:"
    }
    /
    wmi_logical_disk_size_bytes{
      volume!="C:"
    }
  )
)
or
(
  100 * (
    windows_logical_disk_free_bytes{
      volume!="C:"
    }
    /
    windows_logical_disk_size_bytes{
      volume!="C:"
    }
  )
)

```

- Gigs

```
(
  node_filesystem_avail_bytes{
    mountpoint!="/",
    mountpoint!~"/boot.*|/snap.*",
    fstype!~"tmpfs|fuse.*|squashfs|iso9660"
  }
  or
  wmi_logical_disk_free_bytes{
    volume!="C:"
  }
  or
  windows_logical_disk_free_bytes{
    volume!="C:"
  }
)
/
(1024 * 1024 * 1024)

```

- "B" Threshold: Gigs IS BELOW 10

- "C" Threshold: Percent IS BELOW 5

- "E" Math: $B * $C

- "F" Threshold: E IS EQUAL TO: 1

- NO DATA: Last Value

- На data-диске свободного места меньше 5% и  10Gb
- {{ $labels.instance }}

