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

     #countPerPage,
     #searchItem,
     #searchList {
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
	setPage();
	 into();
	 
     $("#countPerPage").on('change', function () {
    	 page =0;
    	 setPage();
       into();
     });

});
function into() {
    var sendData = {
      "searchItem": 'title',
    }
    $.ajax({
      type: 'POST',
      url: 'checkLend',
      data: sendData,
      success: output
    });

  }
  function output(data){
	     totalRecordCount = data.length;
	     totalPageCount = Math.ceil(totalRecordCount / countPerPage);
	     	   startPageGroup = ((page-1)*parseInt(countPerPage))
			endPageGroup = (startPageGroup + parseInt(countPerPage)) 
	     
			navSet(totalPageCount);
			tagSet(data,startPageGroup,endPageGroup);
	 
			
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
  function tagSet(data,startPageGroup,endPageGroup){
		 var tag = '';
	     $.each(data, function (index, item) {
	  	   if (index>=startPageGroup && index<endPageGroup) {

	         tag += '<tr>';
	         if(item.startdate != null){
	         tag += '<td>' + item.startdate + '</td>';
	         }else{
	         tag += '<td></td>';
	         }
	         if(item.status == "lent" || item.status=="delayed"){
	         tag += '<td>' + item.enddate + '</td>';
	         }else if(item.status =="returned"|| item.status =="delay_returned"){
	        	 tag += '<td>' + item.returndate + '</td>';	 
	         }else{
	        	 tag += '<td></td>';
	         }
	         tag += '<td style="background-image:url(resources/img/game/' + item.imageurl + ')"></td>';
	         tag += ' <td>'+item.typename+'</td>';
	         tag += '<td>'+item.gametitle+'</td>';
	         if(item.status == "lent"){
	        	 tag += '<td>대출 중</td>';
		         }else if(item.status=="delayed"){ 
		        	 tag += '<td style="color:red">연체</td>';
		         }else if(item.status =="returned"){
		        	 tag += '<td>반납완료</td>';	 
		         }else if(item.status =="delay_returned"){
		        	 tag += '<td style="color:red">연체반납</td>';	 
		         }
		         else if(item.status =="rejected"){
		        	 tag += '<td style="color:red">대출 거절</td>';
		         }else{
		        	 tag += '<td >대출 신청중</td>';
		         }
	         
	         tag += '</tr>';
	  	   }

	     });
			    	 $("#dataTable tbody").html(tag);
	 }
	   
</script>


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
               <h6 class="m-0 font-weight-bold text-primary">HistoryTable</h6>
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
               </div>
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
               <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
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