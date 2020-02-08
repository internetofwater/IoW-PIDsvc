# Persistent Identifier Service (PID Service)
This is a deployment system using docker for the PIDsvc developed bhy CSIRO. https://www.seegrid.csiro.au/wiki/Siss/PIDService#Prerequisites

1. [Overview](#overview)
2. [Deployment](#deployment)
3. [API Request Templates](#api-request-templates)
* [Batch import](#batch-import-via-xml-file) 
* [Delete individual mapping](#delete-individual-mapping) 

# Overview
The Persistent Identifier Service (PID Service) enables resolution of persistent identifiers. All incoming HTTP requests are intercepted by an Apache HTTP web server level and passed to a dispatcher servlet that matches a pattern of an incoming request and compares it with the patterns configured in the PID Service and stored in a persistent relational data store (e.g. PostgreSQL) and then performs a set of user-defined actions, such as, HTTP header manipulation, redirects, proxying requests, delegating resolution to another service, etc. It features extendable architecture for future improvements and supports multiple control interfaces - visual user interface (UI) as well as programmable API for remote user-less management of URI mapping rules.

Implementation has taken into account findings, requirements and observations discovered during technology review and prototype implementation phases that immediately preceded implementation of the PID Service:
https://www.seegrid.csiro.au/wiki/bin/view/SISS4BoM/PIDTechnologyReview
https://www.seegrid.csiro.au/wiki/bin/view/SISS4BoM/PIDPrototypeSolution




# Deployment
This assumes a machine running Ubuntu 18.04 LTS with at least 10GB of disk space and 1.5GB of RAM

1. [Install Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
2. [Install Docker-Compose](https://docs.docker.com/compose/install/)
3. git clone [] to your Server (ubuntu 18.04 LTS)
4. docker-compose build
5. docker-compose up
6. Pidsvc is deployed at http://localhost:8095

## PostgreSQL Backup
Currently the persistent data store backup is mapped to the host directory /srv/OfW/data/PIDsvc which is backed up.  This directory will need to be created on the host machine before docker-compose can build the images properly

## Accessing the web GUI for managing and implementing redirects
Current test deployment is at https://geoconnex.us/pidsvc


## Optional: Enable https

The most straightforward way to serve the PID service over https is to set up a reverse proxy that routes all https traffic coming through port 443 to the "backend service" running on the tomcat docker image on port 8095, and redirects all http traffic coming through port 80 to port 443. The simplest way to do this is with the [Caddy server](https://caddyserver.com/docs/), which by default provisions and renews free SSL certificates from [letsencrypt.org](https://letsencrypt.org).

### Caddy can be built from source using the Go language.

1. [Install Go](https://golang.org/doc/install)
2. git clone -b v2 "https://github.com/caddyserver/caddy.git"
3. cd caddy/cmd/caddy/
4. go build

### Installing and configuring Caddy is simple once built
5. [Manual Install caddy server for Linux](https://caddyserver.com/docs/install)
6. caddy reverse-proxy --from example.com --to localhost.IP.address:8095

## Optional: Security
1. BasicAuth implemented on virtual host, with password hashes stored on server. When BasicAuth is enabled, the GUI import/restore feature does not work. Long term, this either needs to be fixed or in production all batch mappings need to be done through the API by an authorized user/ machine.

# API Request Templates

## Batch import via xml file
Import an xml file of 1:1 mappings located at path/<whatever-import-file-name.xml>. Note, any mappings for paths already registered will be overwritten by default.

### Using shell/ curl
```
curl --user [name]:[password] https://geoconnex.us/pidsvc/controller?cmd=import -X POST -F "source=@<path>/import-file.xml" -H "Content-Type: multipart/mixed" 
```

### Using R
```
#Required libraries (httr imports the others when installed)
# library(curl)
# library(mime)
# library(openssl)
# library(R6)
library(httr) 

#URL of API endpoint + command
url<-"https://geoconnex.us/pidsvc/controller?cmd=import" 

#set path to xml code desired
body <- list(y = upload_file("<path>/import-file.xml",type="text/xml")) 

#POST with authentication and appropriate header
x<-POST(url, body=body, authenticate("user","password"), add_headers("Content-Type" = "multipart/mixed")) 
```

### Using Python



## Delete individual mapping
Delete a mapping for /namespace/path/endofpath. Note that this does not actually delete the mapping but deprecates and inactivates it. Full version histories are kept in the persistent data store.

### Using shell/ curl
```
curl --user [name]:[password] https://geoconnex.us/pidsvc/controller?cmd=delete_mapping -d "mapping_path=/namespace/path/endofpath" -X POST
```

### Using R
```
library(httr) 

#URL of API endpoint + command
url<-"https://geoconnex.us/pidsvc/controller?cmd=delete_mapping" 

#specify the individual path to be deleted
body <- list(mapping_path="/APItest") 

#POST with authentication 
x<-POST(url, body=body, authenticate("user","password"), encode="form") 
```

### Using Python
