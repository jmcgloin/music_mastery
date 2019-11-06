class PiecesController < ApplicationController

	def new
		@piece = Piece.new
		@piece.transpositions.build()
		@instrument = Instrument.find_by(id: params[:instrument_id])
	end

	def create
		@instrument = Instrument.find_by(id: (params[:instrument_id] || params[:piece][:instrument_id]))
		!logged_in && (redirect_to welcome_path and return)
		@piece = Piece.new(piece_params.merge({added_by: @instrument.musician_id}))
		if @piece.save
			redirect_to instrument_pieces_path(@instrument) and return # maybe set something up where it will return you to where you came from
		elsif  @piece.errors[:title]&.include?("has already been taken")
			@piece = Piece.find_by(title: @piece.title, composer: @piece.composer)
			@transposition = Transposition.find_or_create_by(piece_params[:transposition_attributes])
			!@piece.transpositions&.include?(@transposition) && (@piece.transpositions << @transposition)
			redirect_to instrument_pieces_path(@instrument) and return
		else
			render :new and return
		end
			
	end

	def show
		@piece = Piece.find_by(id: params[:id])
		@instrument = Instrument.find_by(id: params[:instrument_id])
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
		(params[:piece][:tempo].to_i == 0) && (params[:piece][:tempo] = tempo_conversion(params[:piece][:tempo]))
		params.require(:piece).permit(
			:title, :composer, :key_signature, :time_signature, :difficulty, :tempo, transpositions_attributes: [:key, :instrument])
	end

	def tempo_conversion(t)
		words = {
			'Grave' =>'45',
			'Largo' => '53',
			'Larghetto' => '58',
			'Adagio' => '65',
			'Andante' => '78',
			'Moderato' => '93',
			'Allegretto' => '108',
			'Allegro' => '128',
			'Vivace' => '145',
			'Presto' => '160',
			'Prestissimo' => '170'
		}
		words[t]
	end

end
