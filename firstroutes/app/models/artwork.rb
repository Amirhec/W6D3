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

    belongs_to :artist,
        class_name: :User,
        primary_key: :id,
        foreign_key: :artist_id 

    has_many(
        :shares,
        class_name: :ArtworkShare,
        primary_key: :id,
        foreign_key: :artwork_id
    )
    
    has_many :shared_viewers, through: :shares, source: :viewer
    
end
