class Piece < ApplicationRecord
	has_many :mastery_tracks
	has_many :instruments, through: :mastery_tracks
	has_many :musicians, through: :instruments
	has_many :piece_transpositions
	has_many :transpositions, through: :piece_transpositions


	validates :title, presence: { message: "Each piece of sheet music needs a title." }
	validates :composer, presence: { message: "Who composed this piece? 'Unkown' or 'Trad.' are acceptible." }
	validates :title, uniqueness: { scope: :composer }

	# scope :popular, ->(tuning) where("transposition.include(?)", tuning).limit(10).order(musicians.count)
	## change to reflect transposition table and association
end
