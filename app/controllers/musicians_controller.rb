class MusiciansController < ApplicationController
	
	def new
		logged_in? && (redirect_to musician_path(current_musician) and return)
  	@musician = Musician.new
  	@musician.instruments.build()
	end

	def create
		@musician = Musician.new(musician_params)
		if @musician.save
			session[:musician_id] = @musician.id
			redirect_to musician_path(@musician)
		else
			render :new
		end
	end

	def show
		@musician = current_musician
		!@musician && (redirect_to welcome_path and return)
		@instruments = @musician.instruments
	end
	
	private

	def musician_params
		params.require(:musician).permit(:user_name, :email, :password, :password_confirmation,
			instruments_attributes: [:instrument_type, :instrument_category, :tuning])
	end

end