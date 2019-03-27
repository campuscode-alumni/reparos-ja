class Estimate < ApplicationRecord
  enum status: [:requested, :approved_contractor, :approved_user, :rejected_user ]
  
  belongs_to :contractor
  belongs_to :user

  has_one_attached :photo
  validates :description, :location, :service_date, :day_shift, presence: true
  
  def total_fee
    if self.material_fee
      self.material_fee + self.visit_fee + self.service_fee
    else
      0
    end 
  end

  def requested_by(user)
    return false if user.nil?
    return (self.user == user) ? true : false
  end

end
