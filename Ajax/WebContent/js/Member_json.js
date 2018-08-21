/**
 * 사용자 정의 Member객체
 * - 자바스크립의 사용자 정의 객체의 메소드 상속
 * - prototype = 원(부모)객체의 메소드
 */
//생성자 객체 = function(속성){}
Member = function(id,name,securityNo){
	this.id=id;
	this.name=name;
	this.securityNo=securityNo;
}

//자바스크립트의 메소드 원형
//Meber.prototype.setValue=function(){}
//{ 속성명:function(){}}
Member.prototype={
	setValue:function(newId,newName,newSecurityNo){
			this.id=newId;
			this.name=newName;
			this.securityNo=newSecurityNo;
	},
	getAge:function(){
		var birth=parseInt(this.securityNo.substring(0,2));
		var code=this.securityNo.substring(6,7);
		if(code=='1'||code=='2')
			birth+=1900;
		else
			birth+=2000;
		var date = new Date().getFullYear();
		return date - birth+1;
	},
	toString:function(){
		return this.name +"("+this.id+")";
	}	
		
}