class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  def new
    @friend = Friend.new
    @group = Group.find(params[:group_id])
  end

  def edit
    @group = Group.find(params[:group_id])

  end

  def create
    @friend = Friend.new(friend_params)
    @friend.group_id = params[:group_id]
    @friend.created_by = current_user.id
    if @friend.save
      redirect_to group_path(params[:group_id]), notice: 'Friend was successfully created.'
    else
      redirect_to new_group_friend_path(params[:group_id]), alert: "Requires: Name and Email."
      # render :new #this is broken
    end
  end

  def update
    if @friend.update(friend_params)
      redirect_to group_path(params[:group_id]), notice: 'Friend was successfully updated.'
    else
      redirect_to edit_group_friend_path(@friend.group_id,@friend.id), alert: "Requires: Name and Email."
      # render :edit #this is broken
    end
  end

  def destroy
    @friend.destroy
    redirect_to group_path(@friend.group_id), notice: 'Friend was successfully destroyed.'
  end

  private
    def set_friend
      @friend = Friend.find_by(id: params[:id], created_by: current_user)
      if @friend.nil?
        redirect_to groups_path, alert: "That friend does not belong to you!"
      end
    end

    def friend_params
      params.require(:friend).permit(:name, :spouse, :email, :group_id)
    end
end
