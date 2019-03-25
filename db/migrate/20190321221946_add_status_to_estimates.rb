class AddStatusToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :status, :integer
  end
end
