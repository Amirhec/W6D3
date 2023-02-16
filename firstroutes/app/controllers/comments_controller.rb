class CommentsController < ApplicationController

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment.destroy
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    # Testing index

    def index
        if params[:author_id]
            comments = Comment.get_comment_from_user_id(params[:author_id])
        else
            comments = Comment.get_comment_from_artwork_id(params[:artwork_id])
        end
        render json: comments
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end
end