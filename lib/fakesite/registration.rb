require 'forwardable'

module Fakesite
  class Registration
    extend Forwardable

    attr_accessor :id, :fakesite, :options
    def_delegators :fakesite, :match, :deserialize

    def initialize(id, fakesite, options = {})
      self.id = id
      self.fakesite = fakesite
      self.options = options
    end

    def create
      fakesite.new(options)
    end
  end
end
