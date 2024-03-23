{{/*
Expand the name of the chart.
*/}}
{{- define "vs-seeder.name" -}}
{{- default "seeder" .Values.seeder.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vs-seeder.fullname" -}}
{{- if .Values.seeder.fullnameOverride }}
{{- .Values.seeder.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "seeder" .Values.seeder.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs-seeder.chart" -}}
{{- printf "%s-%s" "seeder" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vs-seeder.labels" -}}
helm.sh/chart: {{ include "vs-seeder.chart" . }}
{{ include "vs-seeder.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs-seeder.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs-seeder.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vs-seeder.serviceAccountName" -}}
{{- if .Values.seeder.serviceAccount.create }}
{{- default (include "vs-seeder.fullname" .) .Values.seeder.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.seeder.serviceAccount.name }}
{{- end }}
{{- end }}
