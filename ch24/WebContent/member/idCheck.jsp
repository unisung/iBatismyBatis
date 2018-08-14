<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id=request.getParameter("id");
    MemberDao dao = MemberDao.getInstance();
    if(dao.idCheck(id)>0){
    	out.print("<script>");
    	out.print("alert('존재하는 id 입니다.');");
    	out.print("opener.frm.id.value='';");
    	out.print("opener.frm.id.focus();");
    	out.print("self.close();");
    	out.print("</script>");
    }else{
    	out.print("<script>");
    	out.print("alert('사용가능한 id 입니다.');");
    	out.print("opener.frm.password.focus();");
    	out.print("self.close();");
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