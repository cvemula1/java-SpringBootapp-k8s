#!/usr/bin/env groovy
def branch = 'master'
def repo = "https://github.com/cvemula1/K8s-Docker-Jenkins-CICD.git"
podTemplate(label: 'default'){
    node('default') {
        stage ("build") {
          container('default') {
                git repo
                sh "apt-get install -y openjdk-8-jdk"
                sh "mvn clean install"
                sh "aws ecr get-login --no-include-email --region us-west-2 > loginCommand.sh"
                sh readFile('loginCommand.sh').trim()
sh "docker build -t helloworld ."
sh "docker tag helloworld:latest <AwsAccountid>.dkr.ecr.us-west-2.amazonaws.com/helloworld:$BUILD_NUMBER"
sh "docker tag helloworld:latest <AwsAccountid>.dkr.ecr.us-west-2.amazonaws.com/helloworld:latest"
sh "docker push <AwsAccountid>.dkr.ecr.us-west-2.amazonaws.com/helloworld:$BUILD_NUMBER"
sh "docker push <AwsAccountid>.dkr.ecr.us-west-2.amazonaws.com/helloworld:latest"
            }
        }
        stage ("deploy") {
            container('default'){
               sh "kubectl apply -f Kubernetes/deployment.yaml -n <Kubernetes-NameSpace>"
               sh "kubectl apply -f Kubernetes/services.yaml -n <Kubernetes-NameSpace>"
               sh "kubectl apply -f Kubernetes/ingress.yaml -n <Kubernetes-NameSpace>"
            }
        }
    }
}
