<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resource/css/bootstrap.min.css" />
<title>결제페이지</title>
</head>

<body class="bg">
	<%@ include file = "menu.jsp"%>
	<div class="container">
		<main role="main">
	        <div class="jumbotron">
	          <div class="col-sm-8 mx-auto">
	            <h1>결제 페이지</h1>
	              <a class="btn btn-primary" href="./mainpage.jsp" role="button">홈화면으로»</a>
	          </div>
	        </div>
	      </main>
	</div>
	
	
	<div class="container">
		<form action="./processpayInfo.jsp" class="form-horizontal" method="post">
			
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phonenumber" type="text" class="form-control" />
<!-- 					<input type="text" name="mail1" maxlength="50"> -->
<!-- 						<select name="mail2"> -->
<!-- 							<option>naver.com</option> -->
<!-- 							<option>gmail.com</option> -->
<!-- 							<option>nate.com</option> -->
<!-- 						</select> -->
<!-- 					<input type="text" name="mail1" maxlength="50">	 -->
						
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input name="deliverydate" type="text" class="form-control" />(yyyy/mm/dd)
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">국가명</label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" />
				</div>
			</div>
			
			<div class="form-group row">
                <div class="col-sm-4">
	                <label for="cc-name">은행</label>
	                <input type="text" class="form-control" name="bankname" placeholder="" required="">
	                	<small class="text-muted">Full name as displayed on card</small>
	                <div class="invalid-feedback">
	                  Please provide the name of the bank.
	                </div>
           		</div>
           	</div>	
           	
           	<div class="form-group row">	
	            <div class="col-sm-4">
	                <label for="cc-number">카드 번호</label>
	                <input type="text" class="form-control" name="cdnumber" placeholder="" required="">
	                <div class="invalid-feedback">
	                  Credit card number is required
	                </div>
	            </div>
            </div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="./paycancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
					<input	type="submit" class="btn btn-primary" value="결제완료" />
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>