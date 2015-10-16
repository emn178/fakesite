if defined?(::Rails::Engine)
  class ActionController::Base
    extend Fakesite::Stub
    stub_redirect :orig_redirect_to, :redirect_to
  end
end
