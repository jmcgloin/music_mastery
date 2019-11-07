module InstrumentsHelper

	def default_tuning
		@instrument.tuning || "C(+0)"
	end

end
