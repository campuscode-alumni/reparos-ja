require 'rails_helper'

feature 'contractor will be responds estimate' do

  scenario 'and view estimates' do
    title = 'Instalação de Chuveiro'
    contractor = create(:contractor)
    estimate = create(:estimate, title: title, contractor: contractor)
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Meus Orçamentos'

    expect(page).to have_css('h1', text: 'Meus Orçamentos')
    expect(page).to have_css('h2', text: "#{estimate.id} - #{title}")
  end

  scenario 'and view specific estimate' do
    title = 'Instalação de Chuveiro'
    other_title = 'Instalação de Privada'
    contractor = create(:contractor)
    user = create(:user)
    estimate = create(:estimate, title: title, contractor: contractor, user: user)
    other_estimate = create(:estimate, title: other_title, contractor: contractor, user: user)
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Meus Orçamentos'
    click_on title

    expect(page).to have_css('h1', text: "##{estimate.id} - #{title}")
    expect(page).to have_css('p', text: "Descrição: #{estimate.description}")
    expect(page).to have_css('p', text: "Local: #{estimate.location}")
    expect(page).to have_css('p', text: "Data: #{estimate.service_date}")
    expect(page).to have_css('p', text: "Turno: #{estimate.day_shift}")
    expect(page).to have_css('p', text: "Enviado para: #{estimate.contractor.name}")
    expect(page).to have_css('p', text: "Solicitado por: #{estimate.user.name}")
  end

  scenario 'by clicking on button to respond estimate' do
    title = 'Instalação de Chuveiro'
    contractor = create(:contractor)
    user = create(:user)
    estimate = create(:estimate, :requested_by_user, title: title, contractor: contractor, user: user)
    login_as contractor, scope: :contractor

    visit root_path
    click_on 'Meus Orçamentos'
    click_on title
    click_on 'Responder Orçamento'
    
    fill_in 'Tempo de Execução', with: '2'
    fill_in 'Custo do Material',  with: '100,00'
    fill_in 'Taxa de Visita',  with: '50,00'
    fill_in 'Custo do Serviço',  with: '150,00'
    fill_in 'Lista de Materiais', with: 'Chuveiro, fio, fita isolante, veda rosca'
    click_on 'Enviar Orçamento'
    
    expect(page).to have_css('h1', text: "##{estimate.id} - #{title}")
    expect(page).to have_css('p', text: '2 horas')
    expect(page).to have_css('p', text: 'R$ 100,00')
    expect(page).to have_css('p', text: 'R$ 50,00')
    expect(page).to have_css('p', text: 'R$ 150,00')
    expect(page).to have_css('p', text: 'R$ 300,00')
    expect(page).to have_css('p', text: 'Chuveiro, fio, fita isolante, veda rosca')
    expect(page).to have_css('p', text: 'Aguardando aprovação')
  end

  scenario 'send mail estimate response' do
    title = 'Instalação de Chuveiro'
    contractor = create(:contractor)
    user = create(:user)
    estimate = create(:estimate, title: title, contractor: contractor, user: user)
    login_as contractor, scope: :contractor
    mailer_spy = class_spy(EstimatesMailer)
    stub_const('EstimatesMailer', mailer_spy)

    visit edit_estimate_path(estimate)

    fill_in 'Tempo de Execução', with: '2'
    fill_in 'Custo do Material',  with: '100,00'
    fill_in 'Taxa de Visita',  with: '50,00'
    fill_in 'Custo do Serviço',  with: '150,00'
    fill_in 'Lista de Materiais', with: 'Chuveiro, fio, fita isolante, veda rosca'
    click_on 'Enviar Orçamento'

    expect(EstimatesMailer).to have_received(:notify_estimate_response).with(estimate.id)
  end

end