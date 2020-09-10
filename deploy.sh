
docker build -t jaynejacobs/multi-server:latest -t jaynejacobs/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jaynejacobs/multi-worker:latest -t jaynejacobs/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker build -t jaynejacobs/multi-client:latest -t jaynejacobs/multi-client:$SHA -f ./client/Dockerfile ./client

 
docker push jaynejacobs/multi-server:latest
docker push jaynejacobs/multi-worker:latest
docker push jaynejacobs/multi-client:latest

 
docker push jaynejacobs/multi-server:$SHA
docker push jaynejacobs/multi-worker:$SHA
docker push jaynejacobs/multi-client:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=jaynejacobs/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=jaynejacobs/multi-worker:$SHA
kubectl set image deployments/client-deployment client=jaynejacobs/multi-client:$SHA