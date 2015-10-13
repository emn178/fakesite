if defined?(::Rails::Engine)
  class ActionController::Base
    alias_method :orig_redirect_to, :redirect_to
  
    def redirect_to(options = {}, response_status = {})
      id = Fakesite.match(options)
      if id
        orig_redirect_to Fakesite::Engine.routes.url_helpers.fakesite_path(id, :url => options)
      else
        orig_redirect_to(options, response_status)
      end
    end
  end
end
