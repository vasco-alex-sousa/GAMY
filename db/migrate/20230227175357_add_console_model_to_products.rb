class AddConsoleModelToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :console_model, :string
  end
end
