module Fakesite
  module Stub
    def stub_redirect(orig_redirect_to, redirect_to)
      alias_method orig_redirect_to, redirect_to

      define_method redirect_to do |*args|
        id = Fakesite.match(args[0])
        if id
          send(orig_redirect_to, Fakesite::Engine.routes.url_helpers.fakesite_path(id, :url => args[0]))
        else
          send(orig_redirect_to, *args)
        end
      end
    end
  end
end
