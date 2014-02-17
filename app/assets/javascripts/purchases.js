

$(document).ready(function(){
	Stripe.setPublishableKey($('meta[name = "stripe-key"]').attr('content'));
	




	var setUpForm = function(){ $('#new_purchase').submit(function(){
			$('input[type= submit]').attr('disabled',true);
			if ($('#card_number').length)
				{
					processCard();
					false; 
				}
			else
			{
				true;
			}	
		});
	}

	var processCard = function(){
		var card = {
			number : $("#card_number").val(),
			cvc: $('#card_code').val(),
			expMonth: $('#card_month').val(),
			expYear : $('#card_year').val()
		};
		Stripe.createToken(card, handleStripeResponse); 
	}

 var handleStripeResponse = function(status, response){
 	if (response == 200)
 	{
 		$('#purchase_stripe_customer_token').val(response.id)
 		$('#new_purchase_form')[0].submit()
  }
  else
  {
  	$('#stripe_error').text(response.error.message);
  	$('input[type=submit]').attr('disabled', false);
  }
 }
 setUpForm();
});
