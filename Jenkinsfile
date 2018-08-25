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
    }
}