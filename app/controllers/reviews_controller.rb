class ReviewsController < ApplicationController
	def show
		@customer_reviews = Review.find(params[:id])
	end
end
