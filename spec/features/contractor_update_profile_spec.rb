require 'rails_helper'

feature 'contractor update profile' do
  scenario 'successfully' do
    category = create(:category, name: 'Pedreiro')
    contractor = create(:contractor, category: category)
    first_category_service = CategoryService.create(name: 'Reformas', category: category)
    second_category_service = CategoryService.create(name: 'Manutenção', category: category)
    third_category_service = CategoryService.create(name: 'Pintura', category: category)
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Meu Perfil'
    click_on 'Atualizar Perfil'
    select 'São Paulo', from: 'Cidade'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'pedreiro.jpeg')
    check 'Manutenção'
    check 'Reforma'
    check 'Pintura'
    click_on 'Atualizar'

    expect(page).to have_css('p', text: 'São Paulo')
    expect(page).to have_content('img[src*="pedreiro.jpg"]')
    expect(page).to have_css('li', text: 'Manutenção')
    expect(page).to have_css('li', text: 'Reforma')
    expect(page).not_to have_css('li', text: 'Pintura')
  end
end