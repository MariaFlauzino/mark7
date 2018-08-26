
Dado('que eu acessei o formulário de Login') do
  visit 'https://mark7.herokuapp.com/'
end

Quando('preencho o campo email com {string} e {string}') do |email, senha|
  @email = email
  @login_page.logar(email, senha)
end

Então('sou logado com sucesso') do
  expect(@nav_bar.menu_usuario.text).to eql @email
end

Então('sou redirecionado para o painel de tarefas com a mensagem {string}') do |ola|
  expect(@tarefas_page.painel).to have_content ola
end

Então('devo ver a mensagem de alerta {string}') do |mensagem|
  expect(@login_page.alerta_login.text).to eql mensagem
end
