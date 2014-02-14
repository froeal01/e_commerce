# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# jQuery ->
#  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
#  purchase.setupForm();

#  purchase = 
#  	setupForm: ->
#  		$('.uk-form').submit ->
#  		 	$('input[type=submit]').attr('disabled', true)
#  		 	purchase.processCard()
#  		 	false

#  	processCard: ->
#  		card =
#  			number: $('#card_number').val()
#  			cvc: $('#card_code').val()
#  			expMonth: $('#card_month').val()
#  			expYear: $('#card_year').val()
#  		Stripe.createToken(card, purchase.handleStripeResponse)

#  	handleStripeResponse: (status, response) ->
#  		if status == 200
#  			alert(response.id)
#  		else
#  			alert(response.error.message)

