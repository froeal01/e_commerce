class HomePagesController < ApplicationController

	def index
		#not at all an effecient way to go about this, but the main goal of this website was to use the stripe gem and the three locations
		# will be hard coded in and not changed ever.
		@paris	= Trip.find_by_location("Paris")
		@ny = Trip.find_by_location("New York City")
		@tokyo = Trip.find_by_location("Tokyo")

	end




end
