class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork_id, foreign_key: {to_table: :artworks}, null: false
      t.references :viewer_id, foreign_key: {to_table: :users}, null: false 
      t.timestamps
    end
   
  end
end
