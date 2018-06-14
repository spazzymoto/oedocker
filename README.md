# Docker OpenEdge Shared Memory

This is a docker-compose example which allows shared memory connections from a PASOE docker instance to a separate DB docker instance.

This will allow you to start 1 DB docker instance with x PAS instances behind an haproxy.

Requirements:
--
1. Docker & docker-compose
2. Linux host
3. PROGRESS_OE_11.7.2_LNX_64.tar.gz
4. License for OE Enterprise RDBMS & Progress ProdAS for OE

There are 3 Dockerfile's in this repo:
  - /Dockerfile
  - /db/Dockerfile
  - /pas/Dockerfile

The Docker file at the root builds a base image with the OpenEdge install files included. This image is used in the subsequent db & pas Dockerfiles.

How to build
--

A requirement for this is that your db must be in the same locations on the host + docker instances, i chose /db
Create a copy of the sports2000 db in the /db folder

```sh
## clone
$ git clone https://github.com/spazzymoto/oedocker.git
$ cd oedocker

## Build base image
$ cp /path/to/oe/install/PROGRESS_OE_11.7.2_LNX_64.tar.gz .
$ ./build.sh

## Build db image
#  Edit db/oe-117-db.ini and insert your serial / control numbers
$ cd db/
$ cp /path/to/oe/install/db/progress.cfg .
$ ./build.sh

## Build PAS
#  Edit db/oe-117-pas-prod.ini and insert your serial / control numbers
$ cd pas/
$ cp /path/to/oe/install/pas/progress.cfg .
$ ./build.sh

## From repo root
$ docker-compose up --scale pas=3
```
Open your bowser to http://localhost/web/test.w
