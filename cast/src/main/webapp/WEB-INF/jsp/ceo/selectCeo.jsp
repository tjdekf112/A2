<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ceo_template/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ceo_template/vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ceo_template/css/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/ceo_template/images/favicon.png" />
</head>
<body>
	<%@ include file="ceoBase.jsp"%>
	<br>
	<form method="post" action="${pageContext.request.contextPath}/ceo/selectCeo">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">나의 개인정보</h4>
					<div class="table-responsive pt-3">
						<table class="table table-bordered">
							<tr>
								<td>ID</td>
								<td>${ceoId}</td>
							</tr>
							<tr>
								<td>PW</td>
								<td><a href="${pageContext.request.contextPath}/ceo/updateCeoPw">비밀번호 수정</a></td>
							</tr>
							<tr>
								<td>Name</td>
								<td>${ceoName}</td>
							</tr>
							<tr>
								<td>Email</td>
								<td>${ceoEmail}</td>
							</tr>
							<tr>
								<td>License</td>
								<td>${ceoLicense}</td>
							</tr>
							<tr>
								<td>PhoneNum</td>
								<td>${ceoPhonenum}</td>
							</tr>
							<tr>
								<td>생성일</td>
								<td>${createDate}</td>
							</tr>
						</table>
						<br>
						<div style="text-align:right">
							<c:if test="${state eq '거절'}">
								<a class="btn btn-outline-success btn-icon-text" href="${pageContext.request.contextPath}/ceo/ceoReJoinRequest?ceoId=${ceoId}">
								 <i class="ti-twitter btn-icon-prepend"></i>
									가입 요청
								</a>
							</c:if>
							<c:if test="${state eq '승인'}">
								<a class="btn btn-outline-info btn-icon-text" href="${pageContext.request.contextPath}/ceo/subscribeCeo?ceoId=${ceoId}">
								 <i class="ti-ticket btn-icon-prepend"></i>
								구독 변경
								</a>
							</c:if>
							<a class="btn btn-outline-primary btn-icon-text" href="${pageContext.request.contextPath}/ceo/updateCeo?ceoId=${ceoId}&ceoEmail=${ceoEmail}&ceoLicense=${ceoLicense}&ceoPhonenum=${ceoPhonenum}">
							 <i class="ti-file btn-icon-prepend"></i>
							내 정보수정
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>