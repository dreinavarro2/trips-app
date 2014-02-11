module ApplicationHelper
	def itinerary_row_style(itinerary)
		'background-color:#f55' if itinerary.estimated_cost > Itinerary.monthly_budget
	end
end
