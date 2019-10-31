class Instrument < ApplicationRecord
	belongs_to :musician
	has_many :mastery_tracks
	has_many :pieces, through: :mastery_tracks
end
