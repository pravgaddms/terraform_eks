# terraform_eks
Here you need to create you own key_name in AWS.

Once Cluster and Nodes are provisioned, Login to eks_connect server and follow below steps:

curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.16/2023-01-30/bin/linux/amd64/kubectl

chmod +x kubectl && mv kubectl /usr/local/bin/

kubectl --version

Run AWS Configure

aws sts get-caller-identity

aws eks update-kubeconfig --region ap-south-1 --name dev

kubectl get pods -A

kubectl get all -A