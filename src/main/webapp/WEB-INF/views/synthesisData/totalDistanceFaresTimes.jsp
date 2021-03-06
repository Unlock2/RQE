<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>건수/거리/요금/시간 집계</title>
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- <script type="text/javascript" src="../js/style.js"></script> -->
<!--     <script type="text/javascript" src="../js/jquery.mCustomScrollbar.concat.min.js"></script> -->
<!--     <script type="text/javascript" src="../js/placeholder.js"></script> -->
<script type="text/javascript" src="../js/ui.js"></script>
<script type="text/javascript" src="../js/style.js"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../css/import.css" />
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/common.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/default.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/layout.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/login.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css" /> -->
<link rel="stylesheet" type="text/css" href="../css/modal.css" />

<!-- chart.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>

<!-- Google Chart -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!--   	<script type = "text/javascript">google.charts.load('current', {packages: ['corechart']});</script> -->
</head>
<body>
	<div id=wrap>
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
		<!-- \#header -->
		<!-- #snbArea -->
		<jsp:include page="/WEB-INF/views/layouts/synthesisData_subMenu.jsp" />
		<!-- \#snbArea -->
		<section id="contents" style="width: 95%;">
			<div class="tit-page">
				<span>건수/거리/요금/시간 집계</span>
				<ul class="path">
					<li>종합 데이터</li>
					<li>건수/거리/요금/시간 집계</li>
				</ul>
				<!-- .path -->
			</div>
			<!-- tit-page -->
			<!-- .contents -->
			<div class="contents">
				<!-- .search -->
				<!--
                        board.css : box-sizing: content-box 추가
                    -->
				<div class="search">
					<form id="search-bmt">
						<span class="pd">시작 날짜</span> <input type="text" class="text date"
							id="bmt-start-date" name="bmt-start-date" /> <span class="pd">~</span>
						<span class="pd">종료 날짜</span> <input type="text" class="text date"
							id="bmt-end-date" name="bmt-end-date" /> <a
							href="javascript:getList()" class="btnSearch"> <img
							src="../images/board/btn_search.gif" alt="search" />
						</a>
					</form>
				</div>
				<!-- /.search -->
				<div style="width: 100%; padding-bottom: 20px; padding-top: 20px">
					<table style="width: 100%; padding-bottom: 20px">
						<tbody>
							<tr>
								<td id="Comprehensive_distanceGraph"
									style="width: 33%; height: 250px"></td>
								<td id="Comprehensive_timeGraph"
									style="width: 33%; height: 250px"></td>
								<td id="Comprehensive_chargeGraph"
									style="width: 33%; height: 250px"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div style="padding-bottom: 20px">
					<table id="EvaluationSectionStatus" cellspacing="0" width="100%"
						border="0">
						<thead>
							<!-- 								<tr style="background-color: #e6f2ff;"> -->
							<tr>
								<th style="background-color: #e6e6ff;"><b>평가 구간 현황</b></th>
							</tr>
							<!--                                 <tr style="background-color: #e6f2ff;"> -->
							<tr>
								<th rowspan="2">평가 대상명</th>
								<th>정상 주행</th>
								<th>기타(경로이탈 등)</th>
								<th>총 구간</th>
							</tr>
							<tr>
								<th>단위 : 개</th>
								<th>단위 : 개</th>
								<th>단위 : 개</th>
						</thead>
						<tbody></tbody>
					</table>
				</div>


				<div>
					<table id="PathCostStatus" cellspacing="0" width="100%" border="0">
						<thead>
							<tr style="background-color: #e6f2ff;">
								<th colspan="3" style="background-color: #e6e6ff;"><b>경로 비용 현황</b></th>
							</tr>
							<tr style="background-color: #e6f2ff;">
								<th rowspan="2">평가 대상명</th>
								<th>대상 구간</th>
								<th>총 경로 거리</th>
								<th>총 통행 요금</th>
								<th>총 통행 시간</th>
								<th colspan="3">총 통행 거리</th>
								<th colspan="3">총 통행 요금</th>
							</tr>
							<tr style="background-color: #e6f2ff;">
								<th>단위 : 개</th>
								<th>단위 : km</th>
								<th>단위 : 원</th>
								<th>단위 : 분</th>
								<th>총계(∑)</th>
								<th>차이(∆c)</th>
								<th>차이(∆c/cmin)</th>
								<th>총계(∑)</th>
								<th>차이(∆c)</th>
								<th>차이(∆c/cmin)</th>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			<!-- /.contents -->
	</div>
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
<script src="/js/common.js"></script>
<script>
	$(document).ready(function() {
		/**
		* 초기 date 설정
		*/
		setDate();
		
		/**
		* data sheet list 값 불러오기
		*/
// 		getList();
		
		/**
		* data sheet 상세보기
		*/
		
		/**
		* 검색된 값이 없을경우
		*/
		notFoundResult();
		
	});
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
	} 
	
	
	// Load the Visualization API and the piechart package.
	google.charts.load('current', {'packages':['corechart']});
  
	// Set a callback to run when the Google Visualization API is loaded.
// 	google.charts.setOnLoadCallback(drawChart1);
// 	google.charts.setOnLoadCallback(drawChart2);
// 	google.charts.setOnLoadCallback(drawChart3);
     
	//총 경로 거리 차트 function
     function drawChart1(data) {
		// Create the data table.
		var graphData1 = new google.visualization.DataTable();
    	graphData1.addColumn('string', 'cp 명');
        graphData1.addColumn('number', '총 경로 거리');
        
        for(var i = 0; i < data.list.length; i++){
        	graphData1.addRow([data.list[i].cp, data.list[i].sum_distance]);
        }
         
        var options = {
        		title: '총 경로 거리 (단위:km)',
        		colors: [],
        		is3D: true
        };
     	// option color set
       	set_color(options);
        var chart1 = new google.visualization.PieChart(document.getElementById('Comprehensive_distanceGraph'));
        chart1.draw(graphData1, options);
     }
     
 	//총 통행 요금 차트 function
     function drawChart2(data) {
 		var graphData2 = new google.visualization.DataTable();
    	graphData2.addColumn('string', 'cp 명');
        graphData2.addColumn('number', '총 통행 요금');
        
        
        for(var i = 0; i < data.list.length; i++){
	        	graphData2.addRow([data.list[i].cp, data.list[i].sum_charge]);
        	}
        
        var options = {
        		title: '총 통행 요금 (단위:원)',
        		colors: [],
        		is3D: true
        }
     	// option color set
       	set_color(options);
        var chart2 = new google.visualization.PieChart(document.getElementById('Comprehensive_chargeGraph'));
        chart2.draw(graphData2, options);
     }
 	
 	//총 통행 시간 차트 function
     function drawChart3(data) {
 		var graphData3 = new google.visualization.DataTable();
        graphData3.addColumn('string', 'cp 명');
        graphData3.addColumn('number', '총 통행 시간');
           
      	for(var i = 0; i < data.list.length; i++){
             graphData3.addRow([data.list[i].cp, data.list[i].sum_tm]);
        }
      	
       	var options = {
       			title: '총 통행 시간 (단위:분)',
         		colors: [],
         		is3D: true
       	}
       	// option color set
       	set_color(options);
       	var chart3 = new google.visualization.PieChart(document.getElementById('Comprehensive_timeGraph'));
       	chart3.draw(graphData3, options);
     };
     
  	// 그래프 데이터 변수
     var total_distance_data = '';
  	
  	// option color set
     function set_color(options) {
    	 var co = ['#FF0000', '#0000FF', '#FFFF00', '#00FF00', '#FFA500', '#BA55D3', '#8B4513', '#C0C0C0', '#EE82EE', '#00BFFF'];
    	 var cp = [];
    	 total_distance_data.forEach(function(items, index, array) {
    		 cp.push(items.cp);
     	 });
    	 var cnt = cp.length;
    	 
    	// colorAxis.colors 
   		if (cnt <= 10) {
   			for (var i = 0; i < cnt; i++) {
   	  			options.colors.push(co[i]);
   	  		};
 		} else {
 			for (var i = 0; i < 10; i++) {
   	  			options.colors.push(co[i]);
   	  		};	
   	  		for (var i = 10; i < cnt; i++) {
   	  			// getRandomColor()은 common.js 안에 있습니다.
 	  			options.colors.push(getRandomColor());
 	  		};
 		}
  	};
	
	getList = function() {
		var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		if (start == null || start == '' || end == null || end == '') {
			return false;
		}
		var jsonStr = JSON.stringify($('#search-bmt').serialize());

		$.ajax({
			url : '/synthesisData/totalDistanceFaresTimesData'
	        , type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				$('#Comprehensive_distanceGraph').text('');
		    	$('#Comprehensive_timeGraph').text('');
		    	$('#Comprehensive_chargeGraph').text('');
				total_distance_data = data.list;
				var evaluationSectionStatusHtml = '';
				var pathCostStatusHtml = '';
				
				for(var i = 0; i < data.list.length; i++){				
					evaluationSectionStatusHtml += '<tr>';
					evaluationSectionStatusHtml += '<td>'+data.list[i].cp+'</td>';
					evaluationSectionStatusHtml += '<td>'+data.list[i].normal_count+'</td>';
					evaluationSectionStatusHtml += '<td>'+data.list[i].abnormal_count+'</td>';
					evaluationSectionStatusHtml += '<td>'+data.list[i].total_count+'</td>';
					evaluationSectionStatusHtml += '</tr>';
					
					pathCostStatusHtml += '<tr>'
					pathCostStatusHtml += '<td>'+data.list[i].cp+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].bmt_count+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_distance+' km'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_charge+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_tm+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_distance+' km'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sub_distance+' km'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].ratio_distance+'%'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sum_charge+' 원'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].sub_charge+' 원'+'</td>';
					pathCostStatusHtml += '<td>'+data.list[i].ratio_charge+' %'+'</td>';
					pathCostStatusHtml += '</tr>'
					
				}
				$('#EvaluationSectionStatus > tbody').html(evaluationSectionStatusHtml);
				$('#PathCostStatus > tbody').html(pathCostStatusHtml);
				
				drawChart1(data);
				drawChart3(data);
				
				//요금이 없는 경우가 발생할 수 있는 경우 차트 그리기 제외
				 //data.list[i].sum_charge 가 모두 0값일 때 graph를 그릴 수 없으므로 no data 표현을 한다.
			        var count = [];
			        for (var i = 0; i < data.list.length; i++) {
						if(data.list[i].sum_charge != 0){
							count.push(data.list[i].sum_charge);
						}
					}
			        
			        if (count.length < 1) {
			        	$('#Comprehensive_chargeGraph').text('통행 요금이 0원입니다. 데이터가 없습니다.');
						return;
					} else {
						drawChart2(data);
					}
						
			}
		    , error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		});
	}
	
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
	
	/**
     * 검색된 값이 없는 경우
     */
     notFoundResult = function() {
    	 $('#Comprehensive_distanceGraph').text('검색 된 총 경로 거리 데이터가 없습니다');
    	 $('#Comprehensive_timeGraph').text('검색 된 총 통행 시간 데이터가 없습니다');
    	 $('#Comprehensive_chargeGraph').text('검색 된 총 통행 요금 데이터가 없습니다');
    	 $('#EvaluationSectionStatus > tbody').append('<tr><td colspan="4">검색된 값이 없습니다.</td></tr>');
    	 $('#PathCostStatus > tbody').append('<tr><td colspan="11">검색된 값이 없습니다.</td></tr>');
     };    
     
</script>
</html>
