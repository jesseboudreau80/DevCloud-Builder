🧠 DevCloud Setup & Navigation Guide

This file documents the structure, startup commands, and navigation of the DevCloud Stack.

📂 Folder Overview
Folder	Purpose
.env	Environment variables (ngrok, DB, ports, etc.)
docker-compose.yml	Defines the full containerized stack (n8n, Portainer, Syncthing, DB, etc.)
n8n_data	Persistent workflow and config data for n8n
pg_data	PostgreSQL data volume
portainer_data	Portainer UI data for Docker management
syncthing_config	Syncthing peer and folder configuration
workspace	General dev workspace for custom scripts or repos
sync/	Shared sync folder for live backups or mirroring
🚀 Start the Stack

From within /core:

sudo docker compose up -d


Check running containers:

sudo docker ps

🌐 Tunnels

Start ngrok manually:

ngrok http 5678


Use your ngrok dashboard to get the public forwarding URL.
(Example: https://jesse-automation.ngrok.dev
 → n8n)

If ngrok won’t start, check for existing sessions:

ps aux | grep ngrok
pkill ngrok

🧩 Installed Components

n8n → Workflow automation platform

PostgreSQL → Database for n8n

Portainer → Docker management GUI

Syncthing → File sync between local + remote DevCloud

VS Code Server → Browser-based IDE (accessed via ngrok tunnel)

🔁 Auto-Start on Boot (Optional)

Enable Docker + auto-compose restart:

sudo systemctl enable docker
sudo systemctl start docker


To auto-start your stack at boot:

sudo crontab -e


Add:

@reboot cd /home/jesseboudreau/DevCloud/core && /usr/bin/docker compose up -d

🧰 Useful Commands
Action	Command
Check container logs	sudo docker logs <container_name>
Restart stack	sudo docker compose restart
Shut down stack	sudo docker compose down
List volumes	sudo docker volume ls
Prune unused containers/images	sudo docker system prune -af
Verify env	cat .env
🔑 Notes

Always run commands from /home/jesseboudreau/DevCloud/core.

.env defines ports and tokens for services.

pg_data and n8n_data persist between reboots.

ngrok tunnel must be restarted manually (unless added to systemd).

Keep a copy of this guide in your repo for easy onboarding.
