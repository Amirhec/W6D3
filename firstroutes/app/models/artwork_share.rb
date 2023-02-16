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
    
    belongs_to(
        :artwork,
        class_name: :Artwork,
        primary_key: :id,
        foreign_key: :artwork_id
    )

    belongs_to(
        :viewer,
        class_name: :User,
        primary_key: :id,
        foreign_key: :viewer_id
    )
end
