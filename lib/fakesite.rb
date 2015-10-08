require 'uri'

require "fakesite/engine"
require "fakesite/base"

module Fakesite
  @@initialized = false
  @@fakesites = {}

  def self.register(fakesite)
    require "fakesite/action_controller" unless @@initialized
    @@initialized = true
    @@fakesites[fakesite.id] = fakesite
  end

  def self.match(url)
    return false unless url.is_a? String
    begin
      uri = URI.parse(url)
      @@fakesites.each do |id, fakesite|
        return id if fakesite.match(uri)
      end
    end
    return false
  end

  def self.find(id)
    @@fakesites[id.to_sym]
  end
end
