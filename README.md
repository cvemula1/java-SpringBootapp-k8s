
##############################################################################
# Use the Jenkinsfile as CI/CD Pipeline  
##############################################################################

# Spring Boot Web Application CI-CD with Jenkins

###############################################################################
# Running Manually and pushing dockerimage to AWS ECR
###############################################################################

# Run Maven build it will create target directory

mvn clean install

# Building Docker Image #

# Build your Docker image using the following command and skip this step if you already build image 

docker build -t helloworld .

# Tag this image as latest

# After the build completes, tag your image so you can push the image to this repository

docker tag testing:latest AWSAccountId.dkr.ecr.us-east-1.amazonaws.com/helloworld :latest

# Login to AWS ## Before this Configure AWS CLI

# 1) Retrieve the docker login command that you can use to authenticate your Docker client to your registry:  Note: If you receive an "Unknown options: --no-include-email" error, install the latest version of the AWS CLI. 

aws ecr get-login --no-include-email --region us-east-1

# Above Command will generate login command to login to AWS ECS and enter that command to login

# Run the following command to push this image to your newly created AWS repository:

docker push AccountID.dkr.ecr.us-east-1.amazonaws.com/helloworld :latest
