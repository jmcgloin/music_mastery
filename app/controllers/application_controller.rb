class ApplicationController < ActionController::Base
	helper_method :logged_in, :current_musician

	def logged_in
		session[:musician_id].present?
	end

	def current_musician
		musician = logged_in ? Musician.find_by(id: session[:musician_id]) : nil
		if !musician
			session.clear
		end
		musician
	end	

end
