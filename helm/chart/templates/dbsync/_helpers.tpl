{{/*
Expand the name of the chart.
*/}}
{{- define "vs-dbsync.name" -}}
{{- default "dbsync" .Values.dbsync.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vs-dbsync.fullname" -}}
{{- if .Values.dbsync.fullnameOverride }}
{{- .Values.dbsync.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "dbsync" .Values.dbsync.nameOverride }}
{{- printf "%s-%s-%s" .Release.Name $name (now | date "20060102150405") | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs-dbsync.chart" -}}
{{- printf "%s-%s" "dbsync" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vs-dbsync.labels" -}}
helm.sh/chart: {{ include "vs-dbsync.chart" . }}
{{ include "vs-dbsync.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs-dbsync.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs-dbsync.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vs-dbsync.serviceAccountName" -}}
{{- if .Values.dbsync.serviceAccount.create }}
{{- default (include "vs-dbsync.fullname" .) .Values.dbsync.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.dbsync.serviceAccount.name }}
{{- end }}
{{- end }}
