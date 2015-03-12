class Assignment < ActiveRecord::Base
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
end
