 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>

      <jsp:include page="../model/header.jsp" flush="false" />
 <style>
 .container-fluid{
 text-align: center;
 }
 .card{
   
    margin: 10px 10px;
    display: inline-block;
    min-height: 630px;
 }
 #card1{
  width: 30%;
 }
 #card1 >.card-body{
  background-image: url("resources/img/game/${game.imageurl}");
  background-size: cover;
  height : 570px;
 }
 #card2{
   width: 60%;
 
 }
 </style>
 </head>

 <body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">
     <!-- Sidebar -->
     <jsp:include page="../model/nav.jsp" flush="false" />
     <!-- End of Sidebar -->

     <!-- Content Wrapper -->
     <div id="content-wrapper" class="d-flex flex-column">
       <!-- Main Content -->
       <div id="content">

         <!-- Topbar -->
         <jsp:include page="../model/topbar.jsp" flush="false" />
         <!-- End of Topbar -->
         <!-- Begin Page Content -->
	<!--------------------------------------------------------------------------------------------------->

         <div class="container-fluid">

              <!-- Circle Buttons -->
              <div class="card shadow mb-4" id="card1">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Game</h6>
                </div>
                <div class="card-body"> </div>
              </div>
              <!-- Circle Buttons -->
              <div class="card shadow mb-4"id="card2">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">instruction</h6>
                </div>
                <div class="card-body">
                  
                </div>
              </div>





         </div>
         <!-- /.container-fluid -->

       </div>


	<!--------------------------------------------------------------------------------------------------->

       <!-- End of Main Content -->
       <!-- Footer -->
       <footer class="sticky-footer bg-white">
         <div class="container my-auto">
           <div class="copyright text-center my-auto">
             <span>Copyright &copy; Your Website 2019</span>
           </div>
         </div>
       </footer>
       <!-- End of Footer -->

     </div>
     <!-- End of Content Wrapper -->

   </div>
   <!-- End of Page Wrapper -->

   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top">
     <i class="fas fa-angle-up"></i>
   </a>




 </body>

 </html>