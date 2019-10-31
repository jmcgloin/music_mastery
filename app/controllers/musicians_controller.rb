class MusiciansController < ApplicationController
	before_action :set_musician, only: [:show]
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

	def show
		
	end

	private

	def musician_params
		params.require(:musician).permit(:user_name, :email, :password, :password_confirmation)
	end

	def set_musician
		@musician = Musician.find_by(id: params[:id])
	end

end
