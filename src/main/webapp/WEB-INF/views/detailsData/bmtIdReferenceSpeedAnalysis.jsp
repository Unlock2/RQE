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
	                	<div class="search">
	                        <form id="search-bmt">
	                            <span class="pd">시작 날짜</span>
	                            <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" />
	                            <span class="pd">~</span>
	                            <span class="pd">종료 날짜</span>
	                            <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" />
	                            <a href="javascript:bmtIdReferenceSpeedAnalysis()" class="btnSearch">
	                                <img src="../images/board/btn_search.gif" alt="search" />
	                            </a>
	                        </form>
	                    </div>
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
	                		<div style= "position: relative; width:85%; height:900px; z-index:1; float: right;">
	                			<div id="cpResultTableDiv" style="width:100px; position: absolute; z-index: 2; left:1px">
	                				<table id="tbl-time-list" style="border:3px dashed; background:white; width:100px;">
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
	setDate();
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

/** 
 *	데이터 조회
 */
bmtIdReferenceSpeedAnalysis = function() {
	var list1 = $('#tbl-specific-list').children('tbody');
	var list2 = $('#tbl-specific-info').children('tbody');
	var image = $('#specific-image');
	
	//날짜 입력값이 없으면 return false;
	var start = $('#bmt-start-date').val();
	var end = $('#bmt-end-date').val();
	if (start == null || start == '' || end == null || end == '') {
		alert('날짜입력 확인해주세요');
		return false;
	}
	
	//그래프 초기화
	$("#resultListDiv > table > tbody").empty();
	
	//method 
	$.ajax({
		url : '/detailsData/getBmtIdSpeedList',
		type : 'post',
		dataType : 'json',
		data : $('#search-bmt').serializeObject(),
		processData : true, /*querySTring make false*/
		success : function(data, stat, xhr) {
			var resultListHtml = '';
			for (var i = 0; i < data.list.length; i++) {
				resultListHtml += '<tr onclick="selectBmtId(\''
						+ data.list[i].bmtid + '\')">';
				resultListHtml += '<td>' + data.list[i].bmtid + '</td>';
				resultListHtml += '</tr>';
			}
			$("#resultListDiv > table > tbody").html(resultListHtml);
		},
		error : function(xhr, stat, err) {
			alert("error");
			console.log(err);
		}
	});
}

//bmt_id 클릭시 해당 아이디의 시간데이터를 가지고오는 function 	
selectBmtId = function(selectId) {
	var list = $('#resultTimeDiv');
	
	//날짜 입력값이 없으면 return false;
	var start = $('#bmt-start-date').val();
	var end = $('#bmt-end-date').val();
	if (start == null || start == '' || end == null || end == '') {
		alert('날짜입력 확인해주세요');
		return false;
	}
	
	//그래프 초기화
	$("#resultTimeDiv > table > tbody").empty();

	$.ajax({
		url : '/detailsData/getTimeList',
		type : 'post',
		dataType : 'json',
		data : { start_date : start,
			     end_date : end,
			     bmtid : selectId
				},
		processData : true,
		success : function(data, stat, xhr) {
			var resultListHtml = '';
			var st = parseInt(data.list[0].min_gpstm);
			var ed = data.list[0].max_gpstm;
			var bmtid = '' + data.list[0].bmtid.toString() + '';
			console.log(bmtid);
			for (var i = st; i <= ed; i++) {
				resultListHtml += '<tr onclick="selectGraph(' + i + ', \''  + bmtid + '\')">';
				resultListHtml += '<td>';
				if ( i < 10) {
					resultListHtml += '0' + i;
				} else {
					resultListHtml += i;	
				} 
				resultListHtml += '</td>';
				resultListHtml += '<tr>';
			}
			$("#tbl-time-list > tbody").html(resultListHtml);
		},
		error : function(xhr, stat, err) {
			alert("error");
			console.log(err);
		}
	});
}

//그래프 data 가져오기
selectGraph = function(hh, bmtid) {
	var list = $('#timeSpeedSpecificityChart');
	
	//날짜 입력값이 없으면 return false;
	var start = $('#bmt-start-date').val();
	var end = $('#bmt-end-date').val();
	if (start == null || start == '' || end == null || end == '') {
		alert('날짜입력 확인해주세요');
		return false;
	}
	
	$("#timeSpeedSpecificityChart").empty();
	
	$.ajax({
		url : '/detailsData/getGraph',
		type : 'post',
		dataType : 'json',
		data : { start_date : start,
			     end_date : end,
			     bmtid : bmtid,
			     gpstm : hh
				},
		processData : true,
		success : function(data, stat, xhr) {
			//그래프 함수 호출
			createGraph(data.list);
		},
		error : function(xhr, stat, err) {
			alert("error");
			console.log(err);
		}
	});
}

//그래프 그리는 함수 
function createGraph(result) {

	var ctx = document.getElementById("timeSpeedSpecificityChart");
	var cp = [];
	var speed = [];
	var s_tm = [];

	if (result.length != 0) {
		for (var i = 0; i < result.length; i++) {
			//cp name 중복제거
			if (cp.includes(result[i].cp)) {
				return;
			} else {
				cp.push(result[i].cp);
			}
			
			speed.push(result[i].speed);
			s_tm.push(result[i].s_tm);
		}
	}

	var speedChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : cp,
			datasets : [ {
				label : '속도',
				data : speed,
				borderColor : 'rgba(255, 0, 0, 1)',
				backgroundColor : 'transparent'
			},{
				label : '시간',
				data : s_tm,
				borderColor : 'rgba(0, 125, 0, 1)',
				backgroundColor : 'transparent'
			}]
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

function getColor(userList, colorList) {
	var co = [ '#FF0000', '#0000FF', '#FFFF00', '#00FF00', '#FFA500',
			'#BA55D3', '#8B4513', '#C0C0C0', '#EE82EE', '#00BFFF' ];
	var cnt = userList.length;
	if (cnt <= 10) {
		for (var i = 0; i < cnt; i++) {
			colorList.push(co[i]);
		}
		;
	} else {
		for (var i = 0; i < 10; i++) {
			colorList.push(co[i]);
		}
		;
		for (var i = 10; i < cnt; i++) {
			// getRandomColor()은 common.js 안에 있습니다.
			colorList.push(getRandomColor());
		}
		;
	}
};
	
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