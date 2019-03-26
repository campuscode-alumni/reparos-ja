class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :city
      t.references :contractor, foreign_key: true

      t.timestamps
    end
  end
end
