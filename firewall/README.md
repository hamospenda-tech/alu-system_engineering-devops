# Firewall

Configuring the `ufw` firewall on my web servers.

## Tasks

| File | Description |
|------|-------------|
| `0-block_all_incoming_traffic_but` | `ufw` commands that block all incoming traffic on `web-01` except TCP ports 22 (SSH), 443 (HTTPS) and 80 (HTTP) |
