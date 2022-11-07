//id 중복체크
function idCheck() {
	//새창 만들기
	//window.open("파일명", "새 창 이름", "다양한 옵션");
	window.open("idDuplCheck.jsp", "idcheck", "width=400, height=350");
}

//email 중복체크
function emailCheck() {
	//새창 만들기
	window.open("emailDuplCheck.jsp", "emailcheck", "width=400, height=350");
}//emailCheck() end

function isSame() {
	let pw = document.getElementById('password').value;
	let checkPw = document.getElementById('passwordCheck').value;

	if (pw != "" && checkPw != "") {
		if (pw == checkPw) {
			document.getElementById('same').innerHTML = '비밀번호가 일치함.';
			document.getElementById('same').style.color = 'blue';
		}
		else {
			document.getElementById('same').innerHTML = '비밀번호가 일치하지 않음';
			document.getElementById('same').style.color = 'red';
		}
	}
	if (pw.search(" ") != -1) {
		document.getElementById('space').innerHTML = '공백을 섞을 수 없습니다.';
		document.getElementById('space').style.color = 'red';

	} else {
		document.getElementById('space').innerHTML = "";
	}
}

//joinform_check 함수로 유효성 검사
function joinform_check() {
	//변수에 담아주기
	let id = document.getElementById("id");
	let pw = document.getElementById("password");
	let pwCheck = document.getElementById("passwordCheck");
	let name = document.getElementById("name");
	let phone = document.getElementById("phone");
	let email = document.getElementById("email");

	if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!id.value)
		alert("아이디를 입력하세요.");
		id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	};

	if (pw.value == "") {
		alert("비밀번호를 입력하세요.");
		pw.focus();
		return false;
	};

	//비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
	let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

	if (!pwdCheck.test(pw.value)) {
		alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		pw.focus();
		return false;
	};

	if (pwCheck.value !== pw.value) {
		alert("비밀번호가 일치하지 않습니다.");
		pwCheck.focus();
		return false;
	};

	if (name.value == "") {
		alert("이름을 입력하세요.");
		name.focus();
		return false;
	};

	if (phone.value == "") {
		alert("전화번호를 입력하세요.");
		phone.focus();
		return false;
	}

	if (email.value == "") {
		alert("이메일 주소를 입력하세요.");
		email.focus();
		return false;
	}

	//입력 값 전송
	document.signup.submit(); //유효성 검사의 포인트

	let settings = {
        "url": "https://api-C2C776A7-4236-4340-836A-E42E1963FD0E.sendbird.com/v3/users?user_id=&nickname=",
        "method": "POST",
        "timeout": 0,
        "headers": {
          "Api-Token": "92fd33f2bd65a4ab400a443b08a95fb59de5542d",
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        "data": JSON.stringify({
          "user_id": id.value,
          "nickname": nickname.value,
          "profile_url": "",
          "profile_file": ""
        }),  
      };
      
      $.ajax(settings).done(function (response) {
        console.log(response);
      });
}