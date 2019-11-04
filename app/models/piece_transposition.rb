class PieceTransposition < ApplicationRecord
	belongs_to :piece
	belongs_to :transposition
end
