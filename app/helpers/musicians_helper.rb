module MusiciansHelper

	def show_if_instruments
		if @instruments.present?
			render partial: 'show_instruments_present', locals: { instruments: @instruments, musician: @musician }
		else
			render partial: 'show_instruments_not_present', locals: { musician: @musician }
		end
	end

end