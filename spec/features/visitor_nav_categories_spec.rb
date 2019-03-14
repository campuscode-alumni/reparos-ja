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

    expect(current_path).to eq(category_contractors_path(category))
    expect(page).to have_css('h1', text: 'Prestadores de Serviço')
  end

  scenario 'and view contractors from selected category' do
    category_a = create(:category, name: 'Eletricista')
    category_b = create(:category, name: 'Encanador')
    contractor_a = create(:contractor, name: 'Dionisio', category_id: category_a.id, email: 'dionisio@gmail.com', password: 'dionisio123', cpf:'987654332100')
    contractor_b = create(:contractor, name: 'Geraldo', category_id: category_a.id, email: 'geraldo@gmail.com', password: 'geraldo456', cpf:'56754332100')
    contractor_c = create(:contractor, name: 'Pedro', category_id: category_b.id, email: 'pedro@gmail.com', password: 'pedro789', cpf:'789654332100')

    visit categories_path
    click_on 'Eletricista'

    expect(page).to have_css('h1', text: 'Prestadores de Serviço')
    expect(page).to have_css('p', text: 'Dionisio')
    expect(page).to have_css('p', text: 'Geraldo')
    expect(page).to have_css('small', text: 'Eletricista')
    expect(page).to_not have_css('p', text: 'Pedro')
    expect(page).to_not have_css('small', text: 'Encanador')
  end

end