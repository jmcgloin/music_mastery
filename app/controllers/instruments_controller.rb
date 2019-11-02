class InstrumentsController < ApplicationController

	def new
		# do i need a hidden field in the view for the musician id?  This action will be called by a form in a nested route
		!logged_in && (redirect_to welcome_path and return)
		@instrument = Instrument.new
		@musician = Musician.find_by(id: params[:musician_id]) # dont really need this since musician will be logged in
		binding.pry
	end

	def create
		binding.pry
	end

end
