class AddContractorsFieldToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :total_hours, :integer
    add_column :estimates, :visit_fee, :decimal
    add_column :estimates, :material_fee, :decimal
    add_column :estimates, :service_fee, :decimal
    add_column :estimates, :material_list, :text
  end
end
