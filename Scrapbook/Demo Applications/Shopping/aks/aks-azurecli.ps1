az group create -n aksrg -l westeurope

az acr create -n conraks093 -g aksrg -l westeurope --sku Basic

az acr update -n conraks093 --admin-enabled true

az acr login -n conraks093

docker images

az acr list -g aksrg --query "[].{acrLoginServer:loginServer}" --output table

(note acrLoginServer)

docker tag shoppingapi:latest conraks093.azurecr.io/shoppingapi:v1

docker tag shoppingapp:latest conraks093.azurecr.io/shoppingapp:v1

docker push conraks093.azurecr.io/shoppingapi:v1

docker push conraks093.azurecr.io/shoppingapp:v1

az acr repository list -n conraks093 --output table

az acr repository show-tags -n conraks093 --repository shoppingapp --output table

az acr repository show-tags -n conraks093 --repository shoppingapi --output table

az aks create -g aksrg -l westeurope -n myAKSCluster --node-count 1 --generate-ssh-keys --attach-acr conraks093

az aks install-cli

az aks get-credentials -g aksrg -n myAKSCluster

az acr list -g aksrg --query "[].{acrLoginServer:loginServer}" --output table

(note acrLoginServer)

az acr repository list -n conraks093 --output table

(Get acr key from portal)

kubectl create secret docker-registry acr-secret --docker-server=shoppingacr.azurecr.io --docker-username=shoppingacr --docker-password=eh52L64qJY=toZW9Sh6cPyer8fmVWhNF --docker-email=jon@jcly.de

kubectl get secret

