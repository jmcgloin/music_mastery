class SessionsController < ApplicationController
  def new
    if logged_in
      redirect_to musician_path(current_musician)
    end
  end

  def create
    if auth_hash
      @musician = Musician.find_by(github_uid: auth_hash["uid"])
      if !@musician
        user_name = auth_hash["info"]["nickname"]
        Musician.find_by(user_name: user_name) && (user_name += "-#{auth_hash["uid"]}")
        @musician = Musician.new(
          user_name: user_name,
          email: auth_hash["info"]["email"],
          github_uid: auth_hash["uid"]
        )
        saved = @musician.save
      end
    else
      @musician = Musician.find_by(user_name: session_params[:user_name])
    end
    if @musician&.github_uid || @musician&.authenticate(session_params[:password])
      session[:musician_id] = @musician.id
      redirect_to musician_path(@musician)
    else
      render :new # add flash stuff
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

  def auth_hash
    request.env['omniauth.auth']
  end

end