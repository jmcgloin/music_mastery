class MasteryTracksController < ApplicationController
	before_action :get_mastery_track_set_and_authorize, only: [:create, :edit, :update, :destroy]

	def new
		@musician = current_musician
		@piece = Piece.find_by(id: params[:piece_id])
		@instrument = Instrument.find_by(id: params[:instrument_id])
		@mastery_track = MasteryTrack.new
	end

	def create
		@mastery_track = MasteryTrack.find_by(piece_id: mastery_params[:piece_id], instrument_id: mastery_params[:instrument_id])
		@mastery_track ||= MasteryTrack.new(mastery_params)
		@instrument.mastery_tracks.include?(@mastery_track) && (redirect_to instrument_path(@instrument) and return)
		@mastery_track.save && (redirect_to instrument_path(@instrument) and return)
		render :new
	end

	def edit
	end

	def update
		success = @mastery_track.update(tempo_level: params[:mastery_track][:tempo_level], tempo_goal: params[:mastery_track][:tempo_goal])
		success && (redirect_to instrument_path(@mastery_track.instrument) and return)
		render :edit
	end

	def destroy
		@mastery_track.destroy
		redirect_to instrument_path(@instrument)
	end

	private

	def mastery_params
		params.require(:mastery_track).permit(:piece_id, :instrument_id, :tempo_level, :tempo_goal)
	end

	def get_mastery_track_set_and_authorize
		@mastery_track = MasteryTrack.find_by(id: params[:id]) || MasteryTrack.new(mastery_params)
		@piece = @mastery_track.piece
		@instrument = @mastery_track.instrument
		@musician = @instrument.musician
		authorized?(@musician.id)
	end

end
