class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :service_order
end
