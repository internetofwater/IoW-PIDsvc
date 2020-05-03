#!/bin/bash
set -e 

psql --username "$POSTGRES_USER" -c "create user \"pidsvc-admin\" password 'apassword'"
createdb --username "$POSTGRES_USER" pidsvc -O pidsvc-admin
psql --username "$POSTGRES_USER" -d pidsvc -f postgresql.sql
