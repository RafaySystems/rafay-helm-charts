{{- define "agentsOperator.name" }}
{{- printf "%s" "agents-operator" }}
{{- end }}

{{- define "sharedInformerAgent.name" }}
{{- printf "%s" "shared-informer-agent" }}
{{- end }}

{{- define "policyEnforcementAgent.name" }}
{{- printf "%s" "policy-enforcement-agent" }}
{{- end }}

{{- define "feederService.name" }}
{{- printf "%s" "feeder-service" }}
{{- end }}

{{- define "discoveryEngine.name" }}
{{- printf "%s" "discovery-engine" }}
{{- end }}

{{- define "kmux.name" }}
{{- printf "%s" "kmux" }}
{{- end }}

{{- define "cluster.name" -}}
{{- if .Values.clusterName -}}
{{- (printf "%s" (.Values.clusterName| toString)) | quote }}
{{- end -}}
{{- end -}}

{{- define "cluster.id" -}}
{{- if or (.Values.clusterId) (.Values.install.onlyFeeder) -}}
{{- (printf "%s" (.Values.clusterId | toString)) | quote }}
{{- end -}}
{{- end }}

{{- define "tenant.id" -}}
{{- if or (.Values.tenantId) (.Values.install.onlyFeeder) -}}
{{- (printf "%s" (.Values.tenantId | toString)) | quote }}
{{- end -}}
{{- end }}

{{- define "workspace.id" -}}
{{- if or (.Values.workspaceId) (.Values.install.onlyFeeder) -}}
{{- (printf "%s" (.Values.workspaceId | toString)) | quote  }}
{{- end -}}
{{- end }}

{{- define  "onboarding.details" -}}
{{- range list  "CLUSTER_NAME" "cluster_name" "cluster_id" "tenant_id" "workspace_id" }}
- name: {{ . }}
  valueFrom:
    configMapKeyRef:
      name: onboarding-vars
      key: {{ . }}           
{{- end }}
{{- end }}

{{- define  "kubearmor.details" -}} 
{{- range $k, $v := .Values.feederService.kubearmorVars }}
{{- if $v }}
- name: {{ $k }}
  valueFrom:
    configMapKeyRef:
      name: kubearmor-vars
      key: {{ $k }}
{{- else }}
- name: {{$k}}
  value: ""      
{{- end }}      
{{- end }}      
{{- end }}          

{{- define  "splunk.details" -}} 
{{- range $k, $v := .Values.feederService.splunkVars }}
{{- if $v }}
- name: {{ $k }}
  valueFrom:
    configMapKeyRef:
      name: splunk-vars
      key: {{ $k }}
{{- else }}
- name: {{$k}}
  value: ""       
{{- end }}      
{{- end }}      
{{- end }}         

{{- define  "discoveryEngine.details" -}} 
{{- range $k, $v := .Values.feederService.discoveryEngineVars }}
{{- if $v }}
- name: {{ $k }}
  valueFrom:
    configMapKeyRef:
      name: discovery-engine-vars
      key: {{ $k }}
{{- end }}      
{{- end }}      
{{- end }}  


{{- define  "spire.details" -}} 
{{- range $k, $v := .Values.agentsOperator.spireVars }}
{{- if $v }}
- name: {{ $k }}
  valueFrom:
    configMapKeyRef:
      name: spire-vars
      key: {{ $k }}
{{- end }}      
{{- end }}      
{{- end }}  


{{- define "condition" }}
{{- if eq .Values.install.onlyFeeder true }}
{{- printf "%t" true }}
{{- else }}
{{- if eq .Values.install.onlyFeeder false }}
{{- printf "%t" false }}
{{- else }}
{{- fail "Due to wrong type in .Values.do.*" }}
{{- end }}
{{- end }}
{{- end }}

{{- define  "azureSentinel.details" -}} 
{{- range $k, $v := .Values.feederService.azureSentinelVars }}
{{- if $v }}
- name: {{ $k }}
  valueFrom:
    configMapKeyRef:
      name: azuresentinel-vars
      key: {{ $k }}
{{- else }}
- name: {{$k}}
  value: ""       
{{- end }}      
{{- end }}      
{{- end }}