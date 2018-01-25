# docker-osrm

{work in progress}

# PREREQUISITES

You need to have docker installed on your machine. Visit [docker page](https://docs.docker.com/engine/installation/linux/ubuntulinux/) for installation.

# INTRODUCTION

This is a docker installation for osrm.

This installation comes with [Andorra map](http://download.geofabrik.de/europe/andorra-latest.osm.pbf) and [*car.lua*](https://github.com/Project-OSRM/osrm-backend/tree/master/profiles) profile.

# BUILDING

## Build and run the container

#### First
Clone the git repository and open a terminal in this repository.
#### Secondly
If you want to mount an OSRM server with an other country (instead of Andorra), you need to put the correct **pbf** file into data folder (and remove 
*andorra-latest.osm.pbf*). Visit [geofabrik](http://download.geofabrik.de/europe.html) to select your desire map.
#### Thirdly
Run these commands.

1. To create the docker image  
` sudo docker build -t osrm . `
2. To build and run the container in daemon mode  
` sudo docker run -d -p 5000:5000 --name osrmrun -v $(pwd)/data:/opt/osrm/data -v $(pwd)/profile:/opt/osrm/profile osrm` 
3. To start container  
` sudo docker start osrmrun ` 
4. To stop container  
` sudo docker stop osrmrun `

## Enter into the container
 
` sudo docker run -it -p 5000:5000 --name osrmrun -v $(pwd)/data:/opt/osrm/data -v $(pwd)/profile:/opt/osrm/profile osrm bash`

# RUNNING

## Request for a distance matrix ##

In a browser, enter the following url :
` http://localhost:5000/table/v1/car/1.52194,42.50630;1.73399,42.54356`

It's a test distance matrix with two points from Andorra.