#language: pt

@sprint3
Funcionalidade: Remover uma tarefa
    Para que eu possa deixar meu painel organizado
    Sendo um usuário que possui uma tarefa indesejada
    Posso excluir uma tarefa

    @autenticado @logout
    Cenário: Apagar uma tarefa

        Dado que eu tenho uma tarefa indesejada
        Quando eu solicito a exclusão dessa tarefa 
        E confirmo a ação de exclusão
        Então esta tarefa não deve ser exibida na lista
    
    @autenticado @logout
    Cenário: Desistir da remoção

        Dado que eu tenho uma tarefa indesejada
        Quando eu solicito a exclusão dessa tarefa
        Mas eu cancelo esta ação
        Então esta tarefa permanece na lista