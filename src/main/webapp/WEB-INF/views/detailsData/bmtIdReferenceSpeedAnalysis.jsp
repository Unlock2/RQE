<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fbd114108f63ae7f837dbe2cee10a1ba"></script>

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
#cpResultTableDiv table thead tr th, #cpResultTableDiv table tbody tr td,
	#analysisTableDiv table thead tr th, #analysisTableDiv table tbody tr th,
	#analysisTableDiv table tbody tr td {
	padding: 0;
}

#analysisTableDiv table thead tr th, #analysisTableDiv table tbody tr th
	{
	width: 90px;
}
</style>
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
				<span>BMT ID 기준 속도 분석</span>
				<ul class="path">
					<li>상세 데이터</li>
					<li>BMT ID 기준 속도 분석</li>
				</ul>
				<!-- .path -->
			</div>
			<!-- tit-page -->
			<!-- .contents -->
			<div class="contents" style="width: 100%">
				<!-- .search -->
<!-- 				<div class="search"> -->
<!-- 					<form id="search-bmt"> -->
<!-- 						<span class="pd">시작 날짜</span> <input type="text" class="text date" -->
<!-- 							id="bmt-start-date" name="bmt-start-date" /> <span class="pd">~</span> -->
<!-- 						<span class="pd">종료 날짜</span> <input type="text" class="text date" -->
<!-- 							id="bmt-end-date" name="bmt-end-date" /> <a -->
<!-- 							href="javascript:bmtIdReferenceSpeedAnalysis()" class="btnSearch"> -->
<!-- 							<img src="../images/board/btn_search.gif" alt="search" /> -->
<!-- 						</a> -->
<!-- 					</form> -->
				<jsp:include page="/WEB-INF/views/layouts/checkbox.jsp"/>
<!-- 				</div> -->
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
					<div
						style="position: relative; width: 85%; height: 900px; z-index: 1; float: right;">
						<div id="cpResultTableDiv"
							style="width: 100px; position: absolute; z-index: 2; left: 1px">
							<table id="tbl-time-list"
								style="border: 3px dashed; background: white; width: 100px;">
								<thead>
									<tr>
										<th style="width: 100px; height:34px;">시간</th>
										<!-- 		                						<th style="width:75px">구분</th> -->
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
						<div id="div-cpList" style="width:100px;position: absolute;left: 120px"></div>
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
							<div style="vertical-align: top; width: 92%; margin-left: 230px;">
								<!-- 							<div> -->
								<!-- 								<b>거리 기준 속도 분석</b> -->
								<!-- 							</div> -->
								<!-- 							<canvas id="distanceSpeedSpecificityChart" -->
								<!-- 								style="display: block; width: 719px; width:1125px; height: 400px;"></canvas> -->
								<!-- 						</div> -->
								<div
									id="div-graph" style="display: inline-block; vertical-align: top; width: 83%;">
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
	//기본날짜 set
	setDate();
	
	//검색된 값이 없는 경우
	notFoundResult();

});//document.ready

    
/**
 * 검색된 값이 없는 경우
 */
notFoundResult = function() {
	$('#resultListDiv > table').children('tbody').append('<tr><td>검색된 값이 없습니다</tr>');
	$('#tbl-time-list').children('tbody').append('<tr><td>검색된 값이<br> 없습니다</tr>');
};

//<![CDATA[
// date picker
$(".date").datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '2013:2018',
    showOn: "button",
    buttonImage: "../images/board/btn_date.gif",
    buttonImageOnly: true,
    buttonText: "날짜선택",
    inline: true,
    duration: 300,
    showAnim: "slideDown"
});
$.datepicker.regional['ko'] = {
    closeText: '닫기',
    prevText: '이전달',
    nextText: '다음달',
    currentText: '오늘',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    dateFormat: 'yy-mm-dd', firstDay: 0,
    isRTL: false
};
$.datepicker.setDefaults($.datepicker.regional['ko']);
//]]>

/**
* data sheet 초기 검색값 설정하기
*/
setDate = function() {
	var start = $('#bmt-start-date');
	var end = $('#bmt-end-date');
	var modalCal = $('#bmt-date');	// modal 에 입력되는 달력
	
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	if (month < 10) {
		month = '0' + month;
	}
	var day = date.getDate();
	if (day < 10) {
		day = '0' + day;
	}

	var prevDate = new Date(date.setDate(date.getDate()-30));
	var prevYear = prevDate.getFullYear();
	var prevMonth = prevDate.getMonth() + 1;
	if (prevMonth < 10) {
		prevMonth = '0' + prevMonth;
	}
	var prevDay = prevDate.getDate();
	if (prevDay < 10) {
		prevDay = '0' + prevDay;
	}
	
	start.val(prevYear + '-' + prevMonth + '-' + prevDay);
	end.val(year + '-' + month + '-' + day);
	modalCal.val(year + '-' + month + '-' + day);
}; 

//검색 날짜 담는 변수
var start_date;
var end_date;

/** 
 *	bmtid 조회
 */
bmtIdReferenceSpeedAnalysis = function() {
	
	$('#resultListDiv > table > tbody > tr').empty();
	$('#tbl-time-list > tbody > tr').empty();
	
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
// 	var start = $('#bmt-start-date').val();
// 	var end = $('#bmt-end-date').val();
// 	if (start == null || start == '' || end == null || end == '') {
// 		return false;
// 	}
	
// 	//날짜 입력값이 없으면 return false;
	var start = $('#bmt-start-date').val();
	start_date = start;
	var end = $('#bmt-end-date').val();
	end_date = end;
	if (start == null || start == '' || end == null || end == '') {
		alert('날짜입력 확인해주세요');
		return false;
	}
// 종료날짜가 시작날짜 보다 큰 경우 alert창 띄우고 false로 return 조건문
	if (parseInt(end.replace(/-/g,'')) < parseInt(start.replace(/-/g,''))){
		alert('종료 날짜는 시작 날짜 보다 작을 수 없습니다.')
		return false;
	}
	
	//method 
	$.ajax({
		url : '/detailsData/getBmtIdSpeedList',
		type : 'post',
		dataType : 'json',
		data : $('#search-bmt').serializeObject(),
		processData : true, /*querySTring make false*/
		success : function(data, stat, xhr) {
			//cansvas 초기화
			clearChart();
			
			//button 초기화
			$('#div-cpList').empty();
			
			//bmtid 초기화
			$("#resultListDiv > table > tbody").empty();
			
			if (data.list.length != 0) {
				var resultListHtml = '';
				for (var i = 0; i < data.list.length; i++) {
					resultListHtml += '<tr style="height:34px;" onclick="getTimeList(\''
							+ data.list[i].bmtid + '\')">';
					resultListHtml += '<td>' + data.list[i].bmtid + '</td>';
					resultListHtml += '</tr>';
				}
				$("#resultListDiv > table > tbody").html(resultListHtml);
			} else {
				//검색된 값이 없는 경우
				notFoundResult();
			}
			
		},
		error : function(xhr, stat, err) {
			alert("error");
			console.log(err);
		}
	});
}

/**
 * bmt_id 클릭 시 시간 data 검색
 */
 getTimeList = function(selectId) {
	var list = $('#resultTimeDiv');
	
	//날짜 입력값이 없으면 return false;
	if (start_date == null || start_date == '' || end_date == null || end_date == '') {
		alert('날짜입력 확인해주세요');
		return false;
	}

	$.ajax({
		url : '/detailsData/getTimeList',
		type : 'post',
		dataType : 'json',
		data : { start_date : start_date,
			     end_date : end_date,
			     bmtid : selectId
				},
		processData : true,
		success : function(data, stat, xhr) {
			//cansvas 초기화
			clearChart();
			
			//button 초기화
			$('#div-cpList').empty();
			
			if (data.list.length != 0) {
				var resultListHtml = '';
				var st = parseInt(data.list[0].min_gpstm);
				var ed = data.list[0].max_gpstm;
				var bmtid = '' + data.list[0].bmtid.toString() + '';
				console.log(bmtid);
				for (var i = st; i <= ed; i++) {
					resultListHtml += '<tr>';
					resultListHtml += '<td style="height:34px;" onclick="getCpList(this, \''  + bmtid + '\')">';
					if ( i < 10) {
						resultListHtml += '0' + i;
					} else {
						resultListHtml += i;	
					} 
					resultListHtml += '</td>';
					resultListHtml += '<tr>';
				}
				$("#tbl-time-list > tbody").html(resultListHtml);
			} else {
				$("#tbl-time-list > tbody").text('No data');
			}
			
		},
		error : function(xhr, stat, err) {
			alert("error");
			console.log(err);
		}
	});
}

//chart 초기화
clearChart = function() {
	var canvasChart = document.getElementById('timeSpeedSpecificityChart');
	if(canvasChart != undefined) {
 		canvasChart.remove();
 		console.log("canvasChart >>> " + canvasChart);
		//var ctx = canvasChart.getContext('2d');
		//ctx.clearRect(0, 0, canvasChart.width, canvasChart.height);
	} else {
		canvasChart = document.createElement('canvas');
		canvasChart.setAttribute('id', 'timeSpeedSpecificityChart');
		document.getElementById('div-graph').appendChild(canvasChart);
		console.log("canv >>> " + canvasChart);
	}
}

/**
 * time 클릭시 cp name button list 가져오기 function
 */
 getCpList = function(elmnt, bmtid) {
	//button 그리는 위치
	var buttonDiv = $('#div-cpList');
	
	var hh = elmnt.innerText;
	console.log("hh >>>>>> " + hh);
	
	//parameter 확인
	console.log('hh, bmtid >>>>> ' + hh + ' ' + bmtid);
	 $.ajax({
		 url : '/detailsData/getCpList',
			type : 'post',
			dataType : 'json',
			data : { 
				     bmtid : bmtid,
				     gpstm : hh
					},
			processData : true,
			success : function(data, stat, xhr) {
				//결과값 확인
				console.log(data.result);
				
				//cansvas 초기화
				clearChart();
				
				//button 초기화
				$('#div-cpList').empty();
				
				var result = data.result;
				if (result.length != 0) {
					var resultListHtml = '';
					//cp button 생성
					for (var i = 0; i < result.length; i++) {
						resultListHtml += '<button type="button" style="display: block;margin-bottom: 20px;cursor: pointer;" onclick="getGraph(this, \'' + hh + '\', \''  + bmtid + '\') " value="' + result[i].cp + '">'; 
						resultListHtml += result[i].cp;
						resultListHtml += '</button>';
					}
					buttonDiv.html(resultListHtml);	
				} else {
					$('#div-cpList').text('No cp data.');
				}
			},
			error : function(xhr, stat, err) {
				alert("error");
				console.log(err);
			}
	 });
}

/**
 * 그래프 data 가져오기
 */
getGraph = function(elmnt, hh, bmtid) {
	
	var cp = elmnt.value;
	
	$.ajax({
		url : '/detailsData/getGraph',
		type : 'post',
		dataType : 'json',
		data : { bmtid : bmtid,
			     gpstm : hh,
			     cp : cp
				},
		processData : true,
		success : function(data, stat, xhr) {
			console.log(data.list);
			/**
			* canvas 초기화
			* 기존 chart가 있을 시 remove canvas
			* 없는 경우 create canvas
			* button 클릭시 remove가 실행되므로
			*/
			clearChart();
			
			//canvas null check : null인 경우 canvas를 그려줘야 함 
			var canvasChart = document.getElementById('timeSpeedSpecificityChart');
			if(canvasChart == undefined) {
				clearChart();
			}
			
			//그래프 함수 호출
			createGraph(cp, data.list);
		},
		error : function(xhr, stat, err) {
			alert("error");
			console.log(err);
		}
	});
}

//그래프 그리는 함수 
function createGraph(cp, result) {
	
	//차트 그리는 위치
	var speedCanvas = document.getElementById('timeSpeedSpecificityChart');
	
	//1.좌표  : graph data set
	var Coordinates = [];
	for (var c = 0; c < result.length; c++) {
		Coordinates.push({x : c, y : result[c].speed});
	}
	
	//2.x축 : 시간
	var time = [];
	for (var i = 0; i < 3601; i++) {
		time.push(i);
	}
	
	//3.chart option 설정
	var chartOptions = {
		    legend: {
		    display: true,
		    position: 'top',
		    labels: {
		      boxWidth: 80,
		      fontColor: 'black'
		    }
		  },
		  scales: {
		    xAxes: [{
		      gridLines: {
		        display: false,
		        color: "black"
		      },
		      scaleLabel: {
		        display: true,
		        labelString: "시간(s)",
		        fontColor: "black"
		      }
		    }],
		    yAxes: [{
		      gridLines: {
		        color: "black",
		        borderDash: [2, 5],
		      },
		      scaleLabel: {
		        display: true,
		        labelString: "속도(km/h)",
		        fontColor: "black"
		      }
		    }]
		    }
		};
	
	//4.data set
	var speedData = {
			labels : time,
			datasets : [{
				label : cp,
				data : Coordinates,
				lineTension: 0,
			    fill: false,
			    borderColor: 'black',
			    backgroundColor: 'transparent',
			    pointBorderColor: 'blue',
			    pointRadius: 5,
			    pointHoverRadius: 10,
			    pointHitRadius: 30,
			    pointBorderWidth: 1,
			    pointStyle: 'rectRounded'
			}],
		}
	
	//5.line chart 그리기
	var lineChart = new Chart(speedCanvas, {
		  type: 'line',
		  data: speedData,
		  options: chartOptions
		});
	
}//createGraph
	
/**
 * form data 직렬화 
 */
$.fn.serializeObject = function() {
	var result = {};
	var extend = function(i, element) {
		var node = result[element.name];

		if ('undefined' !== typeof node && node !== null) {
			if ($.isArray(node)) {
				node.push(element.value);
			} else {
				result[element.name] = [ node, element.value ];
			}
		} else {
			result[element.name] = element.value;
		}
	};

	$.each(this.serializeArray(), extend);
	return result;
};

</script>
</html>