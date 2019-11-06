class MasteryTrack < ApplicationRecord
	belongs_to :instrument
	belongs_to :piece

	def level_of_mastery
		((self.tempo_level.to_f/self.tempo_goal)*100).to_i
	end
	
end
