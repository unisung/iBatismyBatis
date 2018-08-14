<%@page import="java.util.List"%>
<%@page import="dto.DeptDTO"%>
<%@page import="dto.EmpDTO"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html>
<%
	String eno = request.getParameter("eno");
    EmpDao dao = EmpDao.getInstance();
    EmpDTO emp = dao.selectEmpInfo(Integer.parseInt(eno));
    List<EmpDTO> manager =dao.selectManagerList();
    List<DeptDTO> dept = dao.selectDeptList();
    
    for(EmpDTO m:manager){
    	System.out.println(m.getEno()+":"+m.getEname());
    }
    for(DeptDTO d:dept){
    	System.out.println(d.getNo()+":"+d.getDname()+"."+d.getLoc());
    }
    System.out.print(emp.getEno()+":"+emp.getEname()+":"+emp.getManager());
    request.setAttribute("emp", emp);
    request.setAttribute("manager",manager);
    request.setAttribute("dept",dept);
    

%>
<head>
<title>사원정보 수정 폼</title>
</head>
<body>
 <c:if test="${not empty emp}">
 <form action="updatePro.jsp" method="post">
  <table border=1>
  <tr>
  <th>사원번호</th>
  <td>
  <input type="text" name="eno" value="${emp.eno}" readonly="readonly">
  </td>
  </tr>
  <tr>
  <th>사원명</th>
  <td>
  <input type="text" name="ename" value="${emp.ename}">
  </td>
  </tr>
  <tr>
  <th>매니저</th>
  <td>
  <select name="manager">
  <c:forEach var="m" items="${manager}">
  <option <c:if test="${m.eno==emp.manager}">selected</c:if> value="${m.eno}">${m.ename}</option>
  </c:forEach>
  </select>
  </td>
  </tr>
  <tr>
  <th>부서</th>
  <td>
  <select name="dno">
  <c:forEach var="d" items="${dept}">
  <option value="${d.no}" 
           <c:if test="${d.no==emp.dno}">selected</c:if>>
            ${d.dname}.${d.loc}
   </option>
  </c:forEach>
  </select>
  </td>
  </tr>
  <tr>
  <th>급여</th>
  <td>
  <input type="text" name="salary" value="${emp.salary}">
  </td>
  </tr>
  <tr>
  <th>커미션</th>
  <td>
  <input type="text" name="commission" value="${emp.commission}">
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
   <input type="button" value="리스트" onclick="location.href='empList.jsp'">
   <input type="submit" value="수정" >
   <input type="reset" value="취소">
  </td>
  </tr>
  </table>
</form>
  </c:if> 
</body>
</html>