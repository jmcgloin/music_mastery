module ApplicationHelper

	def which_nav_bar
		if logged_in?
			(render partial: 'layouts/logged_in_nav_bar')
		else
			(render partial: 'layouts/not_logged_nav_bar')
		end
	end

end
