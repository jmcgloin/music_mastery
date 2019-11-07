class MasteryTrack < ApplicationRecord
	belongs_to :instrument
	belongs_to :piece

	validate :level_vs_goal

	def level_of_mastery
		((self.tempo_level.to_f/tempo_goal.to_f)*100).to_i
	end

	def level_vs_goal
		self.tempo_level.to_i <= tempo_goal.to_i
	end

	def tempo_goal
		tempo_goal = (self.tempo_goal.to_i == 0) ? Piece.tempo_conversion(self.tempo_goal) : self.tempo_goal
	end
	
end
