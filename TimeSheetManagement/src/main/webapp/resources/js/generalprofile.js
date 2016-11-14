$(function(dob) {
	$("#datepicker_dob").datepicker();
});

$(function(le) {
	$("#datepicker_le").datepicker();
});

$('#gpImage').bind('change', function() {
	if (this.files[0].size / 1000000 > 5) {
		warningMsg('File too large(max 5MB)');
	}
});

$('#generalprofile').submit(function(event) {
	// SSN Validation (XXX-XX-XXXX)
	var ssnPattern = /^[0-9]{3}\-?[0-9]{2}\-?[0-9]{4}$/;
	if (!ssnPattern.test($('#ssn').val())) {
		errorMsg('Invalid SSN Format');
		return false;
	} else {
		// image size validation(5MB)
		if ((($('#gpImage')[0].files[0].size) / 1000000) > 5) {
			errorMsg('File too large(max 5MB)');
			return false;
		}
	}
	// event.preventDefault();
	return true;
});

$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("Updated Succesfully") !== -1) {
			successMsg('Updated Succesfully');
		} else {
			errorMsg('DB Connectivity Error');
		}
		$('#updateMsg').hide();
	}
	if ($('#mobile_phone_error').length > 0) {
		errorMsg('Invalid Mobile Phone Number');
		$('#mobile_phone_error').hide();
	}
	if ($('#work_phone_error').length > 0) {
		errorMsg('Invalid Work Phone Number');
		$('#work_phone_error').hide();
	}
	if (document.getElementById('imageError').innerHTML.indexOf("Image too large") !== -1) {
		errorMsg('Image too large(max 5MB)');
		$('#imageError').hide();
	}

});
