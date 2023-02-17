class AddFKeyLikes2 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :liker_id
  end
end
