# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "\nMaking Spartans..."
300.times do
	User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		phone: Faker::PhoneNumber.phone_number,
		avatar: "",
		password: "asdf;lkj"
	)
	print "|"
end

puts "\nGiving them suicidal missions...."
600.times do
	Assignment.create!(
		maker_id: User.all.sample.id,
		tasker_id: User.all.sample.id,
		description: Faker::Hacker.say_something_smart,
		price_in_cents: rand(5000),
		date: Date.today + rand(20).days,
		time: Time.now + rand(500).minutes,
		title: Faker::App.name
	)
	print "|"
end