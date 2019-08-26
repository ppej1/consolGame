 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Login</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin-2.min.js"></script>
  
   <!-- google Login-->
  <link rel="shortcut icon" href="resources/img/chess.ico">
<script>
$(function(){
	$("#login").on('click',function(){

		var flag = false;
		if ($("#userid").val().length== 0) {
			$(".loginAnounce").html("ID를 입력해 주세요 ");
		}else if($("#userid").val().length<2 || $("#userid").val().length>11 ){
			$(".loginAnounce").html("ID는 3~10 글자 입니다. ");

			$("#userid").val("");
		}else if($("#userpwd").val().length== 0){
			$(".loginAnounce").html("PASSWORD를 입력해 주세요 ");

		}else if($("#userpwd").val().length<2 || $("#userpwd").val().length>11 ){
			$(".loginAnounce").html("PASSWORD는 3~10 글자 입니다.");

			$("#userpwd").val("");
		}else{
			flag = true;
			
		}
		
		if(flag== true){
			$("#userloginForm").submit();
		}
		
	});
});
</script>
 

</head>

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
             <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index" style="text-decoration:none">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-chess"></i>
			</div>
			<div class="sidebar-brand-text mx-3">
				<h3>GameBill <sup>2</sup></h3>
			</div>
		</a>
                  </div>
                  <div class="loginAnounce">
                    	${fail}
                  </div>
                  <form id="userloginForm" method="POST" action="login">
                    <div class="form-group">
                      <input type="text" name="userid" class="form-control form-control-user" id="userid" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <div class="form-group">
                      <input type="password" name="userpwd"  class="form-control form-control-user" id="userpwd"   placeholder="Password">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div>
                    </form>
                    <button class="btn btn-primary btn-user btn-block" id="login">
                      Login
                    </button>
                    
                    <hr>
                    <button id="GoogleLoginBtn" class="btn btn-google btn-user btn-block" data-value="cheking">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </button>
                    <a href="#" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a>
                  
                  <hr>
                  <div class="text-center">
                    <a class="small" href="#">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="signup">Create an Account!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

</body>

</html>
