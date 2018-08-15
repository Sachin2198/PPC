$(document).ready(function(){
	$('#repassword').blur(function(){
		var pass = $('#password').val();
		var cnf = $('#repassword').val();
		if(pass != cnf){
			$('#message').html("password did not match.");
			$('#submit').attr('disabled',true);
		}
	});
	

		
});


