
Dado('que eu tenho uma tarefa com os seguintes atributos:') do |table|
  @nova_tarefa =  table.rows_hash
  DAO.new.remover_tarefas(@nova_tarefa[:nome])
end

Dado('eu quero taguear essa tarefa com') do |tags|
  @tags = tags.hashes
end

Dado('eu já tinha cadastrado essa tarefa e não tinha percebido') do
  steps %(
    Quando faço o cadastro dessa tarefa
  )
end

Quando('faço o cadastro dessa tarefa') do
  visit '/tasks'
  @tarefas_page.botao_novo.click
  @tarefas_page.adicionar.cadastrar(@nova_tarefa, @tags)
end

Então('devo ver essa tarefa com o status {string}') do |status_tarefa|
  tarefa = @tarefas_page.item(@nova_tarefa[:nome])
  expect(tarefa).to have_content status_tarefa
end

Então('devo ver somente {int} tarefa com o nome cadastrado.') do |quantidade|
  visit '/tasks'
  # busca pela tarefa que foi cadastrada, o resultado deve ser igual a 1
  @tarefas_page.busca(@nova_tarefa[:nome])
  expect(@tarefas_page.itens.size).to eql quantidade
end

Então('devo ver a mensagem {string} ao tentar cadastrar.') do |mensagem|
  expect(@tarefas_page.adicionar.alerta.text).to eql mensagem
end


# remover
Dado("que eu tenho uma tarefa indesejada") do
  @nova_tarefa = {nome: 'Tarefa muito boa para ser removida', data: '01/07/2018'}
  @tags = [{tag: 'remover'}]
  DAO.new.remover_tarefas(@nova_tarefa[:nome])

  steps %(
    Quando faço o cadastro dessa tarefa
  )
end

Quando("eu solicito a exclusão dessa tarefa") do
  @tarefa_para_remover = @tarefas_page.item(@nova_tarefa[:nome])
  @tarefa_para_remover.find('#delete-button').click
end

Quando("confirmo a ação de exclusão") do
  @tarefas_page.mensagem_confirmacao.confirmar_exclusao
end

Então("esta tarefa não deve ser exibida na lista") do
  @tarefas_page.busca(@nova_tarefa[:nome])
  expect(@tarefas_page.itens.size).to eql 0
end

Quando("eu cancelo esta ação") do
  @tarefas_page.mensagem_confirmacao.cancelar_exclusao
end

Então("esta tarefa permanece na lista") do
  @tarefas_page.busca(@nova_tarefa[:nome])
  expect(@tarefas_page.itens.size).to eql 1
end
