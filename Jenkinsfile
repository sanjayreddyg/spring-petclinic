pipeline{  
    agent{ label 'K8s'}
    stages{
        stage('Docker Build') {
            steps {
                   sh 'docker build -t spring-petclinic:latest .'
      }
    }
        stage('Docker Push') {
            steps {
                   withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                   sh 'docker tag spring-petclinic:latest sanjaygreddy/spring-petclinic:$BUILD_NUMBER'
                   sh 'docker push sanjaygreddy/spring-petclinic:$BUILD_NUMBER'
            }
          }
        }
        stage('Deploying application'){
            steps{
                   sh 'kubectl apply -f spc-dev.yaml'
                }
        }
    }
}