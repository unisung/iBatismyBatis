<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.EmpDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('tr:even').css('backgroundColor','#f9f9f9');
	$('tr:odd').css('backgroundColor','#9f9f9f');
	$('tr:first').css('backgroundColor','#000').css('color','#fff');
});
</script>
</head>
<body>
<%
    String hdate = request.getParameter("hdate");
	EmpDao dao = EmpDao.getInstance();
	List<EmpDTO> list=null;
	
	if(hdate==null|| "".equals(hdate)){
    	list = dao.selectEmpAll();
   }else{
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	     java.sql.Date date = 
	    		 new java.sql.Date(sdf.parse(hdate).getTime());

	    list = dao.selectEmpAll(date);
		request.setAttribute("date", date);
   }
	request.setAttribute("list", list);
%>
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>입사일자</legend>
<form name="seach">
<input type="date" name="hdate" value="${date}">
<input type="submit" value="확인"><p>
<span>해당 날짜 이후의 사원을 조회합니다.</span>
</form>
</fieldset>
<c:if test="${not empty list}">
<table border=1>
<tr>
<th>순번</th><th>사번</th><th>이름</th><th>업무</th><th>매니저</th><th>입사일자</th><th>부서번호</th>
</tr>
<c:forEach var="m" items="${list}" varStatus="n">
 <tr>
 <td>${n.count}</td>
 <td><a href="viewEmp.jsp?eno=${m.eno}">${m.eno}</a></td>
 <td>${m.ename}</td>
 <td>${m.job}</td><td>${m.manager}</td><td>${m.hiredate}</td>
 <td>${m.dno}</td>
 </tr>
</c:forEach>
</table>
</c:if>
</body>
</html>