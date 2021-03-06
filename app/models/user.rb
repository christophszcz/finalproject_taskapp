class User < ActiveRecord::Base
	authenticates_with_sorcery!

	scope :newest_first, -> { order("created_at DESC") }
	

	validates :password, length: {in: 6..40} 
	validates :password, confirmation: true
	validates :password_confirmation, presence: true
  
  validates :email, uniqueness: true
  validates :phone, length: {is: 10}

	has_many :made_tasks, class_name: "Assignment", foreign_key: :customer_id
	has_many :accepted_tasks, class_name: "Assignment", foreign_key: :worker_id

	has_many :customer_reviews, class_name: "Review", foreign_key: :customer_id
	has_many :worker_reviews, class_name: "Review", foreign_key: :worker_id

	mount_uploader :avatar, AvatarUploader

	def accept(assignment)
		return if assignment.customer == self
		assignment.worker = self
		assignment.save!
	end

	def build_review(assignment)
		other_party = assignment.other_party(self)
		if owns?(assignment)
			customer_reviews.build(worker: other_party, assignment: assignment)
		else
			worker_reviews.build(customer: other_party, assignment: assignment)
		end
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

	def self.search(query)
  	where("first_name like ?", "%#{query}%") 
	end

	private
	def owns?(assignment)
		assignment.customer_id == id
	end
end
