{{/* activates wsl on windows. */}}
{{- if eq .os.chezmoi "windows" -}}
Write-Host "Activating wsl..."

if (!(Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux).State) {
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
}

{{- end -}}
