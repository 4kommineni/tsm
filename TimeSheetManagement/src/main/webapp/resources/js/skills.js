$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("Updated Succesfully") !== -1) {
			successMsg('Updated Succesfully');
		} else {
			errorMsg('Db Connectivity Error');
		}
		$('#updateMsg').hide();
	}
	$('#skillsTable').DataTable( {
        "searching": false
    } );
});
