class Review < ActiveRecord::Base
	belongs_to :from, class_name: 'User', foreign_key: "from_id"
	belongs_to :to, class_name: 'User', foreign_key: "to_id"
	belongs_to :assignment

	def self.from(user)
		where(from: user)
	end

	def self.to(user)
		where(to: user)
	end

	def other_party(user)
		if from == user
			to
		elsif to == user
			from
		else
			raise "Invalid Participant"
		end
	end
end
