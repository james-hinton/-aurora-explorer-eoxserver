{{/*
Expand the name of the chart.
*/}}
{{- define "vs-client.name" -}}
{{- default "client" .Values.client.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vs-client.fullname" -}}
{{- if .Values.client.fullnameOverride }}
{{- .Values.client.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "client" .Values.client.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs-client.chart" -}}
{{- printf "%s-%s" "client" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vs-client.labels" -}}
helm.sh/chart: {{ include "vs-client.chart" . }}
{{ include "vs-client.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs-client.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs-client.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vs-client.serviceAccountName" -}}
{{- if .Values.client.serviceAccount.create }}
{{- default (include "vs-client.fullname" .) .Values.client.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.client.serviceAccount.name }}
{{- end }}
{{- end }}
