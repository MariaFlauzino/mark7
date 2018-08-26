pipeline{
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
                script{
                    try{
                        sh "cucumber -p ci"
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