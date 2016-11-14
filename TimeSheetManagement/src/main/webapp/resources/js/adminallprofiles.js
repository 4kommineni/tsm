$(function() {
	$('#adminAllProfilesTable').DataTable();
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("New User Added Succesfully") !== -1) {
			successMsg('New User Added Succesfully');
		} else {
			errorMsg($('#updateMsg').html());
		}
		$('#updateMsg').hide();
	}
});
$('#addNewUser').click(function() {
	var dialog = $('#dialog').data('dialog');
	dialog.open();	
});
