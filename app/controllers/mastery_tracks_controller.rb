class MasteryTracksController < ApplicationController

	def new
		@musician = current_musician
		@piece = Piece.find_by(id: params[:piece_id])
		@instrument = Instrument.find_by(id: params[:instrument_id])
		@mastery_track = MasteryTrack.new
	end

end
