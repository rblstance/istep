function apply(email) {
	//2) 중복확인 email를 부모창에 적용
	//부모창 opener
	opener.document.regForm.email.value = email;
	window.close(); //창닫기
}//apply () end