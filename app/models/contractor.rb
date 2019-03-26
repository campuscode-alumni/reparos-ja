class Contractor < ApplicationRecord
  belongs_to :category
  has_many :estimates

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :cpf, :category_id, presence: true

  has_one :profile
  accepts_nested_attributes_for :profile

  before_create do
    build_profile
  end
end
