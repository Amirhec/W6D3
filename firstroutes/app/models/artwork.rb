# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :bigint           not null
#
class Artwork < ApplicationRecord
    validates :title , :image_url, :artist_id, presence: true 
    validates :title, uniqueness: {scope: :artist_id}

    belongs_to :artist,
        class_name: :User,
        primary_key: :id,
        foreign_key: :artist_id 

    has_many(
        :shares,
        class_name: :ArtworkShare,
        primary_key: :id,
        foreign_key: :artwork_id,
        dependent: :destroy
    )
    
    has_many :shared_viewers, through: :shares, source: :viewer

    def self.artworks_for_user_id(user_id)
        User
            .joins(:shared_artworks)
            .select('DISTINCT artworks.id, artworks.title')
            .where("users.id = ? OR artworks.artist_id = ?", user_id, user_id)
    end
    
end
