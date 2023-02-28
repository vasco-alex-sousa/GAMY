class AddConsoleSubmodelToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :console_submodel, :string
  end
end
