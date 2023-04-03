# Load Balancer

Project done during **Full Stack Software Engineering studiese* at **ALX Africa**. It aims to learn about how to confgure servers, set up an HAproxy load balancer on to manage web servers.

# Tasks

In this project, I continued to build up the configuration of the web server issued in project 0x0B. I was issued two additional servers, one to replicate the Nginx configuration of my original server, and another to set up an HAproxy load balancer on to manage both web servers.

## Technologies
* Scripts written in Bash 5.0.17(1)
* Tested on Ubuntu 20.04 LTS

# Files

The following files are bash scripts and puppet files.

| Filename | Description |
| -------- | ----------- |
`0-custom_http_response_header` | Bash script that installs and configures Nginx on a server with a custom HTTP response header `X-Served-By` with value as hostname of the server.
`1-install_load_balancer` | Bash script that installs and configures HAproxy, distributing requests using a round-robin algorithm, enables management via the init script.
`2-puppet_custom_http_response_header.pp` | Automate the task of creating a custom HTTP header response using puppet
