class AddBoughtYearToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :bought_year, :integer
  end
end
