class Estimate < ApplicationRecord
  belongs_to :contractor
  belongs_to :user

  def total_fee
    if self.material_fee
      self.material_fee + self.visit_fee + self.service_fee
    else
      0
    end 
  end
end
