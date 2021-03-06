<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="ceoBase.jsp" %>
	<br>
	<div>
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
				<h4 class="card-title">체험 차트</h4>
				<div class="card latest-update-card">
									<div>
									<canvas id="myChart"></canvas>
									<div align="center">
									<div class="card-header bg-white">
									<button id="btn22" class="btn btn-outline-light btn-sm">2022</button>
									<button id="btn23" class="btn btn-outline-light btn-sm">2023</button>
									<button id="btn24" class="btn btn-outline-light btn-sm">2024</button>
									</div>
									</div>
								</div>
				</div>
				</div>
				</div>
				</div>
<!-- Plugin js for this page-->
<script src="${pageContext.request.contextPath}/resources/ceo_template/pages/charts/chart.js/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>
	 <script>
   let today = new Date();
   let year = today.getFullYear(); 
   console.log(year);
   
   
   let ctx = document.getElementById('myChart').getContext('2d');
   let myChart = new Chart(ctx, {
       type: 'bar',
       data: {
           labels: [],
           datasets: [{
               label: '',
               data: [],
               backgroundColor: [],
               borderColor: [],
               borderWidth: 1
           }]
       },
       options: {
           scales: {
               y: {
                   beginAtZero: true
               }
           }
       }
   });
   $(document).ready(function(){
	   $('#btn22').trigger('click');
	  
   });
   $('#btn22').click(function(){
	      
	      
	      $.ajax({
	         type:'get',
	         url:'${pageContext.request.contextPath}/getExpTotalInOfMonthByYear?year='+year,
	         success:function(json){
	            console.log(json)
	            // json변수값 -> labels와 data로 가공
	            let myLabels = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
	            let myData = [];
	            myData.push(json.january);
	            myData.push(json.february);
	            myData.push(json.march);
	            myData.push(json.april);
	            myData.push(json.may);
	            myData.push(json.june);
	            myData.push(json.july);
	            myData.push(json.august);
	            myData.push(json.september);
	            myData.push(json.october);
	            myData.push(json.november);
	            myData.push(json.december);
	            
	            myChart.data.labels = myLabels;
	            myChart.data.datasets[0].label = '체험 결제금액('+year+')';
	            myChart.data.datasets[0].data = myData;
	            myChart.data.datasets[0].backgroundColor = [
	                   'rgba(255, 99, 132, 0.2)',
	                   'rgba(54, 162, 235, 0.2)',
	                   'rgba(255, 206, 86, 0.2)',
	                   'rgba(75, 192, 192, 0.2)',
	                   'rgba(153, 102, 255, 0.2)',
	                   'rgba(255, 159, 64, 0.2)',
	                   'rgba(255, 99, 132, 0.2)',
	                   'rgba(54, 162, 235, 0.2)',
	                   'rgba(255, 206, 86, 0.2)',
	                   'rgba(75, 192, 192, 0.2)',
	                   'rgba(153, 102, 255, 0.2)',
	                   'rgba(255, 159, 64, 0.2)'
	               ];
	            myChart.data.datasets[0].boarderColor = [
	                   'rgba(255, 99, 132, 1)',
	                   'rgba(54, 162, 235, 1)',
	                   'rgba(255, 206, 86, 1)',
	                   'rgba(75, 192, 192, 1)',
	                   'rgba(153, 102, 255, 1)',
	                   'rgba(255, 159, 64, 1)',
	                   'rgba(255, 99, 132, 1)',
	                   'rgba(54, 162, 235, 1)',
	                   'rgba(255, 206, 86, 1)',
	                   'rgba(75, 192, 192, 1)',
	                   'rgba(153, 102, 255, 1)',
	                   'rgba(255, 159, 64, 1)'
	               ];
	            
	            myChart.update();
	         }
	      });
	   });
   </script>
	<!-- Apex Chart -->
	<script src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/js/plugins/apexcharts.min.js"></script>


	<!-- custom-chart js -->
	<script src="${pageContext.request.contextPath}/resources/assets/customer/dist/assets/js/pages/dashboard-main.js"></script>
</body>
</html>