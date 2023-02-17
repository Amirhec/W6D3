class AddFKeyLikes < ActiveRecord::Migration[7.0]
  def change
      rename_column :likes, :liker, :liker_id
  end
end
