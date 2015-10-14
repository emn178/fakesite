module Fakesite
  class FakesitesController < Fakesite::ApplicationController
    before_action :find_registration

    def show
      @uri = URI.parse(params[:url])
      @id = params[:id]
      @fakesite = @registration.create
      @fakesite.external_uri = @uri
      key = params[:key]
      if key
        @fakesite.user = Rails.cache.fetch(key)
        Rails.cache.delete(key)
        @fakesite.reload_user
      end
    end

    def redirect
      @fakesite = @registration.deserialize(params[:serialization])
      @fakesite.reload_user
      @fakesite.params = params[:p]
      redirect_to @fakesite.redirect_url
    end

    private

    def find_registration
      @registration = Fakesite.find(params[:id])
    end
  end
end
