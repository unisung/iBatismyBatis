<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id = request.getParameter("id");
	MemberDao dao =  MemberDao.getInstance();
	String name = dao.getMemberInfo(id).getName();
	request.setAttribute("id", id);
	request.setAttribute("name", name);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function chk(){
	var isDel = confirm("정말삭제 하시겠습니까?");
	if(isDel) return true;
	else
		return false;
}
</script>
</head>
<body>
<form action="deletePro.jsp" method="post" onsubmit="return chk()">
  <table border=1>
   <tr><th>id</th><td><input type="text" name="id" value="${id}" readonly></td></tr>
   <tr><th>이름</th><td><input type="text" name="name" value="${name}" readonly></td></tr>
   <tr><th>패스워드</th><td>
   <input type="password" name="password" required>
   </td>
    <tr>
    <td colspan="2" align="center">
    <input type="submit" value="확인">
    <input type="reset" value="취소">
    <input type="button" value="리스트" onclick="location.href='list.jsp'">
    </td>
    </tr>
  </table>
</form>



</body>
</html>