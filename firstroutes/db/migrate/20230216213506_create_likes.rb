class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :liker, null: false
      t.references :likeable, polymorphic: true, null: false

      t.timestamps
    end
    # add_foreign_key :likes, :liker
  end
end
