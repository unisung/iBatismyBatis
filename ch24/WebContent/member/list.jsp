<%@page import="dto.MemberVO"%><%@page import="java.util.List"%><%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
 table{
    table-layout: auto; width: 75%;
   }
 .textstyle{
 color:blue; font-weight: bold; background-color: pink;
 }
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script>
/* nth-child(수식) : 수식에 맞는 요소 선택 */
$(document).ready(function(){
	$('tr:eq(0)').css('background','#000').css('color','white');
	$('td:nth-child(3n+1)').css('background','#565656');
	$('td:nth-child(3n+2)').css('background','#a9a9a9');
	$('td:nth-child(3n)').css('background','#f9f9f9');
});
</script>
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