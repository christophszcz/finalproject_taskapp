class User < ActiveRecord::Base
	authenticates_with_sorcery!
	has_many :made_tasks, class_name: "Assignment", foreign_key: :maker_id
	has_many :accepted_tasks, class_name: "Assignment", foreign_key: :tasker_id
end
