module Fakesite
  class Registration
    attr_accessor :id, :fakesite, :options

    def initialize(id, fakesite, options = {})
      @id = id
      @fakesite = fakesite
      @options = options
    end

    def create
      @fakesite.new(@options)
    end

    def match(uri)
      @fakesite.match(uri)
    end
  end
end
