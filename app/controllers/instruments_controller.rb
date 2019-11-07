class InstrumentsController < ApplicationController
	before_action :get_instrument_set_and_authorize, only: [:show, :edit, :update, :destroy]

	def new
		authorized?(params[:musician_id])
		@instrument = Instrument.new
		@musician = Musician.find_by(id: params[:musician_id])
	end

	def create
		@instrument = Instrument.new(instrument_params)
		@musician = @instrument.musician
		authorized?(@musician.id)
		@instrument.save && (redirect_to(musician_path(@musician)) and return)
		render :new and return
	end

	def show
	end

	def edit
	end

	def update
		@instrument.update(instrument_params)
		redirect_to instrument_path(@instrument)
	end

	def destroy
		@instrument.destroy
		redirect_to musician_path(@musician)
	end

	private

	def instrument_params
		params.require(:instrument).permit(:musician_id, :instrument_type, :instrument_category, :tuning)
	end

	def get_instrument_set_and_authorize
		@instrument = Instrument.find_by(id: params[:id])
		@pieces = @instrument.pieces
		@mastery_tracks = @instrument.mastery_tracks
		@musician = @instrument.musician
		authorized?(@musician.id)
	end

end
