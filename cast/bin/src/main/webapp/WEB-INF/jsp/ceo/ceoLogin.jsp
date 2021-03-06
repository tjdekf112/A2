<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<script src="${pageContext.request.contextPath}/resources/admin_template/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_template/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_template/js/ruang-admin.min.js"></script>
<head>

  <meta charset="UTF">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="${pageContext.request.contextPath}/resources/admin_template/img/logo/logo.png" rel="icon">
  <title>RuangAdmin - Login</title>
  <link href="${pageContext.request.contextPath}/resources/admin_template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin_template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/admin_template/css/ruang-admin.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-login">
  <!-- Login Content -->
  <div class="container-login">
    <div class="row justify-content-center">
      <div class="col-xl-6 col-lg-12 col-md-9">
        <div class="card shadow-sm my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="login-form">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Login</h1>
                  </div>
					<form method="post" action="/ceoLogin" id="ceoLoginForm">
	                    <div class="form-group">
	                      <input type="text" class="form-control" id="ceoId" name="ceoId"  placeholder="????????? ???????????? ??????????????????">
	                    </div>
	                    <div class="form-group">
	                      <input type="password" class="form-control" id="ceoPw" name="ceoPw" placeholder="??????????????? ??????????????????">
	                    </div>
	                    <div class="form-group">
	                      <button type="button" class="btn btn-primary btn-block" id="ceoLoginBtn">Login</button>
	                    </div>
					</form>
                    <hr>
					<div class="text-center">
                    	<a class="font-weight-bold small" href="register.html">????????????</a>
                  	</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>
<script>
	// ?????????????????? ???????????? ???
	$('#ceoLoginBtn').click(function(){	
		if($('#ceoId').val() == '') { // id??? ????????????
			alert('ID??? ???????????????');
			return;
		} 
		if($('#ceoPw').val() == '') { // pw??? ????????????
			alert('PW??? ???????????????');
			return;
		}
		$('#ceoLoginForm').submit(); // ?????????
	});
</script>
  <!-- Login Content -->
	
</body>

</html>