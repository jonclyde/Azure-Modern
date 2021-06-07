#Misc commands
docker-compose -f docker-compose.yml -f docker-compose.override.yml up --build

#Ingress controller
kubectl create namespace ingress-basic

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm install nginx-ingress ingress-nginx/ingress-nginx \
    --namespace ingress-basic \
    -f internal-ingress.yaml \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set controller.admissionWebhooks.patch.nodeSelector."beta\.kubernetes\.io/os"=linux

kubectl --namespace ingress-basic get services -o wide -w nginx-ingress-ingress-nginx-controller

kubectl apply -f aks-helloworld.yaml --namespace ingress-basic
kubectl apply -f ingress-demo.yaml --namespace ingress-basic

kubectl apply -f hello-world-ingress.yaml

kubectl run -it --rm aks-ingress-test --image=mcr.microsoft.com/aks/fundamental/base-ubuntu:v0.0.11 --namespace ingress-basic

apt-get update && apt-get install -y curl

curl -L http://10.240.0.42


#Certificate Manager




#AKS deployment
$rg = "aksrg6"
$acr = "conraks098"
$aks = "myAKSCluster4"

az group create -n $rg -l westeurope

az acr create -n $acr -g $rg -l westeurope --sku Basic

az acr update -n $acr --admin-enabled true

az acr login -n $acr

docker images

#gets ACR address:
az acr list -g $rg --query "[].{acrLoginServer:loginServer}" --output table

docker tag shoppingapi:latest $acr.azurecr.io/shoppingapi:v1

docker tag shoppingapp:latest $acr.azurecr.io/shoppingapp:v1

docker push $acr.azurecr.io/shoppingapi:v1

docker push $acr.azurecr.io/shoppingapp:v1

az acr repository list -n $acr --output table

az acr repository show-tags -n $acr --repository shoppingapp --output table

az acr repository show-tags -n $acr --repository shoppingapi --output table

az aks create -g $rg -l westeurope -n $aks --node-count 1 --generate-ssh-keys --attach-acr $acr

az aks install-cli

az aks get-credentials -g $rg -n $aks

az acr list -g $rg --query "[].{acrLoginServer:loginServer}" --output table

(note acrLoginServer)

az acr repository list -n $acr --output table

(Get acr key from portal)

kubectl create secret docker-registry acr-secret --docker-server=shoppingacr.azurecr.io --docker-username=shoppingacr --docker-password=B/M3quOBgpnnblDvHQnhE9EZIfi938HH --docker-email=jon@jcly.de

kubectl get secret

