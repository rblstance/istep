function blankCheck(f) {
	let email = f.email.value;

	
	console.log(email);
	if(email.length < 1){
		alert("이메일을 입력해주세요");
		return false;
	}
	return true;	
}//blankCheck() end

function apply(email) {
	//2) 중복확인 email를 부모창에 적용
	//부모창 opener
	opener.document.signup.email.value = email;
	window.close(); //창닫기
}//apply () end