function updateMem() {

	user_id = document.getElementById("user_id");
	nickname = document.getElementById("nickname");

	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/users/sendbird8",
		"method": "PUT",
		"timeout": 0,
		"headers": {
			"Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
			"Content-Type": "application/json",
			"Accept": "application/json"
		},
		"data": JSON.stringify({
			"user_id": user_id,
			"nickname": "nickname"
		}),
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
	});
}