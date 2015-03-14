class Review < ActiveRecord::Base
	belongs_to :customer, class_name: 'User', foreign_key: "customer_id"
	belongs_to :worker, class_name: 'User', foreign_key: "worker_id"
	belongs_to :assignment

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
