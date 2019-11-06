class Piece < ApplicationRecord
	has_many :mastery_tracks
	has_many :instruments, through: :mastery_tracks
	has_many :musicians, through: :instruments
	has_many :piece_transpositions
	has_many :transpositions, through: :piece_transpositions

	accepts_nested_attributes_for :transpositions


	validates :title, presence: { message: "Each piece of sheet music needs a title." }
	validates :composer, presence: { message: "Who composed this piece? 'Unkown' or 'Trad.' are acceptible." }
	validates :title, uniqueness: { scope: :composer }

	scope :select_key, -> (key) { joins(:transpositions).where("transpositions.key = ?", key) }
	scope :select_instrument, -> (instrument_type) { joins(:transpositions).where("transpositions.instrument = ?", instrument_type) }

	def self.tempos
		a = (['<40'] + Array(40..45) + ['Grave'] + Array(46..52) + ['Largo'] + Array(53..57) + ['Larghetto'] + Array(58..62) + ['Adagio'] +
				Array(63..77) + ['Andante'] + Array(78..92) + ['Moderato'] + Array(93..107) + ['Allegretto'] + Array(108..127) + ['Allegro']+
				Array(128..145) + ['Vivace'] + Array(146..160) + ['Presto'] + Array(161..170) + ['Prestissimo', '>170']).map{ |t| t.to_s }
		a
	end

end


# Grave 40-50 BPM
# Largo 50-55 BPM
# Larghetto 55-60 BPM
# Adagio 60-70 BPM
# Andante 70-85 BPM
# Moderato 85-100 BPM
# Allegretto 100-115 BPM
# Allegro 115-140 BPM
# Vivace 140-150 BPM
# Presto 150-170 BPM
# Prestissimo 170+ BPM
