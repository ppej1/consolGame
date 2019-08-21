 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>
      <jsp:include page="../model/header.jsp" flush="false" />



<script>
.card shadow mb-4{
	width: 80%;
	margin: auto;
	text-align: center;
}
</script>
   <!-- Custom styles for this page -->
   <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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

  
           <!-- Page Heading -->
           <h1 class="h3 mb-2 text-gray-800">대여 신청 목록 </h1>
           <p class="mb-4">대여 신청을 받은 게임들을 승인 할 수 있습니다.</p>

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
                       <th>GameName</th>
                       <th>Subscriber</th>
                       <th>Action</th>
                     </tr>
                   </thead>
                   <tfoot>
                     <tr>
                       <th>GameName</th>
                       <th>Subscriber</th>
                       <th>Action</th>
                     </tr>
                   </tfoot>
                   <tbody>
                                
                   </tbody>
                 </table>
               </div>
             </div>
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