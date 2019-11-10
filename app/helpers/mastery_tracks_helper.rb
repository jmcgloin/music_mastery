module MasteryTracksHelper

	def simple_or_complex_tempo
		if @piece.tempo.to_i == 0
			render partial: 'display_complex_tempo', locals: { piece: @piece }
		else
			render partial: 'display_simple_tempo', locals: { piece: @piece }
		end
	end

end
