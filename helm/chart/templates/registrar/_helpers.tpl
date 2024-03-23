{{/*
Expand the name of the chart.
*/}}
{{- define "vs-registrar.name" -}}
{{- default "registrar" .Values.registrar.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vs-registrar.fullname" -}}
{{- if .Values.registrar.fullnameOverride }}
{{- .Values.registrar.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "registrar" .Values.registrar.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs-registrar.chart" -}}
{{- printf "%s-%s" "registrar" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vs-registrar.labels" -}}
helm.sh/chart: {{ include "vs-registrar.chart" . }}
{{ include "vs-registrar.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs-registrar.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs-registrar.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vs-registrar.serviceAccountName" -}}
{{- if .Values.registrar.serviceAccount.create }}
{{- default (include "vs-registrar.fullname" .) .Values.registrar.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.registrar.serviceAccount.name }}
{{- end }}
{{- end }}
