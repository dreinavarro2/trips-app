TripsApp::Application.routes.draw do


resources :trips do 
	resources :itineraries
end

root :to => 'trips#index'

end
