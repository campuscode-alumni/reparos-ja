require 'rails_helper'

feature 'visitor create user account' do

  scenario 'from home page successfully' do
    visit root_path
    click_on 'Cadastrar-se como Usuário'

    fill_in('Nome', with: 'Teste User')
    fill_in('Email', with: 'email@teste.com')
    fill_in('Senha', with: '123456')
    fill_in('Confirme sua senha', with: '123456')
    click_on 'Criar Usuário'

    expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
    expect(current_path).to eq(root_path)
    expect(User.count).to eq(1)
  end

  scenario 'without fill in name' do
    visit root_path
    click_on 'Cadastrar-se como Usuário'

    fill_in('Nome', with: '')
    fill_in('Email', with: 'email@teste.com')
    fill_in('Senha', with: '123456')
    fill_in('Confirme sua senha', with: '123456')
    click_on 'Criar Usuário'

    expect(page).to have_content('É necessário informar um nome')
    expect(current_path).to eq(user_registration_path)
    expect(User.count).to eq(0)
  end

end