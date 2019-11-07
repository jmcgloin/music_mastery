module PiecesHelper

	def create_mastery_track_link
		if !@mastery_track
			link_to('Create a Mastery Track for this piece', new_instrument_piece_mastery_track_path(@instrument, @piece))
		end
	end

end
