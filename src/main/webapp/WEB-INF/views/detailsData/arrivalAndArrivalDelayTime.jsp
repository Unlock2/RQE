<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	
	<title>선/후착 및 도착 지연 시간</title>
	
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- 	<script type="text/javascript" src="../js/style.js"></script> -->
	<script type="text/javascript"
		src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="../js/placeholder.js"></script>
	<script type="text/javascript" src="../js/ui.js"></script>
	<script type="text/javascript" src="../js/style.js"></script>
	
	<!-- Google Chart -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	
	<!-- chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
		    
    <script type = "text/javascript">google.charts.load('current', {packages: ['corechart']});</script>
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="../css/import.css" />
<!-- 	<link rel="stylesheet" type="text/css" href="../css/board.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/common.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/default.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/layout.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/login.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="../css/style.css" /> -->
	<link rel="stylesheet" type="text/css" href="../css/modal.css" />
    
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
						<span>선/후착 및 도착 지연 시간</span>
						<ul class="path">
							<li>상세 데이터</li>
							<li>선/후착 및 도착 지연 시간</li>
						</ul>
						<!-- .path -->
					</div>
					<!-- tit-page -->
					<!-- .contents -->
	                <div class="contents">
	                	<!-- .search -->
	                	<jsp:include page="/WEB-INF/views/layouts/checkbox.jsp"/>
	                	<!-- /.search -->
	                	<!-- .row -->   
	                	<div class="row" style="margin-bottom: 25px">
		                	<!-- table -->               
	                    	<table id="tbl-delay-info" style="border-style: none;">
	                            <thead>
	                            	<tr>
	                                    <th colspan="2" style="background-color: #e6e6ff;"><b>선후착 집계(정상 주행)</b></th> 
	                                    <th colspan="7" style="background-color: white;border-style: none"></th>
	                                </tr>                               
	                                <tr>
	                                    <th colspan="5">목적지 선후착</th>
	                                    <th colspan="4">도착 지연 시간(후착 구간)</th>
	                                </tr>
	                                <tr>
	                                	<th>CP</th>
	                                	<th>총 구간</th>
	                                	<th>선착률</th>
	                                	<th>동시도착률</th>
	                                	<th>후착률</th>
	                                	<th>구간</th>
	                                	<th>평균 지연 시간</th>
	                                	<th>최대 지연 시간</th>
	                                	<th>표준 편차</th>
	                                </tr>
	                            </thead>
	                            <tbody></tbody>
	                        </table>   
		                    <!-- \table -->  
	                	</div>
	                	<!-- /.row --> 
	                	
	                	<div class="row" style="border-style: none;">
							<!-- 목적지 선후착률(전체구간) -->
		                    <table style="border-style: none;">
		                    	<tbody style="border-style: none;">
			                    	<tr style="border-style: none;">
			                    		<td style="border-style: none;">
			                    			<div id="first_later_score"></div>
			                    		</td>
			                    	</tr>
		                    	</tbody>
		                    </table>
	                	</div>
	                	
	                	<div class="row">
							<!-- 최선착 대비 도착 지연 시간 분포 -->
		                    <table style="border-style: none;">
		                    	<tbody style="border-style: none;">
			                    	<tr style="border-style: none;">
			                    		<td style="border-style: none;">
			                    			<div id="delay_score"></div>
			                    		</td>
			                    	</tr>
		                    	</tbody>
		                    </table>
	                	</div>
	                	
	                	<div class="row">
							<!-- 주중 오전 첨두 선후착률 -->
		                    <table style="border-style: none;">
		                    	<tbody style="border-style: none;">
			                    	<tr style="border-style: none;">
			                    		<td style="border-style: none;">
			                    			<div id="am_peak_score"></div>
			                    		</td>
			                    	</tr>
		                    	</tbody>
		                    </table>
	                	</div>
	                	
	                	<div class="row">
							<!-- 주중 오전 비첨두 선후착률 -->
		                    <table style="border-style: none;">
		                    	<tbody style="border-style: none;">
			                    	<tr style="border-style: none;">
			                    		<td style="border-style: none;">
			                    			<div id="am_non_peak_score"></div>
			                    		</td>
			                    	</tr>
		                    	</tbody>
		                    </table>
	                	</div>
	                	
	                	<div class="row">
							<!-- 주중 오후 비첨두 선후착률 -->
		                    <table style="border-style: none;">
		                    	<tbody style="border-style: none;">
			                    	<tr style="border-style: none;">
			                    		<td style="border-style: none;">
			                    			<div id="pm_non_peak_score"></div>
			                    		</td>
			                    	</tr>
		                    	</tbody>
		                    </table>
	                	</div>
	                	
	                	<div class="row">
							<!-- 주중 오후 첨두 선후착률 -->
		                    <table style="border-style: none;">
		                    	<tbody style="border-style: none;">
			                    	<tr style="border-style: none;">
			                    		<td style="border-style: none;">
			                    			<div id="pm_peak_score"></div>
			                    		</td>
			                    	</tr>
		                    	</tbody>
		                    </table>
	                	</div>
	                	
	                	<div class="row">
							<!-- 주말 오전 선후착률 -->
		                    <table style="border-style: none;">
		                    	<tbody style="border-style: none;">
			                    	<tr style="border-style: none;">
			                    		<td style="border-style: none;">
			                    			<div id="am_score"></div>
			                    		</td>
			                    	</tr>
		                    	</tbody>
		                    </table>
	                	</div>
	                	
	                	<div class="row">
							<!-- 주말 오후 선후착률 -->
		                    <table style="border-style: none;">
		                    	<tbody style="border-style: none;">
			                    	<tr style="border-style: none;">
			                    		<td style="border-style: none;">
			                    			<div id="pm_score"></div>
			                    		</td>
			                    	</tr>
		                    	</tbody>
		                    </table>
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
	    <!-- .contents -->            
	</div>
	<!-- .wrap -->
</body>
<script src="/js/common.js"></script>
<script>
	$(document).ready(function() {
		
		$('.btnSearch').attr('href', 'javascript:arrivalAndArrivalDelayTime()');
		
		// 검색된 값이 없는경우 
		notFoundResult();
	
	});//document.ready

    
    /**
    * arrivalAndArrivalDelayTime data 조회
    */
    arrivalAndArrivalDelayTime = function() {
    	
    	var list = $('#tbl-delay-info').children('tbody');
    	var chart1 = $('#first_later_score');
    	
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
		
		
		
		$.ajax({
			url : '/detailsData/arrivalAndArrivalDelayTimeData'
				, type : 'post'
				, dataType : 'json'
	 			, data : $('#search-bmt').serializeObject()
				, processData : true /*querySTring make false*/
				, success : function(data, stat, xhr) {
					
					all_score_data = data.out;
					ampm_score_data = data.ampm;
					delay_score_data = data.delay;
					
					// 표 및 그래프 초기화
					list.empty();
					$('#first_later_score').empty();
					$('#delay_score').empty();
					$('#am_peak_score').empty();
					$('#pm_non_peak_score').empty();
					$('#pm_peak_score').empty();
					$('#am_score').empty();
					$('#pm_score').empty();
					
					if (data.out.length === 0) {
						alert('검색된 값이 없습니다');
						notFoundResult();
						return;
					};
					
					data.out.forEach(function(items, index, array) {
						
						if (items.avg_delay_time == null || items.avg_delay_time == '') {
							items.avg_delay_time = '-';
						}; 
						if (items.max_delay_time == null || items.max_delay_time == '') {
							items.max_delay_time = '-';
						};
						if (items.standard_deviation_delay == null || items.standard_deviation_delay == '') {
							items.standard_deviation_delay = '-';
						};
						
						var html = [
							'<tr class="',  items.check_select , '">',
							'<td>', items.cp, '</td>',
							'<td>', items.total_count, '</td>',
							'<td>', items.ratio_first, '</td>',
							'<td>', items.ratio_together, '</td>',
							'<td>', items.ratio_later, '</td>',
							'<td>', items.path_count, '</td>',
							'<td>', items.avg_delay_time, '</td>',
							'<td>', items.max_delay_time, '</td>',
							'<td>', items.standard_deviation_delay, '</td>',
							'</tr>'
						].join('');
						list.append(html);
					});
					//강조 표시
					$('.1').css( "background-color", '#e6ffcc' );
					$('.2').css( "background-color", '#ffcccc' );
					
					//그래프 함수 호출
					all_score();
					delay_score();
					ampeak_score();
					amnonpeak_score();
					pmnonpeak_score();
					pmpeak_score();
					am_score();
					pm_score();
		
				}
				,error : function(data, stat, xhr) {
					alert("error");
			    	console.log(err);
				}
		});
    };
    
    // 그래프 데이터 변수
    var all_score_data = '';
    var ampm_score_data = '';
    var delay_score_data = '';
    
 	// 선착, 동시도착, 후착 색상 지정
    function getColor(options) {
    	// 선착 : #0000FF, 동시도착 : #FFFF00, 후착 : #FF0000
    	var co = ['#0000FF', '#FFFF00', '#FF0000'];
    	for (var i = 0; i < co.length; i++) {
    		options.colors.push(co[i]);
		};
    };
    
    // 목적지 선후착률(전체구간) 그래프
    function all_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	all_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.score_first
				,items.score_together
				,items.score_later
			];
			array.push(chartdata);
		});
        google.charts.setOnLoadCallback(all_score_drawChart(array));
    }; 
    
    // 목적지 선후착률(전체구간) 차트 그리기 함수
    function all_score_drawChart(array) {
        var data = google.visualization.arrayToDataTable(array);
        var options = {
        		title: '목적지 선후착률(전체구간)', 
         		colors:[],
        		isStacked:'percent'
        };
        getColor(options);
        var chart = new google.visualization.ColumnChart(document.getElementById('first_later_score'));
        chart.draw(data, options);
    };
    
    // 최선착 대비 도착 지연 시간 분포
    function delay_score() {
    	var array = [];
    	array.push(['cp', '구간번호', '최선착 대비 지연 시간 (단위:분)', 'legend']);
    	delay_score_data.forEach(function(items, index, array2) {
    		var chartdata = [ 
				items.cp
				,items.delay_no
				,items.arrival_delay_time
				,items.cp
			];
    		// null check
    		if (chartdata[2] == null) {
				return;
			};
			array.push(chartdata);
    	});
        google.charts.setOnLoadCallback(delay_score_drawChart(array));
    };
    
    // 최선착 대비 도착 지연 시간 분포 차트 그리기 함수
    function delay_score_drawChart(array) {
          var data = google.visualization.arrayToDataTable(array);
          var options = {
          		title: '최선착 대비 도착 지연 시간 분포',            		
          		hAxis: {
          			title: '구간번호',
                    ticks: [],
                    gridlines: {color: '#696966'},
                    titleTextStyle:{italic:'0'}
                    },
                vAxis: {
                	title: '최선착 대비 지연시간 (단위:분)',
                    ticks: [],
                    gridlines: {color: '#696966'},
                    titleTextStyle:{italic:'0'}
                  	},
                colors: [],    
                sizeAxis: {
                	maxSize:7,
                	minSize:1    	
                    },
                chartArea:{backgroundColor:'#fffffff'},
                animation:{easing:'in'},
                legend:{
                	visible: true,
                	position: 'right'
                	}
          }; 
       	  // bubbleChart options set line fucntion
          setBubbleOptions_line(array, options);
       	  // bubbleChart options set color fucntion
          setBubbleOptions_color(options);
          var chart = new google.visualization.BubbleChart(document.getElementById('delay_score'));
          chart.draw(data, options);
    };
    
    // bubbleChart options set line fucntion
    function setBubbleOptions_line(array, options) {
    	
    	// 첫번째 배열값 제외
    	var cnt = array.length - 1;
    	
    	// 구간번호 : delay_no (구간번호 기준으로 DB조회되므로 마지막 값이 최대값이다.)
        var hval = array[cnt][1] + 3;
    	
    	// 가로 라인개수 조회 결과값 중 최대값
        var maxNum= 0;

    	// 세로 라인개수(그래프에 반영)
        for (i = 0; i < hval; i++) { 
        	options.hAxis.ticks.push(i);
        };
        
        // 가로 라인개수
        for (var i = 0; i < cnt; i++) {
     		// maxNum 값이 없는 경우 현재 배열값으로 지정
	     	/* if (maxNum == 0 || maxNum == null) {
	     	    maxNum = array[0][2];
	     	}; */
     		// maxNum의 값과 현재 값을 비교해서 maxNum값을 가장 큰 값으로 유지
     		if (maxNum < array[i][2]) {
     	    	maxNum = array[i][2];
     		};
		};
		
		// 가로 라인개수(그래프에 반영)
		var result = maxNum + 10;
        for (j = 0; j < result; j += 5) {
        	options.vAxis.ticks.push(j);
        };
    };
    
 	// bubbleChart options set color fucntion
    function setBubbleOptions_color(options) {
    	var co = ['#FF0000', '#0000FF', '#FFFF00', '#00FF00', '#FFA500', '#BA55D3', '#8B4513', '#C0C0C0', '#EE82EE', '#00BFFF'];
    	var cp = [];
    	all_score_data.forEach(function(items, index, array) {
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
    
    // 주중 오전 첨두 그래프
    function ampeak_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.am_peak_score_first
				,items.am_peak_score_together
				,items.am_peak_score_later
			];
			array.push(chartdata);
		});
        google.charts.setOnLoadCallback(ampeak_score_drawChart(array));
    };
    
 	// 주중 오전 첨두 차트 그리기 함수
    function ampeak_score_drawChart(array) {
        var data = google.visualization.arrayToDataTable(array);
        var options = {
        		title: '주중 오전첨두 선후착률', 
         		colors:[],
        		isStacked:'percent'
        };
        getColor(options);
        var chart = new google.visualization.ColumnChart(document.getElementById('am_peak_score'));
        chart.draw(data, options);
    };
    
    // 주중 오전 비첨두 그래프
    function amnonpeak_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.am_non_peak_score_first
				,items.am_non_peak_score_together
				,items.am_non_peak_score_later
			];
			array.push(chartdata);
		});
        google.charts.setOnLoadCallback(amnonpeak_score_drawChart(array));
    };
    
    // 주중 오전 비첨두 차트 그리기 함수
    function amnonpeak_score_drawChart(array) {
        var data = google.visualization.arrayToDataTable(array);
        var options = {
        		title: '주중 오전 비첨두 선후착률', 
        		colors:[],
        		isStacked:'percent'
        		};  
        getColor(options);
        var chart = new google.visualization.ColumnChart(document.getElementById('am_non_peak_score'));
        chart.draw(data, options);
     };
    
    // 주중 오후 비첨두 그래프
     function pmnonpeak_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.pm_non_peak_score_first
				,items.pm_non_peak_score_together
				,items.pm_non_peak_score_later 
			];
			array.push(chartdata);
		});
        google.charts.setOnLoadCallback(pmnonpeak_score_drawChart(array));
    };
    
    // 주중 오후 비첨두 차트 그리기 함수
    function pmnonpeak_score_drawChart(array) {
       var data = google.visualization.arrayToDataTable(array);
       var options = {
    		   title: '주중 오후 비첨두 선후착률', 
    		   colors:[],
       		   isStacked:'percent'
    		   }; 
       getColor(options);
       var chart = new google.visualization.ColumnChart(document.getElementById('pm_non_peak_score'));
       chart.draw(data, options);
    };
    
    // 주중 오후 첨두 그래프
    function pmpeak_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.pm_peak_score_first
				,items.pm_peak_score_together
				,items.pm_peak_score_later 
			];
			array.push(chartdata);
		});
        google.charts.setOnLoadCallback(pmpeak_score_drawChart(array));
    };
    
    // 주중 오후 첨두 차트 그리기 함수
    function pmpeak_score_drawChart(array) {
       var data = google.visualization.arrayToDataTable(array);
       var options = {
    		   title: '주중 오후 첨두 선후착률', 
    		   colors:[],
       		   isStacked:'percent'
    		   };  
       getColor(options);
       var chart = new google.visualization.ColumnChart(document.getElementById('pm_peak_score'));
       chart.draw(data, options);
    };
    
    // 주말 오전 그래프 
    function am_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.am_score_first
				,items.am_score_together
				,items.am_score_later
			];
			array.push(chartdata);
		});
        google.charts.setOnLoadCallback(am_score_drawChart(array));
    };
    
    // 주말 오전 차트 그리기 함수 
    function am_score_drawChart(array) {
      var data = google.visualization.arrayToDataTable(array);
      var options = {
    		  title: '주말 오전 선후착률', 
    		  colors:[],
      		  isStacked:'percent'
    		  };  
      getColor(options);
      var chart = new google.visualization.ColumnChart(document.getElementById('am_score'));
      chart.draw(data, options);
    };
    
    // 주말 오후 그래프
    function pm_score() {
    	var array = [];
    	array.push(['cp', '선착', '동시도착', '후착']);
    	ampm_score_data.forEach(function(items, index, array2) {
			var chartdata = [ 
				items.cp
				,items.pm_score_first
				,items.pm_score_together
				,items.pm_score_later
			];
			array.push(chartdata);
		});
        google.charts.setOnLoadCallback(pm_score_drawChart(array));
    };
    
    // 주말 오후 차트 그리기 함수
    function pm_score_drawChart(array) {
       var data = google.visualization.arrayToDataTable(array);
       var options = {
    		   title: '주말 오후 선후착률', 
    		   colors:[],
       		   isStacked:'percent'
    		   };  
       getColor(options);
       var chart = new google.visualization.ColumnChart(document.getElementById('pm_score'));
       chart.draw(data, options);
    };
    
    
    /**
     * 검색된 값이 없는 경우
     */
     function notFoundResult() {
    	$('#tbl-delay-info').children('tbody').append('<tr><td colspan="9">검색된 값이 없습니다</td></tr>');
    	$('#first_later_score').empty();
		$('#delay_score').empty();
		$('#am_peak_score').empty();
		$('#am_non_peak_score').empty();
		$('#pm_non_peak_score').empty();
		$('#pm_peak_score').empty();
		$('#am_score').empty();
		$('#pm_score').empty();
     };

</script>
</html>