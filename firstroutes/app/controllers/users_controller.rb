
class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        # debugger
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_url(user)
        else
            render json: users.error.full_message, status: 422
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: user 
        else
            render json: user.error.full_message, status: 422
        end
    end


    private

    def user_params
        params.require(:user).permit(:username)
    end
end

