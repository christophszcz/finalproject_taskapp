class UsersController < ApplicationController
  skip_before_filter :require_login
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      auto_login(@user)
  		redirect_to assignments_url
  	else 
  		render "new"
  	end
  end

  def show
    @user = current_user
    @my_assignments = current_user.made_tasks
    @worker_assignments = current_user.accepted_tasks 

  end
  
  
  private
  def user_params
  	params.require(:user).permit(
      :first_name, 
      :last_name,
      :phone, 
      :email, 
      :password, 
      :password_confirmation,
      :avatar,
      :avatar_cache
      )
  end
end
