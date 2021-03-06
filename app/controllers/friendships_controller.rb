class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friends = current_user.friends
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_path
    else
      flash[:error] = "Unable to add friend"
      redirect_to root_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to root_path
  end
end
