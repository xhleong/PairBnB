class AddGalleryToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :avatars, :json
  end
end
