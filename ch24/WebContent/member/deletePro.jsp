<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
	MemberDao dao =  MemberDao.getInstance();
    int result = dao.userCheck(id, password);
    System.out.println("result="+result);
     if(result>0){
    	 if(dao.delete(id)>0){//update처리
    		 out.print("<script>");
    	     out.print("alert('삭제 성공!');");
    	     out.print("location.href='list.jsp';");
    	     out.print("</script>");
    	 }else{
    		 out.print("<script>");
    	     out.print("alert('삭제 실패!!!');");
    	     out.print("history.back();");
    	     out.print("</script>");
    	 }
    }else{
    	out.print("<script>");
    	out.print("alert('비밀번호가 틀립니다.');");
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