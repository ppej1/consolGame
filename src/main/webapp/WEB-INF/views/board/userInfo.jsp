 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>
   <jsp:include page="../model/header.jsp" flush="false" />
   <style>
     #returnBtn {
       width: 100%
     }

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
     var countPerPage = '';
     var totalRecordCount = '';
     var totalPageCount = '';
     var startPageGroup = '';
     var endPageGroup = '';

     function setPage() {
       countPerPage = $("#countPerPage").val();
       if (page == '' || page < 0) {
         page = 1;
       }
       startPageGroup = ((page - 1) * countPerPage)
       endPageGroup = (startPageGroup + parseInt(countPerPage))

     }

     $(function () {
       setPage()

       into();
       $("#countPerPage").on('change', function () {
         page = 0;
         setPage();
         into();
       });
       $("#searchBtn").on('click', function () {
         page = 0;
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
         url: 'listOfLent',
         data: sendData,
         success: output
       });
     }

     function output(data) {

       totalRecordCount = data.length;
       totalPageCount = Math.ceil(totalRecordCount / countPerPage);
       startPageGroup = ((page - 1) * parseInt(countPerPage))
       endPageGroup = (startPageGroup + parseInt(countPerPage))

       navSet(totalPageCount);
       tagSet(data, startPageGroup, endPageGroup);


       $(".returnBtn").on('click', function () {

         var currentItem = $(this).attr("data-value");
         alert(currentItem)
         var sendData = {
           "lend": currentItem
         }
         $.ajax({
           type: 'POST',
           url: 'returnGame',
           data: sendData,
           success: function () {
             into();
           }
         });
       });

       $(".page-link").on('click', function () {

         if ($(this).attr("data-value") == "next") {
           page = parseInt(page) + 1;
           if (page > totalPageCount) {
             page = totalPageCount;
           }
         } else if ($(this).attr("data-value") == "before") {
           page = parseInt(page) - 1;
           if (page < 1) {
             page = 1;
           }
         } else {
           page = $(this).attr("data-value");
         }
         into();
       });

     }

     function tagSet(data, startPageGroup, endPageGroup) {
       var tag = '';
       $.each(data, function (index, item) {
         if (index >= startPageGroup && index < endPageGroup) {

           tag += '<tr>'
           tag += '<td>' + item.gametitle + '</td>'
           tag += ' <td>' + item.username + '</td>'
           tag += '<td>' + item.startdate + '</td>'
           tag += '<td>' + item.enddate + '</td>'
           tag += '<td>'
           tag +=
             '<button type="button" class="btn returnBtn btn-outline-primary btn-sm" id="returnBtn" data-value ="' +
             item.lend + '">반납</button>'
           tag += '</td>'
           tag += '</tr>'
         }

       });
       $("#dataTable tbody").html(tag);
     }

     function navSet(totalPageCount) {
       var nav = '';
       nav += '<li class="page-item">';
       nav += ' <a class="page-link" href="#" data-value ="before" aria-label="Previous">';
       nav += '<span aria-hidden="true">&laquo;</span>';
       nav += '<span class="sr-only">Previous</span>';
       nav += '</a>';
       nav += '</li>';
       for (var int = 1; int <= totalPageCount; int++) {
         nav += '<li class="page-item"><a class="page-link" href="#' + int + '" data-value ="' + int + '">' + int +
           '</a></li>';
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
           <h1 class="h3 mb-2 text-gray-800">유저 정보</h1>
           <p class="mb-4">유저 정보 조회</p>

           <!-- DataTales Example -->
           <div class="card shadow mb-4">
             <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">lentTable</h6>
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
                     <option value="gametitle">타이틀명</option>
                     <option value="username">대출자</option>
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
               <nav aria-label="Page navigation example">
                 <ul class="pagination justify-content-center">
             </div>
           </div>

         </div>

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