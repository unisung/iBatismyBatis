/**
 * XMLHttpRequest 객체 생성 메소드
 */
 /* IE인 경우 */
 function getXMLHttpRequest(){
	 var xmlhttp;
	 if(window.ActiveXObject){
		try{
		     xmlhttp= new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e1){
				xmlhttp=null;
			}
		}    
 }else if(window.XMLHttpRequest){
  try{
	  xmlhttp = new XMLHttpRequest();
  }catch(e){
	  xmlhttp=null;
  }
 }else{
	 xmlhttp=null;
 }

	if(xmlhttp==null) errorMessage();
	 return xmlhttp;
 }//getXMLHttpRequest() 메소드 끝.
 
function errorMessage(){
	 alert('지원할수 없는 브라우저 입니다.');
 } 