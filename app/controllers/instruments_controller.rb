class InstrumentsController < ApplicationController

	def new
		# do i need a hidden field in the view for the musicican id?  This action will be called by a form in a nested route
		!logged_in && (redirect_to welcome_path and return)
		@instrument = Instrument.new
	end

	def create
		binding.pry
	end

end
