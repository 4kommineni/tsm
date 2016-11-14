$('#start_date').click(function() {
	$('#datepicker_s').datepicker();
});

$('#start_date').change(function() {
	var d = new Date($('#start_date').val());
	var newStartDay = new Date(d.getTime() - (d.getDay() * 60 * 60 * 24 * 1000));
	$('#start_date').val($.datepicker.formatDate('mm/dd/yy', newStartDay));

	var newEndDay = new Date(d.getTime() + ((6 - d.getDay()) * 60 * 60 * 24 * 1000));
	$('#end_date').val($.datepicker.formatDate('mm/dd/yy', newEndDay));
});

$('#getFullDetails')
		.click(
				function() {
					if ($('#start_date').val().length === 0) {
						warningMsg('Pleae choose Start date');
					} else if ($('#hours').val() <= 0) {
						warningMsg('Please Check Your Hours Field');
					} else if ($('#file').val().length === 0) {
						errorMsg('No file selected');
					} else if ((($('#file')[0].files[0].size) / 1000000) > 5) {
						warningMsg('File too large(max 5MB)');
					} else {
						var dialog = $('#dialog').data('dialog');
						var start_date = new Date($('#start_date').val());
						var end_date = new Date($('#end_date').val());
						var hours = $('#hours').val();
						var matter = '<div class="row cells4"><div class="cell">';
						var col = 1;
						var id = 1;
						var temp_hours;
						for (var d = start_date; d <= end_date; d.setDate(d.getDate() + 1), id++) {
							if (d.getDay() == 6 || d.getDay() == 0 || hours <= 0) {
								temp_hours = 0;
							} else {
								temp_hours = (hours > 0) ? (hours > 8) ? 8 : hours : 0;
								hours -= 8;
							}
							matter += '<div class="panel '
									+ ((d.getDay() == 6 || d.getDay() == 0) ? 'warning' : '') + ' fg-black">';
							matter += '<div class="heading"><span class="icon mif-alarm-on"></span><span class="title">'
									+ (d.getMonth() + 1)
									+ '/'
									+ d.getDate()
									+ '/'
									+ d.getFullYear()
									+ '</span></div>';
							matter += '<div class="content">' + innerTable(temp_hours, id, d) + '</div>';
							matter += '</div>';
							matter += '</div><div class="cell">';
							col++;
							if (col == 5) {
								matter += '</div></div><div class="row cells4"><div class="cell">';
								col = 1;
							}
						}
						matter += '</div></div><div class="row">';
						$('.matter').html(matter);
						dialog.open();
					}
				});

function innerTable(hours, id, d) {
	var table = '<div class="grid"><div class="row">';
	table += '<input type="hidden" name="d[]" value="' + (d.getMonth() + 1) + '/' + d.getDate() + '/'
			+ d.getFullYear() + '">';
	table += '</div><div class="row cells4 align-center">';
	table += '<div class="cell">RT<br/><input type="number" name="rt[]" value="' + hours
			+ '" class="full-size"></div>';
	table += '<div class="cell">OT<br/><input type="number" name="ot[]" value="0" class="full-size"></div>';
	table += '<div class="cell">PV<br/><input type="number" name="pv[]" value="0" class="full-size"></div>';
	table += '<div class="cell">UV<br/><input type="number" name="uv[]" value="0" class="full-size"></div>';
	table += '</div></div>';
	return table;
}

$(function() {
	if ($('#updateMsg').html().length > 0) {
		if (document.getElementById('updateMsg').innerHTML.indexOf("Time Sheet Added Succefully") !== -1) {
			successMsg('Time Sheet Added Succefully');
		} else {
			errorMsg($('#updateMsg').html());
		}
		$('#updateMsg').hide();
	}
});