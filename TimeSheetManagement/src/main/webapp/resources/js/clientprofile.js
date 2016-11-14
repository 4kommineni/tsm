$(function(openDate) {
	$('#datepicker').datepicker();
});

$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML
				.indexOf("Updated Succesfully") !== -1) {
			successMsg('Updated Succesfully');
		} else {
			errorMsg('Db Connectivity Error');
		}
		$('#updateMsg').hide();
	}

	if ($('#desk_phone_error').length != 0) {
		errorMsg('Invalid Desk Phone Number');
		$('#desk_phone_error').hide();
	}

	if ($('#supervisor_phone_error').length != 0) {
		errorMsg('Invalid Supervisor Phone Number');
		$('#supervisor_phone_error').hide();
	}
});