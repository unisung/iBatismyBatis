<%@page import="dto.EmpDTO"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String eno = request.getParameter("eno");
    EmpDao dao = EmpDao.getInstance();
    EmpDTO emp = dao.selectEmp(Integer.parseInt(eno));
    request.setAttribute("emp", emp);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="deletePro.jsp" method="post">
<table border="1">
<tr>
<th>사번</th>
<td><input type="text" name="eno" value=${emp.eno} readonly></td>
</tr>
<tr>
<th>사원명</th>
<td><input type="text" name="ename" value=${emp.ename} readonly></td>
</tr>
<tr>
<th>
비밀번호
</th>
<td>
<input type="password" name="password" required>
</td>
</tr>
<tr>
<td colspan=2 align=center>
<input type="button" onclick="location.href='empList.jsp'" value="리스트">
<input type="submit" value="삭제">
<input type="reset" value="취소">
</td>
</tr>
</table>
</form>
</body>
</html>