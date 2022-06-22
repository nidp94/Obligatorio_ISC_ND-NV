cd "./aws/"
terraform init
terraform apply -auto-approve
cd "./app"
terraform init
terraform apply -auto-approve
aws eks --region us-east-1 update-kubeconfig --name obligatorio-eks > /dev/null
echo
echo "La URL para acceder al sitio Web es:"
kubectl get service | grep "LoadBalancer" | awk {'print $4'}