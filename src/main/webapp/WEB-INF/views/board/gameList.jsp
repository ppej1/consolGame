 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>

   <jsp:include page="../model/header.jsp" flush="false" />

   <script src="resources/js/tw_gameList.js"></script>

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

         <!-- Begin Page Content -->
         <div class="container-fluid">

           <!-- Page Heading -->
           <h1 class="h3 mb-2 text-gray-800">GameList</h1>
           <p class="mb-4">대여 가능한 게임들을 모아둔 GamBill 의 게임 리스트 입니다.</p>

           <!-- DataTales Example -->
           <div class="card shadow mb-4">
             <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">GameTable</h6>
             </div>


             <div class="container">
               <div class="row">
                 <div class="col">
                   <label class="my-1 mr-2" for="inlineFormCustomSelectPref">page : </label>
                   <select class="custom-select my-1 mr-sm-2" id="countPerPage">
                     <option value="10">10</option>
                     <option value="15">15</option>
                     <option value="20">20</option>
                   </select>
                 <c:if test="${sessionScope.loginLevel == 0}">
                     <button type="button" class="addbtn btn-primary btn-sm" id="addBtn">Add</button>
                 </c:if>
                 </div>
                 
                 <div class="col">
                 </div>
                 <div class="col-6" id="search">
                   <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Search : </label>
                   <select class="custom-select my-1 mr-sm-2" id="searchList">
                     <option value="gametitle">게임명</option>
                     <option value="production">제작사</option>
                     <option value="genre">장르</option>
                     <option value="typename">게임기종</option>
                   </select>
                   <input class="form-control" id="searchItem" type="text">
                   <button type="button" class="btn btn-primary btn-sm" id="searchBtn">Search</button>
                 </div>
               </div>
             </div>



             <div class="card-body">
               <div class="table-responsive">
                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                   <thead>
                     <tr>
                       <th>Image</th>
                       <th>GameTitle</th>
                       <th>production</th>
                       <th>GameType</th>
                       <th>Genre</th>
                       <th>Possible status</th>
                     </tr>
                   </thead>
                   <tfoot>
                     <tr>
                       <th>Image</th>
                       <th>GameTitle</th>
                       <th>production</th>
                       <th>GameType</th>
                       <th>Genre</th>
                       <th>Possible status</th>
                     </tr>
                   </tfoot>
                   <tbody>

                   </tbody>
                 </table>
               </div>
			
               <nav aria-label="Page navigation example">
                 <ul class="pagination justify-content-center">

                 </ul>
               </nav>


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