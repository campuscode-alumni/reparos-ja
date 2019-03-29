class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :estimates
  has_many :user_reviews

  validates :name, presence: {message: 'É necessário informar um nome'}

  def update_average
    self.update(average_rating: calculate_average)
  end

  private

  def calculate_average
    return 0 if self.user_reviews.count == 0
    self.user_reviews.sum(:rating).to_f / self.user_reviews.count
  end
end
