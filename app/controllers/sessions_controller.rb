class SessionsController < ApplicationController
  
  def new
    if logged_in?
      redirect_to musician_path(current_musician)
    end
  end

  def create_by_login
    @musician = Musician.find_by(user_name: session_params[:user_name])
    authentication
  end

  def create_by_oauth
    @musician = Musician.find_or_create(auth_hash)
    authentication 
    
  end

  def destroy
    session.clear
    redirect_to welcome_path
  end

  private

  def  session_params
  	params.require(:session).permit(:user_name, :password)
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def authentication
    if @musician&.github_uid || @musician&.authenticate(session_params[:password])
      session[:musician_id] = @musician.id
      redirect_to musician_path(@musician)
    else
      flash.now[:alert] = "Incorrect login information provided.  Please try again or #{helpers.link_to('Sign Up', signup_path)}"
      render :new
    end
  end

end