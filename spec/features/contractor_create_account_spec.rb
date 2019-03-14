require 'rails_helper'

feature 'Contractor create account' do
  scenario 'successfully' do
    create(:category, name: 'Pedreiro')
    
    visit root_path
    click_on 'Cadastrar-se como Prestador'

    fill_in 'Nome', with: 'João'
    fill_in 'E-mail', with: 'joao@campuscode.com.br'
    fill_in 'Senha', with: 'Joao123'
    fill_in 'CPF', with: '12345678909'
    select 'Pedreiro', from: 'Categoria' 
    click_on 'Enviar'

    expect(page).to have_content('Bem-Vindo João!')
    expect(page).to have_content('Logado como: joao@campuscode.com.br')
    expect(page).not_to have_link('Cadastrar-se como Prestador')
    expect(page).to have_link('Sair')
  end

end
