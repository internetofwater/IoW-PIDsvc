# High availability version

This configuration is for a version of the PIDsvc with a stack of one master database with streaming replication to any number of standyby read-only databases that have connection pooling nad load balancing handled by [PgPoolII](https://www.pgpool.net/mediawiki/index.php/Main_Page).

The configuration is based on a modified @bitnami Postgres 11 with replication manager [docker image that must be built](https://github.com/internetofwater/IoW-PIDsvc/tree/master/PIDsvc-Docker-HA/bitnami-docker-postgresql-repmgr/11/debian-10), and the PgPool image and configuration in [this repository](https://github.com/bitnami/bitnami-docker-pgpool)


# Install
```
git clone https://github.com/internetofwater/IoW-PIDsvc.git
cd IoW-PIDsvc/tree/master/PIDsvc-Docker-HA/bitnami-docker-postgresql-repmgr/11
docker build debian-10 -t ksonda/bitnamipg:11 
cd ~ IoW/PIDsvc/PIDsvc-Docker-HA/pidpool
docker-compose up
```

Service is running at localhost:9000
