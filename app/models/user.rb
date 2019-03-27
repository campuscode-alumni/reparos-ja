class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :estimates
  has_many :user_reviews

  validates :name, presence: {message: 'É necessário informar um nome'}

  def update_average
    ratings = 0
    if self.user_reviews.count > 0
      self.user_reviews.each do |review|
        ratings += review.rating 
      end
      self.average_rating = ratings / self.user_reviews.count
    else
      self.average_rating = 0
    end
    self.save
  end
end
