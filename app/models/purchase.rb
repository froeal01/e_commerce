class Purchase < ActiveRecord::Base
belongs_to :trip


attr_accessor :value_of_trip


	def payment_saved?
		if valid?
			new_charge = Stripe::Charge.create(card: stripe_customer_token, amount: value_of_trip.to_i, currency: "usd" )
	
		end
	rescue Stripe::InvalidRequestError => e
		logger.error "Stripe error #{e.message}"
		errors.add :base, "There was an issue with your Credit Card."
		false
	end
end