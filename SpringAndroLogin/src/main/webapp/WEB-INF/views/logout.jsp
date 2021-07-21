<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!--  KaKao 로그인 API SDK 삽입-->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    
	<script>

		Kakao.init("c67948042abe53729decb54f94ed88b5");
		Kakao.isInitialized();
		
		if(!Kakao.Auth.getAccessToken()){	// 토큰이 있는지 확인 
			console.log('Not kakao logged in...');
		}
		else{
			Kakao.Auth.logout(function(){	// 카카오 로그아웃
				console.log(Kakao.Auth.getAccessToken());
				console.log('카카오 로그아웃 완료...');
			});
		}
		
	
	</script>
	
	
	<script>
	
	    alert("로그아웃 되었습니다.");
	    self.location = "/";
	    
	</script>
	
</body>
</html>