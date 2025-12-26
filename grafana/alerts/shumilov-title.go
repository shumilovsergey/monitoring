{{ define "shumilov-title" }}
{{- if gt (len .Alerts.Firing) 0 }}
🚨 Тревога: {{ len .Alerts.Firing }}
{{- end }}
{{- if and (gt (len .Alerts.Firing) 0) (gt (len .Alerts.Resolved) 0) }}
, 
{{- end }}
{{- if gt (len .Alerts.Resolved) 0 }}
✅ Разрешено: {{ len .Alerts.Resolved }}
{{- end }}
{{- end }}