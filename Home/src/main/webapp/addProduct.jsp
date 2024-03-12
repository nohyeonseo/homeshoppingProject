<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js">
</script>
<title>상품 등록</title>
</head>
<body>

	<jsp:include page= "menu.jsp" />
	
	<div class="container">
		<main role="main">
			<div class="jumbotron">
		    	<div class="col-sm-8 mx-auto">
		        	<h1>등록</h1>
		        	<a class="btn btn-primary" href="./deleteProduct.jsp" role="button">상품삭제»</a>
		        </div>
		    </div>
		</main>
	</div>
	
	<div class="container">
	
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype ="multipart/form-data">

			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type ="text" id="productId" name="productId" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">제품명</label>
				<div class="col-sm-3">
					<input type ="text" id="name" name="name" class="form-control">
				</div>
			</div>

			<div class="form-group row">
			    <label class="col-sm-2">이미지</label>
			    <div class="col-sm-4">
			        <input type="file" name="productImage" class="form-control">
			    </div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2">상품설명</label>
				<div class="col-sm-6">
					<input type ="text" id="desciption" name="desciption" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세설명</label>
				<div class="col-sm-6">
					<textarea id="detail" name ="detail" rows="10" cols="50" maxlength="400" placeholder="최대 400글자까지 입력 가능합니다."></textarea>
				</div>
			</div>
			
			
			<div class="form-group row">
			<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type ="radio" id="category" name="category" value="여성그룹"> 여성그룹
					<input type ="radio" id="category" name="category" value="남성그룹"> 남성그룹
					<input type ="radio" id="category" name="category" value="솔로"> 솔로
				</div>
			</div>
			
			<div class="form-group row">
		   		<label class="col-sm-2">가격</label>
			    <div class="col-sm-3">
			        <input type="text" id="unitPrice" name="unitPrice" class="form-control">
			    </div>
			</div>
			
			<div class="form-group row">
			<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type ="radio" id="type" name="type" value="CD"> CD
					<input type ="radio" id="type" name="type" value="DVD"> DVD
					<input type ="radio" id="type" name="type" value="PHOTO"> PHOTOBOOK
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
				</div>
			</div>	
			
		</form>
	</div>

	<br>
	<jsp:include page="footer.jsp" />	
</body>
</html>