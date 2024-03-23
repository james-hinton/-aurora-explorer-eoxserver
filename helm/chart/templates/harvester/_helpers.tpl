{{/*
Expand the name of the chart.
*/}}
{{- define "vs-harvester.name" -}}
{{- default "harvester" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vs-harvester.fullname" -}}
{{- if .Values.harvester.fullnameOverride }}
{{- .Values.harvester.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "harvester" .Values.harvester.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs-harvester.chart" -}}
{{- printf "%s-%s" "harvester" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vs-harvester.labels" -}}
helm.sh/chart: {{ include "vs-harvester.chart" . }}
{{ include "vs-harvester.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs-harvester.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs-harvester.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vs-harvester.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "vs-harvester.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
