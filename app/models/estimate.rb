class Estimate < ApplicationRecord
  belongs_to :contractor
  belongs_to :user

  has_one_attached :photo
  validates :description, :location, :service_date, :day_shift, presence: true
end
