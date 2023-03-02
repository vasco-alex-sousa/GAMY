class AddNewColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
  end
end
