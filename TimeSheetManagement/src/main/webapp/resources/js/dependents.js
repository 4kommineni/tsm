$('#dob').click(function() {
	$('#datepicker').datepicker();
});

$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("Updated Succesfully") !== -1) {
			successMsg('Dependent Added Succesfully');
		} else {
			errorMsg($('#updateMsg').html());
		}
		$('#updateMsg').hide();
	}
	$('#dependentsTable').DataTable({
		"searching" : false
	});
});