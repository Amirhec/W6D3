class UpdateWithFavorites < ActiveRecord::Migration[7.0]
  def change
    add_column :artwork_shares, :favorite, :boolean, null: false, default: false
    add_column :artworks, :artist_favorite, :boolean, null: false, default: false
  end
end
