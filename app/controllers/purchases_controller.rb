class PurchasesController < ApplicationController


	def new
		trip = Trip.find(params[:trip_id])
		@purchase = trip.purchases.build

		if @purchase.trip_id == 1
			render 'paris'
		elsif @purchase.trip_id == 2
			render 'ny'
		else
			render 'tokyo'
		end
	end


end