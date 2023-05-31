##POD exercise
##################################################
## current cluster we are working on - we can have many clusters that we can connect to
kubectl config current-context

## create a pod - explain all the details in the yaml
kubectl create -f pod.yaml
## show pod that doesnt have a label on container
## create app with podCrashingLoop

## look on the pod
kubectl get pods -o wide
kubectl logs [pod name] --all-containers

## try to connect to the pod - we cant because we dont have a service
##look on the pod in the dashboard - we can see the cotainers


##Service Exercise
#############################################
### start with a service without a label (remove this from the code)
kubectl create -f service_no_label.yaml
kubectl get services
## show in the dashboard that the service is not connected to a pod

## show IP and everything
kubectl describe svc
## with label
kubectl apply -f service.yaml
##run the service using tunnel
kubectl get services
kubectl describe service sarit-service
## show the service in the dashboard it should have pods now

##usually we will be able to access the service by looking on one of the node's IP 
##and the port. but as minikube runs on docker we need to use tunnel
## (transferring the port to the local machine)
minkube serice sarit-service --url


## deployment exercise
###############################################
##show docker for second app - and create two image versions
kubectl apply -f deployment_second.yaml
## show pods - with replicas.
## kill pod and see what happens
kubectl get pods
kubectl kill pod [pod name]
kubectl get pods ## the number of pods should return to the original number 
##and a new pod was created
################################################# go back to deck
## create service for the deployment
## look on dashboard - there is no service, lets create it
kubectl apply -f service_deployment.yaml
##using tunnel we can now connect our service/app
minikube service sarit-second-service --url
## go to second deployment show everything that is going on there
kubectl apply -f deployment_second.yaml

## see how the pods are replacing.
kubectl get pods
## we can also see it in the dashboard

## show the rollout status:
kubectl rollout status deploy sarit-deployment
## show get pods
kubectl get pods
## show the dashboard and see that the apps are being replaced

#############################################
##if we have time we can see rollback, if not - instructions are here
### rollback
###################################################################
## rollback first step - show replica sets - still exist on the cluster
kubectl get rs
kubectl describe rs [rs name]

##Rollback
kubectl rollout history deploy sarit-deployment
kubectl rollout undo deploy sarit-deployment --to-revision=2

minikube service sarit-serice --url
## show that we are back to the first version
