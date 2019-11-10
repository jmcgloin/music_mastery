module PiecesHelper

	def create_mastery_track_link
		if !@mastery_track
			link_to('Create a Mastery Track for this piece', new_instrument_piece_mastery_track_path(@instrument, @piece), class: 'link')
		end
	end

	def index_if_pieces
		if @pieces.empty?
			render partial: 'index_pieces_empty'
		else
			render partial: 'piece_p', locals: {pieces: @pieces}
		end
	end

end
