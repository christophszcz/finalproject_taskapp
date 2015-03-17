class ReviewsController < ApplicationController
# before_filter :load_assignment
	def new
		@review = Review.new
		
		# if  @review.customer == current_user
		# 	render 'reviews/new'
		# elsif current_user == @review.worker
		# 	raise 'Invalid participant'
		# elsif @review.user_id == @review.customer_id
		# 	raise 'Invalid participant'
		# else

		# end
	end

	def index
		@reviews = Review.all
	end

	def create
		@review = Review.new(review_params)
		# @review.user = current_user
		# @review.to = @review.assignment.other_party(current_user)
		@review.customer = current_user 

		if @review.save
			redirect_to assignments_path, notice: "Your review was successfully created!"
		else 
			render "assignments/show"
		end

		# if  @review.customer == current_user
		# 	render 'reviews/new'
		# else
		# 	raise 'Invalid participant'
		# end
		
	end

	private
		def review_params
			params.require(:review).permit(:assignment_id, :comment, :rating, :worker_id, :customer_id, :title, :first_name, :last_name)

	end	


# 	private
# 		def load_assignment
# 			@assignment = Assignment.find(params[:assignment_id])
# 		end
end
