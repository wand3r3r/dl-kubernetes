{{/* vim: set filetype=mustache: */}}
{{/*       
Kubernetes standard labels
*/}}       
{{- define "decisionlens.labels.standard" -}}
app.kubernetes.io/name: decision-lens
helm.sh/chart: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}                                                                                                   
{{/*
Decision Lens labels
*/}}
{{- define "decisionlens.labels" -}}
{{- include "decisionlens.labels.standard" . }}
{{- with .Values.labels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Decision Lens Selector labels
*/}}
{{- define "decisionlens.selectorLabels" -}}
{{- include "decisionlens.labels.standard" . }}
{{- with .Values.selectorLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Convert JDBC options from list to `&` seperated string
*/}}
{{- define "decisionlens.jdbc.options" -}}
{{- join "&" .Values.database.jdbc.options }}
{{- end -}}

{{- define "decisionlens.dlc.jdbc.options" -}}
{{- $dlcOptions := list "useUnicode=yes" "characterEncoding=UTF-8" -}}
{{- $combined :=  concat .Values.database.jdbc.options $dlcOptions | uniq -}}
{{- join "&" $combined }}
{{- end -}}

