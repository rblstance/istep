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

	if (pw != '' && checkPw != '') {
		if (pw == checkPw) {
			document.getElementById('same').innerHTML = '비밀번호가 일치함.';
			document.getElementById('same').style.color = 'blue';
		}
		else {
			document.getElementById('same').innerHTML = '비밀번호가 일치하지 않음';
			document.getElementById('same').style.color = 'red';
			checkPw.focus();
			return false;
		}
	}
	if (pw.search(" ") != -1) {
		document.getElementById('space').innerHTML = '공백을 넣을 수 없습니다.';
		document.getElementById('space').style.color = 'red';
		pw.focus();
		return false;
	} else {
		document.getElementById('space').innerHTML = '';
	}
}
