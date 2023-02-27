class AddGpuToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :gpu, :string
  end
end
