class Category < ApplicationRecord
  has_many :contractors

  validates :name, uniqueness: {message: 'Já existe uma categoria com este nome'}
end
