class AddPhotoPublicIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :photo_public_id, :string
  end
end
