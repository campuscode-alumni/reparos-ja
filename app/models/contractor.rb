class Contractor < ApplicationRecord
  belongs_to :category

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :cpf, :category_id, presence: true

end
