require 'rails_helper'

feature 'Contractor will be update account' do
  scenario 'with a new email' do
    primary_email = 'teste@outlook.com'
    second_email = 'teste@gmail.com'
    contractor = create(:contractor, email: primary_email)
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Meu Perfil'
    click_on 'Atualizar Perfil'
    fill_in 'E-mail', with: second_email
    click_on 'Atualizar'

    expect(page).to have_content("#{second_email}")
  end

  scenario 'with a new name' do
    primary_name = 'João'
    second_name = 'Miguel'
    contractor = create(:contractor, name: primary_name)
    login_as(contractor, scope: :contractor)

    visit root_path
    click_on 'Meu Perfil'
    click_on 'Atualizar Perfil'
    fill_in 'Nome', with: second_name
    click_on 'Atualizar'

    expect(page).to have_content("Miguel")
  end

  scenario 'and leave blank fields' do
    contractor = create(:contractor)
    login_as(contractor, scope: :contractor)

    visit root_path
    click_on 'Meu Perfil'
    click_on 'Atualizar Perfil'
    fill_in 'Nome', with: ''
    click_on 'Atualizar'

    expect(page).to have_content('Não foi possível atualizar a conta')
  end
end
