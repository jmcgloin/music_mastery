class MusiciansController < ApplicationController

	def new
		@musician = Musician.new
	end

	def create
		@musician = Musician.new(musician_params)
		if @musician.save
			session[:musician_id] = @musician.id
			binding.pry
			redirect_to musician_path(@musician)
		else
			binding.pry
			render :new # add flash message here
		end
	end

	private

	def musician_params
		params.require(:musician).permit(:user_name, :email, :password, :password_confirmation)
	end

end
