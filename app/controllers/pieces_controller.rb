class PiecesController < ApplicationController

	def new
		@piece = Piece.new
		@mastery_track = @piece.mastery_tracks.build()
		@instrument = Instrument.find_by(id: params[:instrument_id])
	end

	def create
		!logged_in && (redirect_to welcome_path and return)
		@piece = Piece.new(piece_params)
		if @piece.save
			redirect_to pieces_path and return # maybe set something up where it will return you to where you came from
		elsif  @piece.errors[:title]&.include?("has already been taken") # add the check for the correct error
			@piece = Piece.find_by(title: @piece.title, composer: @piece.composer)
			@transposition = Transposition.find_or_create_by(piece_params[:transposition_attributes])
			!@piece.transpositions&.include?(@transposition) && (@@piece.transpositions << @transposition)
			redirect_to pieces_path and return
		else #replace this once the elsif above is fixed
			render :new and return
		end
			
	end

	def show

	end

	def index
		@pieces = Piece.all
	end

	def instrument
		# this is where the scope method will return a list of  pieces transposed to the key or instrument type of the nested instrument
		#this scope method will be defined in the piece class
	end

	private

	def piece_params
		params.require(:piece).permit(
			:title, :composer, :key_signature, :time_signature, :difficulty, :tempo, transposition_attributes: [:key, :instrument])
	end

end




# def create
# 		if authorized?(instrument_params[:musician_id])
# 			@instrument = Instrument.new(instrument_params)
# 			@musician = @instrument.musician
# 			@instrument.save && (redirect_to(musician_path(@musician)) and return)
# 			flash[:alert] = @instrument.errors.full_messages.first
# 			render :new and return
# 		else
# 			redirect_to welcome_path
# 		end
# 	end