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

  <title>SB Admin 2 - Register</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin-2.min.js"></script>
 <style>
 .bg-register-image{
  background-image: url("resources/img/user/${loginUser.imageurl}");
 background-size: cover;
 
 }
 
 </style>
 <script>
 $(function(){
		$("#crateUser").on('click',function(){
			$("#userCreate").submit();
		});
	});
 
 </script> 
  
  
  
  
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">
          </div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Modify an Account!</h1>
              </div>
              <form id="userCreate" action="modify" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="userid" id="userid" value="${loginUser.userid}" placeholder="ID" readonly="readonly">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-2 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="exampleInputPassword" name="userpwd"
                      placeholder="Password">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="exampleRepeatPassword"
                      placeholder="Repeat Password">
                  </div>
                </div>
                <div class="form-group">
                  <span>비밀번호 일치 여부 확인  </span>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="exampleInputEmail" name="email" value="${loginUser.email}"
                    placeholder="Email Address">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="exampleInputName" name="username"  value="${loginUser.username}" readonly="readonly" placeholder="Name" >
                </div>
                <div class="form-group">
                  <input type="date" class="form-control form-control-user" id="exampleInputBirthDate" name="birthdate" value="${loginUser.birthdate}" 
                    placeholder="birthdate">
                </div>

                <div class="form-group row">
                  <div class="col-sm-3 mb-1 mb-sm-0">
                    <select class="form-control" id="tel1" name="tel1">
                      <option value="010" selected= "${loginUser.tel1 == 010 ? 'selected': ''}">010</option>
                      <option value="011" selected= "${loginUser.tel1 == 011 ? 'selected': ''}">011</option>
                      <option value="017" selected= "${loginUser.tel1 == 017 ? 'selected': ''}">017</option>
                      <option value="018" selected= "${loginUser.tel1 == 018 ? 'selected': ''}">018</option>
                    </select>
                  </div>
                  -
                  <div class="col-sm-4 mb-1 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="tel2" name="tel2" placeholder="" value="${loginUser.tel2}">
                  </div>
                  -
                  <div class="col-4 mb-1 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="tel3" name="tel3" placeholder="" value="${loginUser.tel3}">
                  </div>
                </div>
             
                <div class="form-group">
                    <div class="btn btn-primary btn-user btn-block">
                      <input type="file" accept="image/x-png,image/gif,image/jpeg" name="upload">
                    </div>
                  </div>



                <button class="btn btn-primary btn-user btn-block" id="crateUser">
                  Register Account
                </button>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="index">I don't want to chainge</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>



</body>

</html>