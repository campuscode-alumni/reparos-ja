class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.references :user, foreign_key: true
      t.references :service_order, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
