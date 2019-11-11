class MasteryTrack < ApplicationRecord
	belongs_to :instrument
	belongs_to :piece

	validate :level_vs_goal
	validate :non_negative_tempo

	def level_of_mastery
		((self.tempo_level.to_f/tempo_goal_float)*100).to_i
	end

	def tempo_goal_float
		self.tempo_goal.to_i == 0 ? Piece.tempo_conversion(self.tempo_goal).to_f : self.tempo_goal.to_f
	end

	def self.find_or_create(params)
		mastery_track = MasteryTrack.find_by(piece_id: params[:piece_id], instrument_id: params[:instrument_id])
		mastery_track ||= MasteryTrack.new(params)
		mastery_track
	end

	private

	def level_vs_goal
		(self.tempo_level.to_i >= tempo_goal_float) && errors.add(:tempo_level, "must be less than the goal tempo")
	end

	def non_negative_tempo
		(self.tempo_level < 0) && errors.add(:tempo_level, "cannot be negative")
	end

	
end
