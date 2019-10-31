class Musician < ApplicationRecord
	has_many :instruments
	has_many :mastery_tracks, through: :instruments
	has_many :pieces, through: :mastery_tracks

	has_secure_password

	accepts_nested_attributes_for :instruments
end
