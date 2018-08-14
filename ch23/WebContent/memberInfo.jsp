<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
    MemberDao dao = MemberDao.getInstance();
    MemberVO member = dao.getMemberInfo(id);
    request.setAttribute("member",member);
    request.setAttribute("id",id);
    
%>
</head>
<body>
	<table border=1>
	 <tr><th>id</th><td>
	     <input type="text" 
	        name="id" readonly="readonly" value="${member.id}"></td>
	 </tr>
	 <tr>
	 <th>name</th>
	 <td>
	 <input type="text" name="name" value=${member.name}>
	 </td>
	 </tr>
	<tr>
	<td colspan=2 align="center">
	<input type="button" onclick="location.href='list.jsp'" value="리스트로 가기">
	<input type="button" onclick="location.href='updateForm.jsp?id=${id}'"
	                value="수정하기">
    <input type="button" onclick="location.href='deleteForm.jsp?id=${id}'"
                    value="삭제하기">	                
	</tr>
	</table> 
</body>
</html>