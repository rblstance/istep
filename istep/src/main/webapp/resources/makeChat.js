function searchMem() {
	//팝업 주소, 팝업창 이름, 팝업창 설정
	window.open("idfind.jsp", "PopupNew", "width=500,height=600");
}

function makeChannel() {

	var host_id = document.getElementById('host_id').value;
	var invite = document.getElementById('invite').value;
	var name = document.getElementById('name').value;
	var custom_type = document.getElementById('custom_type').value;
	var data = document.getElementById('data').value;
	var custom_type = document.getElementById('custom_type').value;
	var access_code = document.getElementById('access_code').value;
	//var custom_type = document.getElementById('custom_type').value;
	

	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/group_channels",
		"method": "POST",
		"timeout": 0,
		"headers": {
			"Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
			"Content-Type": "application/json",
			"Accept": "application/json"
		},
		"data": JSON.stringify({
			"user_ids": [
				host_id,
				invite
			],
			"operator_ids": [
				host_id
			],
			"name": name,
			"custom_type": custom_type,
			"data": data,
			"is_distinct": "",
			"is_public": "true",
			"access_code": access_code
		}),
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
	});
}