# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ApplicationRecord.transaction do
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all

    %w(users artworks artwork_shares).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    artist1 = User.create(username: "Bob")
    artist2 = User.create(username: "Chris")

    viewer1 = User.create(username: "Amir")
    viewer2  = User.create(username: "Steve")

    artwork1 = Artwork.create(title: "Mona Lisa", image_url: "test.com", artist_id: artist1.id)
    artwork2 = Artwork.create(title: "The thinker", image_url: "othertest.com", artist_id: artist1.id)
    artwork3 = Artwork.create(title: "Last Supper", image_url: "test3.com", artist_id: artist2.id)
    artwork4 = Artwork.create(title: "Mona Lisa", image_url: "test4.com", artist_id: artist2.id)

    ArtworkShare.create(artwork_id: artwork1.id, viewer_id: viewer1.id)
    ArtworkShare.create(artwork_id: artwork1.id, viewer_id: viewer2.id)
    ArtworkShare.create(artwork_id: artwork2.id, viewer_id: viewer1.id)
    ArtworkShare.create(artwork_id: artwork3.id, viewer_id: viewer2.id)
    ArtworkShare.create(artwork_id: artwork4.id, viewer_id: viewer1.id)
    ArtworkShare.create(artwork_id: artwork4.id, viewer_id: viewer2.id)


end