<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/sign.css">
</head>
<body>
<div class="wrapper">
  <div class="container">
    <div class="sign-up-container">
      <form>
        <h1>Create Account</h1>
        	<input type="text" placeholder="ID" id="id" readonly>
        <button type="button" onclick="idCheck()">ID중복확인</button>
        <input type="password" placeholder="password" name="password" id="password" onkeyup="return isSame();" >&nbsp;&nbsp;<font
		id="space"></font>
        <input type="password" placeholder="passwordCheck" name="passwordCheck" id="passwordCheck" onkeyup="return isSame();" >&nbsp;&nbsp;<font
		id="same"></font>
        <input type="text" placeholder="Name" name="name" id="name">
        <input type="text" placeholder="nickname" name="nickname" id="nickname">
        <input type="text" placeholder="phone" name="phone" id="phone">
        <input type="text" placeholder="birth" name="birth" id="birth" maxlength="8">
        <input type="email" placeholder="Email" name="email" id="email" readonly>
       	<div>등급[A:학생, B:강사]
			<select name="grade" id="grade">
				<option value="A">A</option>
				<option value="B">B</option>
			</select>
		</div>
        <button class="form_btn">Sign Up</button>
      </form>
    </div>
    <div class="sign-in-container">
      <form>
        <h1>Sign In</h1>
        <div class="social-links">
          <div>
            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
          </div>
          <div>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
          </div>
          <div>
            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
          </div>
        </div>
        <span>or use your account</span>
        <input type="email" placeholder="Email">
        <input type="password" placeholder="Password">
        <button class="form_btn">Sign In</button>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay-left">
        <h1>Welcome Back</h1>
        <p>To keep connected with us please login with your personal info</p>
        <button id="signIn" class="overlay_btn">Sign In</button>
      </div>
      <div class="overlay-right">
        <h1>Hello, Friend</h1>
        <p>Enter your personal details and start journey with us</p>
        <button id="signUp" class="overlay_btn">Sign Up</button>
      </div>
    </div>
  </div>
</div>
<script>
const signUpBtn = document.getElementById("signUp");
const signInBtn = document.getElementById("signIn");
const container = document.querySelector(".container");

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});
signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});
</script>
</body>
</html>