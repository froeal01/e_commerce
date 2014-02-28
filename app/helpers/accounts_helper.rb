module AccountsHelper

	def find_cards(customer_info)
		array_of_card_numbers = []
		if customer_info[:cards][:count] == 1
			customer_info[:cards][:data][:id]
		elsif customer_info[:cards][:count] > 1
			customer_info[:cards][:data].map do |k,v| 
				k.each {|k,v| array_of_card_numbers << v if "#{k}" == "id"}
			end
			array_of_card_numbers
		else
			0
		end
	end

	def retrieve_card_info(array_of_card_ids,customer_info)
		array_of_card_hash = []
		array_of_card_ids.each do |card_id|
			array_of_card_hash<< customer_info.cards.retrieve(card_id)
		end
		array_of_card_hash
	end
end
