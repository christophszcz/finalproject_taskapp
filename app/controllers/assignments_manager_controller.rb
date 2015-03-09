class AssignmentsManagerController < ApplicationController

	def new
		@assignment_manager = Assignment_manager.new
	end

	def create
		@made_tasks = Assignment_manager.new(assignment_manager_params)
		@made_tasks.user_id = current_user.id

		if @assignment_manager.save
			redirect_to assignment_path(@made_task.id)
		else 
			render :new
		end
	end

	def show
		  @assignment_manager = Assignment_manager.find(params[:id])
	end

	private
	def assignment_manager_params
		params.require(:assignment_manager).permit(:title,
			:description,
			:price_in_cents, 
			:date,
			:time
		)
	end
end

