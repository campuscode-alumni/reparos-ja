class EstimatesMailer < ApplicationMailer
  def notify_estimate_response(estimate_id)
    @estimate = Estimate.find(estimate_id)
    mail(to: @estimate.user.email, subject: "Novo orçamento para: #{@estimate.title}")
  end
end