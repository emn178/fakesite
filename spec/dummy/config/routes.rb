Rails.application.routes.draw do

  mount Fakesite::Engine => "/fakesite"

  resources :tests, :path => '/', :only => [:index] do
		collection do 
			get 'test'
			get 'google'
		end
  end
end
