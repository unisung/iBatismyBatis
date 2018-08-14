<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%
	request.setCharacterEncoding("utf-8");
    String password = request.getParameter("password");
%>
<jsp:useBean id="emp" class="dto.EmpDTO">
<jsp:setProperty name="emp" property="*"/>
</jsp:useBean>
<%
	EmpDao  dao =  EmpDao.getInstance();

  if(dao.userCheck(password)>0){ 
	    int result = dao.updateEmp(emp);
	    if(result>0){
	    	out.print("<script>");
	    	out.print("alert('수정 완료!!');");
	    	out.print("location.href='empList.jsp';");
	    	out.print("</script>");
	    }else{
	    	out.print("<script>");
	    	out.print("alert('수정 실패!!');");
	    	out.print("history.back()';");
	    	out.print("</script>");
	    }
   }else{
	    out.print("<script>");
   		out.print("alert('권한이 없습니다.');");
   		out.print("location.href='empList.jsp';");
   		out.print("</script>");
   }
%>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>