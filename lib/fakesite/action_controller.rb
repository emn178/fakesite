class ActionController::Base
	alias_method :orig_redirect_to, :redirect_to

	def redirect_to(options = {}, response_status = {})
		fakesite = Fakesite.match(options)
		if fakesite
			orig_redirect_to Fakesite::Engine.routes.url_helpers.fakesite_path(fakesite, :url => options)
		else
			orig_redirect_to(options, response_status)
		end
	end
end
