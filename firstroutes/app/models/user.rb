# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true 

    has_many :artworks,
        class_name: :Artwork,
        primary_key: :id,
        foreign_key: :artist_id,
        dependent: :destroy,
        inverse_of: :artist

    has_many :views,
        class_name: :ArtworkShare,
        primary_key: :id,
        foreign_key: :viewer_id,
        dependent: :destroy,
        inverse_of: :viewer

    has_many :comments,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Comment,
        dependent: :destroy 

    has_many :likes,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like,
        dependent: :destroy

    has_many :shared_artworks, through: :views, source: :artwork
    
end
