class MasteryTrack < ApplicationRecord
	belongs_to :instrument
	belongs_to :piece

	validate :level_vs_goal

	def level_of_mastery
		((self.tempo_level.to_f/tempo_goal_float)*100).to_i
	end

	def tempo_goal_float
		self.tempo_goal.to_i == 0 ? Piece.tempo_conversion(self.tempo_goal).to_f : self.tempo_goal.to_f
	end

	private

	def level_vs_goal
		(self.tempo_level.to_i >= tempo_goal_float) && errors.add(:tempo_level, "must be less than the goal tempo")
	end

	
end
