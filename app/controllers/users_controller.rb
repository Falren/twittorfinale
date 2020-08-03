class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @post = Post.new
    @comment = Comment.new
    @posts = @user.posts
    @comments = @user.comments
  end
end
