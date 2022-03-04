<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>

	<div class="container">
	
		<section class="content">
		
			<div class="user-box">
				<div class="box-logo text-center">
					<h1>AnecDOT</h1>
				</div>
				
				<div class="mx-2">
					<form id="signUpForm">
					
						<div class="d-flex mt-3">
							<input type="text" id="userIDInput" class="form-control" placeholder="ID">
							<button type="button" class="btn btn-sm ml-1" id="isDuplicateBtn">중복확인</button>
						</div>
						<div id="duplicateDiv" class="d-none"><small class="text-danger">중복된 ID 입니다.</small></div>
						<div id="noneDuplicateDiv" class="d-none"><small class="text-success">사용가능한 ID 입니다.</small></div>
						
						<input type="password" id="passwordInput" class="form-control mt-2" placeholder="Password">
						<small id="errorPassword" class="text-danger d-none">비밀번호가 일치하지 않습니다.</small>
						<input type="password" id="passwordConfirmInput" class="form-control mt-2" placeholder="Password Confirm">
						
						<input type="text" id="nameInput" class="form-control mt-2" placeholder="Name">
						<input type="text" id="emailInput" class="form-control mt-2" placeholder="Email">
						
						<button type="submit" id="signupBtn" class="btn btn-block mt-2">Sign up</button>
						
					</form>
				</div>
				
				<div class="d-flex justify-content-center mt-3" style="height: 100px">
					Do you have an account?
					<a href="/anecdot/user/login" class="ml-2">Log in</a>
				</div>
			</div>
		
		</section>
		
	</div>
	
	
	<script type="text/javascript">
	
		$(document).ready(function() {
			
			var isIdCheck = false;
			var isDuplicateId = true;
			
			// 아이디에 입력이 있을 경우 중복체크 상태를 초기화한다. 
			$("#userIDInput").on("input", function() {
				
				$("#duplicateDiv").addClass("d-none");
				$("#noneDuplicateDiv").addClass("d-none");
				isIdCheck = false;
				isDuplicateId = true;
				
			});

			$("#signUpForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var userID = $("#userIDInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				var name = $("#nameInput").val().trim();
				var email = $("#emailInput").val().trim();
				
				if(userID == null || userID == "") {
					alert("Enter your ID");
					return;
				}
				
				if(password == null || password == "") {
					alert("Enter your Password");
					return;
				}
				
				if(password != passwordConfirm) {
					$("#errorPassword").removeClass("d-none");
					return;
				}
				
				if(name == null || name == "") {
					alert("Enter your name");
					return;
				}
				
				if(email == null || email == "") {
					alert("Enter your email");
					return;
				}
				
				if(isIdCheck == false){
					alert("중복체크를 진행하세요");
					return;
				}
				
				if(isDuplicate == true){
					alert("아이디가 중복되었습니다.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"userID":userID, "password":password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success"){
							location.href="/user/login";
						} else {
							alert("회원가입 실패");
						}
					},
					error:function(e) {
						alert("Error");
					}
				});
				
			});
			
			$("#isDuplicateBtn").on("click", function() {
				
				var userID = $("#userIDInput").val();
				
				if(userID == null || userID == ""){
					alert("Enter your ID");
					return;
				} 
				
				$.ajax({
					type:"get",
					url:"/user/is_duplicate_id",
					data:{"userID":userID},
					success:function(data) {
						isIdCheck = true;
						
						if(data.is_duplicate) {
							isDuplicate = true;
							$("#duplicateDiv").removeClass("d-none");
							$("#noneDuplicateDiv").addClass("d-none");
						} else {
							isDuplicate = false;
							$("#duplicateDiv").addClass("d-none");
							$("#noneDuplicateDiv").removeClass("d-none");
						}
					},
					error:function(e) {
						alert("중복확인 실패");
					}
				});
					
			});
			
			
		});
		
		
	
	</script>
	
	

</body>
</html>


















