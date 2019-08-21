 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>

   <jsp:include page="../model/header.jsp" flush="false" />
   <style>
     .container-fluid {
       text-align: center;
     }

     .card {

       margin: 10px 10px;
       display: inline-block;
       min-height: 630px;
     }

     #card1 {
       width: 30%;
     }

     #card1>.card-body {
       background-image: url("resources/img/game/${game.imageurl}");
       background-size: cover;
       height: 570px;
     }

     #card2 {
       width: 60%;

     }
     
     .t1{
     	width: 100px;
     	height: 50px;
     }
     .d1{
        width: 400px;
     	height: 50px;
     }
     .t3{
        width: 100px;
     	height: 150px;
     }
     .d3{
        width: 400px;
     	height: 150px;
     }
     #gameinfoTb{
     	margin: 0px auto;
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
           <div class="card shadow mb-4" id="card2">
             <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">instruction</h6>
             </div>
             <div class="card-body">
               <table id="gameinfoTb">
                 <tr>
                   <td class="t1">게임 이름 : </td>
                   <td class="d1">${game.gametitle}</td>
                 </tr>
                 <tr>
                   <td class="t1">제작사 : </td>
                   <td class="d1">${game.production}</td>
                 </tr>
                 <tr>
                   <td class="t1">타입 : </td>
                   <td class="d1">${game.typename}</td>
                 </tr>
                 <tr>
                   <td class="t1">장르 : </td>
                   <td class="d1">${game.genre}</td>
                 </tr>
                 <tr>
                   <td class="t3">설명 : </td>
                   <td class="d3">${game.content}</td>
                 </tr>
                 <tr>
                   <td class="t1">대여가능 : </td>
                   <td class="d1">
				<c:choose>
				<c:when test="${game.lend.status == 'delayed' || game.lend.status == 'lent'}">N</c:when>
				<c:otherwise>Y</c:otherwise>
				</c:choose>							
					</td>		
                 </tr>
                 <tr>
                   <td class="t1">대여신청 : </td>
                   <td class="d1">
                   
                   <c:if test="${not empty sessionScope.loginId }">
                     <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                       <span class="icon text-white-50">
                         <i class="fas fa-flag"></i>
                       </span>
                       <span class="text">대여 하기</span>
                     </a>
						</c:if>
                   </td>
                 </tr>
               </table>
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