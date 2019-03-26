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

    expect(page).to have_content("Logado como: #{second_email}")
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

    expect(page).to have_content("Bem-Vindo #{second_name}!")
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

  scenario 'with a new city' do
    city = 'São Caetano do Sul'
    contractor = create(:contractor)
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Meu Perfil'
    click_on 'Atualizar Perfil'
    fill_in 'Cidade', with: city
    click_on 'Atualizar'

    expect(page).to have_content(city)
  end

  scenario 'with a new cpf' do
    # pending!
    cpf = '123.456.789-00'
    contractor = create(:contractor)
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Meu Perfil'
    click_on 'Atualizar Perfil'
    fill_in 'CPF', with: cpf
    click_on 'Atualizar'

    expect(page).to have_content(city)
  end

  scenario 'with a new sub categories' do
    category = create(:category)
    contractor = create(:contractor, category: category)
    profile = create(:profile, contractor: contractor)
    create(:sub_category, name: 'Arrumar chuveiro', category: category)
    create(:sub_category, name: 'Arrumar tomada', category: category)
    create(:sub_category, name: 'Ar condicionado', category: category)
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Meu Perfil'
    click_on 'Atualizar Perfil'
    check 'Arrumar chuveiro'
    check 'Arrumar tomada'
    click_on 'Atualizar'

    expect(page).to have_content('Arrumar chuveiro')
  end
end
