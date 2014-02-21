

$(function(){
	Stripe.setPublishableKey($('meta[name = "stripe-key"]').attr('content'));

	setUpForm();

		function setUpForm(){ $('#new_purchase').submit(function(){
			$('input[type= submit]').attr('disabled',true);
			processCard();
			return false
	});
}

 function processCard() {
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
 				var originalColor = $('#stripe_error').css('background')
 				$('#stripe_error').text(response.error.message).show();
 				$('#stripe_error').animate({backgroundColor: "#FFFF00"}, 1000, function(){
 					$(this).animate({backgroundColor: originalColor}, 1000);
 				});
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
	
 });
