class PiecesController < ApplicationController

	def new
		@piece = Piece.new
		@piece.transpositions.build()
		@instrument = Instrument.find_by(id: params[:instrument_id])
	end

	def create
		@instrument = Instrument.find_by(id: params[:instrument_id])
		@musician = @instrument.musician
		authorized?(@musician.id)
		@piece = Piece.find_by(title: piece_params[:title], composer: piece_params[:composer])
		if @piece
			@transposition = Transposition.find_or_create_by(piece_params[:transposition_attributes])
			!@piece.transpositions&.include?(@transposition) && (@piece.transpositions << @transposition)
		else
			@piece = Piece.new(piece_params.merge({added_by: @instrument.musician_id}))
			!@piece.save && (render :new and return)
		end
			redirect_to instrument_pieces_path(@instrument) and return
	end

	def show
		@piece = Piece.find_by(id: params[:id])
		@instrument = Instrument.find_by(id: params[:instrument_id])
		@mastery_track = MasteryTrack.find_by(instrument_id: @instrument.id, piece_id: @piece.id)
	end

	def index
		@instrument = Instrument.find_by(id: params[:instrument_id])
		if @instrument&.tuning != 'None'
			@pieces = Piece.select_key(@instrument.tuning) + Piece.select_instrument(@instrument.instrument_type)
			@pieces = @pieces.uniq.reject{ |piece| piece.instruments.include?(@instrument) }
		else
			@pieces = Piece.all
		end
	end

	private

	def piece_params
		params.require(:piece).permit(
			:title, :composer, :key_signature, :time_signature, :difficulty, :tempo, transpositions_attributes: [:key, :instrument])
	end

end
