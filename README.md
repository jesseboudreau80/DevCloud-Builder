🚀 DevCloud-Builder
🧠 Your Personal Cloud-Based Developer & Automation Environment










Created by Jesse Boudreau
 — a plug-and-play developer lab for automation, AI, and compliance projects.
Built for speed ⚡, collaboration 🤝, and total control 🧩.

🧠 Overview

DevCloud-Builder turns your machine (or always-free Oracle instance) into a full-stack development environment pre-loaded with Docker, n8n, Portainer, Syncthing, and ngrok.

💡 Think of it as a portable R&D lab — ideal for testing FastAPI, LLMs, or micro-SaaS projects without paying a dime for cloud hosting.

🧩 Stack Components
Service	Description
🐳 Docker Compose	Orchestrates and manages the full stack
🧠 n8n	Low-code workflow automation engine
🖥️ VS Code Server	Browser-based coding environment
🌐 ngrok	Secure public access to your localhost
📦 Portainer	Manage Docker visually (containers, images, stacks)
🔄 Syncthing	Continuous file synchronization between devices
🐍 FastAPI (optional)	Lightweight Python backend for APIs
🤖 AnythingLLM (optional)	Local LLM interface for personal AI agents
⚙️ Quick Start

Clone the repo and spin it up instantly:

git clone https://github.com/jesseboudreau80/DevCloud-Builder.git
cd DevCloud-Builder/core
cp .env.template .env
docker compose up -d


Then open:

🖥️ Portainer → http://localhost:9000

🌐 VS Code Server → your ngrok URL (after login)

🔒 Environment Variables
Variable	Description
NGROK_AUTHTOKEN	Your ngrok authentication token
N8N_ENCRYPTION_KEY	Encryption key for n8n data
POSTGRES_USER / POSTGRES_PASSWORD	Database credentials
SYNC_FOLDER_PATH	Syncthing sync folder path
PORTAINER_ADMIN / PORTAINER_PASSWORD	Optional Portainer admin credentials
🧭 Architecture
        ┌────────────┐
        │ VS Code    │
        │  Server    │
        └─────┬──────┘
              │
        ┌─────▼──────┐
        │ Docker Hub │
        │  Stack     │
        └─────┬──────┘
              │
 ┌────────────▼────────────┐
 │ Portainer • n8n • Sync  │
 └────────────┬────────────┘
              │
           🌐 ngrok

🧱 Roadmap

✅ Current:

Docker stack operational

Portainer dashboard ready

n8n automation running

Syncthing sync configured

ngrok tunneling secured

🧩 Next Up:

⚡ FastAPI backend template

🤖 AnythingLLM integration

🧮 PostgreSQL auto-backup service

🐕 DevCloud CLI bootstrap tool

🖼️ Preview

![DevCloud Commit Preview](assets/devcloud-commit-preview.png)

> Example Warp terminal showing VS Code Server, Portainer, and n8n containers running side-by-side.

❤️ Credits

Built with 💚 by Jesse Boudreau, blending compliance precision with AI innovation.
Designed for developers, dreamers, and dog lovers who build smarter, faster, and cleaner in the cloud.
