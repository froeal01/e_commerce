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
		if params[:save_card] == "yes"
			stripe_user_id	= current_user.stripe_member?(current_user.id, params[:purchase][:stripe_customer_token])
			CreditCard.create_new_card(current_user.id, stripe_user_id, params[:purchase][:stripe_customer_token])
			flash[:notice] = "Card Information Saved"
		end
	@purchase	= Purchase.new(purchase_params)
		if @purchase.payment_saved?
		redirect_to purchase_path(@purchase.trip_id)
		else
			flash[:error] = "Your payment was not processed at this time."
			redirect_to :back

		end
	end	

	def show
		
	end



	private

	def purchase_params
		params.require(:purchase).permit(:email, :stripe_customer_token, :trip_id, :value_of_trip)
	end
end