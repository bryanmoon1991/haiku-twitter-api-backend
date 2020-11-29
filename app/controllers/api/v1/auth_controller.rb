class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    if user && user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: user.id })

      feed = (user.followees.each_with_object([]) {|followee, arr| arr << followee.haikus}).flatten
      feed = feed.map {|haiku| HaikuSerializer.new(haiku)}
      
      unfollowedUsers = User.all - user.followees
      unfollowedUsers = unfollowedUsers.map { |user| BasicUserSerializer.new(user) }

      render json: { user: UserSerializer.new(user), feed: feed, jwt: token, unfollowedUsers: unfollowedUsers}, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end