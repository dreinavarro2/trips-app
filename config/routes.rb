TripsApp::Application.routes.draw do


resources :trips do 
	resources :itineraries
end

resources :budgets

root :to => 'trips#index'

end
