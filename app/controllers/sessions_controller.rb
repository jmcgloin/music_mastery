class SessionsController < ApplicationController
  def new
  end

  def create
  	@musician = Musician.find_by(user_name: session_params[:user_name])
  	if @musician && @musician.authenticate(session_params[:password])
  		session[:musician_id] = @musician.id
  		redirect_to musician_path(@musician)
  	else
  		render :new # add flash message about errors
  	end
  end

  private

  def  session_params
  	params.require(:session).permit(:user_name, :password)
  end
end
