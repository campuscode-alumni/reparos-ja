class Category < ApplicationRecord
  has_many :contractors
  has_many :sub_categories
  
  validates :name, presence: {message: 'Nome não pode ser vazio'}
  validates :name, uniqueness: {message: 'Já existe uma categoria com este nome'}
end
