Fakesite::Engine.routes.draw do
  resources :fakesites, :path => '/', :only => [:show] do
    member do 
      get 'redirect'
    end
  end
end
