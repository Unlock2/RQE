<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>통행 요금</title>

<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- <script type="text/javascript" src="../js/style.js"></script> -->
<script type="text/javascript"
	src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../js/placeholder.js"></script>
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript" src="../js/style.js"></script>

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
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/common.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/default.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/layout.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/login.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css" /> -->
<link rel="stylesheet" type="text/css" href="../css/modal.css" />

</head>
<body>
	<div id=wrap>
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
		<!-- \#header -->
		<!-- #snbArea -->
		<jsp:include page="/WEB-INF/views/layouts/detailsData_subMenu.jsp" />
		<!-- \#snbArea -->
		<section id="contents" style="width: 95%;">
			<div class="tit-page">
				<span>통행 요금</span>
				<ul class="path">
					<li>상세 데이터</li>
					<li>통행 요금</li>
				</ul>
				<!-- .path -->
			</div>
			<!-- tit-page -->

			<!-- .contents -->
			<div class="contents">
				<!-- .search -->
				<jsp:include page="/WEB-INF/views/layouts/checkbox.jsp" />
				<!-- /.search -->
				<!-- .contents -->
				<div class="row">
					<div class="contents" style="display: inline-block">
						<table class="table" id="totalDistance"
							style="width: 712px; height: 402px;">
							<thead>
								<tr>
									<th colspan="4" style="background-color: #e6e6ff;"><b>총 통행 요금</b></th>
								</tr>
								<tr>
									<th>평가 대상</th>
									<th>총계(∑)</th>
									<th>차이(Δc)</th>
									<th>차이(Δc/cmin)</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<!-- Chart Area Start-->
					<div style="display: inline-block; vertical-align: top; width: 50%">
						<canvas id="ratio_distance_chart"></canvas>
					</div>
					<!-- Chart Area End-->
				</div>
				<div class="row" style="margin-top: 40px">
					<div class="content">
						<!-- Chart Area Start-->
						<div
							style="display: inline-block; vertical-align: top; width: 45%">
							<div>
								<b>거리 특성별 총 통행 요금</b>
							</div>
							<canvas id="distanceSpecificityChart"
								style="display: block; width: 719px; height: 399px;"></canvas>
						</div>
						<div
							style="display: inline-block; vertical-align: top; width: 50%">
							<div>
								<b>시간대 특성별 총 통행 요금</b>
							</div>
							<canvas id="timeSpecificityChart"></canvas>
						</div>
						<!-- Chart Area End-->
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
	<!-- wrap -->
</body>
<script>
	$(document).ready(function() {

		$('.btnSearch').attr('href', 'javascript:pathDistanceSearch()');

		// 검색된 값이 없는경우 
		notFoundResult();

	});//document.ready

	function pathDistanceSearch() {

		var list = $('#totalDistance').children('tbody');

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
		
		// 종료날짜가 시작날짜 보다 큰 경우 alert창 띄우고 false로 return 조건문
		if (parseInt(end.replace(/-/g,'')) < parseInt(start.replace(/-/g,''))){
			alert('종료 날짜는 시작 날짜 보다 작을 수 없습니다.')
			return false;
		}

		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};

		var params = $('#search-bmt').serializeObject();

		$.ajax({
			url : '/detailsData/tollsChargeData',
			type : 'GET',
			dataType : 'json',
			data : params,
			processData : true /*querySTring make false*/
			,
			success : function(data, status, xhr) {

				list.empty();

				if (data.list.length === 0) {
					alert('검색된 값이 없습니다');
					notFoundResult();
				}
				;

				data.list.forEach(function(items) {
					var html = [ '<tr class="',  items.check_select , '">',
							'<td>', items.cp, '</td>', '<td>',
							items.sum_charge + '원', '</td>', '<td>',
							items.sub_charge + '원', '</td>', '<td>',
							items.ratio_charge + '%', '</td>', '</tr>' ]
							.join('');
					list.append(html);
				});
				//강조 표시
				$('.1').css("background-color", '#e6ffcc');
				$('.2').css("background-color", '#ffcccc');

				//그래프 함수 호출
				ratioChargeChart(data.list);
				distanceSpecificity(data.chart);
				timeSpecificity(data.chart);

			},
			error : function(status, xhr, error) {
				alert("error");
				console.log(error);
			}
		});

	}

	function ratioChargeChart(dataList) {

		var ctx = document.getElementById("ratio_distance_chart");

		var cpName = [];
		var ratioCharge = [];
		if (dataList.length != 0) {
			for (var i = 0; i < dataList.length; i++) {
				cpName.push(dataList[i].cp);
				ratioCharge.push(dataList[i].sum_charge);
			}
		}

		var radarChart = new Chart(ctx, {
			type : 'radar',
			data : {
				labels : cpName,
				datasets : [ {
					label : '총 통행 요금(Δc/cmin, 단위 : 원)',
					data : ratioCharge,
					backgroundColor : 'transparent',
					borderColor : 'rgba(0,0,255,0.3)'
				} ]
			}
		});

	}

	function distanceSpecificity(dis) {

		var ctx = document.getElementById("distanceSpecificityChart");
		var cpName = [];
		var shortest_distance = [];
		var short_distance = [];
		var medium_distance = [];
		var long_distance = [];
		var longest_distance = [];

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

	function timeSpecificity(time) {

		var ctx = document.getElementById("timeSpecificityChart");
		var cpName = [];
		var am_peak = [];
		var am_non_peak = [];
		var am = [];
		var pm_peak = [];
		var pm_non_peak = [];
		var pm = [];

		if (time.length != 0) {
			for (var i = 0; i < time.length; i++) {
				cpName.push(time[i].cp);
				am_peak.push(time[i].am_peak);
				am_non_peak.push(time[i].am_non_peak);
				am.push(time[i].am);
				pm_peak.push(time[i].pm_peak);
				pm_non_peak.push(time[i].pm_non_peak);
				pm.push(time[i].pm);
			}
		}

		var timeChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : cpName,
				datasets : [ {
					label : '오전 첨두',
					data : am_peak,
					borderColor : 'rgba(255, 0, 0, 1)',
					backgroundColor : 'transparent'
				}, {
					label : '오전 비첨두',
					data : am_non_peak,
					borderColor : 'rgba(0, 125, 0, 1)',
					backgroundColor : 'transparent'
				}, {
					label : '오후 첨두',
					data : pm_peak,
					borderColor : 'rgba(0, 0, 255, 1)',
					backgroundColor : 'transparent'
				}, {
					label : '오후 비첨두',
					data : pm_non_peak,
					borderColor : 'rgba(0, 0, 125, 1)',
					backgroundColor : 'transparent'
				}, {
					label : '오전',
					data : am,
					borderColor : 'rgba(0, 0, 0, 1)',
					backgroundColor : 'transparent'
				}, {
					label : '오후',
					data : pm,
					borderColor : 'rgba(173, 115, 209, 1)',
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

	// 검색값이 없는 경우
	function notFoundResult() {
		$('#totalDistance').children('tbody').append(
				'<tr><td colspan="4">검색된 값이 없습니다</td></tr>')
	}
</script>
</html>