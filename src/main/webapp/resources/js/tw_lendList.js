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
     $("#searchBtn").on('click', function () {
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
       url: 'listOfLent',
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
 
		
	       $(".returnBtn").on('click',function(){
	    	  
	    	   var currentItem = $(this).attr("data-value");
	    	   alert(currentItem)
	           var sendData = {
	          		"lend": currentItem
	             }
	             $.ajax({
	               type: 'POST',
	               url: 'returnGame',
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

         tag += '<tr>'
         tag += '<td>'+item.gametitle+'</td>'
         tag += ' <td>'+item.username+'</td>'
         tag += '<td>'+item.startdate+'</td>'
         tag += '<td>'+item.enddate+'</td>'
         tag += '<td>'
         tag += '<button type="button" class="btn returnBtn btn-outline-primary btn-sm" id="returnBtn" data-value ="'+item.lend+'">반납</button>'
         tag += '</td>'
         tag += '</tr>'
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