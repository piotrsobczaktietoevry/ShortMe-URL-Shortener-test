pipeline {
  agent any
  options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 15, unit: 'MINUTES')
  }
  environment {
    DOCKERHUB_TOKEN=credentials('dockerhub-token')
	}
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
    stage('Push to dockerhub repo') {
      steps{
        sh "echo ${DOCKERHUB_TOKEN_PSW} | docker login -u ${DOCKERHUB_TOKEN_USR} --password-stdin"
	sh 
        sh "docker push localhost:5001/shortner-app:${BUILD_NUMBER}"
      }
    }
  }
}
