 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>

   <jsp:include page="../model/header.jsp" flush="false" /> 
        
   <script>
	$(function(){
			into()
	});
	function into(){
		var sendData = {
				gametitle : "마카롱",
					production : "안녕",
					genre : "액션"
			}
			$.ajax({
				type:'POST',
				url : 'listOfGame',
				data : sendData,
				success : output
			});
	}
	function output(data){
			var tag = '';
			$.each(data,function(index,item){
				tag += '<tr>';
				tag += '<td>'+ item.imageurl +'</td>';
				tag += '<td>'+ item.gametitle +'</td>';
				tag += '<td>'+ item.production +'</td>';
				tag += '<td>'+ item.typename +'</td>';
				tag += '<td>'+ item.genre +'</td>';
				
				if (item.lend.status != null || item.lend.status != 'returned' ) {
					tag += '<td>'+'대여 가능'+'</td>';
				}else{
					tag += '<td>'+'대여 불가'+'</td>';
				} 
				
				tag += '</tr>';

			});
			$("#dataTable tbody").html(tag);
	}
   </script>
   <!-- Custom styles for this page -->
   <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

   <!-- Page level plugins -->
   <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
   <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

   <!-- Page level custom scripts -->
   <script src="resources/js/demo/datatables-demo.js"></script>


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
           <h1 class="h3 mb-2 text-gray-800">Tables</h1>
           <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more
             information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official
               DataTables documentation</a>.</p>

           <!-- DataTales Example -->
           <div class="card shadow mb-4">
             <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
             </div>
             <div class="card-body">
               <div class="table-responsive">
                 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                   <thead>
                     <tr>
                       <th>Image</th>
                       <th>GameName</th>
                       <th>production</th>
                       <th>GameType</th>
                       <th>Genre</th>
                       <th>Possible status</th>
                     </tr>
                   </thead>
                   <tfoot>
                     <tr>
                       <th>Image</th>
                       <th>GameName</th>
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