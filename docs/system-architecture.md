# Enterprise AI Graphic Design Agency & Automation Network

This repository implements an autonomous, multi-agent AI graphic design agency integrated with Slack and orchestrated locally with **n8n**.

## 1. System Architecture

```mermaid
flowchart TD
    Client["Marketing Team (Slack App Mention)"] --> SlackWebhook["Slack Event Webhook (/webhook/slack-design-agent)"]
    SlackWebhook --> BrainLoader["Load Client Memory / Brain\n(Brand Guidelines + Past Approvals + Rejections)"]
    
    subgraph MultiAgentStudio["MNC Design Studio Network"]
        BrainLoader --> CD["1. Creative Director Agent (Senior)\n(Master theme & Asset #1 Proof-of-Concept)"]
        CD --> Engine["2. Specialized Rendering Engine\n(Ideogram v2 / Recraft v3 / FLUX.1)"]
        CD --> Copy["3. Lead Copywriter Agent\n(Hooks, Captions, CTAs, Hashtags)"]
        Engine & Copy --> QA["4. Multimodal Vision QA Inspector\n(GPT-4o Vision: Spelling, Sharpness, Palette)"]
    end
    
    QA --> SlackDraft["Slack Thread Interactive Card"]
    
    subgraph SlackGate["2-Stage Token-Capping Gate"]
        SlackDraft -->|Button: Discard| Abort["Abort ($0.05 spend capped)"]
        SlackDraft -->|Button: Request Edit| Revise["Human in the loop revision"]
        SlackDraft -->|Button: Approve Batch| BatchRun["Generate Remaining 9 Posts"]
    end
    
    BatchRun --> FinalDelivery["Post 10 Formatted Campaign Cards to Slack Thread"]
```

## 2. Multi-Agent Hierarchy

- **Executive Creative Director**: Deconstructs briefs, enforces brand guidelines, and defines multi-post narrative arcs.
- **Art Director & Lead Copywriter**: Establishes composition, lighting, aspect ratios (4:5 / 1:1), and crafts platform-optimized captions.
- **Production Workers**: Formats prompt tokens for specialized graphic engines.
- **Multimodal Vision QA Inspector**: Automatically checks rendered assets character-by-character for spelling errors, blurry text, and brand alignment.

## 3. Unit Economics & Pricing Model

- **Raw API Cost per 10-Post Batch**: ~$0.08 (Budget/Flux) to ~$0.65 (Premium Ideogram v2 + GPT-4o).
- **Aborted Draft Cost**: ~$0.05 (prevents runaway token costs).
- **Agency Value**: Traditional agencies charge $2,500 – $6,000 for a 10-post batch.
- **Enterprise SaaS Retainer**: $1,499 – $3,999/month (>99% Gross Profit Margin).
