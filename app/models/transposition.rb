class Transposition < ApplicationRecord
	has_many :piece_transpositions
	has_many :pieces, through: :piece_transpositions
end
