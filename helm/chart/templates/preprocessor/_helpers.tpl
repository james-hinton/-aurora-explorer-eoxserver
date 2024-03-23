{{/*
Expand the name of the chart.
*/}}
{{- define "vs-preprocessor.name" -}}
{{- default "preprocessor" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "vs-preprocessor.fullname" -}}
{{- if .Values.preprocessor.fullnameOverride }}
{{- .Values.preprocessor.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "preprocessor" .Values.preprocessor.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "vs-preprocessor.chart" -}}
{{- printf "%s-%s" "preprocessor" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "vs-preprocessor.labels" -}}
helm.sh/chart: {{ include "vs-preprocessor.chart" . }}
{{ include "vs-preprocessor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vs-preprocessor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "vs-preprocessor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vs-preprocessor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "vs-preprocessor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
