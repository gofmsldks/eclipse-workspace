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

    <title>Register</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
	<%
		String name = (String)request.getAttribute("name");
		String email = (String)request.getAttribute("email");
		String age = (String)request.getAttribute("age");
		String phone = (String)request.getAttribute("phone");
		String naver_id = (String)request.getAttribute("naver_id");
		System.out.print(name);
		System.out.print(email);
		System.out.print(age);
		System.out.print(phone);
		System.out.print(naver_id);

	%>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-5">
                <!-- Nested Row within Card Body -->
                <div>
                   
                    <div class="text-center">
                        <div class="p-5">
                        
                        <% if((!name.equals("")) && (!email.equals("")) && (!phone.equals("")) && (!age.equals(""))) { %>
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Connect with your Email!</h1>
                            </div>
                          <% }else { %>
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>                          	
                          <% }%>
                          
                            <!--  ------------------edit!--------------------- -->
                            <form class="user" action = "/register" method = "POST">
                            
                            <% if((!name.equals("")) && (!email.equals("")) && (!phone.equals("")) && (!age.equals(""))) { %>
	                                <div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="hidden" class="form-control form-control-user" id="user_name" name = "name"  value = "${name}">
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="hidden" class="form-control form-control-user" id="user_email" name = "email" value = "${email}">
	                                    </div>
	                                </div>
	
	                                <div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="hidden" class="form-control form-control-user" id="user_age" name = "age" value = "${age}">
	                                    </div>
	                                </div>
	                                
	                                <div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="hidden" class="form-control form-control-user" id="user_phone" name = "phoneNumber" value = "${phone}">
	                                    </div>
	                                </div>
	                                
	                              	<div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="hidden" class="form-control form-control-user" id="user_naverID" name = "naver_id" value = "${naver_id}">
	                                    </div>
	                                </div>
                                
                              <% } else{ %>
	                                <div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="text" class="form-control form-control-user" id="user_name" name = "name" placeholder="Enter Name">
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="text" class="form-control form-control-user" id="user_email" name = "email" placeholder="Enter email">
	                                    </div>
	                                </div>
	
	                                <div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="text" class="form-control form-control-user" id="user_age" name = "age" placeholder="Enter age">
	                                    </div>
	                                </div>
	                                <div class="form-group row">
	                                    <div class="col-sm">
	                                        <input type="text" class="form-control form-control-user" id="user_phone" name = "phoneNumber" placeholder="Enter phoneNumber">
	                                    </div>
	                                </div>
                               <% } %>
                                
                                
                                
                                
                                
                                <div class="form-group row">
                                    <div class="col-sm">
                                    <input type="text" class="form-control form-control-user" id="user_id" name = "id" placeholder="Enter ID">
                                	</div>
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm">
                                        <input type="password" class="form-control form-control-user"
                                            id="user_pw" name = "pw" placeholder="Enter Password">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm">
                                        <input type="text" class="form-control form-control-user" id="user_position" name = "position" placeholder="Enter position">
                                    </div>
                                </div>
                                
                                <button type = "submit" class="btn btn-primary btn-user btn-block"> 회원가입 </button>
                                <hr>

                            </form> 
                            
                           <!--  ------------------edit end!--------------------- -->
                            
                            
                            <div class="text-center">
                                <a class="small" href="/">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

</body>

</html>