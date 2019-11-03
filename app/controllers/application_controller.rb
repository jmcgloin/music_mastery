class ApplicationController < ActionController::Base
	helper_method :logged_in, :current_musician

	def logged_in
		session[:musician_id].present?
	end

	def current_musician
		logged_in && (@current_musician ||= Musician.find_by(id: session[:musician_id]))
	end

	def authorized?(id)
		(current_musician.id == id.to_i) || (redirect_to welcome_path and return)
	end

end
