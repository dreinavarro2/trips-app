class ItinerariesController < ApplicationController
	helper_method :sort_column, :sort_direction

	def show
		@itinerary = Itinerary.find(params[:id])
	end

	def index
		@trip = Trip.find(params[:trip_id])
		@itineraries = @trip.itineraries.order(sort_column + " " + sort_direction)
		@remaining_budget = Itinerary.remaining_budget
	end

	def new
		@trip = Trip.find(params[:trip_id])
		@itinerary = Itinerary.new(trip: @trip)
	end

	def create
		@trip = Trip.find(params[:trip_id])
		@itinerary = Itinerary.new(itinerary_params)
		@itinerary.save
		
		if @itinerary.save
      		redirect_to action: 'index'
   		else
      		render action: 'new'
    	end
	end

	def edit
		@trip = Trip.find(params[:trip_id])
		@itinerary = Itinerary.find(params[:id])
	end

	def update
		@trip = Trip.find(params[:trip_id])
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
		params.require(:itinerary).permit(:location, :travel_on, :estimated_cost, :trip_id)
	end

	def sort_column
		Itinerary.column_names.include?(params[:sort]) ? params[:sort] : "location"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end

end