function blankCheck(f) {
	let id = f.id.value;
	id = id.trim();
	if (id.length < 5) {
		alert("아이디는 5글자 이상 입력해주십시오.");
		return false;
	}//if end
	return true;
}//blankCheck() end

function apply(id) {
	//2) 중복확인 id를 부모창에 적용
	//부모창 opener
	opener.document.signup.id.value = id;
	window.close(); //창닫기
}//apply () end