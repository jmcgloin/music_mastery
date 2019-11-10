class MasteryTracksController < ApplicationController
	before_action :get_mastery_track_set_and_authorize, only: [:create, :edit, :update, :destroy]

	def new
		@musician = current_musician
		@piece = Piece.find_by(id: params[:piece_id])
		@instrument = Instrument.find_by(id: params[:instrument_id])
		@mastery_track = MasteryTrack.new
	end

	def create
		@mastery_track = MasteryTrack.find_or_create(mastery_params)
		if @instrument.mastery_tracks.include?(@mastery_track)
			flash[:alert] = "You already have that piece saved to this instrument.  #{helpers.link_to('See it here!', instrument_piece_path(@instrument, @mastery_track.piece), class: 'alert-link') }"
			redirect_to instrument_path(@instrument)
		elsif @mastery_track.save
			redirect_to instrument_path(@instrument)
		else
			flash.now[:alert] = @mastery_track.errors.full_messages.first
			render :new
		end
	end

	def edit
	end

	def update
		@mastery_track.update(
			tempo_level: params[:mastery_track][:tempo_level],
			tempo_goal: params[:mastery_track][:tempo_goal]
		) && (redirect_to instrument_path(@mastery_track.instrument) and return)
		flash.now[:alert] = @mastery_track.errors.full_messages.first
		render :edit
	end

	def destroy
		if @mastery_track.destroy
			(flash[:notice] = "Successfully removed!")
		else
			flash[:alert] = mastery_track.errors.full_messages.first
		end
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
