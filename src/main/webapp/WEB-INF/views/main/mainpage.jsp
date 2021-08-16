<%@ page contentType="text/html;charset=UTF-8"%>
<%
	//db작성 후 변수처리 할 예정임.
	int n = 1;
	int ori_percent = 75;
	int real_percent = 0;
	int per75 = 0;
	int per65 = 0;
	int per55 = 0;
	int per45 = 0;
	int per35 = 0;
	int per25 = 0;
	long per25cnt = 0;
	long per35cnt = 0;
	long per45cnt = 0;
	long per55cnt = 0;
	long per65cnt = 0;
	long per75cnt = 0;
%>
<html>
<head>
	<title>MainPage..</title>
</head>
<%@ include file="../inc/bootstrap.jsp" %>
<body>
<div class="container">
	<h1>
		나만 운없어 페이지입니다.
	</h1>
	<!-- 확률별 시행횟수 -->
	<input type="hidden" id="75per" value="<%=per75%>">
	<input type="hidden" id="65per" value="<%=per65%>">
	<input type="hidden" id="55per" value="<%=per55%>">
	<input type="hidden" id="45per" value="<%=per45%>">
	<input type="hidden" id="35per" value="<%=per35%>">
	<input type="hidden" id="25per" value="<%=per25%>">
	
	<!-- 확률별 성공횟수 -->
	<input type="hidden" id="75percnt" value="<%=per75cnt%>">
	<input type="hidden" id="65percnt" value="<%=per65cnt%>">
	<input type="hidden" id="55percnt" value="<%=per55cnt%>">
	<input type="hidden" id="45percnt" value="<%=per45cnt%>">
	<input type="hidden" id="35percnt" value="<%=per35cnt%>">
	<input type="hidden" id="25percnt" value="<%=per25cnt%>">
	<h3 id="count">  현재 <%=n %>차 시행중 입니다. </h3>
	<P id="many_success">  성공한 횟수는 총 0회입니다. </P>
	<P id="now_percent">  적용된 확률은 <%=ori_percent %>% 입니다. </P>
	<P id="real_percent">  해당 확률에서 실제 성공한 확률은 <%=real_percent %>% 입니다. </P>
	<input type="button" value="성공" id="success">
	<input type="button" value="실패" id="fail">
	<P></P>
	<a href="#">게시판으로 가기</a>
</div>
</body>
<script type="text/javascript">
	var n = <%=n%> // 시행횟수
	var ori_percent = <%=ori_percent%> //적용된 확률
	var real_percent = <%=real_percent%> //실제 성공 확률
	var successCnt = 0; //성공 횟수
	//확률별 시행횟수
	var per75 = <%=per75%>
	var per65 = <%=per65%>
	var per55 = <%=per55%>
	var per45 = <%=per45%>
	var per35 = <%=per35%>
	var per25 = <%=per25%>
	//확률별 성공횟수
	var per75cnt = <%=per75cnt%>
	var per65cnt = <%=per65cnt%>
	var per55cnt = <%=per55cnt%>
	var per45cnt = <%=per45cnt%>
	var per35cnt = <%=per35cnt%>
	var per25cnt = <%=per25cnt%>
	
	$('#fail').click(function(){
		n += 1;
		switch(ori_percent){
			case 75:
				per75 += 1;
				$('#75per').val(per75);
				$('#75percnt').val(per75cnt);
				real_percent = per75cnt/per75;
				break;
			case 65:
				per65 += 1;
				$('#65per').val(per65);
				$('#65percnt').val(per65cnt);
				real_percent = per75cnt/per75;
				break;
			case 55:
				per55 += 1;
				$('#55per').val(per55);
				$('#55percnt').val(per55cnt);
				real_percent = per65cnt/per65;
				break;
			case 45:
				per45 += 1;
				$('#45per').val(per45);
				$('#45percnt').val(per45cnt);
				real_percent = per55cnt/per55;
				break;
			case 35:
				per35 += 1;
				$('#35per').val(per35);
				$('#35percnt').val(per35cnt);
				real_percent = per45cnt/per45;
				break;
			case 25:
				per25 += 1;
				$('#25per').val(per25);
				$('#25percnt').val(per25cnt);
				real_percent = per35cnt/per35;
				break;
		}
		if(ori_percent < 75){
			ori_percent += 10;		
		}
		changeText();
	});
	
	$('#success').click(function(){
		n += 1;
		successCnt += 1;
		switch(ori_percent){
			case 75:
				per75 += 1;
				per75cnt +=1;
				$('#75per').val(per75);
				$('#75percnt').val(per75cnt);
				real_percent = per65cnt/per65;
				break;
			case 65:
				per65 += 1;
				per65cnt +=1;
				$('#65per').val(per65);
				$('#65percnt').val(per65cnt);
				real_percent = per55cnt/per55;
				break;
			case 55:
				per55cnt +=1;
				per55 += 1;
				$('#55per').val(per55);
				$('#55percnt').val(per55cnt);
				real_percent = per45cnt/per45;
				break;
			case 45:
				per45cnt +=1;
				per45 += 1;
				$('#45per').val(per45);
				$('#45percnt').val(per45cnt);
				real_percent = per35cnt/per35;
				break;
			case 35:
				per35cnt +=1;
				per35 += 1;
				$('#35per').val(per35);
				$('#35percnt').val(per35cnt);
				real_percent = per25cnt/per25;
				break;
			case 25:
				per25cnt +=1;
				per25 += 1;
				$('#25per').val(per25);
				$('#25percnt').val(per25cnt);
				real_percent = per25cnt/per25;
				break;
		}
		if(ori_percent > 25){
			ori_percent -= 10;		
		}
		changeText();
	});
	function changeText(){
		$('#count').text('현재 '+n+'차 시행중 입니다.');
		$('#many_success').text('성공한 횟수는 총 '+successCnt+'회입니다.');
		$('#now_percent').text('적용된 확률은 '+ori_percent+'% 입니다.');
		if(isNaN(real_percent)){
			real_percent = 0;
		}
		$('#real_percent').text('해당 확률에서 실제 성공한 확률은 '+real_percent*100+'%입니다.');
	}
</script>

</html>
