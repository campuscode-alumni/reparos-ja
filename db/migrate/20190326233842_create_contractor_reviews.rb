class CreateContractorReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_reviews do |t|
      t.references :service_order, foreign_key: true
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
