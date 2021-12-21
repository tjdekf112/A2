<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Ablepro v8.0 bootstrap admin template by Phoenixcoded</title>
<!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 11]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />
<!-- Favicon icon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/images/favicon.ico"
	type="image/x-icon">
<!-- vendor css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/css/style.css">

</head>
<body class="">
	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>
	<!-- [ Pre-loader ] End -->
	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar menu-light ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div ">

				<div class="">
					<div class="main-menu-header">
						<img class="img-radius"
							src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/images/user/avatar-2.jpg"
							alt="User-Profile-Image">
						<div class="user-details">
							<div id="more-details">${loginCustomerId}<i
									class="fa fa-caret-down"></i>
							</div>
						</div>
					</div>
					<div class="collapse" id="nav-user-link">
						<ul class="list-unstyled">
							<li class="list-group-item"><a
								href="/myinfo?customerId=${loginCustomerId}"><i
									class="feather icon-user m-r-5"></i>내 정보</a></li>
							<li class="list-group-item"><a
								href="/setting?customerId=${loginCustomerId}"><i
									class="feather icon-settings m-r-5"></i>Settings</a></li>
							<li class="list-group-item"><a href="/logOut"><i
									class="feather icon-log-out m-r-5"></i>Logout</a></li>
						</ul>
					</div>
				</div>

				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-menu-caption"><label>Navigation</label>
					</li>
					<li class="nav-item"><a
						href="/customer/customerIndex?customerId=${loginCustomerId}&currentPage=1"
						class="nav-link "><span class="pcoded-micon"><i
								class="feather icon-home"></i></span><span class="pcoded-mtext">Dashboard</span></a>
					</li>
					<li class="nav-item pcoded-hasmenu"><a href="#!"
						class="nav-link "><span class="pcoded-micon"><i
								class="feather icon-layout"></i></span><span class="pcoded-mtext">관심상품</span></a>
						<ul class="pcoded-submenu">
							<li><a href="layout-vertical.html" target="_blank">체험
									관심상품</a></li>
							<li><a href="layout-horizontal.html" target="_blank">숙소
									관심상품</a></li>
						</ul></li>
					<li class="nav-item pcoded-menu-caption"><label>UI
							Element</label></li>
					<li class="nav-item pcoded-hasmenu"><a href="#!"
						class="nav-link "><span class="pcoded-micon"><i
								class="feather icon-box"></i></span><span class="pcoded-mtext">Basic</span></a>
						<ul class="pcoded-submenu">
							<li><a href="bc_alert.html">Alert</a></li>
							<li><a href="bc_button.html">Button</a></li>
							<li><a href="bc_badges.html">Badges</a></li>
							<li><a href="bc_breadcrumb-pagination.html">Breadcrumb &
									paggination</a></li>
							<li><a href="bc_card.html">Cards</a></li>
							<li><a href="bc_collapse.html">Collapse</a></li>
							<li><a href="bc_carousel.html">Carousel</a></li>
							<li><a href="bc_grid.html">Grid system</a></li>
							<li><a href="bc_progress.html">Progress</a></li>
							<li><a href="bc_modal.html">Modal</a></li>
							<li><a href="bc_spinner.html">Spinner</a></li>
							<li><a href="bc_tabs.html">Tabs & pills</a></li>
							<li><a href="bc_typography.html">Typography</a></li>
							<li><a href="bc_tooltip-popover.html">Tooltip & popovers</a></li>
							<li><a href="bc_toasts.html">Toasts</a></li>
							<li><a href="bc_extra.html">Other</a></li>
						</ul></li>
					<li class="nav-item pcoded-menu-caption"><label>QNA</label></li>
					<li class="nav-item"><a
						href="/qnaList?customerId=${loginCustomerId}&currentPage=1"
						class="nav-link "><span class="pcoded-micon"><i
								class="feather icon-file-text"></i></span><span class="pcoded-mtext">Qna</span></a>
					</li>
					<li class="nav-item pcoded-menu-caption"><label>Chart
							& Maps</label></li>
					<li class="nav-item"><a href="chart-apex.html"
						class="nav-link "><span class="pcoded-micon"><i
								class="feather icon-pie-chart"></i></span><span class="pcoded-mtext">Chart</span></a>
					</li>
					<li class="nav-item"><a href="map-google.html"
						class="nav-link "><span class="pcoded-micon"><i
								class="feather icon-map"></i></span><span class="pcoded-mtext">Maps</span></a>
					</li>
					<li class="nav-item pcoded-menu-caption"><label>Pages</label>
					</li>
					<li class="nav-item pcoded-hasmenu"><a href="#!"
						class="nav-link "><span class="pcoded-micon"><i
								class="feather icon-lock"></i></span><span class="pcoded-mtext">Authentication</span></a>
						<ul class="pcoded-submenu">
							<li><a href="auth-signup.html" target="_blank">Sign up</a></li>
							<li><a href="auth-signin.html" target="_blank">Sign in</a></li>
						</ul></li>
					<li class="nav-item"><a href="sample-page.html"
						class="nav-link "><span class="pcoded-micon"><i
								class="feather icon-sidebar"></i></span><span class="pcoded-mtext">Sample
								page</span></a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->
	<!-- [ Header ] start -->
	<header
		class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">


		<div class="m-header">
			<a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
			<a href="#!" class="b-brand"> <!-- ========   change your logo hear   ============ -->
				<img
				src="${pageContext.request.contextPath}/resources/assets/dist/assets/images/logo.png"
				alt="" class="logo"> <img
				src="${pageContext.request.contextPath}/resources/assets/dist/assets/images/logo-icon.png"
				alt="" class="logo-thumb">
			</a> <a href="#!" class="mob-toggler"> <i
				class="feather icon-more-vertical"></i>
			</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a href="#!" class="pop-search"><i
						class="feather icon-search"></i></a>
					<div class="search-bar">
						<input type="text" class="form-control border-0 shadow-none"
							placeholder="Search hear">
						<button type="button" class="close" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li>
					<div class="dropdown">
						<a class="dropdown-toggle" href="#" data-toggle="dropdown"><i
							class="icon feather icon-bell"></i></a>
						<div class="dropdown-menu dropdown-menu-right notification">
							<div class="noti-head">
								<h6 class="d-inline-block m-b-0">알람</h6>
								<div class="float-right">

									<a href="#!">clear all</a>
								</div>
							</div>
							<p class="m-b-0">NEW</p>
							<br>
							<c:forEach items="${list}" var="qna">
								<a
									href="/qnaListOne?customerId=${loginCustomerId}&qnaId=${qna.qnaId}">
									${qna.qnaId}번, ${qna.qnaTitle} 제목에 헤당하는 QNA 게시글에 답글이 달렸습니다. </a>
								<br>
							</c:forEach>






							<div class="noti-footer">
								<a href="#!">show all</a>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown drp-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i
							class="feather icon-user"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right profile-notification">
							<div class="pro-head">
								<img
									src="${pageContext.request.contextPath}/resources/assets/dist/assets/images/user/avatar-1.jpg"
									class="img-radius" alt="User-Profile-Image"> <span>John
									Doe</span> <a href="auth-signin.html" class="dud-logout"
									title="Logout"> <i class="feather icon-log-out"></i>
								</a>
							</div>
							<ul class="pro-body">
								<li><a href="user-profile.html" class="dropdown-item"><i
										class="feather icon-user"></i> Profile</a></li>
								<li><a href="email_inbox.html" class="dropdown-item"><i
										class="feather icon-mail"></i> My Messages</a></li>
								<li><a href="auth-signin.html" class="dropdown-item"><i
										class="feather icon-lock"></i> Lock Screen</a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</header>
	<!-- [ Header ] end -->



	<!-- [ Main Content ] start -->
	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ breadcrumb ] start -->
			<div class="page-header">
				<div class="page-block">
					<div class="row align-items-center">
						<div class="col-md-12">
							<div class="page-header-title">
								<h5 class="m-b-10">Dashboard Analytics</h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="/index"><i
										class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a href="/index">go to
										MainMenu</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->
			<!-- [ Main Content ] start -->
			<div class="row">
				<div class="col-lg-7 col-md-12">
					<!-- support-section start -->
					<div class="row">
						<div class="col-sm-6">
							<div class="card support-bar overflow-hidden">
								<div class="card-body pb-0">
									<h2 class="m-0">350</h2>
									<span class="text-c-blue">월별 결제</span>
									<p class="mb-3 mt-3">#</p>
								</div>
								<div id="support-chart"></div>
								<div class="card-footer bg-primary text-white">
									<div class="row text-center">
										<div class="col">
											<h4 class="m-0 text-white">10</h4>
											<span>Open</span>
										</div>
										<div class="col">
											<h4 class="m-0 text-white">5</h4>
											<span>Running</span>
										</div>
										<div class="col">
											<h4 class="m-0 text-white">3</h4>
											<span>Solved</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="card support-bar overflow-hidden">
								<div class="card-body pb-0">
									<h2 class="m-0">350</h2>
									<span class="text-c-green">연별 예약</span>
									<p class="mb-3 mt-3">#</p>
								</div>
								<div id="support-chart1"></div>
								<div class="card-footer bg-success text-white">
									<div class="row text-center">
										<div class="col">
											<h4 class="m-0 text-white">10</h4>
											<span>Open</span>
										</div>
										<div class="col">
											<h4 class="m-0 text-white">5</h4>
											<span>Running</span>
										</div>
										<div class="col">
											<h4 class="m-0 text-white">3</h4>
											<span>Solved</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- support-section end -->
				</div>
				<div class="col-lg-5 col-md-12">
					<!-- page statustic card start -->
					<div class="row">
						<div class="col-sm-6">
							<div class="card">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-8">
											<h4 class="text-c-yellow">$30200</h4>
											<h6 class="text-muted m-b-0">총 결제금액</h6>
										</div>
										<div class="col-4 text-right">
											<i class="feather icon-bar-chart-2 f-28"></i>
										</div>
									</div>
								</div>
								<div class="card-footer bg-c-yellow">
									<div class="row align-items-center">
										<div class="col-9">
											<p class="text-white m-b-0">% change</p>
										</div>
										<div class="col-3 text-right">
											<i class="feather icon-trending-up text-white f-16"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="card">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-8">
											<h4 class="text-c-green">290+</h4>
											<h6 class="text-muted m-b-0">총 예약 수</h6>
										</div>
										<div class="col-4 text-right">
											<i class="feather icon-file-text f-28"></i>
										</div>
									</div>
								</div>
								<div class="card-footer bg-c-green">
									<div class="row align-items-center">
										<div class="col-9">
											<p class="text-white m-b-0">% change</p>
										</div>
										<div class="col-3 text-right">
											<i class="feather icon-trending-up text-white f-16"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="card">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-8">
											<h4 class="text-c-red">145</h4>
											<h6 class="text-muted m-b-0">추천 댓글 수</h6>
										</div>
										<div class="col-4 text-right">
											<i class="feather icon-calendar f-28"></i>
										</div>
									</div>
								</div>
								<div class="card-footer bg-c-red">
									<div class="row align-items-center">
										<div class="col-9">
											<p class="text-white m-b-0">% change</p>
										</div>
										<div class="col-3 text-right">
											<i class="feather icon-trending-down text-white f-16"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="card">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-8">
											<h4 class="text-c-blue">500</h4>
											<h6 class="text-muted m-b-0">상품 후기 수</h6>
										</div>
										<div class="col-4 text-right">
											<i class="feather icon-thumbs-down f-28"></i>
										</div>
									</div>
								</div>
								<div class="card-footer bg-c-blue">
									<div class="row align-items-center">
										<div class="col-9">
											<p class="text-white m-b-0">% change</p>
										</div>
										<div class="col-3 text-right">
											<i class="feather icon-trending-down text-white f-16"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- page statustic card end -->
				</div>
				<!-- prject ,team member start -->
			<div class="col-xl-8 col-md-12">
				<div class="card table-card review-card">
						<div class="card-body">
							<div class="card latest-update-card">
								<div class="card-header">
									<h5>업데이트된 상품</h5>
									<div class="card-header-right">
										<div class="btn-group card-option">
											<button type="button" class="btn dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">
												<i class="feather icon-more-horizontal"></i>
											</button>
											<ul
												class="list-unstyled card-option dropdown-menu dropdown-menu-right">
												<li class="dropdown-item full-card"><a href="#!"><span><i
															class="feather icon-maximize"></i> maximize</span><span
														style="display: none"><i
															class="feather icon-minimize"></i> Restore</span></a></li>
												<li class="dropdown-item minimize-card"><a href="#!"><span><i
															class="feather icon-minus"></i> collapse</span><span
														style="display: none"><i class="feather icon-plus"></i>
															expand</span></a></li>
												<li class="dropdown-item reload-card"><a href="#!"><i
														class="feather icon-refresh-cw"></i> reload</a></li>
												<li class="dropdown-item close-card"><a href="#!"><i
														class="feather icon-trash"></i> remove</a></li>
											</ul>
										</div>
									</div>
								</div>

								<div class="card-body">
									<div style="width: 45%; display: inline-block;" class="float-left">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>1</th>
													<th>2</th>
													<th>3</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div style="width: 45%; display: inline-block;" class="float-right">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>1</th>
													<th>2</th>
													<th>3</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-md-12">
					<div class="card chat-card">
						<div class="card-header">
							<h5>Chat</h5>
							<div class="card-header-right">
								<div class="btn-group card-option">
									<button type="button" class="btn dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="feather icon-more-horizontal"></i>
									</button>
									<ul
										class="list-unstyled card-option dropdown-menu dropdown-menu-right">
										<li class="dropdown-item full-card"><a href="#!"><span><i
													class="feather icon-maximize"></i> maximize</span><span
												style="display: none"><i
													class="feather icon-minimize"></i> Restore</span></a></li>
										<li class="dropdown-item minimize-card"><a href="#!"><span><i
													class="feather icon-minus"></i> collapse</span><span
												style="display: none"><i class="feather icon-plus"></i>
													expand</span></a></li>
										<li class="dropdown-item reload-card"><a href="#!"><i
												class="feather icon-refresh-cw"></i> reload</a></li>
										<li class="dropdown-item close-card"><a href="#!"><i
												class="feather icon-trash"></i> remove</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="row m-b-20 received-chat">
								<div class="col-auto p-r-0">
									<img
										src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/images/user/avatar-2.jpg"
										alt="user image" class="img-radius wid-40">
								</div>
								<div class="col">
									<div class="msg">
										<p class="m-b-0">Nice to meet you!</p>
									</div>
									<p class="text-muted m-b-0">
										<i class="fa fa-clock-o m-r-10"></i>10:20am
									</p>
								</div>
							</div>
							<div class="row m-b-20 send-chat">
								<div class="col">
									<div class="msg">
										<p class="m-b-0">Nice to meet you!</p>
									</div>
									<p class="text-muted m-b-0">
										<i class="fa fa-clock-o m-r-10"></i>10:20am
									</p>
								</div>
								<div class="col-auto p-l-0">
									<img
										src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/images/user/avatar-3.jpg"
										alt="user image" class="img-radius wid-40">
								</div>
							</div>
							<div class="row m-b-20 received-chat">
								<div class="col-auto p-r-0">
									<img
										src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/images/user/avatar-2.jpg"
										alt="user image" class="img-radius wid-40">
								</div>
								<div class="col">
									<div class="msg">
										<p class="m-b-0">Nice to meet you!</p>
										<img
											src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/images/widget/dashborad-1.jpg"
											alt=""> <img
											src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/images/widget/dashborad-3.jpg"
											alt="">
									</div>
									<p class="text-muted m-b-0">
										<i class="fa fa-clock-o m-r-10"></i>10:20am
									</p>
								</div>
							</div>
							<div class="form-group m-t-15">
								<label class="floating-label" for="Project">Send message</label>
								<input type="text" name="task-insert" class="form-control"
									id="Project">
								<div class="form-icon">
									<button class="btn btn-primary btn-icon">
										<i class="feather icon-message-circle"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>

					<!-- prject ,team member start -->

					<!-- Latest Customers start -->
	</div>
			<div class="col-lg-12 col-md-12">
					<div class="card table-card">
						<div class="card-header">
							<h5>QNA</h5>
							<div class="card-header-right">
								<div class="btn-group card-option">
									<button type="button" class="btn dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="feather icon-more-horizontal"></i>
									</button>
									<ul
										class="list-unstyled card-option dropdown-menu dropdown-menu-right">
										<li class="dropdown-item full-card"><a href="#!"><span><i
													class="feather icon-maximize"></i> maximize</span><span
												style="display: none"><i
													class="feather icon-minimize"></i> Restore</span></a></li>
										<li class="dropdown-item minimize-card"><a href="#!"><span><i
													class="feather icon-minus"></i> collapse</span><span
												style="display: none"><i class="feather icon-plus"></i>
													expand</span></a></li>
										<li class="dropdown-item reload-card"><a href="#!"><i
												class="feather icon-refresh-cw"></i> reload</a></li>
										<li class="dropdown-item close-card"><a href="#!"><i
												class="feather icon-trash"></i> remove</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table table-hover mb-0">
									<thead>
										<tr>
											<th>
												<div class="chk-option">
													<label
														class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
														<input type="checkbox" class="custom-control-input">
														<span class="custom-control-label"></span>
													</label>
												</div> 제목
											</th>
											<th>작성자</th>
											<th>작성 날짜</th>
											<th class="text-right">비밀글</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${qnaList}" var="qna">

											<tr>
												<td>
													<div class="chk-option">
														<label
															class="check-task custom-control custom-checkbox d-flex justify-content-center done-task">
															<input type="checkbox" class="custom-control-input">
															<span class="custom-control-label"></span>
														</label>
													</div>
													<div class="d-inline-block align-middle">
														<img
															src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/images/user/avatar-4.jpg"
															alt="user image"
															class="img-radius wid-40 align-top m-r-15">
														<div class="d-inline-block">
															<h6>
																<a
																	href="/customer/qnaListOne?qnaId=${qna.qnaId}&customerId=${loginCustomerId}&currentPage=${currentPage}">${qna.qnaTitle}</a>
															</h6>
														</div>
													</div>
												</td>
												<td>${qna.customerId}</td>
												<td>${qna.createDate}</td>
												<td class="text-right"><label
													class="badge badge-light-danger">${qna.qnaSecret}</label></td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
								<div class="text-center table container mt-3">
									<c:if test="${currentPage > 1}">
										<a href="/customer/customerIndex?customerId=${loginCustomerId}&currentPage=${currentPage-1}">이전</a>
									</c:if>
									<c:if test="${currentPage < lastPage}">
										<a href="/customer/customerIndex?customerId=${loginCustomerId}&currentPage=${currentPage+1}">다음</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!-- [ Main Content ] end -->
				</div>
				<!-- [ Main Content ] end -->
				<!-- Warning Section start -->
				<!-- Older IE warning message -->
				<!--[if lt IE 11]>
        <div class="ie-warning">
            <h1>Warning!!</h1>
            <p>You are using an outdated version of Internet Explorer, please upgrade
               <br/>to any of the following web browsers to access this website.
            </p>
            <div class="iew-container">
                <ul class="iew-download">
                    <li>
                        <a href="http://www.google.com/chrome/">
                            <img src="${pageContext.request.contextPath}/resources/assets/dist/assets/images/browser/chrome.png" alt="Chrome">
                            <div>Chrome</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.mozilla.org/en-US/firefox/new/">
                            <img src="${pageContext.request.contextPath}/resources/assets/dist/assets/images/browser/firefox.png" alt="Firefox">
                            <div>Firefox</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.opera.com">
                            <img src="${pageContext.request.contextPath}/resources/assets/dist/assets/images/browser/opera.png" alt="Opera">
                            <div>Opera</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.apple.com/safari/">
                            <img src="${pageContext.request.contextPath}/resources/assets/dist/assets/images/browser/safari.png" alt="Safari">
                            <div>Safari</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                            <img src="${pageContext.request.contextPath}/resources/assets/dist/assets/images/browser/ie.png" alt="">
                            <div>IE (11 & above)</div>
                        </a>
                    </li>
                </ul>
            </div>
            <p>Sorry for the inconvenience!</p>
        </div>
    <![endif]-->
				<!-- Warning Section Ends -->

				<!-- Required Js -->
				<script
					src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/js/vendor-all.min.js"></script>
				<script
					src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/js/plugins/bootstrap.min.js"></script>
				<script
					src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/js/ripple.js"></script>
				<script
					src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/js/pcoded.min.js"></script>

				<!-- Apex Chart -->
				<script
					src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/js/plugins/apexcharts.min.js"></script>


				<!-- custom-chart js -->
				<script
					src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/js/pages/dashboard-main.js"></script>
</body>

</html>
