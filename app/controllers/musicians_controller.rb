class MusiciansController < ApplicationController
	
	def new
		if logged_in
      redirect_to musician_path(current_musician)
    else
    	@musician = Musician.new
    	@musician.instruments.build()
    end
	end

	def create
		@musician = Musician.new(musician_params)
		
		if @musician.save
			session[:musician_id] = @musician.id
			redirect_to musician_path(@musician)
		else
			render :new, flash[:alert] = @musician.errors.full_messages.first
		end
	end

	def show
		@musician = current_musician
		if !!@musician
			@instruments = @musician.instruments
		else
			redirect_to welcome_path
		end
	end

	private

	def musician_params
		params.require(:musician).permit(:user_name, :email, :password, :password_confirmation,
			instruments_attributes: [:instrument_type, :instrument_category, :tuning])
	end

end