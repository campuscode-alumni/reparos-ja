require 'rails_helper'

feature 'visitor create user account' do

  scenario 'from home page successfully' do
    visit root_path
    click_on 'Sign up as User'

    fill_in('Name', with: 'Teste User')
    fill_in('Email', with: 'email@teste.com')
    fill_in('Password', with: '123456')
    fill_in('Confirmation Password', with: '123456')
    click_on 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(current_path).to eq(root_path)
    expect(User.count).to eq(1)
  end

  scenario 'without fill in name' do
    visit root_path
    click_on 'Sign up as User'

    fill_in('Name', with: '')
    fill_in('Email', with: 'email@teste.com')
    fill_in('Password', with: '123456')
    fill_in('Confirmation Password', with: '123456')
    click_on 'Sign up'

    expect(page).to have_content('É necessário informar um nome')
    expect(current_path).to eq(user_registration_path)
    expect(User.count).to eq(0)
  end

end