<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/view.css?ver=2" />
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<form method="POST" action="addSubject">
			<h1>과목 추가</h1>
			<div class="group">
				<input type="text" name="subject" required> <span class="highlight"></span>
				<span class="bar"></span> <label>과목명</label>
			</div>
			<div class="group">
				<input type="text" name="teacher" required> <span class="highlight"></span>
				<span class="bar"></span> <label>강사</label>
			</div>
			<div class="group">
				<textarea name="explain" required></textarea> <span class="highlight"></span>
				<span class="bar"></span> <label>과목설명</label>
			</div>
			<div class="group">
				<span class="highlight"></span>
				<span class="bar"></span>
				<select name="kind">
					<option>JAVA</option>
					<option>JavaScript</option>
					<option>Python</option>
					<option>C#</option>
					<option>C++</option>
					<option>HTML</option>
					<option>CSS</option>
				</select> 
			</div>
			<input type="submit" value="과목 생성" />
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>