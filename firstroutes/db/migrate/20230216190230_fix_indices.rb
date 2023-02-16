class FixIndices < ActiveRecord::Migration[7.0]
  def change
    remove_index :artworks, column: [:artist_id, :title]
    remove_index :artwork_shares, column: [:viewer_id,:artwork_id]
    add_index :artworks, [:title, :artist_id], unique: true 
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
  end
end
