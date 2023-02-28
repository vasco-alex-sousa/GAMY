class AddReleaseYearToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :release_year, :integer
  end
end
