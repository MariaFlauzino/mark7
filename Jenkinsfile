node{
    stage 'Build'
        git 'https://github.com/MariaFlauzino/mark7.git'

    stage 'Bundle' 
        sh "gem install bundler"
        sh "bundle install"
                   
    stage 'Run Features'
        script{
            try{
                sh "cucumber -p ci_jenkins"
            }
            finally{
                cucumber fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
            }
        }
    
    stage'Read to production?'
        input message: 'Testes finalizados com sucesso. Podemos ir para produção?'
        echo "Faz de conta que vai subir para produção."
}