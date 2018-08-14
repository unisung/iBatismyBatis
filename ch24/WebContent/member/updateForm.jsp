<%@page import="dto.MemberVO"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String id = request.getParameter("id");
MemberDao  dao = MemberDao.getInstance();
MemberVO  member = dao.getMemberInfo(id);

request.setAttribute("member", member);
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <c:if test="${not empty member}">
 <form action="updatePro.jsp" method="post">
  <table border=1>
  <tr>
  <th>id</th>
  <td>
  <input type="text" name="id" value="${member.id}" readonly="readonly">
  </td>
  </tr>
  <tr>
  <th>name</th>
  <td>
  <input type="text" name="name" value="${member.name}">
  </td>
  </tr>
  <tr>
  <th>비밀번호</th>
  <td>
  <input type="password" name="password">
  </td>
  </tr>
  <tr>
  <td colspan=2 align="center">
   <input type="button" value="리스트" onclick="location.href='list.jsp'">
   <input type="submit" value="수정" >
   <input type="reset" value="취소">
  </td>
  </tr>
  </table>
</form>
  </c:if>
</body>
</html>