{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "empfinchart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "empfinchart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "empfinchart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "empfinchart.common.metaLabels" -}}
helm.sh/chart: {{ include "empfinchart.chart" . }}
{{ include "empfinchart.common.matchLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "empfinchart.common.matchLabels" -}}
app.kubernetes.io/name: {{ include "empfinchart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "empfinchart.pa.labels" -}}
{{ include "empfinchart.pa.matchLabels" . }}
{{ include "empfinchart.common.metaLabels" . }}
{{- end -}}

{{- define "empfinchart.pa.matchLabels" -}}
component: {{ .Values.pa.name | quote }}
{{ include "empfinchart.common.matchLabels" . }}
{{- end -}}

{{- define "empfinchart.hrpy.labels" -}}
{{ include "empfinchart.hrpy.matchLabels" . }}
{{ include "empfinchart.common.metaLabels" . }}
{{- end -}}

{{- define "empfinchart.hrpy.matchLabels" -}}
component: {{ .Values.hrpy.name | quote }}
{{ include "empfinchart.common.matchLabels" . }}
{{- end -}}

{{- define "empfinchart.person.labels" -}}
{{ include "empfinchart.person.matchLabels" . }}
{{ include "empfinchart.common.metaLabels" . }}
{{- end -}}

{{- define "empfinchart.person.matchLabels" -}}
component: {{ .Values.person.name | quote }}
{{ include "empfinchart.common.matchLabels" . }}
{{- end -}}

{{- define "empfinchart.finance.labels" -}}
{{ include "empfinchart.finance.matchLabels" . }}
{{ include "empfinchart.common.metaLabels" . }}
{{- end -}}

{{- define "empfinchart.finance.matchLabels" -}}
component: {{ .Values.finance.name | quote }}
{{ include "empfinchart.common.matchLabels" . }}
{{- end -}}

{{- define "empfinchart.faculty.labels" -}}
{{ include "empfinchart.faculty.matchLabels" . }}
{{ include "empfinchart.common.metaLabels" . }}
{{- end -}}

{{- define "empfinchart.faculty.matchLabels" -}}
component: {{ .Values.faculty.name | quote }}
{{ include "empfinchart.common.matchLabels" . }}
{{- end -}}

{{- define "empfinchart.facilities.labels" -}}
{{ include "empfinchart.facilities.matchLabels" . }}
{{ include "empfinchart.common.metaLabels" . }}
{{- end -}}

{{- define "empfinchart.facilities.matchLabels" -}}
component: {{ .Values.facilities.name | quote }}
{{ include "empfinchart.common.matchLabels" . }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "empfinchart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "empfinchart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
