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


{{- define "jupyter.token" -}}
{{- if .Values.token }}
{{- printf "%s=%s" "--NotebookApp.token" .Values.token }}
{{- else }}
{{- printf "%s=" "--NotebookApp.token" }}
{{- end }}
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
