require 'rails_helper'

feature 'User request estimate' do

  scenario 'successfully' do
    user = create(:user)
    pedreiro = create(:category, name: 'Pedreiro')
    contractor = create(:contractor, name: 'Dionisio', category_id: pedreiro.id, email: 'dionisio@gmail.com', password: 'dionisio123', cpf:'987654332100')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Dionisio'
    click_on 'Solicitar orçamento'

    fill_in 'Descrição do serviço', with: 'Preciso trocar meu telhado'
    fill_in 'Local', with: 'Alameda Santos, 1293'
    fill_in 'Data', with: '15/03/2019'
    select 'Tarde', from: 'Turno'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'telhado.jpeg')
    click_on 'Enviar solicitação'

    expect(current_path).to eq(contractor_path(contractor))
    expect(page).to have_content('Sua solicitação foi enviada')
    expect(page).to have_content('Aguarde retorno do prestador de serviços')
  end

  scenario 'and leave blank fields' do
    user = create(:user)
    pedreiro = create(:category, name: 'Pedreiro')
    contractor = create(:contractor, name: 'Dionisio', category_id: pedreiro.id, email: 'dionisio@gmail.com', password: 'dionisio123', cpf:'987654332100')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Dionisio'
    click_on 'Solicitar orçamento'

    fill_in 'Descrição do serviço', with: ''
    fill_in 'Local', with: ''
    fill_in 'Data', with: ''
    select 'Tarde', from: ''
    click_on 'Enviar solicitação'

    expect(page).to have_content('Erro ao enviar solicitação')
    expect(Estimate.count).to eq(0)
  end

  scenario 'only if authenticated' do
    pedreiro = create(:category, name: 'Pedreiro')
    contractor = create(:contractor, name: 'Dionisio', category_id: pedreiro.id, email: 'dionisio@gmail.com', password: 'dionisio123', cpf:'987654332100')

    visit root_path
    click_on 'Dionisio'

    expect(page).not_to have_link('Solicitar orçamento')
  end

  scenario 'and gets redirected to login' do
    pedreiro = create(:category, name: 'Pedreiro')
    contractor = create(:contractor, name: 'Dionisio', category_id: pedreiro.id, email: 'dionisio@gmail.com', password: 'dionisio123', cpf:'987654332100')

    visit new_contractor_estimate_path(contractor)

    expect(current_path).to eq(new_user_session_path)
  end
end
