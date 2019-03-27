require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#update_average' do
    it 'should calculate with zero reviews' do
      user = create(:user)
      user.update_average

      expect(user.average_rating).to eq(0)
    end

    it 'should calculate and produce a decimal' do
      user = create(:user)
      create(:user_review, user: user, rating: 5)
      create(:user_review, user: user, rating: 2)
      user.update_average

      expect(user.average_rating).to eq(3.5)
    end

    it 'should calculate with five reviews' do
      user = create(:user)
      create(:user_review, user: user, rating: 2)
      create(:user_review, user: user, rating: 3)
      create(:user_review, user: user, rating: 4)
      create(:user_review, user: user, rating: 4)
      create(:user_review, user: user, rating: 5)
      user.update_average

      expect(user.average_rating).to eq(3.6)
    end
  end
end
