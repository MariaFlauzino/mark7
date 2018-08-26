# mensagem de confirmação de exclusão

class Mensagem_Confirmacao < SitePrism::Section
  element :botao_sim, '.btn-danger'
  element :botao_nao, '.btn-default'
  
  def confirmar_exclusao
    botao_sim.click
  end

  def cancelar_exclusao
    botao_nao.click
  end
end

# - Adicionar é classe que representa a subpagina Adicionar tarefas
# que será tratada como uma Seção do SitePrism
class Adicionar < SitePrism::Section
  element :campo_nome, 'input[name=title]'
  element :campo_data, 'input[name=dueDate]'
  element :campo_tags, '.bootstrap-tagsinput input'
  element :botao_cadastrar, 'button[id*=submit]'
  element :alerta, '.alert-warn'


  def add_tags(tags)
    if tags != nil
      tags.each do |t|
        campo_tags.set t[:tag]
        campo_tags.send_keys :tab
      end
    end
  end

  def cadastrar(tarefa, tags)
    campo_nome.set tarefa[:nome]
    campo_data.set tarefa[:data]
    add_tags(tags) 
    botao_cadastrar.click
  end
end

# - TarefasPage eh a pagina principal
class TarefasPage < SitePrism::Page
  element :painel, '#task-board'
  element :botao_novo, '#insert-button'

  element :campo_busca, 'input[name=search]'
  element :botao_busca, '#search-button'

  elements :itens, 'table tbody tr'

  def busca(valor)
    campo_busca.set valor
    botao_busca.click
  end
  
  def item(valor)
    find('table tbody tr', text: valor)
  end

  section :adicionar, Adicionar, '#add-task-view'
  section :mensagem_confirmacao, Mensagem_Confirmacao, '.modal-content'
end
