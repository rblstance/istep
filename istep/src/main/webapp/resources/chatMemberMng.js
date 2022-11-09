const code = document.getElementById("code");
let grade = document.getElementsByTagName("option");

for(let i=0;i<grade.length;i++){
	console.log(code.value);
	console.log(grade[i].value);
	if(code.value === grade[i].value){
		grade[i].selected = true;
	}
}

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
	console.log(user_id);
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
				$('.container').append(
					`<input type="hidden" value="${user_id}" name="users">`
				);
				console.log('추가됨');
			} else {
				console.log('추가 안 됨');
			}
			document.makeChat.user_id.value = "";
		},
		error: function(request, status, error) {
			alert("존재하지 않는 아이디입니다.");
			document.makeChat.user_id.value = "";
		}
	};

	$.ajax(settings).done(function(response) {
		console.log(response);
	});
}