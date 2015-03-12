class AssignmentsController < ApplicationController
	def new
		@assignment = Assignment.new
	end

	def create
		@assignment = Assignment.new(assignment_params)
		# old: @made_tasks = Assignment.new(assignment_params)
		# @made_tasks.user_id = current_user._id

		if @assignment.save
			redirect_to assignments_path
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

	# def edit
	# 	@assignment = Assignment.find(params[:id])
	# end

	private
		def assignment_params
		params.require(:assignment).permit(:title,
			:description,
			:price_in_cents, 
			:date,
			:time
		)
	end

end
