require 'rails_helper'

feature 'user review contractor' do
  scenario 'successfully' do
    contractor = create(:contractor)
    user = create(:user)
    estimate = create(
      :estimate,
      :with_response,
      :approved_by_contractor,
      user: user,
      contractor: contractor
    )
    service_order = create(:service_order, estimate: estimate)

    login_as user, scope: :user
    visit service_order_path(service_order)
    click_on 'Avaliar Prestador'
    fill_in 'Comentário', with: 'Muito Bom!'
    fill_in 'Nota', with: '4'
    click_on 'Enviar'

    expect(current_path).to eq(contractor_path(contractor))
    expect(page).to have_content('Muito Bom!')
    expect(page).to have_content('4')
  end
end