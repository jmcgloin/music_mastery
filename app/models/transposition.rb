class Transposition < ApplicationRecord
	has_many :piece_transpositions
	has_many :pieces, through: :piece_transpositions # need a table to join these
end
