class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @post = Post.new
    @comment = Comment.new
    @posts = @user.posts
    @comments = @user.comments
    @friendship = current_user.active_friendships.find_by(followed_id: @user.id)
  end
end
