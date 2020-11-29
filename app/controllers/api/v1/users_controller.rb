class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show] 

    def profile
        user = current_user
        feed = (user.followees.each_with_object([]) { |followee, arr| arr << followee.haikus}).flatten
        feed = feed.map { |haiku| HaikuSerializer.new(haiku)}
        unfollowedUsers = User.all - user.followees
        unfollowedUsers = unfollowedUsers.map { |user| BasicUserSerializer.new(user) }
        render json: {user: UserSerializer.new(user), feed: feed, unfollowedUsers: unfollowedUsers}, status: :accepted
    end

    def show
        user = User.find(params[:id])
        favorites = user.favorites.each_with_object([]) { |favorite, arr| arr << favorite.haiku }
        
        user = UserSerializer.new(user)
        favorites = favorites.map { |haiku| HaikuSerializer.new(haiku) }
        render json: {user: user, favorites: favorites }
    end

    def index
        users = User.all
        render json: users, each_serializer: BasicUserSerializer
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
