function errorMsg(msg) {
	setTimeout(function() {
		$.Notify({
			type : 'alert',
			caption : 'Error',
			content : msg,
			shadow : true,
			icon : "<span class='mif-warning'></span>"
		});
	}, 1000);
}

function warningMsg(msg) {
	setTimeout(function() {
		$.Notify({
			type : 'warning',
			caption : 'Warning',
			content : msg,
			shadow : true,
			icon : "<span class='mif-warning'></span>"
		});
	}, 1000);
}

function successMsg(msg) {
	setTimeout(function() {
		$.Notify({
			type : 'success',
			caption : 'Sucess',
			content : msg,
			shadow : true,
			icon : "<span class='mif-checkmark'></span>"
		});
	}, 1000);
}