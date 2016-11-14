$('#start_date').click(function() {
	$('#datepicker_s').datepicker();
});

$('#end_date').click(function() {
	$('#datepicker_e').datepicker();
});

$('#start_date').change(function() {
	var d = new Date($('#start_date').val());
	$('#start_date').val($.datepicker.formatDate('mm/dd/yy', d));
});

$('#end_date').change(function() {
	var d = new Date($('#end_date').val());
	$('#end_date').val($.datepicker.formatDate('mm/dd/yy', d));
});

var vefifyDates = function() {
	var start_date = new Date($('#start_date').val());
	var end_date = new Date($('#end_date').val());
	if (start_date > end_date) {
		errorMsg('End Date should be greater than start date');
		$('#search').prop('disabled', true);
	} else {
		$('#search').prop('disabled', false);
	}
};

$('#end_date').on('change', vefifyDates);
$('#start_date').on('change', vefifyDates);

$(function() {
	$('#search').prop('disabled', true);
	$('#searchTable').DataTable( {
        "searching": false
    });
});
