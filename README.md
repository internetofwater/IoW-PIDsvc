# IoW-PIDsvc

This is a suite of tools to manage persistent identifiers and redirects based on the [PIDsvc developed by CSIRO](https://github.com/SISS/PID). Modifications to the CSIRO PIDsvc, the [dockerization done by @OzNome](https://github.com/oznome/pidsvc-docker), and new automation tools are managed in this repository, largely in service of the [geoconnex.us](https://github.com/internetofwater/geoconnex.us) project implementing [SELFIE](https://github.com/opengeospatial/SELFIE) practices in the United States.

The [PIDsvc-Docker](PIDsvc-Docker) directory has a compiled PIDsvc .war file as well as dockerization scripts and documentation for the PIDsvc API.

The [PIDsvc-Docker-HA](PIDsvc-Docker-HA) directory is an experimental configuration for a high-availability setup with database connection pooling using @bitnami docker images for Postgres 11 and Pgpool II


The [pidsvcBackup](pidsvcBackup) directory contains an R client for the PIDsvc API for managing persistent identifiers and their redirects. 
