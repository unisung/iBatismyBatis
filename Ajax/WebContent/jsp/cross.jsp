<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   response.setHeader("Access-Control-Allow-Origin","*");//ajax로 외부에서 접근 허용 "*"는 모든 외부 도메인
	out.print("Hello world");
%>