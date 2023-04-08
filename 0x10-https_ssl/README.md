# HTTPS SSL

Project done during **Full Stack Software Engineering studiese* at **ALX Africa**. It aims to learn about the importance of HTTPS and how it works. I configured my HolbertonBnB web servers with certbot certificate and HAproxy SSL termination.

## Technologies

* Scripts written in Bash 5.0.17(1)
* Tested on Ubuntu 20.04 LTS

## Files

All the following are bash scripts and haproxy configs files:

| Filename | Description |
| -------- | ----------- |
`0-world_wide_web` | Bash script that displays information about subdomains on my configured servers. `./1-world_wide_web <domain> <subdomain>`
`1-haproxy_ssl_termination` | HAproxy configuration file that accepts encrypted SSL traffic for the subdomain www. on TCP port 443
`100-redirect_http_to_https` | HAproxy configuration file that automatically redirects HTTP traffic to HTTPS.
