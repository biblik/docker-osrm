# docker-osrm

{work in progress}

#INTRODUCTION

This is a docker installation for osrm.

Example with andorra map and car.lua profile.

#RUNNING

##Command line

###Linux

Run these commands.

1. To create the docker image 

` sudo docker build -t osrm .`
2. To build and run the container in daemon mode 

` sudo docker run -d -p 5000:5000 --name osrmrun -v $(pwd)/data:/opt/osrm/data -v $(pwd)/profile:/opt/osrm/profile osrm` 
3. To start container 

` sudo docker start osrmrun` 
4. To stop container 

` sudo docker stop osrmrun` 

## Container

1. To enter in the container

` sudo docker run -it -p 5000:5000 --name osrmrun -v $(pwd)/data:/opt/osrm/data -v $(pwd)/profile:/opt/osrm/profile osrm bash`

#REQUEST FOR A DISTANCE MATRIX
In a browser, enter the following url:

` http://localhost:5000/table/v1/car/1.52194,42.50630;1.73399,42.54356`