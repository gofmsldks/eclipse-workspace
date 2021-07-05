<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <script src="resources/vendor/bootstrap/js/bootstrap.js"></script>
	
	 <!--  <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script> -->

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    
    <script  type="text/javascript">
    	var id = "<%=(String)session.getAttribute("userId")%>";	
    </script>
</head>

<body>

<script>
if (id == null){
	
</script>

<div style="background:white;margin:-12px -0.5% 0px -20px; text-align:center;height:80px; border: 1px solid">

<h2>로그인 페이지</h2></div>

 <div style="position:absolute; top:50%; left:50%; width:19%; height:80px; margin:-80px 0px 0px -200px; border:1px solid;">
 
    아이디 : <input type="text" id = "userID" name="id"/><br />
    패스워드 : <input type="password" id = "userPW" name="pw" /><br />
    
    
	<button type="button" name="btn" class="btn" onclick = "login_click();">로그인</button>
     
     <br>
     
     <a href="/register">회원가입</a>

 </div>

 <br>
 
 <script>
 
 }

else {
	 alert("이미 로그인 된 상태입니다.");
 	document.location.href="/";
 }
 
 </script>
 
 
 
 <script>

 function login_click(){
			var userID = $('input[name="id"]').val();
			var userPW = $('input[name="pw"]').val();
		     // JSON으로 요청
		
		     var data = {"id" : userID, "pw" : userPW};
		
		     $.ajax({
		
		              url: "/login",
		
		              type: "POST",
		
		              dataType: "json",          // ajax 통신으로 받는 타입
		
		              contentType: "application/json",  // ajax 통신으로 보내는 타입
		
		              data: JSON.stringify(data),
		
		              success: function(result){
		            	  
		            	  if(result.msg == 'FAIL'){
		            		  alert("아이디 또는 비밀번호가 틀렸습니다.");
		              	 	window.location.href="/login";
		
		            	  }else if(result.msg == 'SUCCESS'){
		            		alert("로그인 되었습니다.");
		            	 	window.location.href="/loginOk";
		              	  }
		              },
				      error: function(result){
				    	  alert("REST 오류 발생")
		              	 	window.location.href="/";

				      }
		
		     });

 }

</script>
 
</body>