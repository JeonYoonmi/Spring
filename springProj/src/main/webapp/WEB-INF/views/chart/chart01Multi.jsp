<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	//구글 차트 라이브러리 로딩(google 객체는 위의 라이브러리에서 불러온 것임)
	google.load("visualization","1",{ "packages" : ["corechart"] });
	
	//불러오는 작업이 완료되어 로딩이 완료되면 drawChart 함수 호출
	google.setOnLoadCallback(drawChart);
	google.setOnLoadCallback(drawChart2);
	
	//콜백함수
	function drawChart(){
		//아작났어유
		//dataType : 응답데이터 형식
		//contentType : 보내는데이터의 형식
		//sync : 동기 / async : 비동기
		let jsonData = $.ajax({
		   url:"/resources/json/simpleData.json",
		   dataType:"json",
		   async:false,
		}).responseText;
		console.log(jsonData);

		//데이터 테이블 생성
		let data = new google.visualization.DataTable(jsonData);
		
		var chart = new google.visualization.LineChart(document.getElementById("chart_div"));
		
		//차트객체.draw(데이터테이블, 옵션)
		//curveType:"function" => 곡선 처리
		chart.draw(data,{
		/*    데이터의 형식 구글 서버에 6. JSON . 데이터를 보내면 차트를 리턴해줌
		   - cols 배열 : 컬럼에 대한 정보, 이름/자료형
		   - rows 배열 : 실제 데이터 */
		   title : "차트 예제",
		   curveType : "function",
		   width:600,
		   height:440
		});
	}
	//콜백함수
	function drawChart2(){
		//아작났어유
		//dataType : 응답데이터 형식
		//contentType : 보내는데이터의 형식
		//sync : 동기 / async : 비동기
		let jsonData = $.ajax({
		   url:"/resources/json/simpleData2.json",
		   dataType:"json",
		   async:false,
		}).responseText;
		console.log(jsonData);

		//데이터 테이블 생성
		let data = new google.visualization.DataTable(jsonData);
		
		var chart = new google.visualization.LineChart(document.getElementById("chart_div2"));
		
		//차트객체.draw(데이터테이블, 옵션)
		//curveType:"function" => 곡선 처리
		chart.draw(data,{
		   title : "차트 예제",
		   width:600,
		   height:440
		});
	}
</script>
<div class="row">
	<div class="col-xl-8 col-lg-7">
		<!-- Area Chart -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weighr-bold text primary">과일가격</h6>
			</div>
			<!-- 구글 차트가 보여질 영역 -->
			<div id="chart_div"></div>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weighr-bold text primary">채소 가격</h6>
			</div>
			<!-- 구글 차트가 보여질 영역 -->
			<div id="chart_div2"></div>
		</div>
	</div>
</div>