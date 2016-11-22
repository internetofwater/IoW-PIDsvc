# Persistent Identifier Service (PID Service)
This is a deployment system using docker for the PIDsvc https://www.seegrid.csiro.au/wiki/Siss/PIDService#Prerequisites
## Overview
Persistent Identifier Service (PID Service) enables resolution of persistent identifiers. The proposed solution is using an approach to intercept all incoming HTTP requests at the Apache HTTP web server level and pass it through to the PID Service dispatcher servlet that implements a logic to recognise a pattern of an incoming request and compare it with one of the patterns configured in the PID Service and stored in a persistent relational data store (e.g. PostgreSQL) and then performs a set of user-defined actions, such as, HTTP header manipulation, redirects, proxying requests, delegating resolution to another service, etc. It features extendable architecture for future improvements and supports multiple control interfaces - visual user interface (UI) as well as programmable API for remote user-less management of URI mapping rules.
Implementation has taken into account findings, requirements and observations discovered during technology review and prototype implementation phases that immediately preceded implementation of the PID Service:
https://www.seegrid.csiro.au/wiki/bin/view/SISS4BoM/PIDTechnologyReview
https://www.seegrid.csiro.au/wiki/bin/view/SISS4BoM/PIDPrototypeSolution

![Simple architecture](https://www.seegrid.csiro.au/wiki/pub/Siss/PIDServiceUserGuide/Core_Principle_Activity_Diagram.png)

## Security Considerations
Current not implemented

## LDAP Authentication
Current not implemented

## Apache HTTP Server Configuration
Current not implemented

## Deployment
1. git clone [] to your Server
2. docker-compose up

## PostgreSQL Backup
Currently the db is mapped to /OSM/MEL/LW_OZNOME/pidsvc/PIDsvc_db which is backed up.  WARNING this will be the same for each deployment of the service.

