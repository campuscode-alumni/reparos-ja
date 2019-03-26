class Contractor < ApplicationRecord
  belongs_to :category
  has_many :estimates
  has_one :contractor_profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :cpf, :category_id, presence: true

  has_one :profile
  accepts_nested_attributes_for :profile

end
