$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("Updated Succesfully") !== -1) {
			successMsg('Updated Succesfully');
		} else {
			errorMsg('Db Connectivity Error');
		}
		$('#updateMsg').hide();
	}
	$('#documentsTable').DataTable({
		"searching" : false
	});
});

$("#resumeForm").submit(function() {
	if ($('#file').val().length === 0) {
		errorMsg('No file selected');
		return false;
	} else if ((($('#file')[0].files[0].size) / 1000000) > 5) {
		warningMsg('File too large(max 5MB)');
		return false;
	} else {
		return true;
	}

});
