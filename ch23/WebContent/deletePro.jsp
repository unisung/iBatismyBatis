<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id = request.getParameter("id");
    MemberDao dao = MemberDao.getInstance();
    int result = dao.delete(id);
    if(result>0){
    	 response.sendRedirect("list.jsp");
    }else{
    	out.print("<script>");
    	out.print("alert('삭제실패');");
    	out.print("history.back();");
    	out.print("</script>");
    }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>