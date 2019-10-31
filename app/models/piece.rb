class Piece < ApplicationRecord
	has_many :mastery_tracks
	has_many :instruments, through: :mastery_tracks
	has_many :musicians, through: :instruments
	has_many :transpositions

	# scope :popular, ->(tuning) where("transposition.include(?)", tuning).limit(10).order(musicians.count)
	## change to reflect transposition table and association
end
