<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 요청받은 서버에서 처리하는 부분 -->
<%
	String name=request.getParameter("name");
%>
<!-- 요청받은 서버에서 처리하는 부분 -->
<!-- 처리한 결과 응답부분 -->
안녕하세요 <%=name %>님!!!
<!-- 처리한 결과 응답부분 --> 
</body>
</html>