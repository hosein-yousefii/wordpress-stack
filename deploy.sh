#!/bin/bash

## Wordpress-stack deployment
## written by hosein yousefi mail: yousefi.hosein.o@gmail.com
## Github: https://github.com/hosein-yousefii/

echo "welcome to wordpress-stack deployment"
echo "tell me if you have any question about this stack"
echo "I'm availabe on Github, LinkedIn and gmail"
echo "Github: https://github.com/hosein-yousefii/"
echo "Mail: yousefi.hosein.o@gmail.com"
echo "LinkedIn: https://www.linkedin.com/in/hoseinyousefi/"



kubectl create ns wordpress-stack


echo "deployment of pvc is started"

kubectl apply -f ./mysql/pvc.yaml
kubectl apply -f ./phpmyadmin/pvc.yaml
kubectl apply -f ./wordpress/pvc.yaml
kubectl apply -f ./poste/pvc.yaml
kubectl apply -f ./filebrowser/pvc.yaml


echo "deploying configmaps"

kubectl apply -f ./filebrowser/cm.yaml
kubectl apply -f ./mysql/cm.yaml
kubectl apply -f ./wordpress/cm.yaml

echo "deploying secrets"

kubectl apply -f ./mysql/sec.yaml


echo "deploying services"

kubectl apply -f ./mysql/svc.yaml
kubectl apply -f ./phpmyadmin/svc.yaml
kubectl apply -f ./wordpress/svc.yaml
kubectl apply -f ./poste/svc.yaml
kubectl apply -f ./filebrowser/svc.yaml

echo "deploying pods"

kubectl apply -f ./mysql/deploy.yaml
kubectl apply -f ./phpmyadmin/deploy.yaml
kubectl apply -f ./wordpress/deploy.yaml
kubectl apply -f ./poste/deploy.yaml
kubectl apply -f ./filebrowser/deploy.yaml

echo "it's finished check your pvc and pods"
echo
echo "kubectl get po --namespace wordpress-stack"
echo
echo "kubectl get pvc --namespace wordpress-stack"
echo
echo "ALL should be running"
echo
echo "In case you don't have any ingress please execute these commands"
echo
echo "kubectl apply -f ./ingress/haproxy.yaml"
echo "kubectl apply -f ./ingress/deploy.yaml"
echo
IP=$(kubectl get svc -A|grep haproxy-controller|grep LoadBalancer|awk '{print $5}')
echo "Your load balancer IP is: $IP"
echo """
please add these subdomains to your hosts

$IP				phpmyadmin.hosein.local file.hosein.local mail.hosein.local hosein.local

"""
echo
echo "deployment is finished."

