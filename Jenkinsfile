pipeline{
    agent{ label 'K8s'}
    triggers{ cron "*/5 * * * * "}
    stages{
        stage('Deploying application') {
            steps{
                   sh 'kubectl apply -f spc-staging.yaml'

                }
        }
    }
}