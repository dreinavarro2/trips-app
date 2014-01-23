class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
    	t.string "location", null: false
      	t.date "travel_on"      	
    end
  end
end
