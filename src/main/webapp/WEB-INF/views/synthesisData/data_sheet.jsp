<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />	
	<title>Data Sheet</title>
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<!--     <script type="text/javascript" src="../js/style.js"></script> -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="../js/placeholder.js"></script>
	<script type="text/javascript" src="../js/ui.js"></script>
	<script type="text/javascript" src="../js/style.js"></script>
	<script type="text/javascript" src="../js/jquery.techbytarun.excelexportjs.js"></script>
	<script type="text/javascript" src="../js/jquery.techbytarun.excelexportjs.min.js"></script>
    
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../css/import.css" />
<!--     <link rel="stylesheet" type="text/css" href="../css/board.css" /> -->
<!--     <link rel="stylesheet" type="text/css" href="../css/common.css" /> -->
<!--     <link rel="stylesheet" type="text/css" href="../css/default.css" /> -->
<!--     <link rel="stylesheet" type="text/css" href="../css/layout.css" /> -->
<!--     <link rel="stylesheet" type="text/css" href="../css/login.css" /> -->
<!--     <link rel="stylesheet" type="text/css" href="../css/style.css" />     -->
    <link rel="stylesheet" type="text/css" href="../css/modal.css" />
</head>
<body>
	<div id=wrap>
		<!-- #header -->
		<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
		<!-- \#header -->
			<!-- #snbArea -->
			<jsp:include page="/WEB-INF/views/layouts/synthesisData_subMenu.jsp"/>
			<!-- \#snbArea -->
			<section id="contents" style="width: 95%;">
				<div class="tit-page">
					<span>Data Sheet</span>
					<ul class="path">
						<li>종합 데이터</li>
						<li>Data Sheet</li>
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
                            <span class="pd">시작 날짜</span>
                            <input type="text" class="text date" id="bmt-start-date" name="bmt-start-date" />
                            <span class="pd">~</span>
                            <span class="pd">종료 날짜</span>
                            <input type="text" class="text date" id="bmt-end-date" name="bmt-end-date" />
                            <a href="javascript:dataSheetList()" class="btnSearch">
                                <img src="../images/board/btn_search.gif" alt="search" />
                            </a>
							<!-- 데이터 다운로드 -->
<!--                             <div style="float:right"> -->
<!-- 	                            <button type="button" id="downloadDataSheet" name="downloadDataSheet" style="background-color:gray; color:white;" onclick="getDataSheet()"> -->
<!-- 	                            데이터 내려받기 	 -->
<!-- 	                            </button> -->
<!--                             </div> -->
                        </form>
                    </div>
                    <!-- /.search -->
                    <div>
                        <table id="tbl-data-sheet">
                            <thead>
                                <tr>
                                    <th style="width: 65px">BMT ID</th>
                                    <th style="width: 85px">구간 주행 상태</th>
                                    <th style="width: 105px">CP</th>
                                    <th>출발지명</th>
                                    <th>도착지명</th>
                                    <th style="width: 65px">예상 시간<p>(분)</p></th>
                                    <th style="width: 65px">예상 거리<p>(Km)</p></th>
                                    <th style="width: 65px">예상 요금<p>(원)</p></th>
                                    <th style="width: 65px">실제 소요<p>시간(분)</p></th>
                                    <th style="width: 65px">실제 소요<p>거리(Km)</p></th>
                                    <th style="width: 65px">실제 소요<p>요금(원)</p></th>
                                    <th style="width: 65px">선/후착</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <!-- /.contents -->
		
		<!-- The Modal -->
		<div id="modal-data-detail" class="modal">
			<!-- Modal content -->
			<div class="modal-content" style="margin-left: 290px;">
				<div class="modal-header">
					<span class="close">&times;</span>
					<span class="tooltiptext">닫기</span>
				</div>
				<div class="modal-body">
					<table id="tbl-modal-data1" style="margin-bottom: 10px">
	                    <tbody>
	                        <tr style="background-color: #e6f2ff;">
	                            <td>BMT ID</td>
	                            <td>USER ID</td>
	                            <td>최종 사용 여부</td>
	                            <td>CP</td>
	                            <td>차량정보</td>
	                            <td>공지사항</td>
	                            <td>요청시간(공지)</td>
	                            <td>출발시간(공지)</td>
	                            <td>출발지명</td>
	                            <td>도착지명</td>
	                        </tr>
	                        <tr></tr>
	                        <tr style="background-color: #e6f2ff;">
	                            <td>실제 요청 시간</td>
	                            <td>예상 소요 시간</td>
	                            <td>예상 소요 거리</td>
	                            <td>예상 소요 요금</td>
	                            <td>실제 출발 시간</td>
	                            <td>주행 도착 시간</td>
	                            <td>실제 소요 거리</td>
	                            <td>실제 소요 요금</td>
	                            <td>구간 주행 상태</td>
	                            <td>선/후착</td>
	                        </tr>
	                        <tr></tr>
	                        <tr style="background-color: #e6f2ff;">
	                            <td colspan="10">특이사항</td>
	                        </tr>
	                        <tr></tr>
	                    </tbody>
					</table>
				</div>
			</div>
			<!-- \Modal content -->
		</div>
		<!-- \The Modal -->		
		
<!-- 		<div id="excelDownDiv"class="modal-body" style="display:none">	 style="display:none;" -->
<!-- 			<table id="tbl-modal-data2"> -->
<!-- 				<thead> -->
<!-- 					<tr>	   -->
<!-- 					  <th>BMT ID</th> -->
<!-- 		              <th>USER ID</th> -->
<!-- 		              <th>최종 사용 여부</th> -->
<!-- 		              <th>구간 주행 상태</th> -->
<!-- 		              <th>CP</th> -->
<!-- 		              <th>차량정보</th> -->
<!-- 		              <th>출발지명</th> -->
<!-- 		              <th>도착지명</th> -->
<!-- 		              <th>실제 요청 시간</th> -->
<!-- 					  <th>예상 소요 시간</th> -->
<!-- 		              <th>실제 출발 시간</th> -->
<!-- 		              <th>주행 도착 시간</th> -->
<!-- 					  <th>실제 소요 시간</th> -->
<!-- 		              <th>예상 소요 거리</th> -->
<!-- 		              <th>실제 소요 거리</th> -->
<!-- 		              <th>예상 소요 요금</th> -->
<!-- 		              <th>실제 소요 요금</th> -->
<!-- 		            </tr>   -->
<!-- 	            </thead> -->
<!-- 					<tbody></tbody> -->
<!-- 			</table> -->
<!-- 		</div> -->
		<!-- download datasheet Table -->
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
		/**
		* 초기 date 설정
		*/
		setDate();
		
		/**
		*검색값 초기화
		*/
		notFoundResult();
		
		/**
		
		/**
		* data sheet 상세보기
		*/
		
		
		$(document).on('click', '#tbl-data-sheet tbody tr', function() {
			console.log('detail');
			var id = $(this).attr('id').trim();
			var cp = $(this).children('td')[2].innerText.trim();
			var tr2 = $('#tbl-modal-data1 tr')[1];
			var tr4 = $('#tbl-modal-data1 tr')[3];
			var tr6 = $('#tbl-modal-data1 tr')[5];
			$.ajax({
				url : '/synthesisData/detailData'
			        , type : 'post'
					, dataType : 'json'
		 			, data : {
		 				bmtid : id,
		 				cp : cp
		 			}
					, processData : true /*querySTring make false*/
					, success : function(data, stat, xhr) {		
						$('#modal-data-detail').css({ 'display': "block" });
							$(tr2).empty();
							$(tr4).empty();
							$(tr6).empty();
 							var html2 = [
 								'<td>', data.data.bmtid , '</td>',
 								'<td>', data.data.userid , '</td>',
 								'<td>', data.data.except_info , '</td>',
 								'<td>', data.data.cp , '</td>',
 								'<td>', data.data.carinfo , '</td>',
 								'<td>', data.data.notice , '</td>',
 								'<td>', data.data.requesttm , '</td>',
 								'<td>', data.data.starttm , '</td>',
 								'<td>', data.data.startpoi , '</td>',
 								'<td>', data.data.endpoi , '</td>'							
 							].join('');
							$(tr2).append(html2);
							//$(tr2).after(html2);
							
							var html4 = [
								'<td>', data.data.real_req_time , '</td>',
								'<td>', data.data.est_time , '</td>',
								'<td>', data.data.est_distance , '</td>',
								'<td>', data.data.est_charge , '</td>',
								'<td>', data.data.bmt_start_tm , '</td>',
								'<td>', data.data.bmt_end_tm , '</td>',
								'<td>', data.data.arrive_distance , '</td>',
								'<td>', data.data.arrive_charge , '</td>',
								'<td>', data.data.state_condition , '</td>',
								'<td>', data.data.score , '</td>'
							].join('');							
							$(tr4).append(html4);
							
							if (data.data.yugoinfo == null || data.data.yugoinfo == '') {
								var html6 = [
									'<td colspan="10">특이사항이 없습니다.</td>'
								].join('');
							} else {
								var yugoinfo = data.data.yugoinfo;								
								var html6 = [
									'<td colspan="10">', yugoinfo.replace(/[//]/g, '<br/>') ,'</td>'
								].join('');
							}				
							$(tr6).append(html6);
					}
				    , error : function(xhr, stat, err) {
				    	alert("error");
				    	console.log(err);
				    }
			});//ajax
		});
		
		/**
		* When the user clicks on <span> (x), close the modal
		*/
        $('.close').on('click', function() {
        	$('#modal-data-detail').css({ 'display': "none" });
        }); 
		
		/**
		* When the user clicks anywhere outside of the modal, close it
		*/
        window.onclick = function (event) {
			var modal = $('#modal-data-detail')[0];
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
		
	});//document.ready
	
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

	
	
	 function getDataSheet() {
		$('#excelDownDiv').show();
		var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		var list = $('#tbl-modal-data2').children('tbody');
		if(start == null || start == '' || end == null || end == ''){
			return false;
		}
		var jsonStr = JSON.stringify($('#search-bmt').serialize());
		
		$.ajax({
			url : '/synthesisData/downloadDataSheet'
			, type : 'post'
			, dataType : 'json'
			, data : $('#search-bmt').serializeObject()
			, processData : true
			, success : function(data, stat, xhr){
				list.empty();
				
				var test = '';
				if(data.downloadDataSheet.length == 0){
					alert('값이 없습니다.')
				}else{
					for(var i =0; i < data.downloadDataSheet.length; i++){
						var dds = data.downloadDataSheet[i];
						test += '<tr>'
						test += '<td>' + dds.bmtid + '</td>'
						test += '<td>' + dds.userid + '</td>'
						test += '<td>' + dds.except_info + '</td>'
						test += '<td>' + dds.state_condition + '</td>'
						test += '<td>' + dds.cp + '</td>'
						test += '<td>' + dds.carinfo + '</td>'
						test += '<td>' + dds.startpoi + '</td>'
						test += '<td>' + dds.endpoi + '</td>'
						test += '<td>' + dds.real_req_time + '</td>'
						test += '<td>' + dds.est_time + '</td>'
						test += '<td>' + dds.bmt_start_tm + '</td>'
						test += '<td>' + dds.bmt_end_tm + '</td>'
						test += '<td>' + dds.real_drv_tm + '</td>'
						test += '<td>' + dds.est_distance + '</td>'
						test += '<td>' + dds.arrive_distance + '</td>'
						test += '<td>' + dds.est_charge + '</td>'
						test += '<td>' + dds.arrive_charge + '</td>'
						test += '</tr>'
					}
				}
				list.html(test);
				console.log('테스트 값 :: ' + test);
			}
			, error : function(xhr, stat, err) {
			   	alert("error");
				console.log(err);
			}
		});
	
// 		var excelData = new Blob([document.getElementById('tbl-modal-data2').innerHTML], {
// 			type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"
// 		});
// 		var excelData = document.createElement('excelData');
//         var data_type = 'data:application/vnd.ms-excel';
//         var table_html = encodeURIComponent($("#tbl-modal-data2").html());
//         excelData.href = data_type + ', ' + table_html;
//         excelData.download = 'dataSheet.xls';
        
//         a.click();
//         e.preventDefault();
	

		$('#excelDownDiv').hide();
	}
	
	
	dataSheetList = function() {
		var start = $('#bmt-start-date').val();
		var end = $('#bmt-end-date').val();
		var list = $('#tbl-data-sheet').children('tbody');
		if (start == null || start == '' || end == null || end == '') {
			return false;
		}
		var jsonStr = JSON.stringify($('#search-bmt').serialize());

		$.ajax({
			url : '/synthesisData/datasheetlist'
	        , type : 'post'
			, dataType : 'json'
 			, data : $('#search-bmt').serializeObject()
			, processData : true /*querySTring make false*/
			, success : function(data, stat, xhr) {
				list.empty();
				if (data.list.length === 0) {				
					list.append('<tr><td colspan="12">검색된 값이 없습니다</tr>');					
					return;
				}				
				/* data.list.forEach(function(items, index, array) {					
					var html = [
						'<tr id = "', items.bmtid ,'" style="cursor: pointer;">',
						'<td>', items.bmtid , '</td>',
						'<td>', items.state_condition , '</td>',
						'<td>', items.cp , '</td>',
						'<td>', items.startpoi , '</td>',
						'<td>', items.endpoi , '</td>',
						'<td>', items.est_time , '</td>',
						'<td>', items.est_distance , '</td>',
						'<td>', items.est_charge , '</td>',
						'<td>', items.driver_tm , '</td>',
						'<td>', items.arrive_distance , '</td>',
						'<td>', items.arrive_charge , '</td>',
						'<td>', items.score , '</td>',
						'</tr>'
					].join('');
					list.append(html);
				});//forEach */
				
				var test = '';
				for (var i = 0; i < data.list.length; i++) {
					test += '<tr id = "'
					test += data.list[i].bmtid;
					test += '" style="cursor: pointer;">';
					test += '<td>' + data.list[i].bmtid + '</td>';
					if (data.list[i].state_condition == '경로이탈') {
						test += '<td class="check_select">' + '경로이탈' + '</td>';
					} else {
						test += '<td>' + data.list[i].state_condition + '</td>';
					}
// 					test += '<td>' + data.list[i].state_condition + '</td>';
					if(data.list[i].cp == data.list[i].cp + ' '|| data.list[i].cp == ' ' + data.list[i].cp ){
						data.list[i].trim();
					}else{
						test += '<td>' + data.list[i].cp + '</td>';
					}
					test += '<td>' + data.list[i].startpoi + '</td>';
					test += '<td>' + data.list[i].endpoi + '</td>';				
					test += '<td>' + data.list[i].est_time + '</td>';
					test += '<td>' + data.list[i].est_distance + '</td>';
					test += '<td>' + data.list[i].est_charge + '</td>';
					test += '<td>' + data.list[i].driver_tm + '</td>';
					test += '<td>' + data.list[i].arrive_distance + '</td>';
					test += '<td>' + data.list[i].arrive_charge + '</td>';
					if (data.list[i].score == null) {
						test += '<td>' + '' + '</td>';
					} else {
						test += '<td>' + data.list[i].score + '</td>';
					}
// 					test += '<td>' + data.list[i].score + '</td>';
					test += '</tr>';
				}
				list.html(test);
				$('.check_select').closest('tr').css( "color", '#D6C8A1' );
					
			}
		    , error : function(xhr, stat, err) {
		    	alert("error");
		    	console.log(err);
		    }
		});
	}//dataSheetList()
	
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
	
	   notFoundResult = function() {
	    	 $('#tbl-data-sheet > tbody').append('<tr><td colspan="12">검색된 값이 없습니다.</td></tr>');
	     };    
	
</script>
</html>
