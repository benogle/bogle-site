$(document).ready(function(){

	$('#contactform').append('<input type="hidden" name="async" value="1" />');
	$('#id_sender').focus();
	
	function postSubmit(data){
		$('#contact, .entry-content p').hide();
		$('.entry-title').html('Thank you!');
		$('.entry-content').append('<p>Your email has been sent. Ben will get back to you as soon as he possibly can!</p>');
	}

	$('#contact').validate({
		rules: {
			sender: {
				required: true,
				email: true
			},
			subject: 'required',
			message: 'required'
		},
		messages: {
			sender: {
				required: 'Please enter your email address.',
				email: 'Please enter a valid email address.'
			},
			subject: 'Please enter your email subject.',
			message: 'Hey, I need a message!'
		},

		errorPlacement: function(error, element) {
			element.parent().addClass('field-error');
			var u = $('<ul class="errorlist"></ul>');
			var l = $('<li></li>');
			u.append(l.append(error)).prependTo( element.parent());
		},

		submitHandler: function(form) {
			$('#contactform input.button').attr('disabled', 'disabled');
			$('#contactform #load-image').show();

			$(form).ajaxSubmit({
				success: postSubmit
			});
		}

	});
});