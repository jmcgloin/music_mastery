class PiecesController < ApplicationController

	def new
		@piece = Piece.new
		@piece.transpositions.build()
		@instrument = Instrument.find_by(id: params[:instrument_id])
	end

	def create
		binding.pry
		@instrument = Instrument.find_by(id: params[:instrument_id])
		!logged_in && (redirect_to welcome_path and return)
		@piece = Piece.new(piece_params)
		if @piece.save
			redirect_to pieces_path and return # maybe set something up where it will return you to where you came from
		elsif  @piece.errors[:title]&.include?("has already been taken")
			@piece = Piece.find_by(title: @piece.title, composer: @piece.composer)
			@transposition = Transposition.find_or_create_by(piece_params[:transposition_attributes])
			!@piece.transpositions&.include?(@transposition) && (@piece.transpositions << @transposition)
			redirect_to pieces_path and return
		else
			render :new and return
		end
			
	end

	def show
		@piece = Piece.find_by(id: params[:id])
	end

	def index
		@instrument = Instrument.find_by(id: params[:instrument_id])
		binding.pry
		if @instrument
			@pieces = Piece.select_key(@instrument.tuning) + Piece.select_instrument(@instrument.instrument_type)
			@pieces.uniq!
			binding.pry
		else
			@pieces = Piece.all
		end
	end

	def add

	end

	private

	def piece_params
		params.require(:piece).permit(
			:title, :composer, :key_signature, :time_signature, :difficulty, :tempo, transpositions_attributes: [:key, :instrument])
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