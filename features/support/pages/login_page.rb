# Classe que mapeia elementos da tela de Login

class LoginPage < SitePrism::Page
  element :campo_email, '#login_email'
  element :campo_senha, 'input[title$=password'
  element :botao_entrar, 'button[id*=btnLogin'
  element :alerta_login, '.alert-login'

  def logar(email,senha)
    campo_email.set email
    campo_senha.set senha
    botao_entrar.click
  end
end
