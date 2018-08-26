#language: pt
# enconding: utf-8

@sprint2
Funcionalidade: Cadastrar tarefas
    Para que eu possa organizar minhas atividades 
    Sendo um usuário cadastrado
    Posso cadastrar novas tarefas

    @autenticado @nova_tarefa @logout
    Cenário: Nova tarefa

        Dado que eu tenho uma tarefa com os seguintes atributos:
            |nome| Fazer uma Compra|
            |data| 25/06/2018|
        E eu quero taguear essa tarefa com 
            | tag          |
            | compras      |
            | supermercado |
            | ketchup      |
        Quando faço o cadastro dessa tarefa
        Então devo ver essa tarefa com o status "Em andamento"
        E devo ver somente 1 tarefa com o nome cadastrado.
    
    @autenticado @tarefa_duplicada @logout
    Cenario: Tarefa não pode ser duplicada

        Dado que eu tenho uma tarefa com os seguintes atributos:
            |nome| Ler um livro|
            |data| 25/06/2018|
        E eu quero taguear essa tarefa com 
            | tag     |
            | go      |
            | estudar |
            | livro   |
            | harcore |
        Mas eu já tinha cadastrado essa tarefa e não tinha percebido
        Quando faço o cadastro dessa tarefa
        Então devo ver a mensagem "Tarefa duplicada." ao tentar cadastrar.
        E devo ver somente 1 tarefa com o nome cadastrado.

    @autenticado @desafio @logout
    Cenario: Valor minimo

        Dado que eu tenho uma tarefa com os seguintes atributos:
            |nome| Mongo|
            |data| 25/06/2018|
        Quando faço o cadastro dessa tarefa
        Então devo ver a mensagem "10 caracteres é o mínimo permitido." ao tentar cadastrar.
        
