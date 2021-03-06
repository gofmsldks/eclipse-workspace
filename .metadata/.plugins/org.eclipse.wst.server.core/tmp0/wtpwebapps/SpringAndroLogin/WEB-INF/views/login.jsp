<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    
	<%
	
		session = request.getSession();
    	String memberName = (String)session.getAttribute("memberName");
        String memberId = (String)session.getAttribute("memberId");

	%>

</head>


<% if (memberId == null){ %>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로그인 화면입니다.</h1>
                                    </div>
	

                                    <!-- 로그인 부분 -->
									<div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="exampleInputID" aria-describedby="IDHelp"
                                                placeholder="Enter your ID..." name = "id">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password" name= "pw">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                        </div>
                                        </div>
                                        
                    					<button type="button" class ="btn btn-primary btn-user btn-block" onclick = "login_click();">로그인</button>
     
     									<br>
                                        <hr>
 
                                    </div>

                                    <div class="text-center">
                                        <a class="small" href="/register">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    
    
<% } else { %>
	<script>
	alert("이미 로그인 된 상태입니다.");
 	document.location.href="/index";
 	</script>

<%  } %>

	 <script>
	 
	 function login_click(){
			var userID = $('input[name="id"]').val();
			var userPW = $('input[name="pw"]').val();
			var customIDCheck = $('#customCheck').val();
		     // JSON으로 요청
			
		     if(customIDCheck == 'on'){
		    	 localStorage.setItem("saveID", userID);
		     }else{
		    	 localStorage.setItem("saveID", 'N');
		     }
		     
		     
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
		            		alert(result.name + "님 환영합니다. 로그인 되었습니다.");
		            	 	window.location.href="/index";
		              	  }
		              },
				      error: function(result){
				    	  alert("REST 오류 발생");
		              	 	window.location.href="/";

				      }
		
		     });

}
	
	 </script>
	<script type="text/javascript">
	if ("${msg}" == "REGISTERED"){
		alert('회원가입 완료 로그인 해주세요');
		
	}else if ("${msg}" == "UNREGISTERD"){
		alert("회원가입 오류. 아이디와 비밀번호를 확인해주세요");
		window.location.href = "/register";
	}
	
	</script>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.js"></script>

</body>

</html>