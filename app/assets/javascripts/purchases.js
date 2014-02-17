

$(document).ready(function(){
	Stripe.setPublishableKey("pk_test_IvhbIRXLO6j34kliLeQSJE2M");




	var setUpForm = function(){ $('#new_purchase').submit(function(){
			$('input[type= submit]').attr('disabled',true);
			processCard();
			return false
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
 	if (response.error)
 	{
 		$('#stripe_error').text(response.error.message);
  	$('input[type=submit]').attr('disabled', false);
 		// alert(response.error.message);

  }
  else
  {
 		// alert(response.id);
  	$('#purchase_stripe_customer_token').val(response.id)
 		$('#new_purchase')[0].submit()
  }
 }
 setUpForm();
});
