require 'rails_helper'

RSpec.describe Contractor, type: :model do
  describe "#update_average" do
    it 'should calculate with zero reviews' do
      contractor = create(:contractor)
      
      contractor.update_average

      expect(contractor.average).to eq(0)
    end
  end
end
