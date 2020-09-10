# Procedure to update all docker containers

Docker update
1. modify the build
2. docker build -t jaynejacobs/multi-client .
3. docker build -t jaynejacobs/multi-client:v1 .


kubernetes issue thread. 
 Force pods to repull image without changing image tag. 

 issue 33644

 Either manually dealete
 or 
 Tag images

 ## Tagging images

 jaynejacobs/image:tag

 **Imperitive command**

 1. docker build -t jaynejacobs/multi-client:v1 .
 2. docker push jaynejacobs/multi-client:v1
   
   kubectl commands
1. update image property
2. kubectl set image deployment/client-deployment client=jaynejacobs/multi-client:v1

kubectl get pods 

docker ps

## Expose minikube Docker Server VM
eval $(minikube docker-env)