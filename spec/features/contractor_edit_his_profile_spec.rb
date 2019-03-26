require 'rails_helper'

feature 'Contractor edit his profile' do
  scenario 'Successfully' do
    contractor = create(:contractor)
    create(:sub_category, name: 'Arrumar chuveiro', category: contractor.category)
    create(:sub_category, name: 'Arrumar tomada', category: contractor.category)
    create(:sub_category, name: 'Ar condicionado', category: contractor.category)

    login_as(contractor, scope: :contractor)
    visit root_path
    click_on 'Editar meu Perfil'
    fill_in 'Nome', with: 'Prestador'
    fill_in 'CPF', with: '98765432198'
    fill_in 'Cidade', with: 'São Paulo'
    check 'Arrumar chuveiro'
    check 'Arrumar tomada'
    click_on 'Atualizar'
    
    expect(page).to have_content('Prestador')
    expect(page).to have_content('98765432198')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('Arrumar chuveiro')
    expect(page).to have_content('Arrumar tomada')
    expect(page).not_to have_content('Ar condicionado')
  end
end