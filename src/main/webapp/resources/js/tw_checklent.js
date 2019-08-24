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
	         tag += '<td style="background-image:url(resources/img/game/' + item.imageurl + '); background-size: cover;"></td>';
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
	