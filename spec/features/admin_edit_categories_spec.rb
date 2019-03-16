require 'rails_helper'

feature 'Admin edit categories' do
  scenario 'successfully' do
    create(:category, name: 'Eletricista')
    
    visit categories_path
    click_on 'Eletricista'
    click_on 'Editar Categoria'
    fill_in 'Nome', with: 'Encanador'
    click_on 'Enviar'
    
    expect(page).to have_css('h1', text: 'Encanador')
    expect(page).not_to have_css('h1', text: 'Eletricista')
  end

  scenario 'and is not allowed to use the same name' do
    create(:category, name: 'Eletricista')
    create(:category, name: 'Encanador')

    visit categories_path
    click_on 'Encanador'
    click_on 'Editar Categoria'
    fill_in 'Nome', with: 'Eletricista'
    click_on 'Enviar'
    
    expect(page).to have_content('Não foi possível editar a categoria')
    expect(page).to have_content('Já existe uma categoria com este nome')
  end
end