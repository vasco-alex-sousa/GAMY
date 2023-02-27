class AddPcTypeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :pc_type, :string
  end
end
