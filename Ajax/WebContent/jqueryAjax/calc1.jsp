<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int v1 = Integer.parseInt(request.getParameter("v1"));
    int v2 = Integer.parseInt(request.getParameter("v2"));
    String op = request.getParameter("op");
    System.out.println("v1="+request.getParameter("v1"));
    System.out.println("v2="+request.getParameter("v2"));
    System.out.println("op="+op);
    switch(op){
    case "sum": 
    	 out.print(v1+"+"+v2+"="+(v1+v2));
    		break;
    case "minus": 
    	out.print(v1+"-"+v2+"="+(v1-v2));
    	break;
    case "mul": 
    	out.print(v1+"x"+v2+"="+(v1*v2));
    	break;
    case "div": 
    	out.print(v1+"/"+v2+"="+((double)v1/v2));
    	break;
    }
%>