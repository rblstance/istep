function updateMem() {

	let user_id = document.getElementById("user_id").value;
	let nickname = document.getElementById("nickname").value;

	console.log(user_id);
	console.log(nickname);

	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/users/" + user_id,
		"method": "PUT",
		"timeout": 0,
		"headers": {
			"Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
			"Content-Type": "application/json",
			"Accept": "application/json"
		},
		"data": JSON.stringify({
			"user_id": user_id,
			"nickname": nickname
		}),
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
	});
}


function deleteMem() {

	let user_id = document.getElementById("user_id").value;

	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/users/" + user_id,
		"method": "DELETE",
		"timeout": 0,
		"headers": {
			"Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
			"Accept": "application/json"
		},
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
	});
}

function searchMember() {

	var user_id = document.getElementById('user_id').value;

	var settings = {
		"url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/users/" + user_id,
		"method": "GET",
		"timeout": 0,
		"headers": {
			"Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
			"Accept": "application/json"
		},
		success: function() {
			var confirmflag = confirm(user_id + '님을 채팅에 초대하시겠습니까?');
			if (confirmflag) {
				console.log('추가됨');
			} else {
				console.log('추가 안 됨');
			}
		},
		error: function(request, status, error) {
			alert("존재하지 않는 아이디입니다.");
		}
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
	});
	location.href="chatView";
}

function makeChannel() {
	var users = document.getElementById("users").value;
	var name = document.getElementById("name").value;
	var custom_type = $('input[name=custom_type]:checked').val();
	var data = document.getElementById("data").value;
	var access_code = document.getElementById("access_code").value;
	
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
			"user_ids": [users],
			"name": name,
			"custom_type": custom_type,
			"data": data,
			"is_public": "true",
			"access_code": access_code
		}),
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
	});
	location.href="chat";
}