class Assignment < ActiveRecord::Base
	belongs_to(:maker, {class_name: "User", foreign_key: "maker_id"})
	belongs_to(:tasker, {class_name: "User", foreign_key: "tasker_id"})
end
