require 'rails_helper'

#criar um contractor
#login com #
#tela inicial clica em atualizar perfil
#editar nome e cidade
#salva
#espera ver nome e cidade

feature 'Contractor update profile spec' do 
  scenario 'successfully' do
    pedreiro = create(:category)
    contractor = create(:contractor, name: 'Dionisio', category_id: pedreiro.id, email: 'dionisio@gmail.com', password: 'dionisio123', cpf:'987654332100')
    
    login_as contractor, scope: :contractor
    visit root_path
    click_on 'Dionisio'
    click_on 'Atualizar Perfil'

    fill_in 'Nome', with: 'Dionisio da Silva'
    fill_in 'Cidade', with: 'São Paulo'
    click_on 'Atualizar'

    expect(current_path).to eq(contractor_path(contractor))
    expect(page).to have_css('p', text: 'Dionisio da Silva')
    expect(page).to have_css('p', text: 'São Paulo')
    
  end

end
