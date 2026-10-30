# Enterprise Slack AI Graphic Design Studio (Local n8n)

An enterprise multi-agent graphic design agency integrated directly into corporate Slack workspaces, powered by a locally hosted **n8n** automation network.

---

## 🌟 Key Capabilities
1. **The Client Brain (Persistent Memory)**:
   - Maintains company-specific design tokens, HEX color palettes, and typography rules.
   - **Golden Examples**: Ingests past approved campaign assets to replicate proven visual styles.
   - **Rejection History**: Never repeats past design mistakes or disapproved elements.
2. **Automated Vision QA Inspector**:
   - Evaluates rendered assets with **GPT-4o Vision** / **Claude 3.5 Sonnet Vision** before showing them to clients.
   - Performs character-by-character spelling checks on image headlines.
   - Detects and filters out blurry typography or anatomical/AI distortions.
3. **2-Stage Human-in-the-Loop (HITL) Gating & Token Capping**:
   - Generates only **Post #1 as a Proof-of-Concept Draft** first (costing ~$0.05).
   - Delivers an interactive Slack card with `[ Approve & Generate Full 10-Post Batch ]`, `[ Request Revision ]`, and `[ Discard & Abort ]`.
   - Prevents runaway token and API costs.

---

## 📁 Repository Structure
```text
ai-design-agency-n8n/
├── client-brain/
│   ├── client-memory-schema.json        # JSON Schema for client persistent memory
│   └── apex_athletics_brain.json       # Real-world client brain example
├── slack-design-agent-2stage-workflow.json # 2-Stage Gated Workflow (Draft -> QA -> Slack Gate -> Batch)
├── slack-design-agent-workflow.json        # Direct batch generation workflow
├── brand-guidelines.json                   # Standalone brand guidelines config
├── start-n8n.ps1                           # PowerShell one-click launcher
├── start-n8n.bat                           # Windows batch one-click launcher
├── .env.example                            # API keys configuration template
└── README.md                               # Project documentation
```

---

## 🚀 How to Run Locally

### 1. Launch n8n
Double-click `start-n8n.bat` or run:
```powershell
.\start-n8n.ps1
```
Open **`http://localhost:5678`** in your browser to access the n8n UI.

### 2. Expose Webhook via Tunnel
Slack requires an HTTPS webhook endpoint. Expose port `5678`:
```powershell
npx ngrok http 5678
# or with cloudflare:
# cloudflared tunnel --url http://localhost:5678
```

### 3. Import Workflow
1. In n8n (`http://localhost:5678`), click **Add Workflow** -> **Import from File**.
2. Select [`slack-design-agent-2stage-workflow.json`](./slack-design-agent-2stage-workflow.json).
3. Set your environment variables in `.env` (or directly in n8n credentials):
   - `SLACK_BOT_TOKEN`
   - `OPENAI_API_KEY`
   - `IDEOGRAM_API_KEY` (or `FAL_KEY` / `RECRAFT_API_KEY`)
4. Activate the workflow!
