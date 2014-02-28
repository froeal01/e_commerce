class CreditCard < ActiveRecord::Base
	belongs_to :user

	def self.create_new_card(user_id, customer_id, token)
		customer = Stripe::Customer.retrieve(customer_id)
		new_card_info = customer.cards.create(card: token)
	  card	= CreditCard.find_by_user_id(user_id) 
		card.stripe_card_id = new_card_info[:"id"]
		card.save!
	end


end