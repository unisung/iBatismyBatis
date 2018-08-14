<%@page import="dto.EmpDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<body>
<%
	EmpDao dao = EmpDao.getInstance();
    List<EmpDTO> list = dao.selectEmpAll();
    request.setAttribute("list", list);

%>
<title>Insert title here</title>
</head>
<body>
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