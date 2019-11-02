class WelcomeController < ApplicationController
  def home
  	if logged_in
  		binding.pry
      redirect_to musician_path(current_musician)
    end
  end
end
