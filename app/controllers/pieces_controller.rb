class PiecesController < ApplicationController

	def new
		@piece = Piece.new
		@mastery_track = @piece.mastery_tracks.build()
		@instrument = Instrument.find_by(id: params[:instrument_id])
	end

	def create
		binding.pry
	end

	def show

	end

	def instrument
		# this is where the scope method will return a list of  pieces transposed to the key or instrument type of the nested instrument
		#this scope method will be defined in the piece class
	end

end
