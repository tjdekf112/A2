<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${pageContext.request.contextPath}/resources/admin_template/img/logo/logo.png" rel="icon">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
    <%@ include file="adminSidebar.jsp"%>
    
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        
        <!-- adminTopbar include -->
		<%@ include file="adminTopbar.jsp"%>

        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">전시소개 수정</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/adminIndex">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">전시소개</li>
            </ol>
          </div>
		<div class="container" style="text-align:center">
	<div class="card">
		<c:forEach items="${exhibition}" var="exhibition">
      <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-primary">전시소개 수정</h6>
      </div>
      <div class="table-responsive">
		 <form method="post" action="${pageContext.request.contextPath}/admin/updateExhibition" id="updateExhibitionForm">
		 	<input type="hidden" name="exhibitionNo" value="${exhibition.exhibitionNo}" readonly="readonly">
			<table class="table align-items-center table-flush">
				<tr>
					<td width="10%" style="text-align: right">제목</td>
					<td width="80%"><input type="text" id="exhibitionTitle" name="exhibitionTitle" style="width:685px; text-align: center" value="${exhibition.exhibitionTitle}"></td>
				</tr>
				<tbody>
					<tr>
						<td width="15%" style="text-align: right">소개 내용</td>
						<td width="80%"><input type="text" id="exhibitionIntro" name="exhibitionIntro"style="width:685px; text-align: center" value="${exhibition.exhibitionIntro}"></td>
					</tr>
					<tr>
						<td style="text-align: right">내용</td>
						<td><textarea id="exhibitionContent" name="exhibitionContent" rows="10" cols="80">${exhibition.exhibitionContent}</textarea></td>
					</tr>
				</tbody>
			</table>
			<button id="updateExhibitionBtn" type="button" class="btn btn-outline-success">수정</button>
		</form>
		<br>
	</div>
	</c:forEach>
</div>

          <!-- Modal Logout include 로그아웃 클릭 시 나타나는 메시지 창-->
          <%@ include file="adminModalLogout.jsp"%>

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
  
    <script>
  $(function(){
	  $('#updateExhibitionBtn').click(function(){
	        if($('#exhibitionTitle').val() == '') {
	           alert('수정할 제목을 입력해주세요.');
	           return;
	        } else if($('#exhibitionIntro').val() == '') {
		           alert('수정할 소개 내용을 입력해주세요.');
		           return;
	        } else if($('#exhibitionContent').val() == '') {
		           alert('수정할 내용을 입력해주세요.');
		           return;
	  		} else {
	           $('#updateExhibitionForm').submit();
	        }
	     });
		/*
		$('#updateExhibitionForm').keypress(function(event){
			if(event.which == 13) {
				$('#updateExhibitionBtn').click();
				return false;
			}
		});
		*/
	  });
  </script>
  
  <script src="${pageContext.request.contextPath}/resources/admin_template/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/js/ruang-admin.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/vendor/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/admin_template/js/demo/chart-area-demo.js"></script>  
</body>

</html>