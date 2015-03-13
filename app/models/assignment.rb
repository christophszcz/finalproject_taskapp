class Assignment < ActiveRecord::Base
	scope :newest_first, -> { order("created_at DESC") }

	belongs_to :customer, class_name: "User", foreign_key: "customer_id"
	belongs_to :worker, class_name: "User", foreign_key: "worker_id"

	# def customer_ratings
	# 	ratings.where(user: customer)
	# end

	# def worker_ratings
	# 	ratings.where(user: worker)
	# end

	def other_party(participant)
		if participant == customer
			worker
		elsif participant == worker
			customer
		else
			raise "Invalid Participant"
		end
	end

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f", price_in_dollars)
	end
end
