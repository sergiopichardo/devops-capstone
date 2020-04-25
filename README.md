# Udacity Devops Engineer Nano-degree Capstone Project

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
- **coffee**: for energy lol

## 1. Setup Cluster Instructions 
<!-- Creating Cluster with eksctl -->
Run setup pipeline by switching to setup branch
```sh
$ git checkout setup-cluster
```

## 2. Run Pipeline Instructions
<!-- Explain how to run pipeline -->
```sh
$ git checkout master 
```

## 3. Update Deployment Instructions
<!-- Add picture of what it should look like with index.html of different colors -->
Run pipeline to set
```sh
$ git checkout green-update
```

## 4. Remove Resources Instructions 
<!-- Display command needed -->
```
$ git checkout remove-cluster
```

## Rubric 
<!-- NOTE: Remember to explain that eksctl creates cloudformation script -->

### Set Up Pipeline 
- [x] **Create Github repository with project code**: All project code is stored in a GitHub repository and a link to the repository has been provided for reviewers.
- [x] **Use image repository to store Docker images**: The project uses a centralized image repository to manage images built in the project. After a clean build, images are pushed to the repository.

### Build Docker Container 
- [x] **Execute linting step in code pipeline**: Code is checked against a linter as part of a Continuous Integration step (demonstrated w/ two screenshots)
- [x] **Build a Docker container in a pipeline**: The project takes a Dockerfile and creates a Docker container in the pipeline.

### Successful Deployment
- [x] **The Docker container is deployed to a Kubernetes cluster**: The cluster is deployed with CloudFormation or Ansible. This should be in the source code of the student’s submission.
    - *This was accomplished using eksctl which deploys the cluster using a cloudformation template internally*
- [x] **Use Blue/Green Deployment or a Rolling Deployment successfully**: The project performs the correct steps to do a blue/green or a rolling deployment into the environment selected. Student demonstrates the successful completion of chosen deployment methodology with screenshots.

