require 'rails_helper'

feature 'contractor receive email' do
  scenario 'successfully' do
    user = create(:user)
    pedreiro = create(:category, name: 'Pedreiro')
    contractor = create(:contractor, name: 'Dionisio', category_id: pedreiro.id, email: 'dionisio@gmail.com', password: 'dionisio123', cpf:'987654332100')

    login_as(user, scope: :user)
    mailer_spy = class_spy(ContractorsMailer)
    stub_const('ContractorsMailer', mailer_spy)

    visit root_path
    click_on 'Dionisio'
    click_on 'Solicitar orçamento'

    fill_in 'Descrição do serviço', with: 'Preciso trocar meu telhado'
    fill_in 'Local', with: 'Alameda Santos, 1293'
    fill_in 'Data', with: '15/03/2019'
    select 'Tarde', from: 'Turno'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'telhado.jpeg')
    click_on 'Enviar solicitação'

    estimate = Estimate.last
    expect(ContractorsMailer).to have_received(:notify_new_estimate).with(contractor.id, estimate.id)
  
  end
end