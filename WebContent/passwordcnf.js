$(document).ready(function(){
	$('#repassword').focus(function(){
		$('#message').html(" ");
		$('#submit').attr('disabled',false);
	});
	
	$('#password').focus(function(){
		$('#message').html(" ");
		$('#submit').attr('disabled',false);
	});
		
});

