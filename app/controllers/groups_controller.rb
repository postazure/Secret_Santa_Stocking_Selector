class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.where(created_by: current_user)
  end

  def show
    @friends = Friend.where(group_id: params[:id], created_by: current_user)
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.created_by = current_user.id
    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def update

    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private
    def set_group
      @group = Group.find_by(id: params[:id], created_by: current_user)
      if @group.nil?
        redirect_to groups_path, alert: "That group does not belong to you! These are your groups:"
      end
    end

    def group_params
      params.require(:group).permit(:name, :user_id)
    end
end
