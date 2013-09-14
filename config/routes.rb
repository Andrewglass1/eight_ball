EightBall::Application.routes.draw do

  resources :questions, :only => [:show, :index]
  resources :responses, :only => [:show, :create, :new] do
  	collection do
  		get :no_hits
  	end
  end

  root :to => "questions#index"
end
