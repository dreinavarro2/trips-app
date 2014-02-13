class Trip < ActiveRecord::Base
	has_many :itineraries

	class << self
	def monthly_budget
   		20000
  	end  	
  end
end
