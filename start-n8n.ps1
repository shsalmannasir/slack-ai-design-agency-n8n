# Launcher for Local n8n Instance
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Starting Local n8n Instance for AI Design Agency..." -ForegroundColor Cyan
Write-Host " Web UI will be available at: http://localhost:5678" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

# Set local execution environment variables
$env:N8N_PORT = "5678"
$env:N8N_PROTOCOL = "http"
$env:N8N_HOST = "localhost"
$env:EXECUTIONS_DATA_PRUNE = "true"
$env:EXECUTIONS_DATA_MAX_AGE = "168"

# Start n8n
npx -y n8n
