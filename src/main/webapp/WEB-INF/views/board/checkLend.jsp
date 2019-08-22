 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>
      <jsp:include page="../model/header.jsp" flush="false" />

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


       <!-- Begin Page Content -->
         <div class="container-fluid">

           <!-- Page Heading -->
           <h1 class="h3 mb-2 text-gray-800">History</h1>
           <p class="mb-4">자신이 대여한 게임의 대여 내역 입니다..</p>

           <!-- DataTales Example -->
           <div class="card shadow mb-4">
             <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">GameTable</h6>
             </div>
             <div class="card-body">
               <div class="table-responsive">
                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                   <thead>
                     <tr>
                       <th>Rent Date</th>
                       <th>Return Date</th>
                       <th>Image</th>
                       <th>GameType</th>
                       <th>GameTitle</th>
                       <th>Status</th>
                     </tr>
                   </thead>
                   <tfoot>
                     <tr>
                       <th>Rent Date</th>
                       <th>Return Date</th>
                       <th>Image</th>
                       <th>GameType</th>
                       <th>GameTitle</th>
                       <th>Status</th>
                     </tr>
                   </tfoot>
                   <tbody>
                                
                   </tbody>
                 </table>
               </div>
             </div>
           </div>

         </div>



         <!-- /.container-fluid -->



	<!--------------------------------------------------------------------------------------------------->
       </div>
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