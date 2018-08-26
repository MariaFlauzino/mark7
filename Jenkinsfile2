pipeline{
    agent none
    environment{
        CI = true
    }
    stages{
        stage('Bundle'){
            steps{
                bat "gem install bundler"
                bat "bundle install"
            }
        }
        stage('Run Features'){
            steps{
                script{
                    try{
                        bat "cucumber -p ci_jenkins"
                    }
                    finally{
                        cucumber fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
                    }
                }
            }
        }
        stage('Read to production?'){
            steps{
                input message: 'Testes finalizados com sucesso. Podemos ir para produção?'
                echo "Faz de conta que vai subir para produção."
            }
        }
    }
}