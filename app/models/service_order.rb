class ServiceOrder < ApplicationRecord
  belongs_to :estimate
  has_one :contractor_review
end
