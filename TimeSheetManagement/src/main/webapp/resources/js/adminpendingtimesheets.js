$(function() {
	$('#PendingTable').DataTable();

	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("APPROVED") !== -1) {
			successMsg('Time Sheet APPROVED');
		} else {
			errorMsg($('Time Sheet DECLINED'));
		}
		$('#updateMsg').hide();
	}
});
