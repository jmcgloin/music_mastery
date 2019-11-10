# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do |p|
	p = Piece.create(
		title: Faker::Games::WorldOfWarcraft.quote,
		composer: Faker::Games::WorldOfWarcraft.hero,
		key_signature: Faker::Music.key,
		time_signature: get_random_thing['4:4', '2:4', '3:4', '2:2'],
		difficulty: rand(1..10),
		tempo: get_random_thing(Piece.tempos),
		added_by: get_random_thing(musician_ids)
	)
	p.transpositions << Transposition.create(
		instrument: get_random_thing(Instrument.all_instruments)
		key: get_random_thing(Instrument.all_tunings)
	)
end

def musician_ids
	Musician.all.map{ |m| m.id }
end

def get_random_thing(thing_array)
	thing_array[rand(0..thing_array.length)]
end