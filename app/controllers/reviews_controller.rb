class ReviewsController < ApplicationController
# before_filter :load_assignment

	def new
		@review = Review.new
	end

	def index
		@review = Review.all
	end

	def create
		@review = @Assignment.review.build(review_params)
		@review.user = current_user
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
			params.require(:review).permit(:customer_id , :worker_id, :assignment_id, :comment, :rating)

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
