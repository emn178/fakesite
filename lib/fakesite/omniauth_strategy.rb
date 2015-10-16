if defined?(::OmniAuth::Strategy)
  module OmniAuth::Strategy
    extend Fakesite::Stub
    stub_redirect :orig_redirect, :redirect
  end
end
