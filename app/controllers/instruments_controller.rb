class InstrumentsController < ApplicationController

	def new
		# do i need a hidden field in the view for the musician id?  This action will be called by a form in a nested route
		!logged_in && (redirect_to welcome_path and return)
		@instrument = Instrument.new
		@musician = Musician.find_by(id: params[:musician_id]) # dont really need this since musician will be logged in
		binding.pry
	end

	def create
		if instrument_params[:musician_id] = session[:musician_id]
			@instrument = Instrument.new(instrument_params)
			@instrument.save && (redirect_to musician_path(session[:musician_id]) and return)
			render :new, flash[:alert] = @instrument.errors.full_messages.first
		else
			redirect_to welcome_path
		end
	end

	private

	def instrument_params
		params.require(:instrument).permit(:musician_id, :instrument_type, :instrument_category, :tuning)
	end

end
