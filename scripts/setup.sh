#!/bin/bash

set -x 

mkdir -p /postgres/data
chown postgres /postgres/data

mkdir -p /postgres/logs
chown postgres /postgres/logs

su - postgres -c "/usr/lib/postgresql/9.4/bin/initdb /postgres/data"
su - postgres -c "/usr/lib/postgresql/9.4/bin/pg_ctl start -l /postgres/logs/logfile -D /postgres/data"
su - postgres -c "/usr/lib/postgresql/9.4/bin/createdb wrapi_development"

psql -U postgres -c "create user wrapi_reader with password 'wrapi'"
psql -U postgres -c "grant all privileges on database wrapi_development to wrapi_reader"
gunzip -c /tmp/setup/wrapdb.gz | psql -U postgres wrapi_development

su - postgres -c "/usr/lib/postgresql/9.4/bin/pg_ctl stop -D /postgres/data"
echo "host     all             all             0.0.0.0/0            md5" >> /postgres/data/pg_hba.conf