class Assignment < ActiveRecord::Base
	belongs_to :maker, class_name: "User", foreign_key: "maker_id"
	belongs_to :tasker, class_name: "User", foreign_key: "tasker_id"

	def other_party(participant)
		if participant.id == maker_id
			tasker
		elsif participant.id == tasker_id
			maker
		else
			raise "Invalid Participant"
		end
	end
end
