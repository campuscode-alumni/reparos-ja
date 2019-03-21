require 'rails_helper'

feature 'User approves estimate' do
  scenario 'successfully' do
    estimate = create(:estimate, :with_response, :approved_by_contractor)
    login_as(estimate.user, scope: :user)

    visit root_path
    click_on 'Meus Orçamentos'
    click_on estimate.title
    click_on 'Aprovar Orçamento'

    expect(current_path).to eq(estimate_path(estimate))
    expect(page).not_to have_link('Aprovar Orçamento')
    expect(page).to have_content('Orçamento aprovado, aguarde contato do prestador')
    estimate.reload
    expect(estimate.status).to eq('approved_user')
  end
  

end