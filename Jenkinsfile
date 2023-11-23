pipeline {
  environment {
    imagename =  "ps0b/devops-inkubator"
    registryCredential = 'ps0b-dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Git checkout repo') {
      steps {
        git([url: 'https://github.com/piotrsobczaktietoevry/ShortMe-URL-Shortener-test.git', branch: 'main', credentialsId: 'github-user-token'])

      }
    }
    stage('Build image') {
      steps{
        sh "docker build -t shortner-app:${BUILD_NUMBER} ."
      }
    }
    stage('Tag build') {
      steps{
        sh "docker tag shortner-app:${BUILD_NUMBER} localhost:5001/shortner-app:${BUILD_NUMBER}"
      }
    }
    stage('Push to local repo') {
      steps{
        sh "docker push localhost:5001/shortner-app:${BUILD_NUMBER}"
      }
    }
  }
}
