class UpdateArtworks < ActiveRecord::Migration[7.0]
  def change
    remove_column :artworks, :artist_id
    
  end
end
