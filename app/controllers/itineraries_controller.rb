class ItinerariesController < ApplicationController

	def show
		@itinerary = Itinerary.find(params[:id])
	end

	def index
		@itineraries = Itinerary.all
		@remaining_budget = Itinerary.remaining_budget
	end

	def new
		@itinerary = Itinerary.new
	end

	def create
		@itinerary = Itinerary.new(itinerary_params)
		@itinerary.save
		
		if @itinerary.save
      		redirect_to action: 'index'
   		else
      		render action: 'new'
    	end
	end

	def edit
		@itinerary = Itinerary.find(params[:id])
	end

	def update
		@itinerary = Itinerary.find(params[:id])
		if @itinerary.update(itinerary_params)
      		redirect_to action: 'show', id: @itinerary.id
    	else
      		render action: 'edit'
    	end
	end

	def destroy
		@itinerary = Itinerary.find(params[:id])
		flash[:notice] = "You have successfully deleted the itinerary for #{@itinerary.location}"
		@itinerary.destroy
		redirect_to action: 'index'
	end

	private
	def itinerary_params
		params.require(:itinerary).permit(:location, :travel_on, :estimated_cost)
	end

end