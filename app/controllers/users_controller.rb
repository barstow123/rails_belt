class UsersController < ApplicationController

  def edit
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to groups_path
    else 
      flash[:errors] = user.errors.full_messages
      redirect_to new_session_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirm)
    end
end
