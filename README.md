# IoW-PIDsvc

This is a suite of tools to manage persistent identifiers and redirects based on the [PIDsvc developed by CSIRO](https://github.com/SISS/PID). Modifications to the CSIRO PIDsvc, the [dockerization done by @OzNome](https://github.com/oznome/pidsvc-docker), and new automation tools are managed in this repository, largely in service of the [geoconnex.us](https://github.com/internetofwater/geoconnex.us) project implementing [SELFIE](https://github.com/opengeospatial/SELFIE) practices in the United States.

The [my directory](PIDsvc) directory has a compiled PIDsvc .war file as well as dockerization scripts and documentation for the PIDsvc API.

The [my directory](pidsvcBackup) directory contains an R package for converting csv and geoJSON files into xml files that can be POSTed to the PIDsvc for minting persistent identifiers and their redirects. 
