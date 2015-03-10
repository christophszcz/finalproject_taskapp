class Review < ActiveRecord::Base
	belongs_to :maker, class_name: 'User'
	belongs_to :tasker, class_name: 'User'
	has_one :assignment
end
