class MusiciansController < ApplicationController

	def new
		@musician = Musician.new
	end

	def create
		binding.pry
	end

end
