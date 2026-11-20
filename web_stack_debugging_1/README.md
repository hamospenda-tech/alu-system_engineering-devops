# Web stack debugging #1

Debugging an Ubuntu container whose Nginx installation is not listening on port 80.

## Tasks

| File | Description |
|------|-------------|
| `0-nginx_likes_port_80` | Makes Nginx listen on port 80 of all the server's active IPv4 IPs: sets the default site's IPv4 `listen` directive to port 80, enables the default site by linking it into `sites-enabled`, and restarts Nginx |
