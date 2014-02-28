class AccountsController < ApplicationController
	include AccountsHelper
	before_filter :authenticate_user!
	

	def index
		 customer_info = Stripe::Customer.retrieve(current_user.stripe_user_id)
		 array_of_credit_card_ids = find_cards(customer_info)
		 if array_of_credit_card_ids[0] != 0
		 	@array_of_card_hash = retrieve_card_info(array_of_credit_card_ids, customer_info)
		 end
	end


end
