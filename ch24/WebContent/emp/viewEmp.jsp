<%@page import="dto.EmpDTO"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<%
    String eno = request.getParameter("eno");
    EmpDao dao = EmpDao.getInstance();
    EmpDTO member = dao.selectEmp(Integer.parseInt(eno));
    
    request.setAttribute("m", member);
%>
<head>
<title>사원 정보</title>
</head>
<body>
<table border=1>
<tr><th>사원번호</th><td>${m.eno}</td></tr>
<tr><th>부서명</th><td>${m.dname}</td></tr>
<tr><th>사원명</th><td>${m.ename}</td></tr>
<tr><th>매니저명</th><td>${m.mname}</td></tr>
<tr><th>입사일자</th><td>${m.hiredate}</td></tr>
<tr><th>급여</th>
<td>
<fmt:formatNumber value="${m.salary}" pattern="###,##0"/>
</td>
</tr>
<tr>
<td colspan=2>
<input type="button" value="리스트" onclick="location.href='empList.jsp'">
<input type="button" value="수정" onclick="location.href='updateForm.jsp?eno=${m.eno}'">
<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?eno=${m.eno}'">
</td>
</tr>
</table>
</body>
</html>