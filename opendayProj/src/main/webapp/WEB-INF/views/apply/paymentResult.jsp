<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/user/paymentResult.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="header-title">결제 완료(상태:${result.apPstatus})</div>
		<div class="container">
			<div class="box">
				<div class="class-image-card">
					<img src="resources/image/teacher/cat.jpg" width="100%"
						height="350px" style="object-fit: fill;" />
				</div>
				<div class="class-detail">
					<h4>${result.oClass.clsName }</h4>

					<div class="class-datetime">
						<span>일시<span> ${result.schedule.scdDate },
								${result.schedule.scdTime } 
					</div>

					<div class="class-location">
						<span>장소</span> [${result.schedule.scdLoc }] ${result.schedule.scdPlace }
					</div>

				</div>
			</div>

			<div class="box">
				<div class="payment-result-summary">
					<p>신청번호: ${result.apNum }</p>
					<p>결제일자: ${result.apDate }</p>
					<p>결제금액: ${result.apFinalAmount }원</p>
					<p>결제방식: ${result.apMethod }</p>
				</div>
			</div>

			<div class="box">
				<a href="">메인으로</a>
			</div>
		</div>
</body>
</html>
