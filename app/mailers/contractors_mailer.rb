class ContractorsMailer < ApplicationMailer
  def notify_new_estimate(contractor_id, estimate_id)
    @contractor = Contractor.find(contractor_id)
    @estimate = Estimate.find(estimate_id)
    mail(
      to: @contractor.email,
      subject: "Você recebeu uma nova solicitação de orçamento do usuário #{@estimate.user.name}"
    )

  end
end