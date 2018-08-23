require 'mongo'

class DAO
    attr_accessor :client

    # salvar log de acesso ao banco
    Mongo::Logger.logger = Logger.new('log/mongo.log')

    def initialize
        str_conn = 'mongodb://aluno:qaninja@ds225078.mlab.com:25078/heroku_4m3km28x'
        @cliente = Mongo::Client.new(str_conn)
    end

    def remover_tarefas(nome)
        tasks = @cliente[:tasks]
        # deleta uma tarefa com o nome
        #tasks.delete_one('title' => nome)

        #deleta qualquer tarefa que tiver o nome
        tasks.delete_many('title' => nome)
    end

    def remover_todastarefas
        tasks = @cliente[:tasks]
        tasks.delete_many()
    end
end

# Mongo x SQL

# Collection x Tabelas
# Documents X Registros