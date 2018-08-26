
Before do
  @login_page = LoginPage.new
  @tarefas_page = TarefasPage.new
  @nav_bar = Navbar.new

  # define resolução da tela antes de iniciar os testes
  page.current_window.resize_to(1440, 900)
end

Before('@autenticado') do 
  visit '/login'
  @login_page.logar('maria@teste.com','123456' )
  @tarefas_page.wait_for_painel
end

After('@logout') do
  @nav_bar.logout
end

After do |scenario|
  nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  nome_cenario = nome_cenario.tr(' ', '_').downcase!
  screenshot = "log/screenshots/#{nome_cenario}.png"
  page.save_screenshot(screenshot) # => capybara tira o screeshot
  embed(screenshot, 'image/png', 'Evidência') # => cucumber anexa evidência no relatório
end

# salvar evidencia de acordo com resultado do teste
=begin
  if scenario.failed?
    screenshot = "log/screenshots/failed/#{nome_cenario}.png"
  else
    screenshot = "log/screenshots/passed/#{nome_cenario}.png"
=end
