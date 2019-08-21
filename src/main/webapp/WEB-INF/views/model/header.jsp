<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">


  <!-- Bootstrap core JavaScript-->
  <script src="resources/js/jquery-3.4.1.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin-2.min.js"></script>

<script>
$(function(){
	var link = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.length);
	if (link == "gameList"||link == "checkLend" ) {
		$("#UserserviceNav").attr('class','nav-item active');
		$("#collapsePages").attr('class','collapse show');
		if (link == "gameList") {
			$('a[href = "gameList"]').attr('class','collapse-item active');
		}else{
			$('a[href = "checkLend"]').attr('class','collapse-item active');
		}
	}else if (link == "lendRequestList"||link == "lendList"||link == "overdueList"||link == "userInfo"  ) {
		$("#ManagerNav").attr('class','nav-item active');
		$("#collapseUtilities").attr('class','collapse show');
		if (link == "lendRequestList") {
			$('a[href = "lendRequestList"]').attr('class','collapse-item active');
		}else if(link == "lendList"){
			$('a[href = "lendList"]').attr('class','collapse-item active');
		}else if(link == "overdueList"){
			$('a[href = "overdueList"]').attr('class','collapse-item active');
		}else{
			$('a[href = "userInfo"]').attr('class','collapse-item active');
		}
		
	}else if (link == "chart") {
		$("#ChartsNav").attr('class','nav-item active');
	}else if (link == "disboard") {
		$("#DashboardNav").attr('class','nav-item active');
	}
})
</script>  

