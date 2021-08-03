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

    <!-- Core plugin JavaScript-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.js"></script>
    
    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!--  KaKao 로그인 API SDK 삽입-->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    
    <!-- 세션 불러오기  -->
	<%
	
		session = request.getSession();
    	String memberName = (String)session.getAttribute("memberName");
        String memberId = (String)session.getAttribute("memberId");

	%>

</head>


<% if (memberId == null){ %>

<body class="bg-gradient-primary">
    
    
	<!--  카카오 로그인시 회원 가입이 필요한 경우 사용자 정보를 form 형식으로 전달해서 회원 가입 페이지로 이동시킨다.(hidden으로 구현) -->
	<form name="kakaoForm" id="kakaoForm" method = "POST" action="/setKakaoInfo">
	<input type="hidden" name="email" id="kakaoEmail" />
	<input type="hidden" name="id" id="kakaoId" />
	<input type="hidden" name="name" id="kakaoNickName" />
	<!--  카카오 로그인 시 나이와 폰번호는 현재로선 불러 올 수 없음 (카카오 자체에서 검수 필요) -->
	<input type="hidden" name="age" id="kakaoBirthyear" value="" />
	<input type="hidden" name="phone" id="kakaoPhone_number" value="" />
	<input type="hidden" name="flag" id="flag" value="kakao" />
	</form>


    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-5">
                        <!-- Nested Row within Card Body -->
                        <div class="text-center">
                            <div class="text-center">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로그인 화면입니다.</h1>
                                    </div>
	

                                    <!-- 로그인 부분 -->
									<div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="exampleInputID" aria-describedby="IDHelp"
                                                placeholder="Enter your ID..." name = "local_id">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password" name= "local_pw">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                        </div>
                                        </div>
                                        
                    					<button type="button" class ="btn btn-primary btn-user btn-block" onclick = "login_click()">로그인</button>
     									
     									
     									<br>
                                        <hr>
     									
     									
     									<!-- 네이버 로그인 창으로 이동 -->
     										
										<div id="naver_id_login" style="text-align:center">
											<a href="${url}">
												<img width = 306px height = 50px src="resources/img/2021_Login_with_naver_guidelines_Kr/btnG_완성형.png"/>
											</a>
										</div>

										
										
										<!-- 카카오 로그인 창으로 이동 -->
										
										<div id="kakao_id_login" style="text-align:center">
											<a href="javascript:kakaoLogin()">
												<img width = 306px height = 50px src="resources/img/kakao_login_large_wide.png"/>
											</a>
										</div>
	
										
										
										
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
	 
	 /*
	 로그인 버튼 클릭시 동작
	 */
	 
	 function login_click(){
			var userID = $('input[name="local_id"]').val();
			var userPW = $('input[name="local_pw"]').val();
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
		              	 	window.location.href="/";
		
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
	
	 /*
	 * 회원 가입 부분 alert 
	 */
	
	
	if ("${msg}" == "REGISTERED"){
		alert('회원가입 완료 로그인 해주세요');
		
	}else if ("${msg}" == "UNREGISTERD"){
		alert("회원가입 오류. 아이디와 비밀번호를 확인해주세요");
		window.location.href = "/register";
	}
	
	</script>
	
	
	<!--  Kakao 로그인 api 불러오기 -->
	<script>
	$(document).ready(function(){
		Kakao.init('c67948042abe53729decb54f94ed88b5');
		console.log("카카오: " + Kakao.isInitialized() );
	});
	
	</script>
	
	
	<script>
	
	 /*
	 * 카카오 로그인 버튼 클릭시 동작
	 */
		function kakaoLogin() {
			Kakao.Auth.login({
				success: function (authObj) {
				Kakao.API.request({
					url: '/v2/user/me',
					success: function (response) {
						console.log(authObj.access_token);
						console.log(response)
						kakaoLoginCallback(response);
						
					},
					fail: function (error) {
						console.log(error);
					},
				})
			},
				fail: function (error) {
					console.log(error);
				},
			})
		}
	
	</script>
	
	
	<script>
	
	 /*
	 * 카카오 로그인 시 카카오 로그인 정보를 받아오는 부분
	 */
		function kakaoLoginCallback(response){
			var data = {'email':response.kakao_account.email, 'id':response.id, 'nickName': response.kakao_account.profile.nickname};
			$.ajax({
				type : 'POST',
				url : '/kakaoCallback',
				data : data,
				dataType : 'json',
				success : function(res){
					console.log(res);
					if(res.JavaData == "YES"){
						alert("로그인되었습니다.");
						location.href = '/index'
					}else if(res.JavaData == "register"){
						$("#kakaoEmail").val(response.kakao_account.email);
						$("#kakaoId").val(response.id);
						$("#kakaoNickName").val(response.kakao_account.profile.nickname);
						$("#kakaoForm").submit();
					}else{
						alert("로그인에 실패했습니다");
					}
					
				},
				error: function(xhr, status, error){
					alert("로그인에 실패했습니다."+error);
				}
			});
		}
			
	</script>

</body>

</html>