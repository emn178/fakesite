module Fakesite
  class FakesitesController < Fakesite::ApplicationController
    before_action :find_registration

    def show
      @uri = URI.parse(params[:url])
      @id = params[:id]
      @fakesite = @registration.create
      @fakesite.external_uri = @uri
      setup_user
    end

    def redirect
      @fakesite = @registration.deserialize(params[:serialization])
      @fakesite.params = params[:p]
      setup_user
      redirect_to @fakesite.redirect_url
    end

    private

    def find_registration
      @registration = Fakesite.find(params[:id])
    end

    def setup_user
      @fakesite.user = current_user if respond_to? :current_user
    end
  end
end
