require 'rails_helper'

RSpec.describe Contractor, type: :model do
  describe "#update_average" do
    it 'should calculate with zero reviews' do
      contractor = create(:contractor)
      
      contractor.update_average

      expect(contractor.average).to eq(0)
    end

    it 'should calculate average with three reviews' do
      contractor = create(:contractor)
      first_estimate = create(:estimate, :with_response, contractor: contractor)
      first_service_order = create(:service_order, estimate: first_estimate)
      first_review = create(:contractor_review, service_order: first_service_order, rating: 2)
      second_estimate = create(:estimate, :with_response, contractor: contractor)
      second_service_order = create(:service_order, estimate: second_estimate)
      second_review = create(:contractor_review, service_order: second_service_order, rating: 3)
      third_estimate = create(:estimate, :with_response, contractor: contractor)
      third_service_order = create(:service_order, estimate: third_estimate)
      third_review = create(:contractor_review, service_order: third_service_order, rating: 5)

      contractor.update_average

      expect(contractor.contractor_reviews.count).to eq(3)
      expect(contractor.average).to eq(3.0)
    end
  end
end
