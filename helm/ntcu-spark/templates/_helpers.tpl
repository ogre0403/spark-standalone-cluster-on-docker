{{- define "event-pvc.name" -}}
{{- printf "%s-%s" .Values.schoolId "event-log" }}
{{- end }}

{{- define "hdfs-pvc.name" -}}
{{- printf "%s-%s" .Values.schoolId "hdfs" }}
{{- end }}


{{- define "history.name" -}}
{{- printf "%s-%s" .Values.schoolId "history" }}
{{- end }}

{{- define "history.label" -}}
app: {{ include "history.name" . }}
{{- end }}

{{- define "history.url" -}}
{{- printf "%s-%s" (include "history.name" .) .Values.domain }}
{{- end }}


{{- define "jupyter.name" -}}
{{- printf "%s-%s" .Values.schoolId "jupyter" }}
{{- end }}

{{- define "jupyter.label" -}}
app: {{ include "jupyter.name" . }}
{{- end }}

{{- define "jupyter.url" -}}
{{- printf "%s-%s" (include "jupyter.name" .) .Values.domain }}
{{- end }}

{{- define "app.url" -}}
{{- printf "%s-%s-%s" .Values.schoolId "app" .Values.domain }}
{{- end }}



{{- define "master.name" -}}
{{- printf "%s-%s" .Values.schoolId "master" }}
{{- end }}

{{- define "master.label" -}}
app: {{ include "master.name" . }}
{{- end }}

{{- define "master.url" -}}
{{- printf "%s-%s" (include "master.name" .) .Values.domain }}
{{- end }}


{{- define "worker.name" -}}
{{- printf "%s-%s" .Values.schoolId "worker" }}
{{- end }}

{{- define "worker.label" -}}
app: {{ include "worker.name" . }}
{{- end }}

{{- define "worker.url" -}}
{{- printf "%s-%s" (include "worker.name" .) .Values.domain }}
{{- end }}

# ===============================================

{{/*
Expand the name of the chart.
*/}}
{{- define "ntcu-spark.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ntcu-spark.fullname" -}}
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
{{- define "ntcu-spark.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ntcu-spark.labels" -}}
helm.sh/chart: {{ include "ntcu-spark.chart" . }}
{{ include "ntcu-spark.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ntcu-spark.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ntcu-spark.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ntcu-spark.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ntcu-spark.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
