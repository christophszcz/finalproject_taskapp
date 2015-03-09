class SessionsController < ApplicationController
  def new
  	@user = User.new
  end
  
  def create
  	if @user = login(params[:email], params[:password])
  		redirect_back_or_to assignments_url, notice: "You are logged in!"
  	else
  		flash[:alert] = "Invalid email or password"
  		@user = User.new(email: params[:email])
  		render action: "new"
  	end
  end

  def destroy
  	logout
  	redirect_to assignments_url, notice: "You are now signed out of your account"
  end
end