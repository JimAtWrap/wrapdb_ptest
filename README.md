This project contains the scripts for creating a Docker image from an existing postgres
database. It allows you to quickly start up a database with a known data set. You can
stop and restart to refresh your data between tests.


1. Dump your database into the db folder.

  > mkdir db
  > pg_dump wrapi_development | gzip > ./db/wrapdb.gz

2. Build your docker image

  > docker build -t wrapdb .

3. Run your docker instance in a container.

  > docker run -p 5432:5432 -d wrapdb
  
4. Get the IP address of your Docker machine

  > docker-machine ip

  192.168.99.100

5. Connect to the database remotely.

  > psql -h 192.168.99.100 -U postgres