class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index] 

    def profile
        user = current_user
        render json: user, status: :accepted
    end

    def index
        users = User.all
        render json: users
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.save
            render json: user, status: :accepted
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessible_entity
        end
    end

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { error: user.errors.full_messages }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :bio, :image)
    end

end
