require 'rails_helper'

RSpec.describe ContractorsMailer do
  describe '.notify_new_estimate' do
    it 'should send a mail to contractor' do
      user = create(:user)
      encanador = create(:category, name: 'Encanador')
      contractor = create(:contractor, name: 'Paulo', category_id: encanador.id, email: 'paulo@gmail.com', password: 'paulo123', cpf:'987654332100')
      estimate = create(:estimate, contractor: contractor, user: user,
        description: 'Trocar encanamento da cozinha', location: 'São Paulo',
        service_date: '2019-03-19', day_shift: 'Noite')

      mail = ContractorsMailer.notify_new_estimate(contractor.id, estimate.id)
      expect(mail.to).to include(contractor.email) 
    end

    it 'should have the correct subject' do
      user = create(:user, name: 'Luiz', email: 'luiz@gmail.com', password: 'senhamuitoforte')
      encanador = create(:category, name: 'Encanador')
      contractor = create(:contractor, name: 'Paulo', category_id: encanador.id, email: 'paulo@gmail.com', password: 'paulo123', cpf:'987654332100')
      estimate = create(:estimate, contractor: contractor, user: user,
        description: 'Trocar encanamento da cozinha', location: 'São Paulo',
        service_date: '2019-03-19', day_shift: 'Noite')

      mail = ContractorsMailer.notify_new_estimate(contractor.id, estimate.id)
      expect(mail.subject).to eq("Você recebeu uma nova solicitação de orçamento do usuário #{user.name}") 
    end

    it 'should have the correct content' do
      user = create(:user, name: 'Paulo Luiz', email: 'pauloluiz@gmail.com', password: 'senhamuitomaisforteainda')
      encanador = create(:category, name: 'Encanador')
      contractor = create(:contractor, name: 'Paulo', category_id: encanador.id, email: 'paulo@gmail.com', password: 'paulo123', cpf:'987654332100')
      estimate = create(:estimate, contractor: contractor, user: user,
        description: 'Trocar encanamento da cozinha', location: 'São Paulo',
        service_date: '2019-03-19', day_shift: 'Noite')

      mail = ContractorsMailer.notify_new_estimate(contractor.id, estimate.id)
      expect(mail.body).to include("O usuário #{user.name} deseja que você realize o seguinte serviço:")
      expect(mail.body).to include(estimate.description)
      expect(mail.body).to include("Local: #{estimate.location}")
      expect(mail.body).to include("Data: #{estimate.service_date}")
      expect(mail.body).to include("Turno: #{estimate.day_shift}")
    end
  end
end