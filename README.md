# EDI Journal


## Setup
The EDI Journal is a Dockerized project.  The following provides instructions apply to creating a development environment on a local Mac computer.  You will need to download and install the [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/) in order to use and develop the code.

First, create docker containers for all the defined services.  

```
$ docker-compose up --build
```

You can create specific containers by referencing their names in the build command.  Note that the following two commands will both start a rails server running on localhost:3000.  The difference is the first command will run the server process in the terminal window (where log output may be observed) while the second command will daemonize the server in its own background process.  

```
$ docker-compose up --build rails
```

```
$ docker-compose up -d --build rails
```

You can stop the server running in background:

```
$ docker-compose stop rails
```

## Helpful Docker Commands

Following are some useful commands to manage your Docker environment.  These commands work after the containers are created following successful execution of the ```docker-compose up``` command above and are always run executed in the project directory. 


### Initiate a terminal session in the Docker container context:

```
$ docker-compose run runner
```

Enter CTRL-D to exit the terminal session

### Get a list of active containers

```
$ docker-compose ps
```

### See log file output for the application and dependent services

```
$ docker-compose logs
```

### Start and stop application and all dependent container services.  

```
$ docker-compose start
$ docker-compose stop
```


## Configuration

* Ruby 2.6.3
* Rails 6.0 w/options:
  * --skip-action-cable
  * --skip-active-record
  * --skip-test
  * --skip-system-test
* Dependencies
  *  Webpacker
  *  MongoDb 4.2
  *  Redis
