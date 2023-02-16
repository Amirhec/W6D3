class ArtworksController < ApplicationController 
    def index
        render json: Artwork.all
    end

    def create
        artwork = Artwork.new(artwork_params)
        # replace the `artwork_attributes_here` with the actual attribute keys

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        # debugger
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork)
        else
            render json: artworks.error.full_message, status: 422
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        if artwork.destroy
            render json: artwork 
        else
            render json: artwork.error.full_message, status: 422
        end
    end


    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end