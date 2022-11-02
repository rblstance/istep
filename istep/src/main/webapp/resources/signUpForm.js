//id 중복체크
function idCheck(){
  //새창 만들기
  //window.open("파일명", "새 창 이름", "다양한 옵션");
  window.open("idDuplCheck.jsp", "idcheck", "width=400, height=350");
}

//email 중복체크
function emailCheck(){
	//새창 만들기
    window.open("emailDuplCheck.jsp", "emailcheck", "width=400, height=350");
}//emailCheck() end

$(function(){
    $('#userPw').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#userPwChk').keyup(function(){

        if($('#userPw').val() != $('#userPwChk').val()){
          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
          $('#chkNotice').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice').html('비밀번호 일치함<br><br>');
          $('#chkNotice').attr('color', '#199894b3');
        }

    });
});