require 'rails_helper'

RSpec.describe Estimate, type: :model do
  describe '#requested_by' do
    it 'should return false if user nil' do
      estimate = create(:estimate)
      
      expect(estimate.requested_by(nil)).to eq(false)
    end

    it 'should return false if diferent user' do
      estimate = create(:estimate)
      user = create(:user)

      expect(estimate.requested_by(user)).to eq(false)
    end

    it 'should return true if same user' do
      estimate = create(:estimate)

      expect(estimate.requested_by(estimate.user)).to eq(true)
    end
  end
end
