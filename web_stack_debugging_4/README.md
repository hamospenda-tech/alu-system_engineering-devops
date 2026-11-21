# Web stack debugging #4

Load-testing Nginx with ApacheBench (`ab -c 100 -n 2000 localhost/`) and fixing the cause of failed requests with Puppet.

## Finding the bug

`/var/log/nginx/error.log` shows `Too many open files` errors during the benchmark. `/etc/default/nginx` sets `ULIMIT="-n 15"`, so Nginx may only keep 15 files and connections open at once, which is far too few for 100 concurrent requests.

## Tasks

| File | Description |
|------|-------------|
| `0-the_sky_is_the_limit_not.pp` | Puppet manifest that raises the Nginx open-file limit to 4096 in `/etc/default/nginx` and restarts Nginx, bringing failed requests to 0 |
