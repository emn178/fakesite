Fakesite::Engine.routes.draw do
  resources :fakesites, :path => '/', :only => [:show] do
    member do 
      post 'redirect'
    end
  end
end
