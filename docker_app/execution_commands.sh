## look on app.py and requirements.txt and then dockerfile
## build docker and look on the image - execute it.
docker build -t my-web-service .
docker images 
docker run -p 5000:5000 my-web-service 
## go to the internet and run - http://localhost:5000/
## to see what is running we can have 
docker ps
docker logs [containerID]

## go into docker bash
docker  exec -it [containerID] /bin/bash

## stop the container
docker stop [container ID]
## creating image in hub and pushing it to the hub
docker tag my-web-service saritnovikg/my-web-service
docker push saritnovikg/my-web-service
docker pull saritnovikg/my-web-service ## for anyone who want to see if they can pull the image


## for deployment exercise - run the following commands
#######################################################
## look on second_app.py and dockerfile_SecondApp- see the differences.
docker build -t my-second-app .
docker tag my-second-app saritnovikg/my-second-app:1.0
docker push saritnovikg/my-second-app:1.0   

## chage the print in the code and run the following commands
docker build -t my-second-app -f Dockerfile_SecondApp .
docker tag my-second-app saritnovikg/my-second-app:2.0
