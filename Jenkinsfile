pipeline {
  environment {
    AWS_ACCOUNT_ID="353712235357"
    AWS_DEFAULT_REGION="us-east-1"
    IMAGE_REPO_NAME="test-nodeapp"
    IMAGE_TAG="v1"
    REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
  }
  agent any
  stages {

    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/acharvighnesha/test-nodeapp', branch: 'master', credentialsId: 'vighnesha-github-user-token'])

      }
    }
    //Building docker image
    stage('Building image') {
      steps{
        script {
          def dockerHome = tool 'myDocker'
          env.PATH = "${dockerHome}/bin:${env.PATH}"
          dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
        }
      }
    }
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{
         script {
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com"
                sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
                sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
         }
        }
      }
    }
 }
