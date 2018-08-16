<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dto.DeptDTO"%><%@page import="dto.EmpDTO"%><%@page import="java.util.List"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<%
   EmpDao dao = EmpDao.getInstance();
	//사원번호 발번   
	int eno = dao.newEmpNo();
	//job리스트 추출
	List<EmpDTO> jobList = dao.selectJobList();
	//manager리스트 추출
	List<EmpDTO> managerList = dao.selectManagerList();
	//부서리스트 추출
	List<DeptDTO> deptList = dao.selectDeptList();
	//오늘 날짜 추출
	Date now = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String sDate = sdf.format(now);
	 
	for(EmpDTO s:jobList){
		System.out.println(s.getJob());
	}
	
	request.setAttribute("eno",eno);
	request.setAttribute("jobList",jobList);
	request.setAttribute("managerList", managerList);
	request.setAttribute("deptList", deptList);
	request.setAttribute("sDate", sDate);
	

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>사원 등록 폼</h2>
<form action="insertEmpPro.jsp" method="post">
<table border=1>
<tr>
<th>사원번호</th>
<td>
<input type="text" name="eno"  value=${eno} disabled="disabled">
<input type="hidden" name="eno" value="${eno}">
</td>
</tr>
<tr>
<th>사원명</th>
<td>
<input type="text" name="ename" required>
</td>
</tr>
<tr>
<th>업무</th>
<td>
<select name="job">
<c:if test="${not empty jobList}">
<option  value="">선택</option>
<c:forEach var="j" items="${jobList}">
<option value="${j.job}">${j.job}</option>
</c:forEach>
</c:if>
</select>
</td>
</tr>
<tr>
<th>매니저</th>
<td>
<select name="manager">
<c:if test="${not empty managerList}">
<option value="" disabled="disabled">선택</option>
<c:forEach var="m" items="${managerList}" varStatus="no">
<option <c:if test="${no.count==1}">selected</c:if> value="${m.eno}">${m.ename}</option>
</c:forEach>
</c:if>
</select>
</td>
</tr>
<tr>
<th>입사일자</th>
<td>
<input type="date" name="hiredate" value="${sDate}">
</td>
</tr>
<th>월급여</th>
<td>
<input type="text" name="salary">
</td>
</tr>
<tr>
<th>커미션</th>
<td>
<input type="text" name="commission">
</td>
<tr>
<th>부서</th>
<td>
<select name="dno">
<c:if test="${not empty deptList}">
<option value="선택" disabled="disabled">선택</option>
<c:forEach var="d" items="${deptList}" varStatus="no">
<option <c:if test="${no.count==1}">selected</c:if> value="${d.no}">${d.dname}</option>
</c:forEach>
</c:if>
</select>
</td>
</tr>
<tr>
<th>비밀번호</th>
<td>
<input type="password" name="password" required>
</td>
</tr>
<tr>
<td colspan=2 align="center">
<input type="submit" value="확인">
<input type="reset" value="취소">
<input type="button" value="리스트" onclick="location.href='empList.jsp'">
</td>
</tr>
</table>
</form>
</body>
</html>