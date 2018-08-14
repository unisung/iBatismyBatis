<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id = request.getParameter("id");
    MemberDao dao = MemberDao.getInstance();
    MemberVO member = dao.getMemberInfo(id);
    request.setAttribute("member", member);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function chk(){
 var pass1 = document.getElementById("password");
 var pass2 = document.getElementById("password2");
 if(pass1.value!=pass2.value){
	 alert('비밀번호와 확인 번호가 다릅니다.');
	 pass1.value="";
	 pass2.value="";
	 pass1.focus();
	 return false;
 }
 return true;
}

</script>
</head>
<body>
<h2>회원정보 수정</h2>
<form action="updatePro.jsp" onsubmit="return chk()" method="post">
<fieldset>
 <legend>회원정보</legend>
 <p>
 <label>아이디</label>
 <input type="text" name="id" id="id"  value="${member.id}" required readonly="readonly">
 </p>
 <p>
 <label>비밀번호</label>
 <input type="password" name="password" id="password" required>
 </p>
<p>
 <label>비밀번호 확인</label>
 <input type="password" name="password2" id="password2" required>
 </p>
<p>
<label>이름</label>
<input type="text" name="name" id="name" value="${member.name}" required>
</p>
<p>
<input type="submit" value="확인">
</p>
</fieldset>
</form>
</body>
</html>