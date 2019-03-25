require 'rails_helper'

feature 'User view estimate' do
  scenario 'before contractor response' do
    estimate = create(:estimate, :requested_by_user)
    login_as(estimate.user, scope: :user)

    visit root_path
    click_on 'Meus Orçamentos'
    click_on estimate.title
    
    expect(page).to have_css('p', text: 'Status: Solicitado pelo Usuário')
    expect(page).not_to have_css('p', text: 'Status: Aguardando aprovação do usuário')
    expect(page).not_to have_content('Tempo de Execução:')
    expect(page).not_to have_content('Custo do Material:')
    expect(page).not_to have_content('Taxa de Visita:')
    expect(page).not_to have_content('Custo do Serviço:')
    expect(page).not_to have_content('Lista de Materiais:')
    expect(page).not_to have_content('Valor Total:')
    expect(page).to have_css('p', text: "Enviado para: #{estimate.contractor.name}")
    expect(page).to have_css('p', text: "Solicitado por: #{estimate.user.name}")
  end
end