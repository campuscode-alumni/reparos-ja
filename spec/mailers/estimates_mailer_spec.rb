require 'rails_helper'

RSpec.describe EstimatesMailer do
  describe '.notify_estimate_response' do
    it 'should send mail to user' do 
      title = 'Instalação de Chuveiro'
      contractor = create(:contractor)
      user = create(:user)
      estimate = create(:estimate, title: title, contractor: contractor, user: user)
      mail = EstimatesMailer.notify_estimate_response(estimate.id)
      expect(mail.to).to include(user.email)
    end

    it 'shoud have the correct subject' do
      title = 'Instalação de Chuveiro'
      contractor = create(:contractor)
      user = create(:user)
      estimate = create(:estimate, title: title, contractor: contractor, user: user)
      mail = EstimatesMailer.notify_estimate_response(estimate.id)

      expect(mail.subject).to eq("Novo orçamento para: #{estimate.title}")
    end

    it 'shoud have the correct subject' do
      estimate = create(:estimate, :with_response)
      mail = EstimatesMailer.notify_estimate_response(estimate.id)

      expect(mail.body).to include(estimate.total_hours)
      expect(mail.body).to include('R$ 100,00')
      expect(mail.body).to include('R$ 50,00')
      expect(mail.body).to include('R$ 150,00')
      expect(mail.body).to include(estimate.material_list)
      expect(mail.body).to include('R$ 300,00')
    end
  end
end
