class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :create_and_sign_in

  private

  def create_and_sign_in
    User.create! :email => "emn178@gmail.com", :password => "1234qwer" if User.all.size == 0
    sign_in User.first unless user_signed_in?
  end
end
