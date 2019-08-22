 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>
   <jsp:include page="../model/header.jsp" flush="false" />

   <style>
     #inlineFormCustomSelectPref,
     #ex1 {
       width: 30%;
       display: inline-block;
       height: 2em
     }
     #search,
     .col {

       margin: 0px;
       padding: 10px;
     }

     #search {
       text-align: right;
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


         <!-- Begin Page Content -->
         <div class="container-fluid">

           <!-- Page Heading -->
           <h1 class="h3 mb-2 text-gray-800">대여 목록</h1>
           <p class="mb-4">대여된 게임들의 목록</p>

           <!-- DataTales Example -->
           <div class="card shadow mb-4">
             <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">GameTable</h6>
             </div>

           
           <div class="container">
               <div class="row">
                 <div class="col">
                   <label class="my-1 mr-2" for="inlineFormCustomSelectPref">page : </label>
                     <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                       <option value="10">10</option>
                       <option value="11">11</option>
                       <option value="12">12</option>
                     </select>
                 </div>
                 <div class="col">
                 </div>
                 <div class="col-6" id="search">     
                     <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Search : </label>
                     <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                       <option value="10">10</option>
                       <option value="11">11</option>
                       <option value="12">12</option>
                     </select>
                     <input class="form-control" id="ex1" type="text">
                     <button type="button" class="btn btn-primary btn-sm">Search</button>
                 </div>
               </div>
             </div>
     


             <div class="card-body">
               <div class="table-responsive">
                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                   <thead>
                     <tr>
                       <th>GameTitle</th>
                       <th>Rental User</th>
                       <th>Start Date</th>
                       <th>End Date</th>
                       <th>Action</th>
                     </tr>
                   </thead>
                   <tfoot>
                     <tr>
                       <th>GameTitle</th>
                       <th>Rental User</th>
                       <th>Start Date</th>
                       <th>End Date</th>
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