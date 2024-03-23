{{/*
Expand the name of the chart.
*/}}
{{- define "vs.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "vs.labels" -}}
helm.sh/chart: {{ include "vs.chart" . }}
{{ include "vs.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Transforms "!env string" to !env "string" for env variable masking
*/}}
{{- define "vs.envVarQuote" -}}
{{- if contains "!env " .}}!env {{( . | replace "!env " "") | quote }}
{{- else if contains "!env" .}}!env {{( . | replace "!env" "") | quote }}
{{- else}}{{. | quote }}
{{- end}}
{{- end}}
