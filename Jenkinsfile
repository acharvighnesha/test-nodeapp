pipeline {
  environment {
    imagename = "test-nodeapp/assign"
    dockerImage = ''
  }
  agent any
  stages {

    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/acharvighnesha/test-nodeapp', branch: 'master', credentialsId: 'vighnesha-github-user-token'])

      }
    }
    stage('Building image') {
      steps{
        script {
          def dockerHome = tool 'myDocker'
          env.PATH = "${dockerHome}/bin:${env.PATH}"
          dockerImage = docker.build imagename
        }
      }
    }

  }
}