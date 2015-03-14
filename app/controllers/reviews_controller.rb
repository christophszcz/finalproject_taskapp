class ReviewsController < ApplicationController
# before_filter :load_assignment


	def index
		@review = Review.all
	end

	def create
		@review = Review.new(review_params)
		@review.user = current_user
		@review.to = @review.assignment.other_party(current_user)

		if @review.save
			redirect_to assignments_path, notice: "Review created successfully"
		else 
			render "assignments/show"
		end
	end

	def show 
		@review = Review.find(params[:id])
	end

	private
		def review_params
			params.require(:review).permit(:assignment_id, :comment, :rating, :worker, :customer)

	end

		# if User.id == customer.id
		# 	render 'customer_review'
		# elsif User.id == worker.id
		# 	render 'worker_review'
		# else
		# 	raise 'Invalid participant'
		# end

# 	end

# 	private
# 		def load_assignment
# 			@assignment = Assignment.find(params[:assignment_id])
# 		end
end
