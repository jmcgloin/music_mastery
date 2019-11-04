class InstrumentsController < ApplicationController

	def new
		authorized?(params[:musician_id])
		@instrument = Instrument.new
		@musician = Musician.find_by(id: params[:musician_id])
	end

	def create
		if authorized?(instrument_params[:musician_id])
			@instrument = Instrument.new(instrument_params)
			@musician = @instrument.musician
			@instrument.save && (redirect_to(musician_path(@musician)) and return)
			flash[:alert] = @instrument.errors.full_messages.first
			render :new and return
		else
			redirect_to welcome_path
		end
	end

	def show
		@instrument = Instrument.find_by(id: params[:id])
		if authorized?(@instrument.musician_id)
			@pieces = @instrument.pieces
			@mastery_tracks = @instrument.mastery_tracks
		else
			redirect_to musician_path(current_musician)
		end
	end

	def edit
		@instrument = Instrument.find_by(id: params[:id])
		@musician = @instrument.musician
	end

	def update
		binding.pry
		@instrument = Instrument.find_by(id: params[:id])
		@instrument.update(instrument_params)
		binding.pry
		redirect_to instrument_path(@instrument)
	end

	private

	def instrument_params
		params.require(:instrument).permit(:musician_id, :instrument_type, :instrument_category, :tuning)
	end

end
