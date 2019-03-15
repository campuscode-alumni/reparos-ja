require 'rails_helper'

feature 'User request estimate' do

  scenario 'successfully' do
    pedreiro = create(:category, name: 'Pedreiro')
    create(:contractor, name: 'Dionisio', category_id: pedreiro.id, email: 'dionisio@gmail.com', password: 'dionisio123', cpf:'987654332100')

    visit root_path
    click_on 'Dionisio'
    click_on 'Solicitar orçamento'

    fill_in 'Descrição do serviço', with: 'Preciso trocar meu telhado'
    fill_in 'Local', with: 'Alameda Santos, 1293'
    fill_in 'Data', with: '15/03/2019'
    check 'Manhã'
    check 'Tarde'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'telhado.jpg')
    click_on 'Enviar solicitação'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Sua solicitação foi enviada')
    expect(page).to have_content('Aguarde retorno do prestador de serviços')
  end
end
