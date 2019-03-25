require 'rails_helper'

feature 'Contractor view estimate' do
  scenario 'already sent to the user' do
    estimate = create(:estimate, :with_response, :approved_by_contractor)
    login_as(estimate.contractor, scope: :contractor)

    visit root_path
    click_on 'Meus Orçamentos'
    click_on estimate.title

    expect(current_path).to eq(estimate_path(estimate))
    expect(page).not_to have_link('Responder Orçamento')
    expect(page).to have_css('h1', text: "##{estimate.id} - #{estimate.title}")
    expect(page).to have_css('p', text: "Descrição: #{estimate.description}")
    expect(page).to have_css('p', text: "Local: #{estimate.location}")
    expect(page).to have_css('p', text: "Data: #{estimate.service_date}")
    expect(page).to have_css('p', text: "Turno: #{estimate.day_shift}")
    expect(page).to have_css('p', text: "Enviado para: #{estimate.contractor.name}")
    expect(page).to have_css('p', text: "Solicitado por: #{estimate.user.name}")
    expect(page).to have_css('p', text: "Tempo de Execução: #{estimate.total_hours} horas")
    expect(page).to have_css('p', text: "Custo do Material: ")
    expect(page).to have_css('p', text: "Taxa de Visita: ")
    expect(page).to have_css('p', text: "Custo do Serviço: ")
    expect(page).to have_css('p', text: "Lista de Materiais: ")
    expect(page).to have_css('p', text: "Valor Total: ")
  end

  scenario 'not yet sent to the user' do
    estimate = create(:estimate, :requested_by_user)
    login_as(estimate.contractor, scope: :contractor)

    visit root_path
    click_on 'Meus Orçamentos'
    click_on estimate.title

    expect(current_path).to eq(estimate_path(estimate))
    expect(page).to have_link('Responder Orçamento')
    expect(page).to have_css('h1', text: "##{estimate.id} - #{estimate.title}")
    expect(page).to have_css('p', text: "Descrição: #{estimate.description}")
    expect(page).to have_css('p', text: "Local: #{estimate.location}")
    expect(page).to have_css('p', text: "Data: #{estimate.service_date}")
    expect(page).to have_css('p', text: "Turno: #{estimate.day_shift}")
    expect(page).to have_css('p', text: "Enviado para: #{estimate.contractor.name}")
    expect(page).to have_css('p', text: "Solicitado por: #{estimate.user.name}")
    expect(page).not_to have_css('p', text: "Tempo de Execução: #{estimate.total_hours} horas")
    expect(page).not_to have_css('p', text: "Custo do Material:")
    expect(page).not_to have_css('p', text: "Taxa de Visita:")
    expect(page).not_to have_css('p', text: "Custo do Serviço:")
    expect(page).not_to have_css('p', text: "Lista de Materiais: #{estimate.material_list}")
    expect(page).not_to have_css('p', text: "Valor Total:")
  end

  scenario 'only if estimate belongs to contractor itself' do
    estimate = create(:estimate, :with_response, :approved_by_contractor)
    estimate2 = create(:estimate, :with_response, :approved_by_contractor)
    login_as(estimate.contractor, scope: :contractor)

    visit estimate_path(estimate2)

    expect(current_path).to eq(root_path)
  end
end