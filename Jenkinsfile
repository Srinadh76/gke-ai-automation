pipeline {
  agent any

  stages {

    stage('Terraform Apply') {
      steps {
        sh 'terraform -chdir=terraform/autopilot-cluster init'
        sh 'terraform -chdir=terraform/autopilot-cluster apply -auto-approve'
      }
    }

    stage('Deploy Workload') {
      steps {
        sh 'kubectl apply -f k8s/'
      }
    }

    stage('Load Test') {
      steps {
        sh 'bash scripts/load-test.sh'
      }
    }

    stage('Validation') {
      steps {
        sh 'bash scripts/validation.sh'
      }
    }
  }
}
