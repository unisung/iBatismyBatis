<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.EmpDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<script src="../js/createXMLHttpRequest.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="../js/createXMLHttpRequest.js"></script>
<script>
var checkFirst=false;
var lastKeyword='';/* 마지막 검색할 키원드*/
var loopSendKeyword=false;//사용자가 제시어를 선택했는지 유무
 function start(){
	 if(checkFirst==false){
		 setTimeout("sendKeyword()",500);/*500(0.5초)밀리초 후에 실행하라 */
		 loopSendKeyword=true;
	 }
	 checkFirst=true;
 }
 function sendKeyword(){
	 if(loopSendKeyword==false) return;/* start()전에 실행 금지 */
	 var keyword = document.search.keyword.value;
	 if(keyword==''){
		 lastKeyword='';
		 hide('suggest');/* 선택자 'suggest'를 숨김 */
	 }else if(keyword!=lastKeyword){
		 lastKeyword=keyword;
		 if(keyword!=''){
		/* 	 var params='keyword='+keyword; */
 			 var params='keyword='+encodeURIComponent(keyword); 
			 sendRequest("suggest.jsp",params,displayResult,'POST');
		 }else{
			 hide('suggest');
		 }
	 }
	 setTimeout("sendKeyword()",500);
 }//sendKeyword()메소드 끝.

function displayResult(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var resultText = httpRequest.responseText;
			var result = resultText.split('|');//6|자바, 자바 프로그래밍,...,result[0]='6',result[1]='자바, 자바 프로그래밍,...,'
			var count = parseInt(result[0]);//숫자형으로 바꿈 parseInt(문자열)
			var keywordList =null;
			if(count>0){
				
				keywordList = result[1].split(',');
				
				var html='';
				for(var i=0;i<keywordList.length;i++){
					html+="<a href=\"javascript:select('"+keywordList[i]+"')\">"
					                       +keywordList[i]+"</a><br>";
				}
				var listView = document.getElementById('suggestList');
				listView.innerHTML=html;
			    show('suggest');//보이기	
				}else{
					hide('suggest');
				}
			}else{
				alert("에러발생:"+httpRequest.status);
			}
			
		}	 
 }
 
 function select(selectedKeyword){
	 document.search.keyword.value=selectedKeyword;
	 loopSendKeyword=false;//loopSendKeyword 값이 false면 sendKeyword()함수를 호출하지 않음
	 checkFirst=false;//startSuggest() 한번 호출되면 true
	 hide('suggest');
 }
 function show(elementId){
	 var element = document.getElementById(elementId);
	 if(element){
		 element.style.display='';//요소의 style.displaye=''; 요소 보기익
	 }
 }
 function hide(elementId){
	 var element = document.getElementById(elementId);
	 if(element){
		 element.style.display='none';//요소의 style.displaye='none'; 요소 감추기
	 }
 }
</script>
<script>
$(document).ready(function(){
	$('tr:even').css('backgroundColor','#f9f9f9');
	$('tr:odd').css('backgroundColor','#9f9f9f');
	$('tr:first').css('backgroundColor','#000').css('color','#fff');
});
</script>
<script>
function chk(){
	 document.search.action="empList2.jsp?keyword="+document.search.keyword.value;
	 alert(document.search.action);
	 document.search.submit();
}
</script>
</head>
<body>
<%
  
     String name = request.getParameter("keyword");

	EmpDao dao = EmpDao.getInstance();
	List<EmpDTO> list=null;
	
	if(name==null|| "".equals(name)){
    	list = dao.selectEmpAll();
   }else{
	     
	     list= dao.selectEmp(name);
		
   }
	request.setAttribute("list", list);
%>
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>입사일자</legend>
<form action="" name="search">
  <input type="text" name="keyword" id="keyword" onkeydown="start()">
  <input type="button" value="검색" onclick="chk()">
</form>
<div id="suggest" style="display:;position:absolute; left:10px;top:70px;">
<div id="suggestList"></div>
</div>
</fieldset>
<div style="margin-top:100px;">
<c:if test="${not empty list}">
<table border=1>
<tr>
<th>순번</th><th>사번</th><th>이름</th><th>업무</th><th>매니저</th><th>입사일자</th><th>부서번호</th>
</tr>
<c:forEach var="m" items="${list}" varStatus="n">
 <tr>
 <td>${n.count}</td>
 <td><a href="viewEmp.jsp?eno=${m.eno}">${m.eno}</a></td>
 <td>${m.ename}</td>
 <td>${m.job}</td><td>${m.manager}</td><td>${m.hiredate}</td>
 <td>${m.dno}</td>
 </tr>
</c:forEach>
</table>
</c:if>
</div>
</body>
</html>