#language:pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tarefas
    Sendo um usuário cadastrado
    Posso logar no sistema

    Contexto: Formulário
        Dado que eu acessei o formulário de Login

    @login @logout @teste
    Cenário: Login do usuário
        
        Quando preencho o campo email com "maria@teste.com" e "123456"
        Então sou logado com sucesso
        E sou redirecionado para o painel de tarefas com a mensagem "Olá, Maria"

    Esquema do Cenário: Tentativa de Logar
    
        Quando preencho o campo email com "<email>" e "<senha>"
        Então devo ver a mensagem de alerta "<saida>"

        Exemplos:
        | email                     | senha  | saida                       |
        | eu@papito.io              | xpt123 | Senha inválida.             |
        | padre.kevedo@noekzite.com | 123456 | Usuário não cadastrado.     |
        | maria%noekzite.com        | 123456 | Email incorreto ou ausente. |
        |                           | 123456 | Email incorreto ou ausente. |
        | eu@papito.io              |        | Senha ausente.              |