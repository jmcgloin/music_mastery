class WelcomeController < ApplicationController
  def home
  	if logged_in
      redirect_to musician_path(current_musician)
    end
  end
end
