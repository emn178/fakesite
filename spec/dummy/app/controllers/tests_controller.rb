class TestsController < ApplicationController
  def index
  end

  def test
    redirect_to "http://test.com/?key1=val1"
  end

  def google
    redirect_to "http://www.google.com/"
  end
end
