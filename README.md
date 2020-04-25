# Udacity Devops Engineer Nano-degree Capstone Project

In this capstone project I implemented a CI/CD pipeline using Github, Jenkins, Amazon Web Services, Docker and Kubernetes. The goal of the project was to launch a simple nginx server into a Kubernetes pod using a blue/green app deployment approach. Two deployments are launched simultaneously with one load balancing service. When we want to switch to the green segment of the deployment, the service config file is updated using a label/selector method. 

## Initial Setup
![alt Project Pipeline](https://github.com/sergiopichardo/devops-capstone/blob/master/diagrams/initial-setup.png)


## Deployments
![alt Project Initial](https://github.com/sergiopichardo/devops-capstone/blob/master/diagrams/deployments.png)


## DevOps Architecture
![alt Project Pipeline](https://github.com/sergiopichardo/devops-capstone/blob/master/diagrams/pipeline.png)


<!-- Add dependencies needed to be installed -->
### Jenkins Dependencies 
- **Compute power**: AWS EC2 Instance, Ubuntu 18.04 AMI, t2.medium or larger (kubernetes needs at least 2 CPUs to run).
- **jenkins**: Install and configure jenkins to run your pipelines. You'll need docker, and aws credentials loaded into jenkins.
- **tidy**: HTML Linter, check for syntax errors and output correctness score.
- **nodejs**: Javascript run time (=> 10.x.x) to run dockerfile_lint
- **dockerfile_lint**: Dockerfile Linter, check for errors, and suggest best practices.
- **make**: Makefile generator, allows you to automate scripts.
- **unzip**: Extract zip files.
- **awscli**: official AWS cli 2 to interact with AWS API. 
- **docker**: Build and run Docker containers.
- **kubernetes**: kubelet, kubeadm, kubectl, and kubernetes-cni.
- **eksctl**: Create kubernetes cluster on aws.
- **aws-iam-authenticator**: Authenticate your kubernetes cluster to AWS.
- **IAM user**: setup an IAM user and give it required permissions. 
- **Energy**: Coffee or Energy is recommended, but not required :D


## Setup Cluster Instructions 
<!-- Creating Cluster with eksctl -->
Before launching pipeline you must create eks cluster. Remember this process takes from 10 to 15 miniutes to complete as cloudformation has to provision all resources.

*NOTE: Some regions do not support EKS. I used us-east-1 region.*

```sh
$ eksctl create cluster --name <cluster_name> --nodes 1 --region <region>
```


### Change kubectl Context 
So you can interact with eks api from your local machine or EC2 instance.
```sh
aws eks --region us-east-1 update-kubeconfig --name devops-cluster
```


### Authenticate to AWS using aws-iam-authenticator
This command will pre-generate certificate, private key, and kubeconfig files for the server.
```sh
$ aws-iam-authenticator init
```


### IAM Authentication Errors
In case of errors check which IAM role you have setup for your current workspace. 
```
$ aws sts get-caller-identity
```


## Run Pipeline Instructions
<!-- Explain how to run pipeline -->
Login into your Jenkins server, authenticate to github, setup pipeline and 
launch deployments and service. 

The provision of the resources should work almost immediately, but for the Elastic Load Balancer to be accessible externally might take a few minutes (around 10 minutes).

## Update Deployment Instructions
Update load balancer so it points to the green pod using the label/selector strategy.
```yml
apiVersion: v1
kind: Service
metadata:
  name: load-balancer
  labels:
    run: load-balancer
    color: green
spec:
  ports:
  - port: 80
    targetPort: 80
    protocol: TCP
  selector:
    run: load-balancer
    color: green
  type: LoadBalancer
```


### Execute update using kubectl.
```sh
$ kubectl apply -f service.yml
```

## Remove Cluster Instructions 
<!-- Display command needed -->
```sh
$ eksctl delete cluster --name <cluster_name>
```


## Rubric 
<!-- NOTE: Remember to explain that eksctl creates cloudformation script -->

### Set Up Pipeline 
- [x] **Create Github repository with project code**: All project code is stored in a GitHub repository and a link to the repository has been provided for reviewers.
    - *Link to GitHub repository can be found in file called **github-repo.txt***
- [x] **Use image repository to store Docker images**: The project uses a centralized image repository to manage images built in the project. After a clean build, images are pushed to the repository.
    - *Project uses DockerHub as the centralized image repository*
### Build Docker Container 
- [x] **Execute linting step in code pipeline**: Code is checked against a linter as part of a Continuous Integration step (demonstrated w/ two screenshots)
    - *Two images are provided: one failing and one passing*
- [x] **Build a Docker container in a pipeline**: The project takes a Dockerfile and creates a Docker container in the pipeline.
    - *A docker build stage was added to jenkins pipeline which turn a Dockerfile and turns it into an image.*

### Successful Deployment
- [x] **The Docker container is deployed to a Kubernetes cluster**: The cluster is deployed with CloudFormation or Ansible. This should be in the source code of the student’s submission.
    - *This was accomplished using **eksctl** which deploys the cluster using a cloudformation template internally*
- [x] **Use Blue/Green Deployment or a Rolling Deployment successfully**: The project performs the correct steps to do a **blue/green** into the environment selected. Student demonstrates the successful completion of chosen deployment methodology with screenshots.
    - *Screenshots can be found in directory called **screenshots/***

