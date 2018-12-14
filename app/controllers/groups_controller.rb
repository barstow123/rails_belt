class GroupsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @all_groups = Group.all
  end

  def show
    @user = User.find(session[:user_id])
    @group = Group.joins(:user).select('groups.*, users.first_name').find(params[:id])
  end

  def create
    group = Group.new(group_params)
    if group.save
      attendance = Attendance.create(user_id: session[:user_id], group_id: group.id)
      redirect_to "/groups/#{group.id}"
    else
      flash[:errors] = group.errors.full_messages
      redirect_to groups_path
    end
  end

  def destroy
    group = Group.find(params[:id])
    unless group.destroy
      flash[:errors] = group.errors.full_messages
    end
    redirect_to groups_path
  end

  private
    def group_params
      params.require(:group).permit(:title, :description, :user_id)
    end
end
