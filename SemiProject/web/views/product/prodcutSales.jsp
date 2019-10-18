<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
	
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
					['월', '책상', '의자', '옷걸이', '빨랫대', '이불'],
					['2019/05',  589000,      450000,         123000,             50000,           450000],
					['2019/06',  600000,      320000,        231000,             40000,          288000],
					['2019/07',  870000,      470000,        245000,             60000,           397000],
					['2019/08',  780000,      520000,        198000,             80000,           215000],
					['2019/09',  680000,      655000,         210000,             90000,          366000]
				]);
			var options = {
					title : '5월~9월 매출그래프',
					vAxis: {title: 'Cups'},
					hAxis: {title: 'Month'}, 
					seriesType: 'bars',
					series: {5: {type: 'line'}}
				};
			
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script><style>
#centerbody {
	display: inline-block;
	position: relative;
	width: 85%;
	height: 100%;
	border : 1px solid black;
	margin-left: 250px;
	}
</style>

</head>
<body>
<%@ include file = "/views/company/companyMenubar.jsp" %> 


<div id="centerbody">
	<div id="chart_div" style="width:900px; height:500px;">
	
	</div>

</div>

</body>
</html>