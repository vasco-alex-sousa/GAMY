class AddInternalStorageToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :internal_storage, :string
  end
end
