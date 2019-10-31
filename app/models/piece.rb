class Piece < ApplicationRecord
	has_many :mastery_tracks
	has_many :instruments, through: :mastery_tracks
	has_many :musicians, through: :instruments
end
