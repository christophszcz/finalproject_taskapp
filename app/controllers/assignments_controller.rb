class AssignmentsController < ApplicationController
	# before_filter :require_login_from_http_basic, only: [:create, :update]
	def new
		@assignment = Assignment.new
	end

	def create
		@made_task = Assignment.new(assignment_params)
		# old: @made_tasks = Assignment.new(assignment_params)
		@made_task.customer = current_user
		# onclick current_user.id => worker_id
		if @made_task.save
			redirect_to assignments_path notice: "You have successfully posted a task!"
			# old: redirect_to assignment_path(@made_task.id)
		else 
			render :new
		end
	end


	# def show
	# 	  @assignment_manager = Assignment_manager.find(params[:id])
	# end

	def index
		@assignments = Assignment.all
	end

	def show
		@assignment = Assignment.find(params[:id])
	end

	def update
		@assignment = Assignment.find(params[:id])
		@assignment.worker = current_user
		if @assignment.save
			redirect_to assignments_path notice: "You have successfully accepted a task!"
		else
			render :new
		end
	end

	# def edit
	# 	@assignment = Assignment.find(params[:id])
	# end

	private
		def assignment_params
		params.require(:assignment).permit(:title,
			:description,
			:price_in_cents, 
			:date,
			:time,
			:customer_id,
			:worker_id
		)
	end

end
