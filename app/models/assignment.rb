class Assignment < ActiveRecord::Base
	belongs_to :customer, class_name: "User", foreign_key: "customer_id"
	belongs_to :worker, class_name: "User", foreign_key: "worker_id"

	def other_party(participant)
		if participant.id == customer_id
			worker
		elsif participant.id == worker_id
			customer
		else
			raise "Invalid Participant"
		end
	end
end
