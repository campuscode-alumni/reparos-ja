require 'rails_helper'

feature 'Contractor create account' do
  scenario 'successfully' do
    create(:category, name: 'Pedreiro')

    visit root_path
    click_on 'Cadastrar-se como Prestador'

    fill_in 'Nome', with: 'João'
    fill_in 'Email', with: 'joao@campuscode.com.br'
    fill_in 'Senha', with: 'Joao123'
    fill_in 'Confirme sua senha', with: 'Joao123'
    fill_in 'CPF', with: '12345678909'
    select 'Pedreiro', from: 'Categoria' 
    click_on 'Criar Prestador'

    expect(page).to have_content('Bem-Vindo João!')
    expect(page).to have_content('Logado como: joao@campuscode.com.br')
    expect(page).not_to have_link('Cadastrar-se como Prestador')
    expect(page).to have_link('Sair')
  end

  scenario "and leave fields blank" do
    create(:category, name: 'Pedreiro')

    visit root_path
    click_on 'Cadastrar-se como Prestador'

    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirme sua senha', with: ''
    fill_in 'CPF', with: ''
    click_on 'Criar Prestador'

    expect(page).to have_content('Não foi possível criar a conta')
  end
end
