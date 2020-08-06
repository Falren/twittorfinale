class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.create(friendship_params)
    redirect_to user_path(@friendship.followed_id)
  end

  def destroy
    @friendship = Friendship.find(params[:id]).destroy
    redirect_to user_path(@friendship.followed_id)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:follower_id, :followed_id)
  end
end
