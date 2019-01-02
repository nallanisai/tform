//Jenkinsfile

pipeline {
 
  agent any
  
  parameters {
    string(name: 'tf_version', description: 'Terraform version', defaultValue: '0.11.11')
  }
  
  options {
    buildDiscarder(logRotator(numToKeepStr: '50'))
    disableConcurrentBuilds()
//    ansiColor('xterm')
  }

  stages {
    stage('Loading AWS Credentials and running terraform plan') {
      steps {
          echo "colors"
          sh """
          set -x
          source /usr/local/bin/aws-acsa-credentials
          pwd
          /usr/bin/terraform init 
          /usr/bin/terraform plan -out=create.tfplan
          """
      }
    }

    stage("Review plan before apply") {
      steps {
        timeout(time:10, unit:'MINUTES') {
          input 'Are you sure? Review the output of the previous step before proceeding!'
        }
      }
    }

    stage('Deploying vm using terraform apply') {
      steps {
         sh """
         set -x
         source /jenkins_workspace/aws_credentials.sh
         /usr/bin/terraform apply create.tfplan
         """ 
      }    
    }
  }
}    
