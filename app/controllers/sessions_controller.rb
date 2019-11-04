class SessionsController < ApplicationController
  def new
    if logged_in
      redirect_to musician_path(current_musician)
    end
  end

  def create
  	@musician = Musician.find_by(user_name: session_params[:user_name])
  	if @musician && @musician.authenticate(session_params[:password])
  		session[:musician_id] = @musician.id
  		redirect_to musician_path(@musician)
  	else
      flash[:alert] = "User name or password incorrect.  Please try again or Sign Up."
  		render :new
  	end
  end

  def destroy
    session.clear
    redirect_to welcome_path
  end

  private

  def  session_params
  	params.require(:session).permit(:user_name, :password)
  end
end
