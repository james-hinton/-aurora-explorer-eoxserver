{{/*
Expand the name of the chart.
*/}}
{{- define "vs-cache.name" -}}
{{- default "cache" .Values.cache.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vs-cache.fullname" -}}
{{- if .Values.cache.fullnameOverride }}
{{- .Values.cache.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "cache" .Values.cache.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs-cache.chart" -}}
{{- printf "%s-%s" "cache" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vs-cache.labels" -}}
helm.sh/chart: {{ include "vs-cache.chart" . }}
{{ include "vs-cache.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs-cache.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs-cache.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vs-cache.serviceAccountName" -}}
{{- if .Values.cache.serviceAccount.create }}
{{- default (include "vs-cache.fullname" .) .Values.cache.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.cache.serviceAccount.name }}
{{- end }}
{{- end }}
