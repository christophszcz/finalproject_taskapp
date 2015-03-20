class Review < ActiveRecord::Base
	belongs_to :customer, class_name: 'User', foreign_key: "customer_id"
	belongs_to :worker, class_name: 'User', foreign_key: "worker_id"
	belongs_to :assignment

	def self.customer(user)
		where(customer: user)
	end

	def self.worker(user)
		where(worker: user)
	end

	def other_party(user)
		if customer == user
		worker
		elsif worker == user
			customer
		else
			raise "Invalid Participant"
		end
	end
end
