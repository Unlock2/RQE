<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	
	<title>BMT ID 기준 속도 분석</title>
	
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- 	<script type="text/javascript" src="../js/style.js"></script> -->
	<script type="text/javascript"
		src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="../js/placeholder.js"></script>
	<script type="text/javascript" src="../js/ui.js"></script>
	<script type="text/javascript" src="../js/style.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fbd114108f63ae7f837dbe2cee10a1ba"></script>
    
    <!-- Google Chart -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	
	<!-- chart.js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
    
   	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="../css/import.css" />
<!-- 	<link rel="stylesheet" type="text/css" href="../css/board.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/common.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/default.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/layout.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/login.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/style.css" /> -->
	<link rel="stylesheet" type="text/css" href="../css/modal.css" />
    
    <style>
    	#cpResultTableDiv table thead tr th,
    	#cpResultTableDiv table tbody tr td,
    	#analysisTableDiv table thead tr th,
    	#analysisTableDiv table tbody tr th,
    	#analysisTableDiv table tbody tr td
    	{
    		padding : 0;
    	}
    	#analysisTableDiv table thead tr th,
    	#analysisTableDiv table tbody tr th{
   		    width: 90px;
    	}
    	#cpResultTableDiv table tbody tr td{
    	    font-weight: bold;
   	    }
    
    </style>
</head>
<body>
	<div id=wrap>
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
		<!-- \#header -->
			<!-- #snbArea -->
			<jsp:include page="/WEB-INF/views/layouts/detailsData_subMenu.jsp"/>
			<!-- \#snbArea -->
			<section id="contents" style="width: 95%;">
				<div class="tit-page">
					<span>BMT ID 기준 속도 분석</span>
					<ul class="path">
						<li>상세 데이터</li>
						<li>BMT ID 기준 속도 분석</li>
					</ul>
					<!-- .path -->
				</div>
				<!-- tit-page -->	
					<!-- .contents -->
	                <div class="contents" style="width:100%">
	                	<!-- .search -->
	                	<jsp:include page="/WEB-INF/views/layouts/checkbox.jsp"/>
	                	<!-- /.search -->
	                	<div id="resultDiv">
	                		<div id="resultListDiv" style="width: 15%; float: left;">
	                			<table>
	                				<thead>
	                					<tr>
	                						<th>BMT_ID</th>
	                					</tr>
	                				</thead>
	                				<tbody>
	                				</tbody>
	                			</table>
	                		</div>
	                		<div id="resultMapDiv" style= "position: relative; width:85%; height:900px; z-index:1; float: right;">
	                			<div id="cpResultTableDiv" style="width:100px; position: absolute; z-index: 2; left:1px">
	                				<table style="border:3px dashed; background:white; width:100px;">
	                					<thead>
	                						<tr>
		                						<th style="width:100px">시간</th>
<!-- 		                						<th style="width:75px">구분</th> -->
	                						</tr>
	                					</thead>
	                					<tbody>
	                					</tbody>
	                				</table>
	                			</div>
<!-- 	                			<div id="analysisTableDiv" style="width: 75%; float: right; position: absolute; z-index: 2; left: 50px; width:1135px"> -->
<!-- 	                				<table style="border:3px dashed; background:white; position:absolute; z-index:2; left:170px"> -->
<!-- 		                				<thead></thead> -->
<!-- 		                				<tbody></tbody> -->
<!-- 	                				</table> -->
<!-- 	                			</div> -->
<!-- 	                			<div id="bmtIdReferenceSpeedAnalysisDiv" style= "position: relative; height:700px; z-index:1; margin-top: 228px;"> -->
	                			
<!-- 	                			</div> -->
								<div class="content">
						<!-- Chart Area Start-->
						<div
							style="display: inline-block; vertical-align: top; width: 92%; margin-left: 112px;">
<!-- 							<div> -->
<!-- 								<b>거리 기준 속도 분석</b> -->
<!-- 							</div> -->
<!-- 							<canvas id="distanceSpeedSpecificityChart" -->
<!-- 								style="display: block; width: 719px; width:1125px; height: 400px;"></canvas> -->
<!-- 						</div> -->
						<div
							style="display: inline-block; vertical-align: top; width: 83%;">
							<div>
								<b>시간 기준 속도 분석(종합)</b>
							</div>
							<canvas id="timeSpeedSpecificityChart"></canvas>
						</div>
						<!-- Chart Area End-->
					</div>

	                		</div>
	                	
	                	</div>
	               	</div>
	               	<!-- /.contents -->
			 </section>
				<!-- /.contents -->
		</section>
		<!--  #container -->
		<footer>
			<p class="copyright">Copyright ⓒ 2018. WaveM Co. All rights
					reserved.</p>
		</footer>             
	</div>
<!-- .wrap -->
</body>
	<script>
		
		
		$(document).ready(function() {
			
			$('.btnSearch').attr('href', 'javascript:bmtIdReferenceSpeedAnalysis()');
			
			notFoundResult();
	
		});//document.ready
		
	    
	    /**
	     * 검색된 값이 없는 경우
	     */
	     notFoundResult = function() {
	     	$('#tbl-specific-list').children('tbody').append('<tr><td colspan="3">검색된 값이 없습니다</tr>');
	     	$('#tbl-specific-info').children('tbody').append('<tr><td colspan="5">검색된 값이 없습니다</tr>');					
	 		$('#tbl-specific-etc1').text('검색된 값이 없습니다');
	 		$('#tbl-specific-etc2').text('검색된 값이 없습니다');
	 		$('#tbl-specific-etc3').text('검색된 값이 없습니다');
	     };
	    
	     
	     /** 
	     *	데이터 조회
	     */
		bmtIdReferenceSpeedAnalysis = function(){
			var list1 = $('#tbl-specific-list').children('tbody');
	    	var list2 = $('#tbl-specific-info').children('tbody');
	    	var image = $('#specific-image');
	    	
	    	//시간대 특성 체크된 개수 확인
	    	var count_time = $('.timecheck input:checked').length;
	    	if (count_time < 1) {
	    		alert('시간대특성 및 거리특성을 1개 이상 선택해 주시기바랍니다.');
				return false;
			}
	    	
	    	//거리 특성 체크된 개수 확인
	    	var count_distance = $('.distance input:checked').length;
	    	if (count_distance < 1) {
	    		alert('거리특성을 1개 이상 선택해 주시기바랍니다.');
				return false;
			}
	    	
	    	//시작날짜 종료날짜 입력 확인
	    	var start = $('#bmt-start-date').val();
			var end = $('#bmt-end-date').val();
			if (start == null || start == '' || end == null || end == '') {
				return false;
			}
	    	 
			$("#resultListDiv > table > tbody").empty();
			
			$.ajax({
				url : '/detailsData/getBmtIdSpeedList'
				, type : 'post'
				, dataType : 'json'
	 			, data : $('#search-bmt').serializeObject()
				, processData : true /*querySTring make false*/
				, success : function(data, stat, xhr) {
					var resultListHtml = '';
					for(var i = 0; i < data.list.length; i++){
						resultListHtml += '<tr onclick="selectBmtId(\''+data.list[i].bmtid+'\')">';
						resultListHtml += '<td>' +data.list[i].bmtid+ '</td>';
						resultListHtml += '</tr>';
						
					}
					$("#resultListDiv > table > tbody").html(resultListHtml);
				}
				, error : function(xhr, stat, err) {
			    	alert("error");
			    	console.log(err);
			    }
			});
    	}
			
		selectBmtId = function(bmtId){
			var data = {
					bmtid : bmtId
					//, userid : "user01"				
			};
			
			
			
			// 시간대별 속도 산출을 위해서는 for문을 수정해야 하겠다. 쿼리 받으면 데이터에 따른 것을 넣어야 할 듯 싶다.
			function distanceSpecificity(dis) {

				var ctx = document.getElementById("distanceSpeedSpecificityChart");
				var cpName = [];
				var distance = [];
				var speed = [];

				if (dis.length != 0) {
					for (var i = 0; i < dis.length; i++) {
						cpName.push(dis[i].cp);
						shortest_distance.push(dis[i].shortest_distance);
						short_distance.push(dis[i].short_distance);
						medium_distance.push(dis[i].medium_distance);
						long_distance.push(dis[i].long_distance);
						longest_distance.push(dis[i].longest_distance);
					}
				}

				var distanceChart = new Chart(ctx, {
					type : 'line',
					data : {
						labels : cpName,
						datasets : [ {
							label : '초단거리',
							data : shortest_distance,
							borderColor : 'rgba(255, 0, 0, 1)',
							backgroundColor : 'transparent'
						}, {
							label : '단거리',
							data : short_distance,
							borderColor : 'rgba(0, 125, 0, 1)',
							backgroundColor : 'transparent'
						}, {
							label : '중거리',
							data : medium_distance,
							borderColor : 'rgba(0, 0, 0, 1)',
							backgroundColor : 'transparent'
						}, {
							label : '장거리',
							data : long_distance,
							borderColor : 'rgba(0, 0, 125, 1)',
							backgroundColor : 'transparent'
						}, {
							label : '초장거리',
							data : longest_distance,
							borderColor : 'rgba(0, 0, 255, 1)',
							backgroundColor : 'transparent'
						} ]
					},
					options : {
						elements : {
							line : {
								tension : 0
							}
						},
						legend : {
							display : true,
							position : 'bottom'
						}
					}
				});
			}	
			
			
// 			$.ajax({
// 				url : '/detailsData/getBmtIdSpeedListDetail'
// 		        , type : 'post'
// 				, dataType : 'json'
// 	 			, data : JSON.stringify(data)
// 				, contentType : 'application/json; charset=UTF-8'
// 				, success : function(data, stat, xhr) {
// 					var userList = data.list.userList;
// 					var colorList = [];
// 					getColor(userList, colorList);
// 					console.log(data);
// 					// cp list 테이블
// 					if(data.list.userList != null && data.list.userList != ''){
// 						//var userList = data.list.userList;
// 						var userListHtml = '';
// 						$("#cpResultTableDiv > table > tbody").empty();
// 						for(var i = 0; i < userList.length; i++){
// 							//var color = getRandomColor();
// 							userListHtml += '<tr>';
// 							userListHtml += '<td>'+userList[i].cp+'</td>';
// 							userListHtml += '<td style="background-color:'+ colorList[i] +'"></td>';
// 							userListHtml += '</tr>';
// 							//colorList.push(color);
// 						}
// 						$("#cpResultTableDiv > table > tbody").html(userListHtml);
// 					}
// 					// 분석데이터
// 					if(data.list.analysisList != null && data.list.analysisList != ''){
// 						var analysisList = data.list.analysisList;				
// 						$("#analysisTableDiv > table > thead").empty();
// 						$("#analysisTableDiv > table > tbody").empty();
// 						var subHeadHtml1 = '';
// 						var subHeadHtml2 = '<tr><th>CP</th>';
// 						var subHeadHtml3 = '<tr><th>구간주행상태</th>';
// 						subHeadHtml1 += '<tr>';
// 						subHeadHtml1 += '<th style="width:15px;">BMTID</th>';
// 						subHeadHtml1 += '<th colspan="'+analysisList.length+'">'+ analysisList[0].bmtid +'</th>';
// 						subHeadHtml1 += '</tr>';
// 						// 분석데이터 헤더
// 						for(var i = 0; i < analysisList.length; i++){
// 							subHeadHtml2 += '<th>';
// 							subHeadHtml2 += analysisList[i].cp;
// 							subHeadHtml2 += '</th>';
// 							subHeadHtml3 += '<th>';
// 							subHeadHtml3 += analysisList[i].bmt_condition;
// 							subHeadHtml3 += '</th>';
// 						}
// 						subHeadHtml1 += '</tr>';
// 						subHeadHtml2 += '</tr>';
// 						var subHeadHtml = subHeadHtml1 + subHeadHtml2 + subHeadHtml3;

// 						$("#analysisTableDiv > table > thead").html(subHeadHtml);
						
						
// 						// 분석 데이터 tbody 부분
// 						var subBodyHtml1 = '<tr><th>예상 소요 시간</th>';
// 						var subBodyHtml2 = '<tr><th>실제 소요 시간</th>';
// 						var subBodyHtml3 = '<tr><th>예상 소요 거리</th>';
// 						var subBodyHtml4 = '<tr><th>실제 소요 거리</th>';
// 						var subBodyHtml5 = '<tr><th>예상 소요 요금</th>';
// 						var subBodyHtml6 = '<tr><th>실제 소요 요금</th>';
						
// 						for(var i = 0; i < analysisList.length; i++){
// 							subBodyHtml1 += '<td>';
// 							subBodyHtml1 += analysisList[i].est_time;
// 							subBodyHtml1 += '</td>';
							
// 							subBodyHtml2 += '<td>';
// 							subBodyHtml2 += analysisList[i].driver_tm;
// 							subBodyHtml2 += '</td>';
							
// 							subBodyHtml3 += '<td>';
// 							subBodyHtml3 += analysisList[i].est_distance;
// 							subBodyHtml3 += '</td>';
							
// 							subBodyHtml4 += '<td>';
// 							subBodyHtml4 += analysisList[i].arrive_distance;
// 							subBodyHtml4 += '</td>';
							
// 							subBodyHtml5 += '<td>';
// 							subBodyHtml5 += analysisList[i].est_charge;
// 							subBodyHtml5 += '</td>';
							
// 							subBodyHtml6 += '<td>';
// 							subBodyHtml6 += analysisList[i].arrive_charge;
// 							subBodyHtml6 += '</td>';
// 						}
// 						subBodyHtml1 += '</tr>';
// 						subBodyHtml2 += '</tr>';
// 						subBodyHtml3 += '</tr>';
// 						subBodyHtml4 += '</tr>';
// 						subBodyHtml5 += '</tr>';
// 						subBodyHtml6 += '</tr>';
						
// 						var subHeadHtml = subBodyHtml1 
// 										+ subBodyHtml2 
// 										+ subBodyHtml3 
// 										+ subBodyHtml4 
// 										+ subBodyHtml5 
// 										+ subBodyHtml6;
// 						$("#analysisTableDiv > table > tbody").html(subHeadHtml);
// 					}
						
// 					for(var i= 0 ; i < polylineList.length; i++) {
// 						polylineList[i].setMap(null);
// 					}
					
// 					polylineList= [];
// 					var centerLat = 0;
// 					var centerLon = 0;
// 					if(data.list.gpsDataList.length != null && data.list.gpsDataList != ''){
// 						var gpsDataList = data.list.gpsDataList;
// 						centerLat = gpsDataList[0][0].lat;
// 						centerLon = gpsDataList[0][0].lon;
// 						for(var i = 0; i < gpsDataList.length; i++){
// 							var linePath = [];
// 							for(var j = 0; j < gpsDataList[i].length ; j++){
// 								linePath.push(new daum.maps.LatLng(gpsDataList[i][j].lat, gpsDataList[i][j].lon));
// // 								centerLat += parseFloat(gpsDataList[i][j].lat);
// // 								centerLon += parseFloat(gpsDataList[i][j].lon);
// 							}
// // 							centerLat = centerLat / gpsDataList[i].length;								
// // 							centerLon = centerLon / gpsDataList[i].length;								
							
// 							var polyline = new daum.maps.Polyline({
// 							    path: linePath, // 선을 구성하는 좌표배열 입니다
// 							    strokeWeight: 5, // 선의 두께 입니다
// 							    strokeColor: colorList[i], // 선의 색깔입니다
// 							    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
// 							    strokeStyle: 'solid' // 선의 스타일입니다
// 							});
// 							polyline.setMap(map);
// 							polylineList.push(polyline);
// 						}
// 					}
// 					map.setCenter(new daum.maps.LatLng(centerLat ,centerLon));
// 				}
// 				, error : function(xhr, stat, err) {
// 			    	alert("error");
// 			    	console.log("xhr" + xhr);
// 			    	console.log("stat" + stat);
// 			    	console.log("err" + err);
// 			    }
// 			});
		}
		
		function getColor(userList, colorList) {
			var co = ['#FF0000', '#0000FF', '#FFFF00', '#00FF00', '#FFA500', '#BA55D3', '#8B4513', '#C0C0C0', '#EE82EE', '#00BFFF'];
			var cnt = userList.length;
			if (cnt <= 10) {
	  			for (var i = 0; i < cnt; i++) {
	  				colorList.push(co[i]);
	  	  		};
			} else {
				for (var i = 0; i < 10; i++) {
					colorList.push(co[i]);
	  	  		};	
	  	  		for (var i = 10; i < cnt; i++) {
	  	  			// getRandomColor()은 common.js 안에 있습니다.
		  			colorList.push(getRandomColor());
		  		};
			}
		};
	</script>
</html>