#!/bin/bash

docker build -t dandu1008/jenkins-master:latest -t dandu1008/jenkins-master:$SHA -f ./master/Dockerfile ./master
docker build -t dandu1008/jenkins-slave:latest -t dandu1008/jenkins-slave:$SHA -f ./slave/Dockerfile ./slave

docker push dandu1008/jenkins-master:latest
docker push dandu1008/jenkins-slave:latest

docker push dandu1008/jenkins-master:$SHA
docker push dandu1008/jenkins-slave:$SHA

kubectl apply -f k8s
kubectl set image deployments/jenkins-master-deployment jenkins-master=dandu1008/jenkins-master:$SHA
kubectl set image deployments/jenkins-slave-deployment jenkins-slave=dandu1008/jenkins-slave:$SHA

if [[ -z "$DNS" ]]
then
  echo "No DNS is Configured; Deployment is completed"
else
  kubectl apply -f k8s_dns #DNS is not empty
fi   



