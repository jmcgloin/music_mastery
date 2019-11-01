# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


1.to(10) do |i|
	m = Musician.create(
		user_name: Faker::Name.unique.name,
		email: Faker::Internet.email,
		password: Faker::Internet.password,
		)
	i = Instrument.create(
		instrument_type: Faker::Music.instrument,
		instrument_category: Instrument.all_families[rand(0..23),
		tuning: Instrument.all_tunings[rand(0..5)],
		musician_id: m.id
		)
end