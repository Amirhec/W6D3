# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, :viewer_id, presence: true
    validates :artwork_id, uniqueness: {scope: :viewer_id}
    
    belongs_to(
        :artwork,
        class_name: :Artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        inverse_of: :shares
    )

    belongs_to(
        :viewer,
        class_name: :User,
        primary_key: :id,
        foreign_key: :viewer_id,
        inverse_of: :views
    )
end
