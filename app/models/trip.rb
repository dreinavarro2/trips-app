class Trip < ActiveRecord::Base
	has_many :itineraries

	class << self
		def monthly_budget
   			20000
  		end
  		def ordered_by_name
      		self.all.order(:name)
    	end  	
  	end

  	def to_s
  		name
	end
end
