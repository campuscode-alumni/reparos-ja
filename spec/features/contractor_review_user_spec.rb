require 'rails_helper'

feature 'Contractor review user' do
  scenario 'successfully' do
    contractor = create(:contractor)
    user = create(:user)
    estimate = create(:estimate, :with_response, contractor: contractor, user: user)
    service = create(:service_order, estimate: estimate)
    
    login_as(contractor, scope: :contractor)
    visit service_order_path(service)
    click_on 'Avaliar usuário'

    select '5', from: 'Nota'
    fill_in 'Comentário', with: 'Ótimo serviço executado'
    click_on 'Enviar avaliação'
    
    expect(page).to have_css('span', text: "Avaliação Média: #{user.average_rating}")
    expect(page).to have_css('p', text: "Serviço: #{estimate.title}")
    expect(page).to have_css('p', text: "Nota: 5")
    expect(page).to have_css('p', text: "Comentário: Ótimo serviço executado")
  end
end