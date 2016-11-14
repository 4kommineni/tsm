$('#cpForm').submit(function() {
	if ($('#user_password1').val() === $('#user_password2').val()) {
		return true;
	} else {
		errorMsg('New Passwords doNot match');
		return false;
	}
});

$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("Updated Succesfully") !== -1) {
			successMsg('Updated Succesfully');
		} else {
			errorMsg($('#updateMsg').html());
		}
		$('#updateMsg').hide();
	}
});
