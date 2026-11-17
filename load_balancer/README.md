# Load balancer

Ubuntu 16.04 LTS Bash automation for the two mandatory tasks.

| File | Task |
| --- | --- |
| 0-custom_http_response_header | Configure nginx on both web servers with X-Served-By set to its hostname |
| 1-install_load_balancer | Install HAProxy on lb-01 with roundrobin and init-script management |

## Configure the servers after pushing

A GitHub push does not configure servers. On each server, clone or update this
repository and enter its load_balancer directory. Run task 0 on BOTH web-01
(35.178.250.230) and web-02 (35.178.244.80), never on lb-01:

```bash
sudo bash 0-custom_http_response_header
hostname
curl -sI http://localhost/ | grep -i '^X-Served-By:'
```

The header must match the hostname. Check that the hostnames are your own
[STUDENT_ID]-web-01 and [STUDENT_ID]-web-02. Correct them using the intranet
tutorial if needed; this script does not invent a student ID or change SSH access.
Task 0 keeps the permanent redirect and custom 404 response, and preserves
an existing /var/www/html/404.html design.

On lb-01 ONLY, run:

```bash
sudo bash 1-install_load_balancer
sudo service haproxy status
```

HAProxy routes to 35.178.250.230:80 and 35.178.244.80:80. Rebuild if these IPs change.
From another computer, check both web server IPs with curl -sI http://IP/.
Then repeatedly run curl -sI http://LB01_IP/ using the actual lb-01 IP from
My servers. Expect HTTP 200 and both web server hostnames in X-Served-By.
One hostname only can mean one backend is unavailable. Check nginx on both
servers and port 80 access in firewall/hosting rules; do not disable your firewall.

Run Shellcheck 0.3.7 (shellcheck -e SC2154 0-custom_http_response_header
1-install_load_balancer) and verify on Ubuntu 16.04 before requesting review.
The builder has not logged into your servers or verified public traffic.
