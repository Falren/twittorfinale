class CommentsController < ApplicationController
  def create
  @comment = Comment.new(comment_params)
  @user = @comment.user
    if @comment.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :body)
  end
end
