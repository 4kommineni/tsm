$('#start_date').click(function() {
	$('#datepicker_s').datepicker();
});
$('#end_date').click(function() {
	$('#datepicker_e').datepicker();
}).change(function() {
	var start_date = new Date($('#start_date').val());
	var end_date = new Date($('#end_date').val());
	var daysDiff = Math.ceil((end_date.getTime() - start_date.getTime()) / (1000 * 3600 * 24));
	if (daysDiff <= 0) {
		errorMsg('Start Date should be less that end date');
	}
});

$('#p_issue_date').click(function() {
	$('#datepicker_pi').datepicker();
});
$('#p_exp_date').click(function() {
	$('#datepicker_pe').datepicker();
}).change(function() {
	var i_date = new Date($('#p_issue_date').val());
	var e_date = new Date($('#p_exp_date').val());
	var daysDiff = Math.ceil((e_date.getTime() - i_date.getTime()) / (1000 * 3600 * 24));
	if (daysDiff <= 0) {
		errorMsg('Passport Issue Date should be before Passport Exp. Date');
	}
});
$('#us_entry_date').click(function() {
	$('#datepicker_ue').datepicker();
});

$('#iForm').submit(function() {
	var sdate;
	var edate;
	var daysDiff;
	var toReturn = true;
	sdate = new Date($('#start_date').val());
	edate = new Date($('#end_date').val());
	daysDiff = Math.ceil((edate.getTime() - sdate.getTime()) / (1000 * 3600 * 24));
	if (daysDiff <= 0) {
		errorMsg('Start Date should be less that end date');
		toReturn = false;
	}
	sdate = new Date($('#p_issue_date').val());
	edate = new Date($('#p_exp_date').val());
	daysDiff = Math.ceil((edate.getTime() - sdate.getTime()) / (1000 * 3600 * 24));
	if (daysDiff <= 0) {
		errorMsg('Start Date should be less that end date');
		toReturn = false;
	}

	return toReturn;
});
$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("Updated Succesfully") !== -1) {
			successMsg('Updated Succesfully');
		} else {
			errorMsg('Db Connectivity Error');
		}
		$('#updateMsg').hide();
	}
});