## look on app.py and requirements.txt and then dockerfile
## build docker and look on the image - execute it.
docker build -t sarit-app .
docker images 
docker run -p 5004:5004 sarit-app 
## go to the internet and run - http://localhost:5004/
## to see what is running we can have 
docker ps
docker logs [containerID]

## go into docker bash
docker  exec -it [containerID] /bin/bash

## stop the container
docker stop [container ID]
## creating image in hub and pushing it to the hub
docker tag sarit-app saritnovikg/sarit-app
docker push saritnovikg/sarit-app
docker pull saritnovikg/sarit-app ## for anyone who want to see if they can pull the image


## for deployment exercise - run the following commands
#######################################################
## look on second_app.py and dockerfile_SecondApp- see the differences.
docker build -t sarit-app-second .
docker tag sarit-app-second saritnovikg/sarit-app-second:1.0
docker push saritnovikg/sarit-app-second:1.0   

## chage the print in the code and run the following commands
docker build -t sarit-app-second -f Dockerfile_SecondApp .
docker tag sarit-app-second saritnovikg/sarit-app-second:2.0
