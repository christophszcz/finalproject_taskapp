# class ReviewsController < ApplicationController
# before_filter :load_assignment

# 	def reviewer
# 		if User.id == customer.id
# 			render 'customer_review'
# 		elsif User.id == worker.id
# 			render 'worker_review'
# 		else
# 			raise 'Invalid participant'
# 		end

# 	end

# 	private
# 		def load_assignment
# 			@assignment = Assignment.find(params[:assignment_id])
# 		end
# end
