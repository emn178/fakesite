if defined?(::Rails::Engine)
  module Fakesite
    class Engine < ::Rails::Engine
      isolate_namespace Fakesite
    end
  end
end