class MasteryTrack < ApplicationRecord
	belongs_to :instrument
	belongs_to :piece

	scope :mastery_of, ->(piece, instrument) { where('mastery_tracks.piece_id = ? AND mastery_tracks.instrument_id = ?', piece, instrument) }
end
