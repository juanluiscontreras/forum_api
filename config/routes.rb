Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
    resources :questions do
     resources :answers
  	end
  	resources :questions do
  		member do
    		put 'resolve'
    	end
  	end

  	post 'sessions', to: 'authentication#authenticate'
    resources :users, only: [:create]
end
