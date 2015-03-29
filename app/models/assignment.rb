class Assignment < ActiveRecord::Base
	attr_accessor :updating_assignment

	scope :newest_first, -> { order("created_at DESC") }
	scope :active, -> {where("date > ?", Time.now)}

	validates :customer, presence: true
	validate :should_validate_assignment?

	belongs_to :customer, class_name: "User", foreign_key: "customer_id"
	belongs_to :worker, class_name: "User", foreign_key: "worker_id"

	has_many :reviews


	# def customer_ratings
	# 	ratings.where(user: customer)
	# end

	# def worker_ratings
	# 	ratings.where(user: worker)
	# end

	def should_validate_assignment?
		if updating_assignment
			worker.present?
		end
	end

	def other_party(participant)
		if participant == customer
			worker
		elsif participant == worker
			customer
		else
			raise "Invalid Participant"
		end
	end

	# def self.search(search)
	# 	if search 
	# 		where(["title LIKE ?", "%#{search}%"])
	# 	else 
	# 		all 
	# 	end
	# end

	def self.search(search)
  	where("title LIKE ?", "%#{search}%" ) 
	end
		

	# def formatted_price
	# 	price_in_dollars = price_in_cents.to_f / 100
	# 	sprintf("%.2f", price_in_dollars)
	# end
end
