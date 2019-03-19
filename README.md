# jenkins-master-slave-docker

This app is to host Jenkins Master along with Docker container as slave.

To bind slave to master, this app relies on JNLP protocol

Prerequisites:

Docker Has to be up and running in working machine
Kubernetes Cluster/Minikube - if you want to spin up on kubernetes.


Docker-Compose:
Execute the docker-compose.yaml for dev version. 


Kubernetes Dev Version:

Prerequisites: 
- Helm installation

steps to follow prior k8s yamls execution:
kubectl create secret generic jenkinspass --from-literal JENKINS_PASS=<password>

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml  —> this mandatory for any kind of ingress setup.

minikube addons enable ingress

kubectl apply -f k8s

minikube ip

http://<minikube-ip>:8080


Kubernetes Prod Version(DNS SetUp):

Prerequisites: 
- Helm installation

steps to follow prior k8s yamls execution:
kubectl create secret generic jenkinspass --from-literal JENKINS_PASS=<password>

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml  —> this mandatory for any kind of ingress setup.

minikube addons enable ingress

kubectl apply -f k8s

minikube ip

http://<minikube-ip>:8080


