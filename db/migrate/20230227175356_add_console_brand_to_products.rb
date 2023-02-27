class AddConsoleBrandToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :console_brand, :string
  end
end
