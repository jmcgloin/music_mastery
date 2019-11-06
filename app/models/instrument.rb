class Instrument < ApplicationRecord
	belongs_to :musician
	has_many :mastery_tracks
	has_many :pieces, through: :mastery_tracks

	validates :instrument_type, presence: { message: "What type of instrument is this? Trumpet, piano, etc." }
	validates :instrument_type, uniqueness: { scope: [:tuning, :musician_id], message: "You already have this instrument with this tuning" }

	def self.all_tunings
		%w( None Db(-11) D(-10) Eb(-9) E(-8) F(-7) F#(-6) G(-5) Ab(-4) A(-3) Bb(-2) B(-1) C(+0) Db(+1) D(+2) Eb(+3) E(+4) F(+5) F#(+6) G(+7) Ab(+8) A(+9) Bb(+10) B(+11)).reverse!
	end

	def self.all_families
		%w(String Percussion Keyboard Brass Woodwind Voice)
	end

end