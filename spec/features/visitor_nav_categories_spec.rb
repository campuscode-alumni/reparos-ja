require 'rails_helper'

feature 'visitor navigate into categories' do

  scenario 'and view registered categories' do
    create(:category, name: 'Eletricista')
    create(:category, name: 'Encanador')

    visit categories_path

    expect(page).to have_css('h1', text: 'Categorias')
    expect(page).to have_css('li', text: 'Eletricista')
    expect(page).to have_css('li', text: 'Encanador')
  end

  scenario 'and select one category' do
    category = create(:category, name: 'Eletricista')

    visit categories_path
    click_on 'Eletricista'

    expect(current_path).to eq(category_path(category))
    expect(page).to have_css('h1', text: 'Prestadores de Serviço')
  end

  scenario 'and view contractors from this category' do

  end

end