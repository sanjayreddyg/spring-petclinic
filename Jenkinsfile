pipeline{
    agent{ label 'K8s'}
    triggers{ cron "*/6 * * * *  " }
    stages{
        stage('Deploying application') {
            steps{
                   sh 'kubectl apply -f spc-prod.yml'

                }
        }
    }
}