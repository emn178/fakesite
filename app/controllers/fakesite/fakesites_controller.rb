module Fakesite
  class FakesitesController < Fakesite::ApplicationController
    before_action :find_registration, :only => [:show]
    before_action :deserialize, :only => [:redirect]

    def show
      @uri = URI.parse(params[:url])
      @id = params[:id]
      @fakesite = @registration.create
      @fakesite.external_uri = @uri
    end

    def redirect
      @fakesite.params = params[:p]
      redirect_to @fakesite.redirect_url
    end

    private

    def find_registration
      @registration = Fakesite.find(params[:id])
    end

    def deserialize
      @fakesite = YAML.load(params[:serialization])
    end
  end
end
