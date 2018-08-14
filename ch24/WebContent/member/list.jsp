<%@page import="dto.MemberVO"%><%@page import="java.util.List"%><%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	MemberDao dao = MemberDao.getInstance();
    List<MemberVO> list = dao.getMemberList();
    request.setAttribute("list", list);

%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty list}">
<table border=1>
<tr>
<th>번호</th><th>id</th><th>이름</th>
</tr>
<c:forEach var="m" items="${list}" varStatus="n">
 <tr>
 <td>${n.count}</td><td>${m.id}</td>
 <td><a href='memberInfo.jsp?id=${m.id}'>${m.name}</a></td>
 </tr>
</c:forEach>
</table>






</c:if>
</body>
</html>