class AddRamToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :ram, :string
  end
end
