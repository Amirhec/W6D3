class Comment < ApplicationRecord
    
    belongs_to :author,
        class_name: :User,
        foreign_key: :author_id,
        primary_key: :id,
        inverse_of: :comments

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork,
        inverse_of: :comments 

end