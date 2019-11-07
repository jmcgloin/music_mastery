# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

ids = Musician.all.map{ |m| m.id }

100.times do |p|
	p = Piece.create(
		title: Faker::Games::WorldOfWarcraft.quote,
		composer: Faker::Games::WorldOfWarcraft.hero,
		key_signature: Faker::Music.key,
		time_signature: '4:4',
		difficulty: rand(1..10),
		tempo: Piece.tempos[rand(1..Piece.tempos.length)],
		added_by: ids[rand(1..ids.length)]
	)
	p.transpositions << Transposition.create(
		instrument: Faker::Music.instrument,
		key: Faker::Music.key
	)

end

# Faker::Music.key #=> "C"

# Faker::Music.chord #=> "Amaj7"

# Faker::Music.instrument #=> "Ukelele"

# Faker::Music.band #=> "The Beatles"

# Faker::Music.album #=> "Sgt. Pepper's Lonely Hearts Club"

# Faker::Music.genre #=> "Rock"