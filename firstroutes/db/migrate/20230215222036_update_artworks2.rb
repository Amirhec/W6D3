class UpdateArtworks2 < ActiveRecord::Migration[7.0]
  def change
    add_column :artworks, :artist_id, :bigint, null: false 
    add_index :artworks, [:artist_id,:title], unique: true 
  end
end
