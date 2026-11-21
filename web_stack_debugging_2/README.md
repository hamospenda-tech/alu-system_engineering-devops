# Web stack debugging #2

Running commands as a user other than `root`.

## Tasks

| File | Description |
|------|-------------|
| `0-iamsomeoneelse` | Runs `whoami` as the user passed as the first argument, using `sudo -u` |
| `1-run_nginx_as_nginx` | Stops Apache and the root-owned Nginx, makes Nginx listen on port 8080 of all active IPs, gives the `nginx` user access to the files it needs, and starts Nginx as the `nginx` user |
