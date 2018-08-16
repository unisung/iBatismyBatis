<%@page import="java.util.Date"%>
<%@page import="dto.DeptDTO"%><%@page import="dto.EmpDTO"%><%@page import="java.util.List"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	for(EmpDTO s:jobList){
		System.out.println(s.getJob());
	}


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
<input type="text" name="eno">
</td>
</tr>
<tr>
<th>사원명</th>
<td>
<input type="text" name="ename">
</td>
</tr>
<tr>
<th>업무</th>
<td>job</td>
</tr>
<tr>
<th>매니저</th>
<td>manager</td>
</tr>
<tr>
<th>입사일자</th>
<td>
<input type="date" name="hiredate">
</td>
</tr>
<tr>
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
dno
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