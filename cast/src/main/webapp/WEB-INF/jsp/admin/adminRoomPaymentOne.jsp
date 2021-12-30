<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${pageContext.request.contextPath}/resources/admin_template/img/logo/logo.png" rel="icon">
  <title>RuangAdmin - Dashboard</title>
  <link href="${pageContext.request.contextPath}/resources/admin_template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin_template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin_template/css/ruang-admin.min.css" rel="stylesheet">
</head>

<style>
	.content {
 	 	border: none;
 	 	resize: none;
 	 
	}
	.content:focus {
  		outline: none;
	}
</style>
<body id="page-top">
  <div id="wrapper">
    
	<!-- adminSidebar include -->
    <%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp"%>
    
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        
        <!-- adminTopbar include -->
		<%@ include file="/WEB-INF/jsp/admin/adminTopbar.jsp"%>

        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">예약 결제 리스트</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/adminIndex">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">예약 결제 리스트</li>
            </ol>
          </div>
		<div class="container" style="text-align:center">

	<div class="card">
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">숙소예약상세보기</h6>
      </div>
      <div class="table-responsive">
		<table class="table align-items-center table-flush">
			<tr>
				<td>예약 번호 : ${roomPaymentOne.roomOrder.roomOrderId}</td>
				<td>호텔 이름 : ${roomPaymentOne.roomOrder.hotelName}</td>
				<td style="width: 30%;">예약 날짜 : ${fn:substring(roomPaymentOne.roomOrder.createDate,0,10)}</td>
				
			</tr>
			<tbody>
				<tr>
					<td>고객ID : ${roomPaymentOne.roomOrder.customerId}</td>
					<td>방 이름 : ${roomPaymentOne.roomOrder.roomName}</td>
					<td>숙박 기간 :  ${fn:substring(roomPaymentOne.roomOrder.roomOrderStartDate,0,10)} ~ ${fn:substring(roomPaymentOne.roomOrder.roomOrderEndDate,0,10)}</td>
				</tr>
			</tbody>
			<tr>
				<td colspan="3"><textarea class="content" rows="15" cols="100" readonly="readonly">${roomPaymentOne.roomOrder.note}</textarea></td>
			</tr>
		</table>	
		<br>
	</div>
	</div>
	<br>
	<div class="card">
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">숙소결제상세보기</h6>
      </div>
      <div class="table-responsive">
		<table class="table align-items-center table-flush">
			<tr>
				<td>결제 번호 : ${roomPaymentOne.roomPaymentId}</td>
				<td>결제 방식 : ${roomPaymentOne.roomPaymentMethod}</td>
				<td>결제 금액 : <fmt:formatNumber value="${roomPaymentOne.roomPaymentMoney}" pattern="#,###"/>원</td>
				<td style="width: 30%;">결제 날짜 : ${fn:substring(roomPaymentOne.createDate,0,10)}</td>
			</tr>
		</table>	
		<br>
	</div>
	</div>

          <!-- Modal Logout include 로그아웃 클릭 시 나타나는 메시지 창-->
          <%@ include file="/WEB-INF/jsp/admin/adminModalLogout.jsp"%>

        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>copyright &copy; <script> document.write(new Date().getFullYear()); </script> - developed by
              <b><a href="https://indrijunanda.gitlab.io/" target="_blank">indrijunanda</a></b>
            </span>
          </div>
        </div>

        <div class="container my-auto py-2">
          <div class="copyright text-center my-auto">
            <span>copyright &copy; <script> document.write(new Date().getFullYear()); </script> - distributed by
              <b><a href="https://themewagon.com/" target="_blank">themewagon</a></b>
            </span>
          </div>
        </div>
      </footer>
      <!-- Footer -->
    </div>
  </div>
</div>
  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="${pageContext.request.contextPath}/resources/admin_template/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/js/ruang-admin.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/vendor/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/js/demo/chart-area-demo.js"></script>  
</body>

</html>