{{/*
Expand the name of the chart.
*/}}
{{- define "vs-renderer.name" -}}
{{- default "renderer" .Values.renderer.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vs-renderer.fullname" -}}
{{- if .Values.renderer.fullnameOverride }}
{{- .Values.renderer.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "renderer" .Values.renderer.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs-renderer.chart" -}}
{{- printf "%s-%s" "renderer" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vs-renderer.labels" -}}
helm.sh/chart: {{ include "vs-renderer.chart" . }}
{{ include "vs-renderer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs-renderer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs-renderer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vs-renderer.serviceAccountName" -}}
{{- if .Values.renderer.serviceAccount.create }}
{{- default (include "vs-renderer.fullname" .) .Values.renderer.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.renderer.serviceAccount.name }}
{{- end }}
{{- end }}
