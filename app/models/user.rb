class User < ActiveRecord::Base
	authenticates_with_sorcery!
	has_many :made_tasks, class_name: "Assignment", foreign_key: :maker_id
	has_many :accepted_tasks, class_name: "Assignment", foreign_key: :tasker_id

	has_many :client_reviews, class_name: "Review", foreign_key: :maker_id
	has_many :tasker_reviews, class_name: "Review", foreign_key: :tasker_id

	def accept(assignment)
		return if assignment.maker == self
		assignment.tasker = self
		assignment.save!
	end

	def build_review(assignment)
		other_party = assignment.other_party(self)
		if owns?(assignment)
			client_reviews.build(tasker: other_party, assignment: assignment)
		else
			tasker_reviews.build(maker: other_party, assignment: assignment)
		end
	end

	private
	def owns?(assignment)
		assignment.maker_id = id
	end
end
