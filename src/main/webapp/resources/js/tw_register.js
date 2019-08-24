$(function(){
		$("#confirm").on('click',function(){
			var flag = false;
			if($("#userid").val().length>2){
				flag=true;
				if(flag==true){
					var sendData = {
							"userid" : $("#userid").val()
						}
					$.ajax({
			               type: 'POST',
			               url: 'confirmUserId',
			               data: sendData,
			               success: function(data){
			               	if(data=="success"){
			               		alert("사용하실 수 있는 아이디 입니다.")
			               	}else{
			               		alert("사용하실 수 없는 아이디 입니다.")
			               		$("#userid").val("");
			               		flag = false;
			               	}
			             }
					});
				}
			}else{
				alert("ID를 다시 입력하세요(최소3자).");
				$("#userid").val("");
				flag = false;
			}
		});
		
		
	 	$("#crateUser").on('click',function(){
	 		var flag = false;
			if ($("#userid").val().length==0) {
				alert("ID를 입력 해 주세요 ");
			}else if($("#userid").val().length<2 ||$("#userid").val().length>11){
				alert("ID는 3~10 글자 사이입니다.");
			}else if($("#userpwd").val().length ==0 || $("#RepeatUserpwd").val().length ==0 ){
				alert("password를 입력 해 주세요 ");
			}else if($("#userpwd").val()!== $("#RepeatUserpwd").val()){
				alert("비밀번호가 틀립니다. 다시한번 확인 해 주세요 ");
				$("#userpwd").val("");
				$("#RepeatUserpwd").val("");
			}else if($("#userpwd").val().length<2 != $("#RepeatUserpwd").val().length>11){
				alert("ID는 3~10 글자 사이입니다.");
				$("#userpwd").val("");
				$("#RepeatUserpwd").val("");
			}else if($("#InputEmail").val().length ==0){
				alert("email을  입력 해 주세요 ");
			}else if($("#InputName").val().length ==0){
				alert("이름을  입력 해 주세요 ");
			}else if($("#InputBirthDate").val().length ==0){
				alert("생일을  입력 해 주세요 ");$("#InputBirthDate").val("")
			}else if($("#InputBirthDate").val().length ==0){
				alert("생일을  입력 해 주세요 ");
			}else if($("#tel1").val().length ==0|| $("#tel2").val().length ==0|| $("#tel3").val().length ==0){
				alert("전화번호를  입력 해 주세요 ");
			}else if(isNaN($("#tel1").val()) ||isNaN($("#tel2").val()) ||isNaN($("#tel3").val())){
				alert("전화번호는 숫자만 입력해주세요.");
				$("#tel1").val("")
				$("#tel2").val("")
				$("#tel3").val("")
			}else{
				flag = true;
			}
			
			if(flag == true){
				$("#userCreate").submit();
			}
			
			
		});
 });
 