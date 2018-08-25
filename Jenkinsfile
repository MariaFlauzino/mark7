pipeline{
    agent{
        docker{
            image 'ruby'
        }
    }
    environment{
        CI = true
    }
    stages{
        stage('Bundle'){
            steps{
                sh "bundle install"
            }
        }
        stage('Run Features'){
            steps{
                sh "cucumber"

            }
        }
    }
}