class MasteryTracksController < ApplicationController

	def new
		# binding.pry
		@musician = current_musician
		@piece = Piece.find_by(id: params[:piece_id])
		@instrument = Instrument.find_by(id: params[:instrument_id])
		@mastery_track = MasteryTrack.new
	end

	def create
		@instrument = Instrument.find_by(id: params[:mastery_track][:instrument_id])
		@musician = Musician.find_by(id: @instrument.musician_id)
		@piece = Piece.find_by(id: params[:mastery_track][:piece_id])
		authorized?(@musician.id)
		@mastery_track = MasteryTrack.new(mastery_params)
		if @mastery_track.save
			redirect_to instrument_path(@instrument)
		else
			render :new # add flash error messages
		end
	end

	def edit
		@mastery_track = MasteryTrack.find_by(id: params[:id])
	end

	def update
		@mastery_track = MasteryTrack.find_by(id: params[:id])
		@mastery_track.update(tempo_level: params[:mastery_track][:tempo_level], tempo_goal: params[:mastery_track][:tempo_goal])
		redirect_to instrument_path(@mastery_track.instrument)
	end

	def destroy
		@mastery_track = MasteryTrack.find_by(id: params[:id])
		@instrument = @mastery_track.instrument
		@piece = @mastery_track.piece
		@mastery_track.destroy
		redirect_to instrument_path(@instrument)
	end

	private

	def mastery_params
		params.require(:mastery_track).permit(:piece_id, :instrument_id, :tempo_level, :tempo_goal)
	end

end
