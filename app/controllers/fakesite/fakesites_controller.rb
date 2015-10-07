module Fakesite
  class FakesitesController < Fakesite::ApplicationController
    before_action :find_fakesite

    def show
      @uri = URI.parse(params[:url])
      @id = params[:id]
      @parameters = @fakesite.parameters(params[:url])
    end

    def redirect
      @uri = URI.parse(params[:url])
      redirect_to @fakesite.redirect_url(@uri, params[:p])
    end

    private

    def find_fakesite
      @fakesite = Fakesite.find(params[:id])
    end
  end
end
