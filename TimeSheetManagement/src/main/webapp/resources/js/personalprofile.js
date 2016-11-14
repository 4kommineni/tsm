$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById("updateMsg").innerHTML
				.indexOf("Updated Succesfully") !== -1) {
			successMsg('Updated Succesfully');
		} else {
			errorMsg('Db Connectivity Error');
		}
		$("#updateMsg").hide();
	}
	if ($("#home_phone_error1").length != 0) {
		errorMsg('Invalid Home Phone Number');
		$("#home_phone_error1").hide();
	}
});
$('input[name="copyAdrs"]:radio').change(function() {
	if ($(this).val() === 'Yes') {
		$('#apt2').val($('#apt1').val());
		$('#city2').val($('#city1').val());
		$('#state2').val($('#state1').val());
		$('#country2').val($('#country1').val());
		$('#zipcode2').val($('#zipcode1').val());
		$('#home_phone2').val($('#home_phone1').val());
	} else {
		$('#apt2').val('');
		$('#city2').val('');
		$('#state2').val('');
		$('#country2').val('');
		$('#zipcode2').val('');
		$('#home_phone2').val('');
	}
});