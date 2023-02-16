class UpdateArtwork < ActiveRecord::Migration[7.0]
  def change
    rename_column :artwork_shares, :viewer_id_id, :viewer_id
    rename_column :artwork_shares, :artwork_id_id, :artwork_id
    add_index :artwork_shares,[:viewer_id,:artwork_id], unique: true 
  end
end
