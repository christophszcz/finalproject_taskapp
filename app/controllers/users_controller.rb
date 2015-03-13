class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to assignments_url, notice: "You are now signed up!"
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
      )
  end
end
