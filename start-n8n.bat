@echo off
title Local n8n Server - AI Graphic Design Agency
echo ==========================================================
echo  Starting Local n8n Instance for AI Design Agency...
echo  Web UI: http://localhost:5678
echo ==========================================================
set N8N_PORT=5678
set N8N_PROTOCOL=http
set N8N_HOST=localhost
set EXECUTIONS_DATA_PRUNE=true
set EXECUTIONS_DATA_MAX_AGE=168

npx -y n8n
pause
