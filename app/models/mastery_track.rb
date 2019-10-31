class MasteryTrack < ApplicationRecord
	belongs_to :instrument
	belongs_to :piece
end
