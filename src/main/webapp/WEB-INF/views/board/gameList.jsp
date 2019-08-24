 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>

   <jsp:include page="../model/header.jsp" flush="false" />
   
   <style>
     td {
       text-align: center;
     }

     .container {
       max-width: 1820px;
       margin: 5px;
       width: 100%;

     }

     #searchItem,
     #searchList,
     #countPerPage{
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
   
   <script>
   var page = '';
   var countPerPage ='';
   var totalRecordCount ='';
   var totalPageCount ='';
   var startPageGroup ='';
   var endPageGroup = '';
   function setPage(){
	   countPerPage = $("#countPerPage").val();
	   if(page == '' || page < 0){page = 1;}
	   startPageGroup = ((page-1)*countPerPage)
		endPageGroup = (startPageGroup + parseInt(countPerPage)) 
			
   }
   
 $(function(){
	 setPage()
	 
	 into();
     $("#countPerPage").on('change', function () {
    	 page =0;
    	 setPage();
       into();
     });
     $("#searchBtn").on('click',function(){
    	 page =0;
    	 setPage();
       into();
     });    
 });
 function into() {
	 var searchItem = $("#searchItem").val();
 	var searchList = $("#searchList").val();
    var sendData = {
 		"searchItem": searchItem,
 		"searchList": searchList,
    }
    $.ajax({
      type: 'POST',
      url: 'listOfGame',
      data: sendData,
      success: output
    });
   }

 function output(data) { 

     totalRecordCount = data.length;
     totalPageCount = Math.ceil(totalRecordCount / countPerPage);
     	   startPageGroup = ((page-1)*parseInt(countPerPage))
		endPageGroup = (startPageGroup + parseInt(countPerPage)) 
     
		navSet(totalPageCount);
		tagSet(data,startPageGroup,endPageGroup);
		
		 $(".a_tag").on('click',function(){
			 var currentItem = $(this).attr("data-value");
			 location.href ="gamedetail?gamenum="+currentItem;
			 
		 });

		
 
		
	       $(".btn").on('click',function(){
	    	   var currentItem = $(this).attr("data-value");	
	    	   var selectYN = $(this).attr("id");
	    	   var selectDate = $("#selectDate").val();
	           var sendData = {
	       		"lend": currentItem,
	       		"selectDate" :selectDate,
	       		"selectYN" :selectYN
	          }
	          $.ajax({
	            type: 'POST',
	            url: 'confirmRequest',
	            data: sendData,
	            success: function(){
	            	into();
	            }
	          });
	       });

	   	$(".page-link").on('click',function(){
			
			if ($(this).attr("data-value") =="next") {
				page = parseInt(page) + 1;
				if (page>totalPageCount) {
					page=totalPageCount;
				}
			}else if ($(this).attr("data-value") =="before") {
				page = parseInt(page) - 1;
				if(page<1){
					page = 1;
				}
			}else{
				page= $(this).attr("data-value");
			}
			into();
	   	});		

 }
 
 function tagSet(data,startPageGroup,endPageGroup){
	 var tag = '';
	 $.each(data, function (index, item) {
 		 
			if (index>=startPageGroup && index<endPageGroup) {
	             tag += '<tr>';
	             tag += '<td class="a_tag"data-value="' + item.gamenum + '" style="background-image:url(resources/img/game/' + item.imageurl + '); background-size: cover;"></td>';
	             tag += '<td><a href ="gamedetail?gamenum=' + item.gamenum + '">' + item.gametitle + '</a></td>';
	             tag += '<td>' + item.production + '</td>';
	             tag += '<td>' + item.typename + '</td>';
	             tag += '<td>' + item.genre + '</td>';

	             if (item.status == 'delayed' || item.status == 'lent') {
	               tag += '<td  style="color:red">' + '대여 불가' + '</td>';
	             } else {
	               tag += '<td>' + '대여 가능' + '</td>';
	             }

	             tag += '</tr>';

			}
			 
 });
		    	 $("#dataTable tbody").html(tag);
 }
 
 function navSet(totalPageCount){
	 var nav = '';
		nav += '<li class="page-item">';
	       nav += ' <a class="page-link" href="#" data-value ="before" aria-label="Previous">';
	       nav += '<span aria-hidden="true">&laquo;</span>';
	       nav += '<span class="sr-only">Previous</span>';
	       nav += '</a>';
	       nav += '</li>';
	       for (var int = 1; int <= totalPageCount; int ++) {
	       	nav += '<li class="page-item"><a class="page-link" href="#'+int+'" data-value ="'+int+'">'+int+'</a></li>';
	   		}
	       
	       nav += '<li class="page-item">';
	       nav += '<a class="page-link" href="#" data-value ="next" aria-label="Next">';
	       nav += '<span aria-hidden="true">&raquo;</span>';
	       nav += '<span class="sr-only">Next</span>';
	       nav += '</a>';
	       nav += '</li>';
	       
	       $(".pagination").html(nav);	
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
                   <input class="form-control" id="searchItem" type="text" >
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