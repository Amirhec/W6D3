class Comment < ApplicationRecord
    validates :body, :author_id, :artwork_id, presence: true
    
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

    def self.get_comment_from_user_id(user_id)
        Comment
            .select('comments.body')
            .joins(:author)
            .where('author_id = ?', user_id)
    end

    def self.get_comment_from_artwork_id(artwork_id)
        Comment
            .select('comments.body')
            .joins(:artwork)
            .where('artwork_id = ?', artwork_id)
    end
end