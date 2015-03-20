class ReviewsController < ApplicationController
	before_filter :load_assignment

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
		@review = @assignment.reviews.new(review_params)
		# @review.user = current_user
		# @review.to = @review.assignment.other_party(current_user)

		@review.customer = current_user 
		other        = @assignment.other_party(current_user)
		@review.worker  = other

		if @review.save
			redirect_to user_path(other), notice: "Your review was successfully created!"
		else
			render "new"
		end

		# if  @review.customer == current_user
		# 	render 'reviews/new'
		# else
		# 	raise 'Invalid participant'
		# end
		
	end

	private
		def review_params
			params.require(:review).permit(:comment, :rating)

		end	


	private
		def load_assignment
			@assignment = Assignment.find(params[:assignment_id])
		end
end
