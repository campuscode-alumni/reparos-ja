require 'rails_helper'

feature 'Admin create new categories' do
  scenario 'successfully' do
     
    visit categories_path
    click_on 'Nova Categoria'
    fill_in 'Nome', with: 'Eletricista'
    click_on 'Enviar'

    expect(Category.count).to eq(1)
    expect(page).to have_css('h1', text: 'Eletricista')
  end

  scenario 'do not blank category name' do
    visit categories_path
    click_on 'Nova Categoria'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(Category.count).to eq(0)
    expect(page).to have_css('li', text: 'Nome não pode ser vazio')
  end

  scenario 'duplicate category name' do
    create(:category, name: 'Eletricista')

    visit categories_path
    click_on 'Nova Categoria'
    fill_in 'Nome', with: 'Eletricista'
    click_on 'Enviar'

    expect(page).to have_css('li', text: 'Já existe uma categoria com este nome')
  end
end