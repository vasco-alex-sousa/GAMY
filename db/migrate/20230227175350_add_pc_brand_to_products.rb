class AddPcBrandToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :pc_brand, :string
  end
end
