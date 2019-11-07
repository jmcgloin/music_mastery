class WelcomeController < ApplicationController
  def home
    logged_in? && (redirect_to musician_path(current_musician))
  end
end
