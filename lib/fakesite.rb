require 'uri'
require "fakesite/engine"
require "fakesite/stub"
require "fakesite/base"
require "fakesite/registration"

module Fakesite
  @@initialized = false
  @@registrations = {}

  def self.register(id, fakesite, options = {})
    Fakesite.initialize
    id = id.to_sym
    @@registrations[id] = Registration.new(id, fakesite, options)
    fakesite.after_register
  end

  def self.match(url)
    return false unless url.is_a? String
    begin
      uri = URI.parse(url)
      @@registrations.each do |id, fakesite|
        return id if fakesite.match(uri)
      end
    end
    return false
  end

  def self.find(id)
    @@registrations[id.to_sym]
  end

  private

  def self.initialize
    return if @@initialized
    @@initialized = true
    require "fakesite/action_controller"
    require "fakesite/omniauth_strategy"
  end
end
