class CreateContractorProfileSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_profile_sub_categories do |t|
      t.integer :profile_id
      t.belongs_to :sub_category, foreign_key: true

      t.timestamps
    end
    add_index :contractor_profile_sub_categories, :profile_id
  end
end
