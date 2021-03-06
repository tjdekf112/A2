<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="ceoBase.jsp" %>
	
	<form method="post" action="${pageContext.request.contextPath}/ceo/insertRoom" enctype="multipart/form-data" class="forms-sample">
	<br>
		<div class="col-12 grid-margin stretch-card">
			<div class="card">
				
				<div class="card-body">
				<div class="progress" style="height:20px">
				<div class="progress-bar progress-bar-striped" style="width:25%">25%</div>
				</div>
				<br>
					<h2 class="card-title">방 등록</h2>
					<p class="card-description">호텔의 객실 정보를 입력해주세요.</p>
					<div>
								
					<div class="form-group">
						<label for="exampleInputName1"></label>방 이름
						<br><br><input type="text"
							class="form-control" name="roomName" placeholder="방이름">
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" value="${hotelId}"
							name="hotelId">
					</div>
					<label for="exampleSelectGender" style="font-size: 15px">판매일자</label>
					<div class="form-group input-group">
						<input type="date" class="form-control" style="width: 250px" name="roomStartdate" >
						<div class="input-group-text">~</div>
						<input type="date" class="form-control" style="width: 250px" name="roomEnddate">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail3">객실 수</label>
						<div class="input-group">
							<input type="text" class="form-control" name="roomCount"
								placeholder="객실 수">
							<div class="input-group-append">
								<span style="color: black" class="input-group-text"> 개</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail3">가격</label>
						<div class="input-group">
							<input type="text" class="form-control" name="roomPrice"
								placeholder="가격">
							<div class="input-group-append">
								<span style="color: black" class="input-group-text">&#8361;</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>이미지 등록</label> <!--<input type="file" name="img[]"
							class="file-upload-default"> -->
						<div class="input-group col-xs-12">
							<!-- <input type="text" class="form-control file-upload-info" disabled
								placeholder="Upload Image"> <span
								class="input-group-append">
								<button class="file-upload-browse btn btn-primary" type="button">Upload</button> 
							</span>-->
							<input multiple="multiple" type="file" name="roomImage" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="exampleTextarea1">방 설명</label>
						<textarea class="form-control" name="roomContent" rows="10"></textarea>
					</div>
					<br>
					</div>
					<div align="right">
					<button type="submit" class="btn btn-primary mr-2">NEXT</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	


</body>
</html>