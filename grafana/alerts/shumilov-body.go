{{- define "mdv2.escape" -}}
{{- $s := . -}}
{{- $s = reReplaceAll "\\\\" "\\\\" $s -}}
{{- $s -}}
{{- end -}}

{{ define "telegram.print" -}}
{{- if eq .Status "firing" }}
🔥 - {{ .Labels.alertname }}
{{- else if eq .Status "resolved" }}
✅ - {{ .Labels.alertname }}
{{- end }}

{{- range .Labels.SortedPairs -}}
{{- if eq .Name "instance" }}
🖥: {{ template "mdv2.escape" .Value }}

{{- else if eq .Name "grafana_folder" }}
📂: {{ template "mdv2.escape" .Value }}

{{- else if eq .Name "job" }}
📊: {{ template "mdv2.escape" .Value }}
    
{{- else }}
{{- end }}
{{- end }}

{{- $summary := index .Annotations "summary" }}
{{- if $summary }}

Описание:
- {{ .Labels.instance }}
- {{ $summary }}
{{- end }}
{{- end }}

{{ define "shumilov-body" -}}
{{- if .Alerts.Firing }}
{{- range .Alerts.Firing }}
{{ template "telegram.print" . }}
{{- end }}
{{- end }}

{{- if .Alerts.Resolved }}
{{- range .Alerts.Resolved }}
{{ template "telegram.print" . }}
{{- end }}
{{- end }}
{{- end }}