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
    expect(page).to have_css('span', text: "Enviado para: #{estimate.contractor.name}")
    expect(page).to have_css('span', text: "Solicitado por: #{estimate.user.name}")
  end

end