 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>

 <head>

   <title>GameBill</title>
      <jsp:include page="model/header.jsp" flush="false" />
<style>
#carouselDiv{
width: 85%;
    margin: 10px auto 10px;
    padding: 10px;
}
#carouselDiv2{
width: 100%;
    background-color: white;
    height: 300px;
}
</style>
 </head>

 <body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">
     <!-- Sidebar -->
     <jsp:include page="model/nav.jsp" flush="false" />

		<!-- Sidebar Toggler (Sidebar) -->

     <!-- End of Sidebar --> 

     <!-- Content Wrapper -->
     <div id="content-wrapper" class="d-flex flex-column">
       <!-- Main Content -->
       <div id="content">

         <!-- Topbar -->
       <jsp:include page="model/topbar.jsp" flush="false" />
         <!-- End of Topbar -->

         <!-- Begin Page Content -->
         	<!-------------------------------------------------------------------------------------------------  -->
					<div id="carouselDiv">
					<!--Carousel Wrapper-->
					<div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
					  <!--Indicators-->
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-1z" data-slide-to="1"></li>
					    <li data-target="#carousel-example-1z" data-slide-to="2"></li>
					    <li data-target="#carousel-example-1z" data-slide-to="3"></li>
					  </ol>
					  <!--/.Indicators-->
					  <!--Slides-->
					  <div class="carousel-inner" role="listbox">
					    <!--First slide-->
					    <div class="carousel-item active">
					      <a href="gamedetail?gamenum=23"><img class="d-block w-100" src="resources/img/software_switch_main_aea2a.jpg"
					        alt="First slide"></a>
					    </div>
					    <!--/First slide-->
					    <!--Second slide-->
					    <div class="carousel-item">
					      <a href="gamedetail?gamenum=22"><img class="d-block w-100" src="resources/img/software_switch_main_anvya.jpg"
					        alt="Second slide"></a>
					    </div>
					    <!--/Second slide-->
					    <!--Third slide-->
					    <div class="carousel-item">
					      <a href="gamedetail?gamenum=24"><img class="d-block w-100" src="resources/img/software_switch_main_baaqa.jpg"
					        alt="Third slide"></a>
					    </div>
					    <div class="carousel-item">
					      <a href="gamedetail?gamenum=25"><img class="d-block w-100" src="resources/img/software_switch_main_splatoon2.jpg"
					        alt="Fourth slide"></a>
					    </div>
					    <!--/Third slide-->
					  </div>
					  <!--/.Slides-->
					  <!--Controls-->
					  <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					  <!--/.Controls-->
					</div>
					<!--/.Carousel Wrapper-->
         			</div>
					<div id="carouselDiv2">
					
					</div>



       		<!-------------------------------------------------------------------------------------------------  -->

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