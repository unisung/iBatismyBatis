<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="dto.MemberVO">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<%
	MemberDao dao =  MemberDao.getInstance();
    int result = dao.userCheck(member.getId(), member.getPassword());
    System.out.println("result="+result);
     if(result>0){
    	 if(dao.update(member)>0){//update처리
    		 out.print("<script>");
    	     out.print("alert('수정 성공!');");
    	     out.print("location.href='list.jsp';");
    	     out.print("</script>");
    	 }else{
    		 out.print("<script>");
    	     out.print("alert('수정 실패!!!');");
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