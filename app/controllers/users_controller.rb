class UsersController < ApplicationController
  skip_before_filter :require_login, except: [:index]
  
  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

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
    @user               = User.find(params[:id])
    @my_assignments     = @user.made_tasks
    @worker_assignments = current_user.accepted_tasks 
    @reviews_about_me   = Review.worker(current_user)
  end  

  def edit
    @assignment = Assignment.find(params[:id]) 
      @assignment.worker_id = nil
      @assignment.save
    redirect_to assignments_path
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
      :avatar_cache,
      :school
      )
  end
end
