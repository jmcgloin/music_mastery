class InstrumentsController < ApplicationController
	
	def new
		# do i need a hidden field in the view for the musician id?  This action will be called by a form in a nested route
		authorized?(params[:musician_id])
		@instrument = Instrument.new

		@musician = Musician.find_by(id: params[:musician_id]) # dont really need this since musician will be logged in
	end

	def create
		if authorized?(instrument_params[:musician_id])
			@instrument = Instrument.new(instrument_params)
			@instrument.save && (redirect_to musician_path(@instrument.musician_id) and return)
			render :new, flash[:alert] = @instrument.errors.full_messages.first
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
			current_musician.present? ? redirect_to
		end
	end

	private

	def instrument_params
		params.require(:instrument).permit(:musician_id, :instrument_type, :instrument_category, :tuning)
	end

end
