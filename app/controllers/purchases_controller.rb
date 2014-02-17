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

	def create
	@purchase	= Purchase.new(purchase_params)
		if @purchase.save
			redirect_to @purchase, notice: "Your trip is now booked!"
		else
			redirect_to '/'
		end
	end	

	def show
	end



	private

	def purchase_params
		params.require(:purchase).permit(:email)
	end
end